(when (maybe-require-package 'shm)
  (remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook 'structured-haskell-mode))

(when (maybe-require-package 'tern)
  (add-hook 'js-mode-hook (lambda () (tern-mode t))))

(when (maybe-require-package 'company-tern)
  (eval-after-load
      'company-mode
    '(add-to-list 'company-backends 'company-tern)))

(when (maybe-require-package 'web-beautify)
  (add-hook 'js2-mode-hook (lambda () (define-key js2-mode-map (kbd "C-c b") 'web-beautify-js)))
  (add-hook 'web-mode-hook (lambda () (define-key web-mode-map (kbd "C-c b") 'web-beautify-html)))
  (add-hook 'css-mode-hook (lambda () (define-key css-mode-map (kbd "C-c b") 'web-beautify-css)))
  (add-hook 'json-mode (lambda () (define-key json-mode-map (kbd "C-c b") 'web-beautify-js)))
  (add-hook 'sgml-mode (lambda () (define-key html-mode-map (kbd "C-c b") 'web-beautify-html))))

(provide 'init-local)
