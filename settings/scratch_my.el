;; Ergoemacs settings.
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (persistent-soft ergoemacs-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; The full name of the user logged in
;; Full mailing address of user
(setq-default user-full-name   "kirill"
              user-mail-adress "nicrontir@yandex.ru")

;; Get PATH from user defined PATH
(exec-path-from-shell-initialize)

;; Set bash as default shell
(setq shell-file-name           "/bin/bash"
      explicit-shell-file-name  "/bin/bash")

;; Display the name of the current buffer in the title bar
(setq frame-title-format "%b")

;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      t
      imenu-use-popup-menu   nil)
(semantic-mode 1)

;; Autosave and restore Emacs sessions
(desktop-save-mode 1)

;; Disabling warnings at startup
(setq warning-minimum-level :emergency)

;; Disable GUI components
(setq show-paren-style 'expression)
(show-paren-mode 2)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1) 

;; Disable autosaves, backup etc
(setq make-backup-files        nil)
(setq auto-save-list-file-name nil)
(setq auto-save-default        nil)
(setq backup-inhibited t)

;; Coding-system settings
(set-language-environment               'UTF-8)
(setq buffer-file-coding-system         'utf-8
      file-name-coding-system           'utf-8)
(setq-default coding-system-for-read    'utf-8)
(set-selection-coding-system            'utf-8)
(set-keyboard-coding-system             'utf-8-unix)
(set-terminal-coding-system             'utf-8)
(prefer-coding-system                   'utf-8)

;; Display lines numbers
(global-linum-mode t)
(setq linum-format "%d ")

;; Scrolling settings
(setq scroll-step             1
      scroll-margin           10
      scroll-conservatively   10000)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; Highlight search results
(setq search-highlight            t
      query-replace-highlight     t
      auto-window-vscroll         nil
      bidi-display-reordering     nil)

;; Helm mode
(require 'helm-config) 
(helm-mode 1)

;; Draw 79 column width vertical line
(add-hook 'emacs-lisp-mode-hook (lambda ()
    (fci-mode 1)
    (setq fci-rule-column 79)
    (setq fci-rule-color "#48555c")
  ))

;; Neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

;; Buffers layouts
(defun load-purpose-mode ()
  (interactive)
  (purpose-load-window-layout-file "~/.emacs.d/settings/layouts/full-ide.window-layout")
  (purpose-x-code1-setup)

  (add-to-list 'purpose-user-mode-purposes
             '(neotree-mode . dired))
)
(global-set-key (kbd "M-}") 'load-purpose-mode)

;; Show buffers hot-key
(global-set-key (kbd "C-x C-b") 'bs-show)

;; Projectile settings
(require 'projectile)
(setq projectile-project-search-path '("~/projects/"))
;(define-key projectile-mode-map (kbd "M-p") 'projectile-command-map)
;(global-set-key (kbd "M-p") 'projectile-commander)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)

;; Global formatting settings
(setq-default indent-tabs-mode t)
(setq-default tab-width 2)
(global-set-key (kbd "TAB") 'self-insert-command)

;; Golang settings

;; Buffer navigation
(global-set-key (kbd "M-P") 'recenter-top-bottom)
(global-set-key (kbd "C-g") 'goto-line)
;; Panels navigation
(global-set-key (kbd "C-j")  'windmove-left)
(global-set-key (kbd "C-l") 'windmove-right)
(global-set-key (kbd "C-i")    'windmove-up)
(global-set-key (kbd "C-j")  'windmove-down)


(provide 'scratch_my)
