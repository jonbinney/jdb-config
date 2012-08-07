;; Jon Binney .emacs 
;; 7/16/04

;; add my elisp folder to load-path
(setq load-path (append load-path (list "~/Config/emacs"))) 

;; Remember recently opened files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 100)
(setq recentf-exclude (append recentf-exclude '(".ftp:.*" ".sudo:.*")))
(setq recentf-keep '(file-remote-p file-readable-p))

(condition-case nil
    (progn
      (require 'smex)
      ;;smex replaces M-x with IDO enhancements
      (setq smex-save-file "~/.smex.save")

      (smex-initialize)
      (global-set-key (kbd "M-x") 'smex)
      (global-set-key (kbd "M-X") 'smex-major-mode-commands)
      (global-set-key (kbd "C-c M-x") 'smex-update-and-run)
      ;; This is your old M-x.
      (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))
  (error (message "error when loading smex")))

(load "light-symbol-mode.el")
(add-hook 'python-mode-hook (lambda () (light-symbol-mode)))
(autoload 'light-symbol-mode "light symbol mode"
  "highlight code."
  t)

;;; disable the menu bar, scroll bar, and toolbar
;;(menu-bar-mode -1)
;;(toggle-scroll-bar -1)
;;(tool-bar-mode -1)

;;; key bindings
(global-set-key "\M-g" 'goto-line)
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
;;(require 'ipython)
(setq-default py-indent-offset 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;(setq ipython-command "/usr/bin/ipython")
;;(require 'ipython)

; will allow you to type just "y" instead of "yes" when you exit.
(fset 'yes-or-no-p 'y-or-n-p)

;; tramp for remote editing
(require 'tramp)
(setq tramp-default-method "ssh")

;; cc-mode
(require 'cc-mode)
(c-set-offset 'arglist-intro 2)
(set-variable (quote c-basic-offset) 2)

;; make emacs use the clipboard
;;(setq x-select-enable-clipboard t)
;;(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; ROS
; Tell emacs where to find the rosemacs sources
(push (expand-file-name "~/Config/emacs/rosemacs") load-path) 
;; Load the library and start it up
(condition-case nil
    (progn
      (require 'rosemacs)
      (invoke-rosemacs))
  (error (message "error when loading rosemacs")))

;; prefix for the rosemacs commands
(global-set-key "\C-x\C-r" ros-keymap)

;; need no toolbar nor menu
(tool-bar-mode -1)
(menu-bar-mode -1)

;; highlight matching parentheses
(require 'paren)
(show-paren-mode 1)

(setq inhibit-startup-message t)

;; the code below allows emacs to scroll slowly when using the mouse wheel,
;; or when reaching the end of buffer with point
(defun smooth-scroll (increment)
  (scroll-up increment) (sit-for 0.05)
   (scroll-up increment) (sit-for 0.02)
   (scroll-up increment) (sit-for 0.02)
   (scroll-up increment) (sit-for 0.05)
   (scroll-up increment) (sit-for 0.06)
   (scroll-up increment))
 (global-set-key [(mouse-5)] '(lambda () (interactive) (smooth-scroll 1)))
 (global-set-key [(mouse-4)] '(lambda () (interactive) (smooth-scroll -1)))

(custom-set-variables
   '(recentf-menu-filter (quote recentf-show-basenames))
   '(recentf-save-file "~/.recentf")
   '(recentf-show-file-shortcuts-flag nil)

   '(column-number-mode t)
   '(line-number-mode t)
   '(hippie-expand-try-functions-list (quote (try-expand-dabbrev )))

   '(ido-auto-merge-work-directories-length -1)
   '(ido-case-fold t)
   '(ido-confirm-unique-completion nil)
   '(ido-create-new-buffer (quote alway))
   '(ido-enable-flex-matching t)
   '(ido-everywhere t)
   '(ido-ignore-buffers (quote ("\\*ros[a-zA-Z\\D]*" "\\*slime-events\\*"
 "\\*slime-compilation\\*" "\\*Ibuffer\\*" "\\*inferior-lisp\\*" "\\` ")))
   '(ido-max-work-file-list 30)
   '(ido-mode (quote both) nil (ido))
   '(ido-save-directory-list-file "~/.emacs.d/.ido.last")
   '(ido-use-filename-at-point (quote guess))
   '(ido-use-url-at-point t)

   '(scroll-bar-mode (quote right))

 )

(global-set-key (kbd "<backtab>") 'hippie-expand)
