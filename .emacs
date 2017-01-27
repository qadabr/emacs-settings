
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Назначение клавиш
(define-key global-map (kbd "M-j") 'backward-char)
(define-key global-map (kbd "M-l") 'forward-char)
(define-key global-map (kbd "M-i") 'previous-line)
(define-key global-map (kbd "M-k") 'next-line)

(define-key global-map (kbd "M-u") 'backward-word)
(define-key global-map (kbd "M-o") 'forward-word)

(define-key global-map (kbd "M-;") 'goto-line)

;; Отключение графического меню
(menu-bar-mode -1)

;; Отключение стартового экрана
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

;; Отключение автоматических сохранений
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-list-file-name nil)

;; Включение нумерации строк
(require 'linum)
(line-number-mode t)
(global-linum-mode t)
(column-number-mode t)
(setq linum-format "%3d ")

;; Автозакрытие скобок с перемещением курсора во внутрь
(electric-pair-mode 1)

;; Стиль кода "linux" с отступами в 4 пробела
(setq c-default-style "linux"
      c-basic-offset 8)

;; ggtags для быстрого перехода по символам в проекте
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; Автодополнение
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backend 'company-irony)

(define-key global-map (kbd "M-z") 'company-complete-common)

(defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))

  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))

(global-set-key [tab] 'tab-indent-or-complete)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'c-mode-common-hook 'irony-mode)
(add-hook 'c-mode-common-hook 'company-mode)

(require 'semantic/ia)
(global-semanticdb-minor-mode)
(global-semantic-highlight-func-mode)
(global-semantic-decoration-mode)
(global-semantic-idle-scheduler-mode)
(global-semantic-idle-completions-mode)
(global-semantic-idle-summary-mode)

(semantic-mode 1)

(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; Рефакторинг
(require 'srefactor)
(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)

;; Подсветка
(require 'semantic/bovine/c nil 'noerror)
(load-file "~/.emacs.d/region-list-edit.el")
(load-file "~/.emacs.d/zjl-hl.el")
(zjl-hl-enable-global 'c-mode)
(zjl-hl-enable-global 'c++-mode)
(zjl-hl-enable-global 'java-mode)

;; Сниппеты
(require 'yasnippet)
(yas-global-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "b9b1a8d2ec1d5c17700e1a09256f33c2520b26f49980ed9e217e444c381279a9" "12b7ed9b0e990f6d41827c343467d2a6c464094cbcc6d0844df32837b50655f9" "83faf27892c7119f6016e3609f346d3dae3516dede8fd8a5940373d98f615b4e" "d606ac41cdd7054841941455c0151c54f8bff7e4e050255dbd4ae4d60ab640c1" default)))
 '(package-selected-packages
   (quote
    (highlight monokai-theme suscolors-theme meacupla-theme labburn-theme foggy-night-theme yasnippet srefactor ggtags company-irony company-c-headers)))
 '(rainbow-identifiers-choose-face-function (quote rainbow-identifiers-cie-l*a*b*-choose-face) t)
 '(rainbow-identifiers-cie-l*a*b*-color-count 1024 t)
 '(rainbow-identifiers-cie-l*a*b*-lightness 80 t)
 '(rainbow-identifiers-cie-l*a*b*-saturation 25 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
