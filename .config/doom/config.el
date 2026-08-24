;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; 'C-h v doom-font'
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 17 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 17))

(setq doom-theme 'doom-one)

(add-to-list 'default-frame-alist '(alpha-background . 82))

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

;; Unlink Evil registers from system clipboard
(setq select-enable-clipboard nil)

(after! pass
  (defun custom/pass-copy-to-system (entry)
    "Copy password to the system clipboard."
    (let ((proc (start-process "pass-copy-to-system" nil "pass" "-c" entry)))
      (set-process-filter proc (lambda (_proc output)
                                 (message "%s" (string-trim output))))))

  (advice-add 'password-store-copy :override #'custom/pass-copy-to-system))

(defun custom/paste-from-clipboard ()
  (interactive)
  ;; UTF8_STRING tells clipboard manager to give utf-8
  (insert (gui-get-selection 'CLIPBOARD 'UTF8_STRING)))

(defun custom/ghostel-paste-from-clipboard ()
  (interactive)
  (let ((text (gui-get-selection 'CLIPBOARD)))
    (when text
      (if (derived-mode-p 'ghostel-mode)
          (ghostel-send-string text)
        (insert text)))))

;; Replicate vim behaviour
(define-key general-override-mode-map (kbd "C-S-v") #'custom/paste-from-clipboard)
(map! :map ghostel-mode-map :i "C-S-v" #'custom/ghostel-paste-from-clipboard)
(map! :n "s" #'evil-substitute
      :n "S" #'evil-change-whole-line)

(setq scroll-margin 8)
(setq display-line-numbers-type 'relative)
;; Disable auto insert closing bracket
(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(after! evil
  (setq +evil-want-o/O-to-continue-comments nil))

(setq org-directory "~/.org/")

(setenv "SSH_AUTH_SOCK" (concat (getenv "XDG_RUNTIME_DIR") "/ssh-agent.socket"))

(setq projectile-enable-caching nil)

(add-hook! 'markdown-mode-hook
  (setq fill-column 80)
  (visual-line-mode 1)
  (display-fill-column-indicator-mode 1))

(use-package! msgpack)
(use-package! tramp-rpc)

(after! tramp
  ;; Ensure NixOS setuid wrappers take precedence over raw system binaries
  (add-to-list 'tramp-remote-path "/run/wrappers/bin"))

(after! ghostel
  ;; Use remote configured shell when using tramp-rpc
  (add-to-list 'ghostel-tramp-shells '("rpc" login-shell)))

(after! notmuch
  ;; Open all notmuch buffers in full screen
  (set-popup-rule! "^\\*notmuch" :ignore t)
  (setq +notmuch-mail-folder "~/.mail/personal"))

(after! markdown-mode
  (setq markdown-fontify-code-blocks-natively t))

(use-package! jinx
  :hook (text-mode . jinx-mode)
  :config
  (setq jinx-languages "de_DE en_US")
  :bind (("M-$" . jinx-correct)
         ("C-M-$" . jinx-languages)))

;; --- Language servers ---
(add-to-list 'auto-mode-alist '("\\.astro\\'" . web-mode))

(after! eglot
  ;; sudo npm install -g typescript @astrojs/language-server
  (add-to-list 'eglot-server-programs
               '(web-mode . ("astro-ls" "--stdio"
                             :initializationOptions
                             (:typescript (:tsdk "./node_modules/typescript/lib"))))))

(add-hook 'web-mode-hook
          (lambda ()
            (when (string-match-p "\\.astro\\'" (or buffer-file-name ""))
              (eglot-ensure))))
