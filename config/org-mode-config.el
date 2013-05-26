(add-to-list 'load-path "~/.live-pack/org-pack/lib/vendor/org-mode/lisp")
(add-to-list 'load-path "~/.live-pack/org-pack/lib/vendor/org-mode/contrib")

(live-add-pack-lib "vendor/org-reveal")
(live-add-pack-lib "vendor/org-mode/lisp")
(live-add-pack-lib "vendor/org-mode/contrib/lisp")
(require 'org-version)
(require 'org-loaddefs)

(setq org-completion-use-ido t)

;; Yasnippet compatibility
(add-hook 'org-mode-hook
          (lambda ()
            (org-set-local 'yas/trigger-key [tab])
                                  (define-key yas/keymap [tab] 'yas/next-field-or-maybe-expand)))

(defun yas/org-very-safe-expand ()
              (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(add-hook 'org-mode-hook
          (lambda ()
            (make-variable-buffer-local 'yas/trigger-key)
            (setq yas/trigger-key [tab])
            (add-to-list 'org-tab-first-hook 'yas/org-very-safe-expand)
            (define-key yas/keymap [tab] 'yas/next-field)))

(require 'org-install)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; e-mail editing with org-mode
(require 'org-mime)
(setq org-mime-library 'mml)
(add-hook 'org-mime-html-hook
          (lambda ()
            (org-mime-change-element-style
             "pre" (format "color: %s; background-color: %s; padding: 0.5em;"
                           "#E6E1DC" "#232323"))))
(add-hook 'org-mime-html-hook
          (lambda ()
            (org-mime-change-element-style
             "blockquote" "border-left: 2px solid gray; padding-left: 4px;")))

(setq org-pretty-entities t
      org-entities-user '(("CC" "\\CC" t "&#8450;" "C" "C" "ℂ")
                          ("FF" "\\FF" t "&#120125;" "F" "F" "𝔽")
                          ("HH" "\\HH" t "&#8461;" "H" "H" "ℍ")
                          ("NN" "\\NN" t "&#8469;" "N" "N" "ℕ")
                          ("PP" "\\PP" t "&#8473;" "P" "P" "ℙ")
                          ("QQ" "\\QQ" t "&#8474;" "Q" "Q" "ℚ")
                          ("RR" "\\RR" t "&#8477;" "R" "R" "ℝ")
                          ("ZZ" "\\ZZ" t "&#8484;" "Z" "Z" "ℤ")))

(require 'org-protocol)
(require 'ox-reveal)
