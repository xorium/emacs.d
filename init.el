(package-initialize)

(add-to-list 'load-path (expand-file-name "settings" user-emacs-directory))
(require 'oceanic-theme)
(require 'package_my)
(require 'scratch_my)
(require 'hooks_my)
(require 'keybindings_my)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (undo-tree persistent-soft ergoemacs-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
