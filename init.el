;;
;; PELM's init.el
;; Author: caker
;; Last modified: 2011-12-04
;; Version: 0.5.0

(add-to-list 'load-path "~/.emacs.d")

(defvar pelm-dir (file-name-directory load-file-name)
  "The root dir of the PELM distribution.")

(defvar pelm-plugins-dir (concat pelm-dir "plugins/")
  "This directory houses all of the built-in plem plugin.
   you should avoid modifying the configuration there.")

(defvar pelm-vendor-dir (concat pelm-dir "vendor/")
  "This directory house third part packages of emacs")

(defvar pelm-personal-dir (concat pelm-dir "personal/")
  "Users of PELM are encouraged to keep their personal configuration
   changes in this directory. All Emacs Lisp files there are loaded
   automatically by PELM.")

(add-to-list 'load-path pelm-plugins-dir)
(add-to-list 'load-path pelm-vendor-dir)
(add-to-list 'load-path pelm-personal-dir)

;; the PELM have pre-init.el and post-init.el which you can do your own code
;; pre-init.el load at begin, for example: if you using emacs < 24,you
;; can require org-mode here by :
;; (require 'org)  or you can load it from pre-init-private.org, see below
(load-file "~/.emacs.d/pre-init.el")

;; load the pre-init-private.org file if it exists
;; this file is under .gitignore,
;; so it' wont' be version-controlled. The idea is to make
;; this file load other version-controlled or private stuff
;; before the pelm load.
(if (file-exists-p "~/.emacs.d/pre-init-private.org")
    (org-babel-load-file "~/.emacs.d/pre-init-local.org"))

;; load the core plugins 
(require 'pelm-runtime)
(require 'pelm-ui)
(require 'pelm-keys)
(require 'pelm-shell)
(require 'pelm-server)



;; You're expected to populate .emacs.d/post-init-local.org
;; with your own code after the PELM loaded(kind of overide ?).
;; This file is under .gitignore
;; so it won't be version-controlled. The idea is to
;; make this file load other version-controlled files.

(if (file-exists-p "~/.emacs.d/post-init-local.org")
    (org-babel-load-file "~/.emacs.d/post-local.org"))

(package-manager-show-load-time)

;;; ends init.el here
