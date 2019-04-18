(require 'package)

(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Standard Jedi.el setting
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;Setting line mode and turing off line break
(global-linum-mode 1)
(setq-default truncate-lines 0)

(split-window-horizontally)
(other-window 1)
(shrink-window-horizontally 15)
(split-window-vertically)
(other-window 1)
;; terminal call commend (term "/bin/bash")

(global-set-key (quote [C-return]) (quote other-window))

;(add-to-list 'load-path "/media/tigran/Common/averta-ct-serial/averta-ct/")
;(global-set-key (quote [C-M-return]) (quote neotree-toggle))

(load-theme 'atom-one-dark t)

(add-to-list 'load-path "/media/tigran/Common/averta-ct-serial/averta-ct/")
(add-to-list 'load-path "/media/tigran/Common/armenian-history-project/")
(require 'neotree)
(global-set-key [C-M-return] 'neotree-toggle)
(setq-default neo-show-hidden-files t)
;; List of project directories
;(neotree-dir "/media/tigran/Common/averta-ct-serial/averta-ct/")
(neotree-dir "/media/tigran/Common/armenian-history-project/armenian-history/")

;; adding javascript support
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)


;; Adding js2-refactor and xref-js2 for addition javascript support(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; Adding javascript autocomplition
(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)


;; Making emacs to treat ejs files as html files
;;(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . html-mode))
