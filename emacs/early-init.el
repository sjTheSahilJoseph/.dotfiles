
;; Memory ++
(setq read-process-output-max (* 200 1024 1024))
(setq gc-cons-threshold 1073741824
      gc-cons-percentage 0.6)

(setenv "LSP_USE_PLISTS" "true")

(provide 'early-init)
