;; -*- lexical-binding: t; -*-

;;; package -- Summary

;;; Commentary:

;;; Code:

(require 'server)
  (unless (server-running-p)
    (server-start))

(setq json-object-type 'hash-table
      json-array-type 'list
      json-key-type 'string)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(connection-local-criteria-alist
   '(((:application vc-git) vc-git-connection-default-profile)
     ((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile
      tramp-flatpak-connection-local-default-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)))
 '(connection-local-profile-alist
   '((vc-git-connection-default-profile (vc-git--program-version))
     (tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97
                               (tramp-kubernetes--container
                                (car tramp-current-connection))
                               104
                               (tramp-kubernetes--pod
                                (car tramp-current-connection))
                               120
                               (tramp-kubernetes--context-namespace
                                (car tramp-current-connection))))
     (tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin"
                         "/usr/local/bin" "/usr/local/sbin"
                         "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin"
                         "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin"
                         "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . tramp-ps-time)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number)
                                          (ttname . string)
                                          (time . tramp-ps-time)
                                          (nice . number)
                                          (etime . tramp-ps-time)
                                          (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number)
                                          (euid . number)
                                          (user . string)
                                          (egid . number)
                                          (group . string) (comm . 52)
                                          (state . string)
                                          (ppid . number)
                                          (pgrp . number)
                                          (sess . number)
                                          (ttname . string)
                                          (tpgid . number)
                                          (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number)
                                          (nice . number)
                                          (vsize . number)
                                          (rss . number)
                                          (etime . number)
                                          (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":") (null-device . "/dev/null")
      (exec-suffixes ""))))
 '(cursor-type 'bar)
 '(custom-enabled-themes '(wombat))
 '(flycheck-checker-error-threshold 900)
 '(indicate-buffer-boundaries 'left)
 '(package-selected-packages
   '(cape company corfu counsel dash dockerfile-mode dotenv-mode f
          flycheck google-translate ivy js-doc js2-mode json-mode
          markdown-mode nginx-mode popup prettier-js
          rainbow-delimiters rainbow-mode sokoban swiper
          typescript-mode typit vterm yaml-mode yasnippet))
 '(safe-local-variable-values
   '((eval setq-local eglot-workspace-folders (list default-directory))))
 '(save-place-mode t nil (saveplace))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(tooltip-mode -1)
(menu-bar-mode -1)
(electric-pair-mode t)
(setf use-dialog-box nil)

