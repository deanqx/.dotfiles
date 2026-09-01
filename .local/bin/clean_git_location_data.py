import os
import re
import subprocess
import tempfile

GPS_RE = re.compile(
    r"\b("
    r"gps|"
    r"latitude|"
    r"longitude|"
    r"gpslatitude|"
    r"gpslongitude|"
    r"gpsposition"
    r")\b",
    re.IGNORECASE,
)

# Only process regular files.
if mode not in (b"100644", b"100755"):
    return (filename, mode, blob_id)

contents = value.get_contents_by_identifier(blob_id)

name = os.path.basename(os.fsdecode(filename))
suffix = os.path.splitext(name)[1]

with tempfile.TemporaryDirectory(prefix="mat2-git-") as td:
    path = os.path.join(td, "input" + suffix)

    with open(path, "wb") as f:
        f.write(contents)

    clean = subprocess.run(
        [
            "mat2",
            "--inplace",
            "-L",
            "--unknown-members",
            "keep",
            path,
        ],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )

    show = subprocess.run(
        ["mat2", "--show", path],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )

    if show.returncode != 0:
        raise RuntimeError(
            f"mat2 --show failed after cleaning "
            f"{os.fsdecode(filename)!r}\n"
            f"stderr:\n{show.stderr}"
        )

    output = show.stdout + "\n" + show.stderr

    if GPS_RE.search(output):
        raise RuntimeError(
            f"GPS metadata remains after MAT2 cleaning in "
            f"{os.fsdecode(filename)!r}\n"
            f"mat2 --show output:\n{show.stdout}"
        )

    # Store the cleaned file as a new Git blob.
    with open(path, "rb") as f:
        cleaned = f.read()

new_blob_id = value.insert_file_with_contents(cleaned)

return (filename, mode, new_blob_id)
