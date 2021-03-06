;;; pelm-misc.el --- PELM misc
;;
;; Copyight (c) 2011-2015 eggcaker
;;
;; Authors: eggcaker <eggcaker@gmail.com>
;; URL: http://caker.me/pelm


;; This file is not part of GNU Emacs

;;; Code:


(defun mp-insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %A")))
 
(defun mp-insert-time ()
  (interactive)
  (insert (format-time-string "%X")))
 
(global-set-key (kbd "C-c i d") 'mp-insert-date)
(global-set-key (kbd "C-c i t") 'mp-insert-time)


(require 'find-dired)
(setq find-ls-option '("-print0 | xargs -0 ls -ld" . "-ld"))

(setq display-time-day-and-date t
      display-time-24hr-format t)

;  (setq system-time-locale "en_US.utf8")
   (setq system-time-locale "C")

(display-time )

;(setq system-time-locale "C")



(fset 'format_xml
      (lambda (&optional arg)
        "Keyboard macro."
        (interactive "p")
        (kmacro-exec-ring-item (quote ([19 34 32 13 return] 0 "%d")) arg)))


(defun swap-buffers-in-windows ()
  "Put the buffer from the selected window in next window, and vice versa"
  (interactive)
  (let* ((this (selected-window))
     (other (next-window))
     (this-buffer (window-buffer this))
     (other-buffer (window-buffer other)))
    (set-window-buffer other this-buffer)
    (set-window-buffer this other-buffer)
    )
  )

(define-key pelm-keymap "s" 'swap-buffers-in-windows)


(defun start_work ()
  "pull all repos before start work "
  (interactive)
  (pelm-clock-in-task-by-id "4233C029-C856-422C-A0F6-8E6EF2E40698")
  (org-mobile-pull)
  (async-shell-command  "~/.dotfiles/bin/c.sw"))

(defun go_home ()
  "push all repos before go home "
  (interactive)
  (org-save-all-org-buffers)
  (pelm-clock-in-task-by-id "E84E9FE4-7BFF-41CD-A88A-B167DB8EA065")
  (org-mobile-push)
  (async-shell-command "~/.dotfiles/bin/c.gh"))

(define-key pelm-keymap "," 'start_work)
(define-key pelm-keymap "." 'go_home)

(require 'jabber)
(setq jabber-account-list
      '(
        ("eggcaker@gmail.com"
         (:connection-type . ssl)
         (:network-server . "talk.google.com")
         (:port . 5223)
        )
       ))

(custom-set-variables

 '(jabber-auto-reconnect nil)
 '(jabber-avatar-verbose nil)
 '(jabber-vcard-avatars-retrieve nil)
 '(jabber-chat-buffer-format "*-jabber-%n-*")
 '(jabber-history-enabled t)
 '(jabber-mode-line-mode t)
 '(jabber-roster-buffer "*-jabber-*")
 '(jabber-roster-line-format " %c %-25n %u %-8s (%r)")
 '(jabber-show-offline-contacts nil))


(projectile-global-mode)


(define-key pelm-keymap "p" 'epresent-run)


;; games

(eval-after-load "2048-game"  
   '(progn
  (define-key 2048-mode-map (kbd "k") '2048-up)
  (define-key 2048-mode-map (kbd "j") '2048-down)
  (define-key 2048-mode-map (kbd "h") '2048-left)
  (define-key 2048-mode-map (kbd "l") '2048-right)))

(provide 'pelm-misc)

;; pelm-misc.el ends here
