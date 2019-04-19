(require 'package)

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Setting up js env for emacs


;;Setting line mode and turing off line break
(global-linum-mode 1)
(setq-default truncate-lines 0)

;; Creating window setup on startup
(split-window-horizontally)
(other-window 1)
(shrink-window-horizontally 15)
(split-window-vertically)
(other-window 1)

;; Adding other window key
(global-set-key (quote [C-return]) (quote other-window))

;; Changing default theme to atom one dark
(load-theme 'atom-one-dark t)

;; Setting up tree view
(add-to-list 'load-path "/media/tigran/Common/averta-ct-serial/averta-ct/")
(add-to-list 'load-path "/media/tigran/Common/armenian-history-project/")
(require 'neotree)
(global-set-key [C-M-return] 'neotree-toggle)
(setq-default neo-show-hidden-files t)

;; List of project directories
;(neotree-dir "/media/tigran/Common/averta-ct-serial/averta-ct/")
;(neotree-dir "/media/tigran/Common/armenian-history-project/armenian-history/")
(neotree-dir "/media/tigran/Common/targetx")

;; Making emacs to treat ejs files as html files
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (js2-mode ## xref-js2 python-environment neotree js2-refactor epc company-tern auto-complete atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
