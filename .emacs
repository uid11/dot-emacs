;;; package -- Summary

;;; Commentary:

;; packages:
;;  web-mode
;;  js2-mode
;;  json-mode
;;  flycheck
;;  auto-complete (need (ac-flyspell-workaround) to work with flyspell)
;;  Tern for tags (http://ternjs.net/doc/manual.html#emacs)
;;  https://github.com/mooz/js-doc -- for es-doc comments
;;  magit for Git -- unnecessary
;;  cider (https://github.com/clojure-emacs/cider)
;;  parinfer
;;  ibuffer (yet another buffers list -- and it's a part of Emacs)

;;; Code:

(require 'server)
  (unless (server-running-p)
    (server-start))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(column-number-mode t)
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (wombat)))
 '(indicate-buffer-boundaries (quote left))
 '(package-selected-packages
   (quote
    (auto-complete flycheck json-mode js2-mode web-mode)))
 '(save-place t nil (saveplace))
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

(global-linum-mode t)
(global-whitespace-mode t)
(global-hl-line-mode t)
(desktop-save-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'whitespace)
(setq whitespace-style
 '(face lines-tail tabs spaces space-mark tab-mark trailing))
(set-face-attribute
 'whitespace-space nil :background nil :foreground "#444")
(set-face-attribute
 'whitespace-tab nil :background "#333" :foreground "#666")

(set-face-background 'highlight "#333")
(set-face-foreground 'highlight nil)
(set-face-underline 'highlight nil)

(set-face-background 'region "#555")

(set-face-background 'cursor "#f3e406")

(set-face-foreground 'vertical-border "#222")

(defconst cust-def-indent 4
  "The size of standard indent.")
(setq-default standard-indent cust-def-indent)
(setq-default tab-width cust-def-indent)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset cust-def-indent)
(setq-default js-indent-level cust-def-indent)
(setq-default css-indent-offset cust-def-indent)

(setq show-paren-delay 0)
(show-paren-mode 1)

(setq linum-format "%2d")
(set-face-attribute 'linum nil :foreground "#555")

(fringe-mode '(4 . 0))
(setq-default indicate-buffer-boundaries 'left)

(set-background-color "#000")

(defconst cust-def-scroll-width 12
  "The width of vertical scroll bar for all windows.")
;; (set-window-scroll-bars nil cust-def-scroll-width 'right)
;; (setq-default scroll-bar-width cust-def-scroll-width)
;; (setf scroll-bar-width cust-def-scroll-width)
(set-scroll-bar-mode 'nil)

(setf blink-cursor-blinks 0)

(setf frame-title-format "%b")

(visit-tags-table "~/.emacs.d/source-tags/")

(global-auto-revert-mode 1)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/all-backups"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
(setf auto-save-default nil)
(setf create-lockfiles nil)

(setf bookmark-save-flag 1)
(setf bookmark-search-size 64)

(require 'imenu)
  (setf imenu-auto-rescan      t) ;; always rescan the buffers
  (setf imenu-use-popup-menu nil) ;; only minibuffer prompts

(require 'ido)
  (ido-mode t)
  (ido-everywhere t)
  (setf ido-enable-flex-matching t)
  (icomplete-mode t)

(global-set-key (kbd "C-x C-b") 'bs-show)
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
This function should call from pre-command-hook."
  (if (not (eq this-command 'cust-def-goto-local-previous-point))
      (setf cust-def-local-previous-point (point))))

(add-hook 'pre-command-hook 'cust-def-set-local-previous-point)

(defun cust-def-kill-buffer-in-other-window ()
  "Kill buffer in \"other-window\" (C-x o)."
  (interactive)
  (kill-buffer (window-buffer (next-window))))

(defconst cust-def-repl-node-name "repl-node"
  "The name of repl-node buffer.")

(defconst cust-def-repl-node-path "~/JS/repl-node.js"
  "The path to repl-node script.")

(defun cust-def-run-repl-node-script ()
  "Run repl-node in term mode, if buffer name matching."
  (if (string-match-p cust-def-repl-node-name (buffer-name))
      (insert (concat cust-def-repl-node-path "\n"))))

(defun repl-node ()
  "Run repl-node in ansi-term mode."
  (interactive)
  (ansi-term "/bin/bash" cust-def-repl-node-name))

(add-hook 'term-mode-hook (lambda ()
  (define-key term-raw-map (kbd "C-y") 'term-paste)
  (define-key term-raw-map (kbd "C-н") 'term-paste)
  (cust-def-run-repl-node-script)))

(defun cust-def-kill-backward-line ()
  "Kill backward from point to the beginning of line.
If point locate in the beginning of line, kill previous line."
  (interactive)
  (kill-line (if (eq (point) (line-beginning-position)) -1 0)))

(defun cust-def-previous-window ()
  "Select previous window -- like other-window, but in reverse order."
  (interactive)
  (other-window -1))

(defun cust-def-next-buffer-in-other-window ()
  "Select next buffer in \"other-window\" (C-x o)."
  (interactive)
  (switch-to-next-buffer (next-window)))

(defun cust-def-previous-buffer-in-other-window ()
  "Select previous buffer in \"other-window\" (C-x o)."
  (interactive)
  (switch-to-prev-buffer (previous-window)))

(defun cust-def-end-of-word-p ()
  "Return t if point is at the end of word."
  (save-excursion
    (let ((pt (point)))
      (and (backward-word) (forward-word) (eq pt (point))))))

(defun cust-def-copy-current-word ()
  "Copy (in kill ring) current word without changing mark and point."
  (interactive)
  (save-excursion
    (if (not (cust-def-end-of-word-p)) (forward-word))
    (let ((pt (point)))
      (backward-word)
      (copy-region-as-kill pt (point)))))

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

;(add-to-list 'default-frame-alist '(font .
;  "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" ))
;(set-face-attribute 'default nil :font
;  "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1" )

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)


(require 'package)

(add-to-list
 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(global-auto-complete-mode t)
(global-flycheck-mode t)
(ac-flyspell-workaround)

(add-to-list 'ac-modes 'Emacs-Lisp)
(add-to-list 'ac-modes 'Javascript)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'json-mode)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'nxml-mode)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))

(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
          '(javascript-jshint)))

(flycheck-add-mode 'javascript-eslint 'web-mode)

(provide '.emacs)
;;; .emacs ends here
