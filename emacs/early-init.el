
;; Memory ++
(setq gc-cons-threshold most-positive-fixnum)
(add-hook 'after-init-hook
    (lambda ()
        (setq gc-cons-threshold (* 200 1024 1024))))

(setq read-process-output-max (* 200 1024 1024))

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

(provide 'early-init)
