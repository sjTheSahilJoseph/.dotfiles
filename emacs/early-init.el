
;; Memory ++
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
    (lambda ()
        (setq gc-cons-threshold (* 100 1024 1024))))

(setq read-process-output-max (* 100 1024 1024))

