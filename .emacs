;; Назначение клавиш
(define-key global-map (kbd "M-j") 'backward-char)
(define-key global-map (kbd "M-l") 'forward-char)
(define-key global-map (kbd "M-i") 'previous-line)
(define-key global-map (kbd "M-k") 'next-line)

(define-key global-map (kbd "M-u") 'backward-word)
(define-key global-map (kbd "M-o") 'forward-word)

(define-key global-map (kbd "M-;") 'goto-line)

;; Отступы
(setq tab-width 8)
(setq c-basic-offset 8)

;; Отключение графического меню
(menu-bar-mode -1)

;; Отключение стартового экрана
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Отключение автоматических сохранений
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)

;; Автозакрытие скобок с перемещением курсора во внутрь
(electric-pair-mode 1)

;; Включение нумерации строк
(require 'linum)
(line-number-mode t)
(global-linum-mode t)
(column-number-mode t)
(setq linum-format "%3d ")

;; Подключение списка плагинов
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Автодополнение
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

;; Cниппеты
(require 'yasnippet)
(yas-global-mode 1)

(custom-set-variables
 '(custom-enabled-themes (quote (wombat))))
(custom-set-faces)
