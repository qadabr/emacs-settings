;;(standard-display-ascii ?\r "¤")
;;(standard-display-ascii ?\n "¬\n")

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

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-common-hook 'irony-mode)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages (quote (irony yasnippet sublime-themes auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
