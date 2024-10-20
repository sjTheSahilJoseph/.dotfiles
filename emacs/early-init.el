
;; Memory ++
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
    (lambda ()
        (setq gc-cons-threshold (* 200 1024 1024))))

(setq read-process-output-max (* 200 1024 1024))

