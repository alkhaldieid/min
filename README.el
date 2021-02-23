    (setq inhibit-startup-message t)
    (tool-bar-mode -1)
    (fset 'yes-or-no-p 'y-or-n-p)
    (use-package parchment-theme :ensure t)
    (use-package cloud-theme :ensure t)
    (use-package moe-theme :ensure t)
    (use-package zenburn-theme :ensure t)
    (use-package monokai-theme :ensure t)
    (use-package gruvbox-theme :ensure t)
    (use-package ample-theme :ensure t)
    (use-package ample-zen-theme :ensure t)
    (use-package alect-themes :ensure t)
    (use-package tao-theme :ensure t)
    (use-package poet-theme :ensure t)
    (use-package modus-operandi-theme :ensure t)
    (use-package modus-vivendi-theme :ensure t)
    (use-package faff-theme :ensure t)
    (use-package color-theme-modern :ensure t)
    (load-theme 'parchment t)

    (use-package doom-modeline
      :ensure t)
    (doom-modeline-init)


    ;; expand the marked region in semantic increments
    ;;(negative prefix to reduce region)
    (use-package expand-region
      :ensure t
      :config
      (global-set-key (kbd "C-=") 'er/expand-region))

    (setq save-interprogram-paste-before-kill t)

    (use-package aggressive-indent
      :ensure t
      :config
      )

    (global-display-line-numbers-mode)
    (setq display-line-numbers-type 'relative)

    ;; Display battery for when in full screen mode
    ;; Uncomment in laptops
    (display-battery-mode t)

(use-package try :ensure t)
(use-package posframe :ensure t)
(use-package iedit
  :ensure t)

(use-package which-key
      :ensure t
      :config
      (which-key-mode))

(use-package pcre2el
:ensure t
:config
(pcre-mode)
)

(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(add-hook 'mu4e-compose-mode-hook 'turn-on-flyspell)
(add-hook 'mu4e-compose-mode-hook 'turn-on-auto-fill)

(use-package eyebrowse
  :ensure t
  ;; ':ensure t' tells use-package to run package-install
  :diminish eyebrowse-mode
  :config (progn
            (define-key eyebrowse-mode-map (kbd "C-w j") 'eyebrowse-switch-to-window-config-1)
            (define-key eyebrowse-mode-map (kbd "C-w k") 'eyebrowse-switch-to-window-config-2)
            (define-key eyebrowse-mode-map (kbd "C-w l") 'eyebrowse-switch-to-window-config-3)
            (define-key eyebrowse-mode-map (kbd "C-w ;") 'eyebrowse-switch-to-window-config-4)
            (eyebrowse-mode t)
            (setq eyebrowse-new-workspace t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; Evil Stuff ;;;;;;;;;;;
;;; Enable evil mode
(unless (package-installed-p 'evil)
  (package-install 'evil))
(require 'evil)
(evil-mode 1)

;; Enable evil-leader (has to be enabled before evil-mode)

(unless (package-installed-p 'evil-leader)
  (package-install 'evil-leader))
(require 'evil-leader)

;; evil-leader configs
;; (global-evil-leader-mode 1) Enable evil leader in every buffer where evil is enabled
(global-evil-leader-mode 1)
  ;; set the leader key
  (evil-leader/set-leader "<SPC>")
  ;; use (evil-leader/set-key to bind keys in the leader map

  (evil-leader/set-key
;   "<SPC> " 'helm-M-x
   "fs" 'save-buffer
   "ff" 'find-file
 

;   "d"'(lambda() (interactive) (find-file "~/Dropbox/second_final/ieee"))
   ;; buffers

   "bb" 'switch-to-buffer
   "bk" 'kill-buffer
   "bp" 'previous-buffer
   "bn" 'next-buffer
   ;; windows
   "wl" 'evil-window-right
   "wh" 'evil-window-left
   "wk" 'evil-window-up
   "wj" 'evil-window-down
   "wd" 'evil-window-delete
   "wv" 'evil-window-vsplit
   "ws" 'evil-window-split
 
   ;; workspaces
   "lw1" 'eyebrowse-switch-to-window-config-1
   "lw2" 'eyebrowse-switch-to-window-config-2
   "lw3" 'eyebrowse-switch-to-window-config-3
   "lw4" 'eyebrowse-switch-to-window-config-4
   "lw5" 'eyebrowse-switch-to-window-config-5
   "lw6" 'eyebrowse-switch-to-window-config-6
   "lw7" 'eyebrowse-switch-to-window-config-7
   "lw8" 'eyebrowse-switch-to-window-config-8
   "lw9" 'eyebrowse-switch-to-window-config-9
   ;; files
   ;; cf files
   "cfe" '(lambda() (interactive) (find-file "~/.emacs.d/init.el"))
   "cfi" '(lambda() (interactive) (find-file "~/.config/i3/config"))
   "cfa" '(lambda() (interactive) (find-file "~/.config/aliasrc"))
   "cfd" '(lambda() (interactive) (find-file "~/.config/directories"))
   "cfk" '(lambda() (interactive) (find-file "~/.emacs.d/userConfig/keybindings.el"))
   "cfm" '(lambda() (interactive) (find-file "~/.emacs.d/myinit.org"))
   
   ;; evil-nerd-commenter
;;   "ci" 'evilnc-comment-or-uncomment-lines
;;   "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
;;   "cc" 'evilnc-copy-and-comment-lines
;;   "cp" 'evilnc-comment-or-uncomment-paragraphs
;;   "cr" 'comment-or-uncomment-region
;;   "cv" 'evilnc-toggle-invert-comment-line-by-line
;;   "."  'evilnc-copy-and-comment-operator
;;   "//" 'evilnc-comment-operator ; if you prefer backslash key
   
   ;; zoom-in and out
   "=" 'text-scale-increase
   "-" 'text-scale-decrease
   
   ;; org roam
;;   "nl" 'org-roam
;;   "nf" 'org-roam-find-file
;;   "ng" 'org-roam-show-graph
;;   "ni" 'org-roam-insert
   ;; org-roam-bibtex
;;   "na" 'orb-note-actions
   ;; syn layer  keybindings
;;   "ss" 'synonyms
;;   "sl" 'synosaurus-lookup
;;   "sr" 'synosaurus-choose-and-replace
;;   "si" 'synosaurus-choose-and-insert
;;   ;; org-recoll keys
;;   "ps" 'org-recoll-search
;;   "pu" 'org-recoll-update-index
   ;; evil-commentry
  ;; ";" evil-commentry-line
   )
