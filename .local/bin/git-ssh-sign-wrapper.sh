#!/usr/bin/env sh

# echo "$@"
# -Y sign -n git -f /home/USER/.ssh/KEY.pub /tmp/.git_signing_buffer_tmpABC

PUB_KEY_PATH="$(echo "$@" | awk -F'-f ' '{print $2}' | awk '{print $1}')"
KEY_PATH="${PUB_KEY_PATH%.pub}"

FINGERPRINT="$(ssh-keygen -lf "$PUB_KEY_PATH" | awk '{print $2}')"

if ! ssh-add -l | grep -q "$FINGERPRINT"; then
  ssh-add "$KEY_PATH"
fi

exec ssh-keygen -U "$@"
