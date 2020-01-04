;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

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

;; enable global auto-completion
(global-company-mode t)
;; set cursor type to 'bar
(setq-default cursor-type 'bar)
;; disable auto backup-file
(setq make-backup-files nil)
;; delete select word when input
(delete-selection-mode t)
;; fullscreen when start-up
(setq initial-frame-alist (quote ((fullscreen . maximized))))

(global-hl-line-mode t)
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; use C-x C-r to open recent file
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)




(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