(global-display-line-numbers-mode)
(global-whitespace-mode t)
(global-hl-line-mode t)
(desktop-save-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'whitespace)
(setq whitespace-style
 '(face lines-tail tabs spaces space-mark tab-mark trailing))
(set-face-attribute
 'whitespace-space nil :background 'unspecified :foreground "#444")
(set-face-attribute
 'whitespace-tab nil :background "#333" :foreground "#666")

(set-face-background 'highlight "#333")
(set-face-foreground 'highlight nil)
(set-face-underline 'highlight nil)
(set-face-background 'region "#555")

(set-face-foreground 'vertical-border "#222")
(set-face-background 'cursor "#f3e406")

(set-face-background 'mode-line-inactive "#202020")

(set-background-color "#0d1117")

(defconst cust-def-indent 4
  "The size of standard indent.")
(setq-default standard-indent cust-def-indent)
(setq-default tab-width cust-def-indent)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset cust-def-indent)
(setq-default js-indent-level cust-def-indent)
(setq-default css-indent-offset cust-def-indent)

(setq-default whitespace-line-column 100)

(require 'paren)
(setq show-paren-delay 0)
(show-paren-mode 1)

(fringe-mode '(4 . 0))
(setq-default indicate-buffer-boundaries 'left)

(defconst cust-def-scroll-width 12
  "The width of vertical scroll bar for all windows.")
; (set-window-scroll-bars nil cust-def-scroll-width 'right)
; (setq-default scroll-bar-width cust-def-scroll-width)
; (setf scroll-bar-width cust-def-scroll-width)
(set-scroll-bar-mode 'nil)

(setf blink-cursor-blinks 0)

(setf frame-title-format "%b")

;(visit-tags-table "~/.emacs.d/source-tags/")

(global-auto-revert-mode 1)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/all-backups")) ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
(setf auto-save-default nil)
(setf create-lockfiles nil)

(require 'bookmark)
(setf bookmark-save-flag 1)
(setf bookmark-search-size 64)

(require 'imenu)
  (setf imenu-auto-rescan      t) ; always rescan the buffers
  (setf imenu-use-popup-menu nil) ; only minibuffer prompts

(require 'ido)
  (ido-mode t)
  (ido-everywhere t)
  (setf ido-enable-flex-matching t)
  (icomplete-mode t)

(global-set-key (kbd "C-п") 'keyboard-quit)
(global-set-key (kbd "C-ч C-с") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-ч C-ы") 'save-buffer)
(global-set-key (kbd "C-ч C-а") 'find-file)
(global-set-key (kbd "C-ч №") 'server-edit)
(global-set-key (kbd "C-н") 'yank)
(global-set-key (kbd "M-ц") 'kill-ring-save)
(global-set-key (kbd "C-ц") 'kill-region)
(global-set-key (kbd "C-м") 'scroll-up-command)
(global-set-key (kbd "M-м") 'scroll-down-command)
(global-set-key (kbd "C-д") 'recenter-top-bottom)
(global-set-key (kbd "C-и") 'backward-char)
(global-set-key (kbd "C-а") 'forward-char)
(global-set-key (kbd "C-з") 'previous-line)
(global-set-key (kbd "C-т") 'next-line)
(global-set-key (kbd "M-ь") 'back-to-indentation)
(global-set-key (kbd "C-ч C-ц") 'write-file)
(global-set-key (kbd "C-ч C-м") 'find-alternate-file)
(global-set-key (kbd "C-ч C-й") 'read-only-mode)
(global-set-key (kbd "C-ч C-к") 'find-file-read-only)

(defvar-local cust-def-local-previous-point (point)
  "Previous value of current buffer's point.")

(defun cust-def-goto-local-previous-point ()
  "Set point to buffer-local previous value."
  (interactive)
  (let ((pt (point)))
    (goto-char cust-def-local-previous-point)
    (setf cust-def-local-previous-point pt)))

(defun cust-def-set-local-previous-point ()
  "Set value of buffer-local previous point.
This function should call from `pre-command-hook'."
  (if (not (eq this-command 'cust-def-goto-local-previous-point))
      (setf cust-def-local-previous-point (point))))

(add-hook 'pre-command-hook 'cust-def-set-local-previous-point)

(defun cust-def-kill-buffer-in-other-window ()
  "Kill buffer in `other-window' (C-x o)."
  (interactive)
  (kill-buffer (window-buffer (next-window))))

(require 'term)
(add-hook 'term-mode-hook (lambda ()
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-н") 'term-paste)))

(defun cust-def-kill-backward-line ()
  "Kill backward from point to the beginning of line.
If point locate in the beginning of line, kill previous line."
  (interactive)
  (kill-line (if (eq (point) (line-beginning-position)) -1 0)))

(defun cust-def-previous-window ()
  "Select previous window -- like `other-window', but in reverse order."
  (interactive)
  (other-window -1))

(defun cust-def-next-buffer-in-other-window ()
  "Select next buffer in `other-window' (C-x o)."
  (interactive)
  (switch-to-next-buffer (next-window)))

(defun cust-def-previous-buffer-in-other-window ()
  "Select previous buffer in `other-window' (C-x o)."
  (interactive)
  (switch-to-prev-buffer (previous-window)))

(defun cust-def-end-of-word-p ()
  "Return t if point is at the end of word."
  (save-mark-and-excursion
    (let ((pt (point)))
      (and (backward-word) (forward-word) (eq pt (point))))))

(defun cust-def-copy-current-word ()
  "Copy (in kill ring) current word without changing mark and point."
  (interactive)
  (save-mark-and-excursion
    (if (not (cust-def-end-of-word-p)) (forward-word))
    (let ((pt (point)))
      (backward-word)
      (copy-region-as-kill pt (point)))))

(defun cust-def-show-buffer-file-name ()
  "Show buffer file name in minibuffer."
  (interactive)
  (message buffer-file-name))

(fset 'cust-def-insert-js-doc
   (kmacro [?\C-a ?\C-o ?\C-o ?\C-o ?/ ?* ?* ?\C-a ?\C-n ?  ?* ?\C-a ?\C-n ?  ?* ?/ ?\C-p ? ] 0 "%d"))

(global-set-key (kbd "<f6>") 'imenu)
(global-set-key (kbd "C-c DEL") 'cust-def-kill-backward-line)
(global-set-key (kbd "C-c C-/") 'cust-def-goto-local-previous-point)
(global-set-key (kbd "C-c k") 'kill-this-buffer)
(global-set-key (kbd "C-c o") 'cust-def-kill-buffer-in-other-window)
(global-set-key (kbd "C-c [") 'cust-def-previous-window)
(global-set-key (kbd "C-c f") 'next-buffer)
(global-set-key (kbd "C-c b") 'previous-buffer)
(global-set-key (kbd "C-c p") 'cust-def-previous-buffer-in-other-window)
(global-set-key (kbd "C-c n") 'cust-def-next-buffer-in-other-window)
(global-set-key (kbd "C-c w") 'cust-def-copy-current-word)
(global-set-key (kbd "C-c i") 'cust-def-show-buffer-file-name)

;(add-to-list 'default-frame-alist '(font .
;  "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" ))
;(set-face-attribute 'default nil :font
;  "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" )

(set-face-attribute 'default (selected-frame) :height 120)
(set-frame-size (selected-frame) 230 70)

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(set-frame-font "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-24-*-*-*-m-0-iso10646-1" nil t)

(require 'package)

(add-to-list
 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(global-flycheck-mode t)

(ispell-change-dictionary "en_US" t)

(display-time-mode 1)
(require 'time)
(setq display-time-string-forms
      '((propertize (concat " " 24-hours ":" minutes " ")
                    'face 'mode-line)))

(add-to-list 'auto-mode-alist '("\\.bashrc$" . sh-mode))

(require 'web-mode)
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)
(add-to-list 'auto-mode-alist '("\\.html" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx$" . tsx-ts-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.yate$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))

(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json'" . json-mode))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.cjs'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.mjs'" . js2-mode))

(require 'rjsx-mode)
(add-to-list 'auto-mode-alist '("\\.js'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.cjs'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.mjs'" . rjsx-mode))

(setf js2-strict-trailing-comma-warning nil)

(set-face-foreground 'js2-object-property "#85ad91")
(set-face-foreground 'js2-function-call "#b39999")
;(set-face-foreground 'rjsx-tag "#B5ad91")
;(set-face-foreground 'rjsx-attr "#85Dd91")

(require 'flycheck)
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
          '(javascript-jshint json-python-json typescript-tslint)))

(setq-default flycheck-eslint-rules-directories nil)

(use-package treesit
  :mode (("\\.ts\\'"  . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode))
  :config
  (setq treesit-language-source-alist
        '((typescript "https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "typescript/src")
          (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "v0.23.2" "tsx/src")))
  (dolist (grammar '(typescript tsx))
    (unless (treesit-language-available-p grammar)
      (treesit-install-language-grammar grammar))))

(use-package typescript-ts-mode
  :mode (("\\.ts\\'"  . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode)))

(add-hook 'typescript-ts-mode-hook #'eglot-ensure)
(add-hook 'tsx-ts-mode-hook #'eglot-ensure)

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (eglot-semantic-tokens-mode -1)))

(with-eval-after-load 'eglot
  (add-to-list 'eglot-ignored-server-capabilites
               :documentHighlightProvider)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c e a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c e f") #'eglot-format-buffer))

(setq eldoc-echo-area-use-multiline-p t)

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (setq-local eldoc-documentation-functions
                        '(t flymake-eldoc-function
                          eglot-hover-eldoc-function
                          eglot-signature-eldoc-function
                          eglot-highlight-eldoc-function))))

(with-eval-after-load 'project
  (add-to-list 'project-vc-extra-root-markers ".npmignore"))

(defun my/flycheck-override-typescript-bindings ()
  "Override Flycheck keybindings for TypeScript buffers to use Flymake."
  (when (derived-mode-p 'typescript-ts-mode 'tsx-ts-mode)
    (define-key flycheck-mode-map (kbd "C-c ! n") #'flymake-goto-next-error)
    (define-key flycheck-mode-map (kbd "C-c ! p") #'flymake-goto-prev-error)))

(add-hook 'flycheck-mode-hook #'my/flycheck-override-typescript-bindings)


(use-package corfu
  :init
  (global-corfu-mode))

(setq corfu-auto t
      corfu-auto-prefix 1
      corfu-auto-delay 0.0)

(use-package corfu-popupinfo
  :after corfu
  :init
  (corfu-popupinfo-mode))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev 90)
  (add-to-list 'completion-at-point-functions #'cape-file 90)
  (add-to-list 'completion-at-point-functions #'cape-keyword 90)
)

(setq completion-ignore-case nil)
(setq read-buffer-completion-ignore-case nil)
(setq read-file-name-completion-ignore-case nil)

(setq cape-dabbrev-check-other-buffers t)
(setq cape-dabbrev-min-length 3)
(setq cape-dabbrev-ignore-case nil)

(setq dabbrev-case-replace nil)
(setq dabbrev-case-fold-search nil)

(flycheck-add-mode 'css-csslint 'css-mode)
(flycheck-add-mode 'javascript-eslint 'rjsx-mode)
(flycheck-add-mode 'javascript-eslint 'web-mode)


(defun cust-def-use-eslint-from-node-modules ()
  "Set local eslint for flycheck."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/.bin/eslint"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun cust-def-use-markdownlint-from-node-modules ()
  "Set local markdownlint for flycheck."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (markdownlint (and root
                      (expand-file-name "node_modules/.bin/markdownlint"
                                        root))))
    (when (and markdownlint (file-executable-p markdownlint))
      (setq-local flycheck-markdown-markdownlint-cli-executable markdownlint))))

(add-hook 'flycheck-mode-hook #'cust-def-use-eslint-from-node-modules)
(add-hook 'flycheck-mode-hook #'cust-def-use-markdownlint-from-node-modules)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; need to support js-mode (JavaScript) because emacs opens JS files
;; with shebang with fallback to this mode
(add-hook 'js-mode-hook
          #'(lambda ()
              (define-key js-mode-map (kbd "C-c I") 'cust-def-insert-js-doc)
              (define-key js-mode-map "@" 'js-doc-insert-tag)))

(add-hook 'js2-mode-hook
          #'(lambda ()
              (define-key js2-mode-map (kbd "C-c I") 'cust-def-insert-js-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))

(add-hook 'rjsx-mode-hook
          #'(lambda ()
              (define-key rjsx-mode-map (kbd "C-c I") 'cust-def-insert-js-doc)
              (define-key rjsx-mode-map "@" 'js-doc-insert-tag)))

(add-hook 'web-mode-hook
          #'(lambda ()
              (define-key web-mode-map (kbd "C-c C-b") 'counsel-bookmark)))

(require 'typescript-ts-mode)
(add-hook 'typescript-ts-mode-hook
          #'(lambda ()
              (define-key typescript-ts-mode-map (kbd "C-c C-d") #'eldoc-print-current-symbol-info)
              (define-key typescript-ts-mode-map (kbd "C-c I") 'cust-def-insert-js-doc)
              (define-key typescript-ts-mode-map "@" 'js-doc-insert-tag)))

(add-hook 'tsx-ts-mode-hook
          #'(lambda ()
              (define-key tsx-ts-mode-map (kbd "C-c C-d") #'eldoc-print-current-symbol-info)
              (define-key tsx-ts-mode-map (kbd "C-c I") 'cust-def-insert-js-doc)
              (define-key tsx-ts-mode-map "@" 'js-doc-insert-tag)))


(require 'prettier-js)
(add-hook 'css-mode-hook 'prettier-js-mode)
(add-hook 'js-mode-hook 'prettier-js-mode)
(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'json-mode-hook 'prettier-js-mode)
(add-hook 'markdown-mode-hook 'prettier-js-mode)
(add-hook 'rjsx-mode-hook 'prettier-js-mode)
(add-hook 'typescript-ts-mode-hook 'prettier-js-mode)
(add-hook 'tsx-ts-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'yaml-mode-hook 'prettier-js-mode)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(require 'face-remap)
(setf text-scale-mode-step 1.05)

;(require 'vterm)
;(setq vterm-buffer-name-string "%s")

(require 'google-translate)
(require 'google-translate-default-ui)
(global-set-key (kbd "C-c t") 'google-translate-at-point)
(global-set-key (kbd "C-c T") 'google-translate-query-translate)
(global-set-key (kbd "C-c r") 'google-translate-at-point-reverse)
(global-set-key (kbd "C-c R") 'google-translate-query-translate-reverse)
(setq google-translate-default-source-language "en")
(setq google-translate-default-target-language "ru")
(setq google-translate-backend-method 'curl)

(defun google-translate--search-tkk ()
  "Search TKK (fix for https://github.com/atykhonov/google-translate/issues/137)."
  (list 430675 2721866130))

(require 'markdown-mode)
(setq markdown-command "pandoc --include-in-header file:///home/uid11/.emacs.d/github-pandoc.html --from markdown -t html5 --mathjax --standalone --variable lang=en --metadata title=___")

(require 'markdown-preview-mode)
(setq markdown-preview-stylesheets (list))

(add-hook 'markdown-mode-hook
          #'(lambda ()
              (define-key markdown-mode-map (kbd "C-c C-c p") 'markdown-preview-mode)))

(require 'counsel)
(ivy-mode 1)
(setq ivy-count-format "%d/%d ")
(setq ivy-use-virtual-buffers t)
(setq ivy-wrap t)
(set-face-background 'swiper-line-face "#65a7e2")
(set-face-foreground 'swiper-line-face "#010203")

(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;; todo: this is prefix code in web-mode
(global-set-key (kbd "C-c C-b") 'counsel-bookmark)
(global-set-key (kbd "C-c g") 'counsel-rg)

(provide '.emacs)
;;; .emacs ends here

;(elisp-eval-buffer)
