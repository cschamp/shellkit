(display-time)

;;  -- Load FORTRAN mode.

(defun fortran-mode-w-abbrevs ()
  (interactive)
  (fortran-mode)
  (if (not abbrev-mode)
      (setq abbrev-mode t)))

(setq fortran-continuation-string "&")

;;  -- Define all of the file extensions which might be FORTRAN files.

(setq auto-mode-alist (append auto-mode-alist
			      (list '("\\.F$" . fortran-mode-w-abbrevs))))
(setq auto-mode-alist (append auto-mode-alist
			      (list '("\\.f$" . fortran-mode-w-abbrevs))))
(setq auto-mode-alist (append auto-mode-alist
			      (list '("\\.for$" . fortran-mode-w-abbrevs))))
(setq auto-mode-alist (append auto-mode-alist
			      (list '("\\.FOR$" . fortran-mode-w-abbrevs))))
(setq auto-mode-alist (append auto-mode-alist
			      (list '("\\.f90$" . fortran-mode-w-abbrevs))))


;;  -- Load Python mode.

(autoload 'python-mode "python-mode" "Python editing mode." t)
(setq auto-mode-alist
      (cons '("\\.py$" . python-mode) auto-mode-alist))

;;  -- Load C++ mode for *.h header files
(setq auto-mode-alist
      (cons '("\\.h$" . c++-mode) auto-mode-alist))

(setq default-major-mode 'text-mode)
(setq text-mode-hook 'turn-on-auto-fill)

(setq display-time-day-and-date t)
(setq truncate-lines t)
(setq scroll-step 3)
(setq version-control t)
(setq trim-versions-without-asking t)
(setq kept-new-versions 2)
(setq kept-old-versions 0)
(setq search-repeat-char ?\C-s)

(put '*defun 'lisp-indent-hook 'defun)
(put '*defvar 'lisp-indent-hook 'defun)
(put 'when 'lisp-indent-hook 1)
(put '*when 'lisp-indent-hook 1)
(put '*let 'lisp-indent-hook 1)
(put '*let* 'lisp-indent-hook 1)
(put 'dotimes 'lisp-indent-hook 1)
(put 'do 'lisp-indent-hook 2)
(put 'narrow-to-region 'disabled nil)

(defun deltotop ()
   (set-mark-command)
   (beginning-of-buffer)
   (delete-region)
   (end-of-buffer))

;; (define-key esc-map "q" 'deltotop)
(define-key esc-map "b" 'erase-buffer)
(define-key esc-map "v" 'save-buffer)
(define-key esc-map "%" 'replace-string)
(define-key esc-map "^" 'replace-regexp)
(define-key esc-map "s" 'shell)
(define-key esc-map "c" 'compile)
(define-key esc-map "e" 'next-error)
(define-key esc-map "f" 'font-lock-fontify-buffer)
(define-key esc-map "[1~" 'beginning-of-line)
(define-key esc-map "[4~" 'end-of-line)
(define-key esc-map "[5~" 'scroll-down)
(define-key esc-map "[6~" 'scroll-up)



(setq delete-key-deletes-forward t)

(put 'downcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)

(put 'eval-expression 'disabled nil)

(setq search-highlight t)
(setq default-frame-alist
      '((menu-bar-lines . 1)
	(auto-lower . nil)
	(auto-raise . nil)))

(autoload 'spell-word   "ispell" "Check the spelling of word in buffer." t)
(autoload 'spell-region "ispell" "Check the spelling of region." t)
(autoload 'spell-buffer "ispell" "Check the spelling of buffer." t)
(global-set-key "\e$" 'spell-word)
;(define-key esc-map "$" 'spell-word)

(setq line-number-mode t)
(setq column-number-mode t)




;;;;----------------------------------------------------------------------------

;; Customizations for all modes in CC Mode.

(defun bogus-c-mode-common-hook ()
  (setq tab-width 3		;; set tab to be 8 spaces
        indent-tabs-mode nil)	;; use spaces not hard tabs
  (setq c-basic-offset 3)
  ;;(c-toggle-auto-state 1)	;; enable "electric commands"
  ;;(c-toggle-hungry-state 1)	;; enable "hungry delete"
  (c-set-style "python")
  (define-key c-mode-base-map "\C-m" 'newline-and-indent)
  )

(add-hook 'c-mode-common-hook 'bogus-c-mode-common-hook)

(require 'vc)

;;;;----------------------------------------------------------------------------
;; R-ness
;;(add-to-list 'load-path "~/.emacs_files/ess-5.3.1/lisp")
;;(require 'ess-site) 
;;(setq inferior-R-program-name "/root/R/bin/R")

;;;;----------------------------------------------------------------------------
;; Tab setup
(global-set-key (kbd "TAB") 'self-insert-command);           # in every mode
(global-set-key (kbd "TAB") 'tab-to-tab-stop);           # in every mode
(setq-default indent-tabs-mode nil);     # put this in your .emacs file
(setq-default tab-width 3 indent-tabs-mode nil)	;; use spaces not hard tabs
