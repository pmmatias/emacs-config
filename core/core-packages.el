;; Default (auto-installed) packages
(setq-default package-list '(ac-c-headers
                             all-the-icons
                             all-the-icons-dired
                             anzu
                             ascii-art-to-unicode
                             async
                             auctex
                             auto-complete
                             auto-complete-auctex
                             avy
                             centaur-tabs
                             clojure-mode
                             cmake-mode
                             coffee-mode
                             csharp-mode
                             css-mode
                             csv-mode
                             dashboard
                             diminish
                             dockerfile-mode
                             dumb-jump
                             eglot
                             elpy
                             evil
                             flycheck
                             flycheck-haskell
                             gitconfig-mode
                             gitignore-mode
                             go-mode
                             groovy-mode
                             haskell-mode
                             highlight-parentheses
                             ido-completing-read+
                             ido-vertical-mode
                             iedit
                             json-mode
                             kaolin-themes
                             kotlin-mode
                             lua-mode
                             magit
                             markdown-mode
                             move-text
                             multiple-cursors
                             nasm-mode
                             neotree
                             org-bullets
                             orgbox
                             php-mode
                             powershell
                             projectile
                             rust-mode
                             sql-indent
                             smex
                             spray
                             telephone-line
                             vlf
                             web-mode
                             which-key
                             yasnippet
                             yasnippet-snippets))

;; Packages to auto-install when a file with a given extension is opened
(defvar package-auto-install-alist
  '(("Cask" cask-mode cask-mode)
    ("PKGBUILD\\'" pkgbuild-mode pkgbuild-mode)
    ("\\.adoc\\'" adoc-mode adoc-mode)
    ("\\.d\\'" d-mode d-mode)
    ("\\.dart\\'" dart-mode dart-mode)
    ("\\.elm\\'" elm-mode elm-mode)
    ("\\.ex\\'" elixir-mode elixir-mode)
    ("\\.exs\\'" elixir-mode elixir-mode)
    ("\\.elixir\\'" elixir-mode elixir-mode)
    ("\\.erl\\'" erlang erlang-mode)
    ("\\.feature\\'" feature-mode feature-mode)
    ("\\.fs\\'" fsharp-mode fsharp-mode)
    ("\\.graphql\\'" graphql-mode graphql-mode)
    ("\\.haml\\'" haml-mode haml-mode)
    ("\\.kv\\'" kivy-mode kivy-mode)
    ("\\.less\\'" less-css-mode less-css-mode)
    ("\\.ml\\'" tuareg tuareg-mode)
    ("\\.pp\\'" puppet-mode puppet-mode)
    ("\\.proto\\'" protobuf-mode protobuf-mode)
    ("\\.pyd\\'" cython-mode cython-mode)
    ("\\.pyi\\'" cython-mode cython-mode)
    ("\\.pyx\\'" cython-mode cython-mode)
    ("\\.sass\\'" sass-mode sass-mode)
    ("\\.scala\\'" scala-mode scala-mode)
    ("\\.scss\\'" scss-mode scss-mode)
    ("\\.slim\\'" slim-mode slim-mode)
    ("\\.styl\\'" stylus-mode stylus-mode)
    ("\\.swift\\'" swift-mode swift-mode)
    ("\\.textile\\'" textile-mode textile-mode)
    ("\\.thrift\\'" thrift thrift-mode)
    ("\\.yml\\'" yaml-mode yaml-mode)
    ("\\.yaml\\'" yaml-mode yaml-mode)))

;; Package archives list
(setq-default package-archives
              (quote
               (("org" . "https://orgmode.org/elpa/")
                ("melpa" . "https://melpa.org/packages/")
                ("gnu" . "https://elpa.gnu.org/packages/"))))

;; Enable the packages at the startup
(require 'package)
(setq package-enable-at-startup nil)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install the defaults if they're missing
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(defmacro package-auto-install (extension package mode)
  "When file with a given extension is opened for the first time triggers the auto-install of the corresponding package."
  `(add-to-list 'auto-mode-alist
                `(,extension . (lambda ()
                                 (unless (package-installed-p ',package)
                                   (package-install ',package))
                                 (,mode)))))

;; Set auto-install mappings
(mapc
 (lambda (entry)
   (let ((extension (car entry))
         (package (cadr entry))
         (mode (cadr (cdr entry))))
     (unless (package-installed-p package)
       (package-auto-install extension package mode))))
 package-auto-install-alist)

(provide 'core-packages)
