;; $Id: .emacs,v 1.57 2005/10/07 20:44:30 seb Exp $

;; _____________________________________________________________________
;; custom path
(setq load-path (cons (expand-file-name "~/.emacsd") load-path))

(load "~/.emacsd/nxml-mode-20041004/rng-auto.el")
;; _____________________________________________________________________
;; some functions/macros
(defmacro make-interactive-fun (fn args)
  `(lambda () (interactive) (funcall ,fn ,args)))

(defmacro make-fun (fn args)
  `(lambda () (funcall ,fn ,args)))

(defun system-short-name ()
  (car (split-string system-name "\\.")))

(defun ts ()
  (interactive)
  (shell-command "date -R" t))

(defun id ()
  (interactive)
  (insert "Craig Schamp <chs@dog-star.com>"))

(defun kill-to-eof ()
  (interactive)
  (kill-region (point) (point-max)))

;;(defun make-html-mail ()
;;  (interactive)
;;  (mark-whole-buffer)
;;  (shell-command-on-region (point-min) (point-max)
;;			   "python /home/seb/make-html-mail.py" t))

(defun my-autoload (&rest modes)
  "Autoload each mode listed in MODES."
  (loop for mode in modes do (autoload (intern mode) mode nil t)))

(defun set-fill-column-for-hooks (n modes)
  "Sets N as the default column length for each mode listed in MODES."
  (loop for mode in modes do
	(add-hook mode `(lambda () (set-fill-column ,n))))) ;; real ugly

;; _____________________________________________________________________
;; Turn off Emacs 21 toolbar
(if (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))

;; _____________________________________________________________________
;; General preferences
(setq ids-creator-id "chs")
(setq sh-indentation 2)
(setq py-indent-offset 2)
(setq case-fold-search t)

(put 'upcase-region 'disabled nil) ;; FIXME: ???
(unless (or (featurep 'xemacs))
  (show-paren-mode t)
  (transient-mark-mode t))

(line-number-mode t)
(column-number-mode t)
(setq visible-bell t)
(setq c-default-style "bsd")
;;(setq c-default-style "k&r")
;;(setq c-default-style "linux")
;; (transient-mark-mode 1)

 ;; scrollwheel
 (defun up-slightly () (interactive) (scroll-up 5))
 (defun down-slightly () (interactive) (scroll-down 5))
 (defun up-one () (interactive) (scroll-up 1))
 (defun down-one () (interactive) (scroll-down 1))
 (defun up-a-lot () (interactive) (scroll-up))
 (defun down-a-lot () (interactive) (scroll-down))
 (global-set-key [mouse-4] 'down-slightly)
 (global-set-key [mouse-5] 'up-slightly)
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)


;; Font highlighting
(unless (or (featurep 'xemacs) (featurep 'aquamacs))
  (require 'color-theme)
  (global-font-lock-mode t)
  (setq font-lock-maximum-decoration t)
  (if (< (display-color-cells) 20)
      (color-theme-billw)
    (color-theme-subtle-hacker-seb)))

;; Other reasonable themes
;; (color-theme-billw)
;; (color-theme-euphoria)
;; (color-theme-lethe)
;; (color-theme-tty-dark)
;; (color-theme-comidia)
;;(color-theme-goldenrod)

;; _____________________________________________________________________
;; Accents
(unless (or (featurep 'xemacs) (featurep 'aquamacs))
  (setq current-language-environment "Latin-1")
  (set-terminal-coding-system 'latin-1)
  (standard-display-european 1)
  (set-input-mode (car (current-input-mode))
		  (nth 1 (current-input-mode))
		  0))

;; _____________________________________________________________________
;; Autloaded modules
(my-autoload "id" "p4" "align" "python-mode" "python-outline" "multi-mode"
	     "time-stamp" "pf_mode")

;; _____________________________________________________________________
;; Hooks
;;(eval-after-load "flyspell" ;; yeah, we wish there was a flyspell-hook...
;;  '(progn
;;     (defun change-dict (dict)
;;       (interactive)
;;       (message (concat "Changing dict to: " dict))
;;       (ispell-change-dictionary dict))
;;     (defun is-buffer-english ()
;;       "Check if the buffer contains english text."
;;       (goto-char (point-min))
;;       (re-search-forward " \\(the\\|in\\) " nil t))
;;     ;; if buffer empty, base choice on system name
;;     (if (zerop (buffer-size)) (if (equal (system-short-name) "cali") (change-dict "american")
;;				 (change-dict "francais"))
;;	 ;; if non-empty, try to identify the language...
;;	 (if (is-buffer-english) (change-dict "american")
;;	   (change-dict "francais")))
;;     (goto-char (point-min))
;;     (set-face-foreground 'flyspell-incorrect-face "yellow3")
;;     (global-set-key "\C-cf" (make-interactive-fun 'change-dict "francais"))
;;     (global-set-key "\C-ce" (make-interactive-fun 'change-dict "american"))))

(defun my-align-hook ()
  (message "Align hook")
  (setq align-to-tab-stop nil)
  (setq align-c++-modes '(c++-mode c-mode java-mode jde-mode)))
(add-hook 'align-load-hook 'my-align-hook)

(defun my-time-stamp-hook ()
  (time-stamp-format "%3a, %02d %3b %Y %02H:%02M:%02S %z"))
(add-hook 'time-stamp-hook 'my-time-stamp-hook)

;;(defun my-jde-mode-hook ()
;;  (message "JDE mode hook")
;;  (c-add-style "my-java" '("java" (c-basic-offset . 4)))
;;  (c-set-style "my-java")
;;  (jde-compile-option-classpath nil)
;;  (jde-compile-option-verbose nil))
;;;;  (put 'jde-global-classpath 'customized-value '("." "/usr/share/java/jde.jar" "/opt/tomcat/common/lib/servlet.jar" "/usr/share/java/junit.jar"))
;;;;  (jde-jdk-registry (quote (("1.4.2" . "/usr/local/j2sdk1.4.2_01"))))
;;(add-hook 'jde-mode-hook 'my-jde-mode-hook)
;;(setq global-senator-minor-mode t) ; fix from Debian's BTS

;; (defun my-nxml-mode-hook ()
;;   (nxml-delimiter-data-face ((nil (:foreground "LightGreen"))))
;;   (nxml-delimiter-face ((t (:foreground "LightSalmon2" :weight bold))))
;;   (nxml-name-face ((nil (:foreground "SkyBlue" :weight bold))))
;;   (nxml-ref-face ((nil (:foreground "LavenderBlush")))))
;; (add-hook 'nxml-mode-hook 'my-nxml-mode-hook)

;; custom modes
;;(defun jsp-mode ()
;;  (interactive)
;;  (multi-mode 1 'html-mode '("<%" jde-mode) '("%>" html-mode)))

;;(defun my-mutt-flyspell-mode ()
;;  (flet ((is-buffer-to-htmlize ()
;;			       "Check if the buffer is a raw email needing HTMLization."
;;			       (goto-char (point-min))
;;			       (and (re-search-forward "^From: " nil t) (re-search-forward "+sig+" nil t)))
;;	 (htmlize-and-exit ()
;;			   (make-html-mail)
;;			   (save-buffer)
;;			   (kill-emacs)))
;;  (if (is-buffer-to-htmlize) (htmlize-and-exit) (flyspell-mode))))

;; associate file patterns and modes
(setq auto-mode-alist 
      (append '(("\\.texi" 		      	     . texi-outline)
		("\\.[jp]y" 		      	     . python-outline)
		("pf\\.conf" 		      	     . pf-mode)
		("\\.\\(html\\|xml\\|php\\)" 	     . nxml-mode)
		("\\.jsp$" 		      	     . jsp-mode)
		("\\.z" 		      	     . sh-mode))
              auto-mode-alist))

(set-fill-column-for-hooks 78 '(python-mode-hook java-mode-hook shell-mode-hook
                                c-mode-hook lisp-mode-hook emacs-lisp-mode-hook
				html-mode-hook))
(set-fill-column-for-hooks 72 '(text-mode-hook))

;; Remapping keys
(global-set-key "\C-ca" 'align-entire)
(global-set-key "\C-ck" 'kill-to-eof)
;; (global-set-key "\C-c#" ')

(custom-set-variables
 '(ecb-options-version "2.21")
 '(jde-ant-enable-find t)
 '(jde-global-classpath (quote ("." "/usr/share/java/jde.jar" "/opt/tomcat/common/lib/servlet.jar" "/usr/share/java/junit.jar")))
 '(jde-jdk-registry (quote (("1.4.2_01" . "/usr/local/j2sdk1.4.2_01"))))
 '(load-home-init-file t t))

(auto-save-mode nil)

(custom-set-faces)

(load "/Applications/Lispbox/lispbox.el")
