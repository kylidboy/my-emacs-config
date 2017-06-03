;;; package --- init golang
;;; Commentary:
;;; Code:

(use-package go-mode :ensure t)
(use-package company-go :ensure t)
(use-package go-eldoc :ensure t)
(use-package go-guru :ensure t)
;; (use-package go-dlv :ensure t)
(use-package flycheck-gometalinter
  :ensure t
  :config
  (progn
    (flycheck-gometalinter-setup)))
(setenv "GOPATH" "/Users/kyli/Codes/golang")
(setq company-tooltip-limit 20)
(setq company-idle-delay .8)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))
(setq company-minimum-prefix-length 5)

(custom-set-faces
 '(company-preview
   ((t (:foreground "darkgray" :underline t))))
 '(company-preview-common
   ((t (:inherit company-preview))))
 '(company-tooltip
   ((t (:background "lightgray" :foreground "black"))))
 '(company-tooltip-selection
   ((t (:background "steelblue" :foreground "white"))))
 '(company-tooltip-common
   ((((type x)) (:inherit company-tooltip :weight bold))
    (t (:inherit company-tooltip))))
 '(company-tooltip-common-selection
   ((((type x)) (:inherit company-tooltip-selection :weight bold))
    (t (:inherit company-tooltip-selection)))))

(setq gofmt-command "gofmt")
;; skips 'vendor' directories and sets GO15VENDOREXPERIMENT=1
(setq flycheck-gometalinter-vendor t)
;; only show errors
(setq flycheck-gometalinter-errors-only t)
;; only run fast linters
(setq flycheck-gometalinter-fast t)

(add-hook 'go-mode-hook (lambda ()
                          (go-eldoc-setup)

                          (local-set-key (kbd "M-.") 'godef-jump)
                          (local-set-key (kbd "M-,") 'pop-tag-mark)
                          (set (make-local-variable 'company-backends) '(company-go))
                          (go-guru-hl-identifier-mode)
                          (company-mode)
                          ))
(add-hook 'before-save-hook 'gofmt-before-save)

(provide 'init-go)

;;; end
