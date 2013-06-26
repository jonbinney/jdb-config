;; Jon Binney .emacs 
;; 7/16/04

;; add my elisp folder to load-path
(setq load-path (append load-path (list "~/Config/emacs"))) 
(setq load-path (append load-path (list "~/Config/emacs/js3-mode"))) 

;; Remember recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(setq recentf-exclude (append recentf-exclude '(".ftp:.*" ".sudo:.*")))
(setq recentf-keep '(file-remote-p file-readable-p))

;;; disable the menu bar, scroll bar, and toolbar
;;(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
;;(tool-bar-mode -1)

;;; key bindings
(global-set-key "\M-s" 'shell)
(global-set-key "\M--" 'comment-dwim)
(global-set-key "\M-n" 'next-error)

;;; show time and date
(setq display-time-day-and-date t)
(display-time)

;;; turn on font-lock-mode
(global-font-lock-mode t)

;; no crap in *scratch* on startup
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)

;; don't create backup files
(setq make_backup-files nil)

;; show the column number i am in
(line-number-mode 1)
(column-number-mode 1)

;; disable backup files (i don't use them, and they are annoying)
(setq backup-inhibited t)

;; turn off automatic save (these cause annoying pauses, especially
;; when editing remote files)
(setq auto-save-default nil)

;; python
(setq-default py-indent-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

; will allow you to type just "y" instead of "yes" when you exit.
(fset 'yes-or-no-p 'y-or-n-p)

;; tramp for remote editing
(require 'tramp)
(setq tramp-default-method "ssh")

;; cc-mode
(require 'cc-mode)
(c-set-offset 'arglist-intro 2)
(set-variable (quote c-basic-offset) 2)

;; ROS
; Tell emacs where to find the rosemacs sources
;; (push (expand-file-name "~/config/emacs/rosemacs") load-path) 
;; Load the library and start it up
;; (condition-case nil
;;     (progn
;;      (require 'rosemacs)
;;      (invoke-rosemacs))
;;  (error (message "error when loading rosemacs")))

;; prefix for the rosemacs commands
;; (global-set-key "\C-x\C-r" ros-keymap)

;; need no toolbar nor menu
(tool-bar-mode -1)
(menu-bar-mode -1)

;; highlight matching parentheses
(require 'paren)
(show-paren-mode 1)

(setq inhibit-startup-message t)
