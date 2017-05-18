;; -*- mode: lisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/lua-mode")

;; Load cmake only on OSX. I don't really use it on Linux
(if (eq system-type 'darwin)
    (progn (setq cellar-dir (file-name-as-directory "/usr/local/Cellar"))
           (add-to-list 'load-path (concat cellar-dir "cmake/3.7.2_1/share/emacs/site-lisp/cmake"))
           (require 'cmake-mode)
           (setq auto-mode-alist
                 (append
                  '(("CMakeLists\\.txt\\'" . cmake-mode))
                  '(("\\.cmake\\'" . cmake-mode))
                  auto-mode-alist))))

;; Compile mode settings
(setq compilation-scroll-output t)
(setq first-error t)

(require 'highlight-chars)
(require 'org)

;;(require 'timeclock-x)
;;(timeclock-modeline-display 1)
;;(timeclock-initialize)


(hc-toggle-highlight-trailing-whitespace)

;; C-mode to Andrea's liking
(setq-default indent-tabs-mode nil)

(setq c-default-style "linux"
      c-basic-offset 4)
(setq column-number-mode t)

;;;;org-mode configuration
;; Make org-mode work with files ending in .org
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen


;;;; lua-mode configuration
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
