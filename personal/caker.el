
(setq default-directory "~/src/Android/DIT/dit-app/")

(custom-set-variables
 '(ecb-layout-name "left1")
 '(ecb-layout-window-sizes (quote (("left1" (0.30 . 0.30) (0.15 . 0.35) (0.15 . 0.35) (0.30 . 0.35)))))
 '(jabber-alert-message-hooks (quote (jabber-message-awesome jabber-message-echo jabber-message-scroll)))
 '(jabber-alert-presence-hooks (quote (jabber-presence-awesome jabber-presence-echo)))
 '(jabber-avatar-verbose nil)
 '(jabber-show-offline-contacts nil)
 '(jabber-vcard-avatars-publish nil)
 '(scala-interpreter "/usr/local/bin/scala")
 '(jabber-show-resources nil)
 '(jabber-roster-show-bindings nil)
 '(jabber-roster-show-title nil)
 '(jabber-vcard-avatars-retrieve nil)
 '(android-mode-sdk-dir "~/Library/android-sdk-mac_x86")
 )

;; set PATH for eshell
(setq path-as-list (split-string (getenv "PATH") ":"))
(add-to-list 'path-as-list "/Users/eggcaker/.oh-my-zsh/bin") ; they need path form "/"
(add-to-list 'path-as-list"/usr/local/bin");
(setenv "PATH" (mapconcat 'identity path-as-list ":"))

(add-hook 'gud-mode-hook
    (lambda ()
            (add-to-list 'gud-jdb-classpath "~/Library/android-sdk-mac_x86/platforms/android-8/android.jar ")
    )
)

;; jabber start 
(setq jabber-account-list
      '(("eggcaker@gmail.com" 
    (:network-server . "talk.google.com")
    (:connection-type . ssl))))

;;(jabber-connect-all)

(setq user-mail-address "eggcaker@gmail.com")

(setq user-full-name    "Egg Caker"
     user-mail-address "eggcaker@gmail.com")