;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    elpy ;; add the elpy package
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(elpy-enable) ;; enabling elpy (Emacs Lisp Python Environment)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(setq-default truncate-lines 0) ;; remove line-break
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode)) ;; treat ejs files as html files

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (neotree material-theme better-defaults))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; NEOTREE CONFIGURATION
;; --------------------------------------

(add-to-list 'load-path "/media/tigran/Common/armenian-history-project/armenian-history")

(require 'neotree)

;; ADDING ALL-THE-ICONS TO NEO-TREE AND MODE LINE
;; --------------------------------------

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; ADDING KEY BINDINGS AND SETTING UP INITIAL LAYOUT
;; --------------------------------------

(split-window-horizontally)
(other-window 1)
(shrink-window-horizontally 25)
(global-set-key [C-return] 'other-window)
(global-set-key [C-M-return] 'neotree-toggle)

;; LIST OF CURRENT WORKSPASES
;; --------------------------------------

;(neotree-dir "/media/tigran/Common/averta-ct-serial/averta-ct/")
(neotree-dir "/media/tigran/Common/armenian-history-project/armenian-history/")
;(neotree-dir "/media/tigran/Common/targetx")

;; init.el ends here
