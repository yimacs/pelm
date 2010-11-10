;; format configurations 

;; TODO 
;;
;; A bunch of customizations for the C-family languages under CC-mode...
;; These things define a "style" with various indentations and behaviors
;; specified.
;;
(defconst my-c-style
  '((c-offsets-alist . ((substatement-open . 0)
						(defun-block-intro . 4)
						(statement-block-intro . 4)
						(case-label . 4)
										; (inclass . 0)
										; (topmost-intro . 0)
						(inher-cont . 4)
						(inline-open . 4)))
    (c-echo-syntactic-information-p . t)
    )
  "My style for C-like languages")
;;
;; Create a hook that CC-mode, the mode that handles intelligent editing for
;; C-family languages will use to figure out various things it needs to know
;; about what you want things to look like.
;;
(defun my-c-mode-common-hook ()
  (c-add-style "PERSONAL" my-c-style t)
  (setq tab-width 4 indent-tabs-mode nil); Indent with spaces not tabs, dammit!
  )

;; Added the hook to environment
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; format 

(setq c-default-style "bsd"
	  c-basic-offset 4)

(setq c-mode-hook
	  (function (lambda ()
				  (setq indent-tabs-mode nil)
				  (setq c-indent-level 4))))
(setq objc-mode-hook
	  (function (lambda ()
				  (setq indent-tabs-mode nil)
				  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
				  (setq indent-tabs-mode nil)
				  (setq c-indent-level 4))))

(setq nxml-mode-hook
      (function (lambda ()
				  (setq indent-tabs-mode nil)
				  (setq c-indent-level 4))))

;; 
(setq tab-width 4)


