;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; 'C-h v doom-font'
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 17 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 17))

;; Disable auto insert closing bracket
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)

(setq scroll-margin 8)
(setq display-line-numbers-type 'relative)
(after! evil
  (setq +evil-want-o/O-to-continue-comments nil))

;; Always use block cursor
(setq evil-normal-state-cursor   'box
      evil-insert-state-cursor   'box
      evil-visual-state-cursor   'box
      evil-motion-state-cursor   'box
      evil-replace-state-cursor  'box
      evil-operator-state-cursor 'box
      evil-emacs-state-cursor    'box)

(setq doom-theme 'doom-one)

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
