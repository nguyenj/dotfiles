(setq package-enable-at-startup nil)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                          ("melpa" . "http://melpa.org/packages/")
                          ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)

                                        ; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

(use-package nord-theme
  :ensure t
  :config
  (load-theme 'nord t))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
                                        ; Handle half page navigation
  (when evil-want-C-u-scroll
    (define-key evil-insert-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
    (define-key evil-motion-state-map (kbd "C-u") 'evil-scroll-up)))

(use-package counsel
  :ensure t
  :bind (("M-x" . counsel-M-x)
          ("C-x C-f" . counsel-find-file)))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
    enable-recursive-minibuffers t
    ivy-count-format "(%d/%d) "
    ivy-re-builders-alist '((swiper . ivy--regex-plus)
                             (counsel-ag . ivy--regex-plus)
                             (counsel-grep-or-swiper . ivy--regex-plus)
                             (t . ivy--regex-fuzzy))))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(use-package js2-mode
  :ensure t
  :mode (("\\.js\\'" . js2-mode))
  :config
  (custom-set-variables '(js2-mode-show-parse-errors nil)
    '(js2-mode-show-strict-warnings nil)))

(use-package haml-mode
  :ensure t
  :mode (("\\.haml\\'" . haml-mode)))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1))

(use-package counsel-projectile
  :ensure t
  :init
  (counsel-projectile-mode 1))

(use-package magit
  :ensure t)


                                        ; display line numbers
(global-linum-mode 1)

                                        ; highlight the current line
(global-hl-line-mode t)

                                        ; hide menu bar
(menu-bar-mode -1)

                                        ; alias y = yes n = no in prompts
(defalias 'yes-or-no-p 'y-or-n-p)

                                        ; hide welcome screen
(setq inhibit-splash-screen t)

                                        ; stop creating backup~ files
(setq make-backup-files nil)

                                        ; stop creating #autosave# files
(setq auto-save-default nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(package-selected-packages
     (quote
       (magit with-editor use-package nord-theme magit-popup js2-mode haml-mode evil editorconfig counsel-projectile))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
