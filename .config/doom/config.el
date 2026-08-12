;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; 'C-h v doom-font'
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 17 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 17))

(setq doom-theme 'doom-one)

(add-to-list 'default-frame-alist '(alpha-background . 97))

(with-eval-after-load 'doom-themes
  (custom-set-faces!
    '(font-lock-comment-face :foreground "#999")
    '(font-lock-doc-face :foreground "#aaa")
    '(line-number :foreground "#666")
    '(default :background "#000")
    '(markdown-code-face :background "#1a1a1a")
    '(magit-diff-context-highlight :background "#000")
    '(solaire-default-face :background "#000")))

;; Always use block cursor
(setq evil-normal-state-cursor   'box
      evil-insert-state-cursor   'box
      evil-visual-state-cursor   'box
      evil-motion-state-cursor   'box
      evil-replace-state-cursor  'box
      evil-operator-state-cursor 'box
      evil-emacs-state-cursor    'box)


(setq scroll-margin 8)
(setq display-line-numbers-type 'relative)
(after! evil
  (setq +evil-want-o/O-to-continue-comments nil))
;; Disable auto insert closing bracket
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq org-directory "~/org/")

(setenv "SSH_AUTH_SOCK" (concat (getenv "XDG_RUNTIME_DIR") "/ssh-agent.socket"))

(use-package! msgpack)
(use-package! tramp-rpc)

(after! tramp
  ;; Ensure NixOS setuid wrappers take precedence over raw system binaries
  (add-to-list 'tramp-remote-path "/run/wrappers/bin"))

(after! ghostel
  ;; Use remote configured shell when using tramp-rpc
  (add-to-list 'ghostel-tramp-shells '("rpc" login-shell)))

(after! notmuch
  (setq +notmuch-mail-folder "~/.mail/personal"))

(after! markdown-mode
  (setq markdown-fontify-code-blocks-natively t))

(use-package! jinx
  :hook (text-mode . jinx-mode)
  :config
  (setq jinx-languages "de_DE en_US")
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-languages)))
