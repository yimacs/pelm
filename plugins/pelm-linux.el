;;; package --- pelm-linux.el  PELM configuration for linux
;;; Commentary:
;; Linux configurations
;;
;; Copyright (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm

;; This file is not part of GNU Emacs

;;; Code:

(defun pelm-linux-toggle-fullscreen ()
  "Toggle full screen for linux."
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)))

(when (string-match "linux" system-configuration)
  (define-key pelm-keymap "uf" 'pelm-linux-toggle-fullscreen)
  (set-face-font 'default "M+ 1mn medium-18"))

(provide 'pelm-linux)
;;; pelm-linux.el ends here
