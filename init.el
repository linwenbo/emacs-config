;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when ( >= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives
	'(("gnu" . "http://elpa.emacs-china.org/gnu/")
	  ("melpa" . "http://elpa.emacs-china.org/melpa/")
	  ("org" . "http://elpa.emacs-china.org/org/"))))

(require 'cl)

;; Add Packages
(defvar linwenbo/packages '(
			    ;; helm
			    helm
			    helm-gtags
			    ;; theme
			    monokai-theme
			    solarized-theme
			    ;; youdao
			    youdao-dictionary
			    chinese-word-at-point
			    popup
			    names
			    pos-tip
			    ) "Default packages")
(setq package-selected-packages linwenbo/packages)

(defun linwenbo/packages-installed-p ()
  (loop for pkg in linwenbo/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))
(unless (linwenbo/packages-installed-p)
  (message "%s" "refreshing pakcage database...")
  (package-refresh-contents)
  (dolist (pkg linwenbo/packages)
    (when (not (package-installed-p pkg))
    (package-install pkg))))


(load-theme 'monokai t)

;; disable toolbar & scroll bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;enable global linum mode
(global-linum-mode 1)
;; disable welcome screen on emacs start-up
(setq inhibit-splash-screen t)

;; use F2 key to open emacs init file
(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f2>") 'open-my-init-file)

;; use F3 key to reload emacs init file
(defun load-my-init-file()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
(global-set-key (kbd "<f3>") 'load-my-init-file)

;; set cursor type to 'bar
(setq-default cursor-type 'bar)
;; disable auto backup-file
(setq make-backup-files nil)
;; fullscreen when start-up
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; use C-x C-r to open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; use C-q to translate english to chinese
(global-set-key (kbd "C-q") 'youdao-dictionary-search-at-point+)

;; helm config
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; helm-gtags config
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t))

(with-eval-after-load 'helm-gtags
  (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
  (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))


