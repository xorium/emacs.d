;;; Если el-get не установлен, его нужно установить
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;;; Эта часть взята из официальной документации el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;;; Указываем, где будут храниться "рецепты" (набор параметров для каждого пакета в терминологии el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/settings/recipes")
(el-get 'sync) ;;; Получаем список пакетов, доступных для установки

;;; Список пакетов, которые будут установлены через el-get
(setq required-packages
      (append
       '(
         ergoemacs-mode
         projectile
         go-eldoc
         go-mode
         go-company
         go-rename
         go-scratch
         go-rename
         window-purpose
         )
       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

;;; Установка пакетов через el-get
(el-get 'sync required-packages)

;;; А эти пакеты - из MELPA Stable
(defvar elpa-packages '(
                        all-the-icons
                        helm
                        helm-projectile
                        neotree
                        desktop+
                        fill-column-indicator
                        exec-path-from-shell
                        ))

(defun cfg:install-packages ()
  (let ((pkgs (remove-if #'package-installed-p elpa-packages)))
    (when pkgs
      (message "%s" "Emacs refresh packages database...")
      (package-refresh-contents)
      (message "%s" " done.")
      (dolist (p elpa-packages)
        (package-install p)))))

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;; Раскомментируйте строку ниже, если хотите, чтобы так же стал доступен основной репозиторий MELPA
;;; Пакеты там более свежие, но и шансов нарваться на глюки больше, чем в Stable
;;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;;; Обновляем список пакетов, доступных для установки через packages
(package-initialize)

;;; Запускаем процесс установки
(cfg:install-packages)

(provide 'package_my)