(require 'centaur-tabs)

;; Enable Centaur Tabs
(centaur-tabs-mode t)

;; Set tab style to box
(setq centaur-tabs-style "box")

;; Display icons on the tabs
(setq centaur-tabs-set-icons t)

;; Display a colored bar at the left of the selected tab
(setq centaur-tabs-set-bar 'left)

;; Show a '*' on the tab if the buffer is modified
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-modified-marker "*")

;; Disable tabs on certain buffers
(add-hook 'shell-mode-hook 'centaur-tabs-local-mode)
(add-hook 'ediff-prepare-buffer-hook 'centaur-tabs-local-mode)

(provide 'pemacs-centaur-tabs)
