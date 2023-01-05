;;; Mode line settings
(column-number-mode 1)
(display-time-mode 1)

;;; General settings
(tool-bar-mode -1)


;;; Aliases
(defalias 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

;;; custom-set-variables
(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file 'noerror)

;;; History and backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(recentf-mode t)

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t
      history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1
      savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))
