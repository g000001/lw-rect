;;;; lw-rect.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)


(defsystem :lw-rect
  :description "rect.el for LispWorks"
  :long-description "rect.el for LispWorks"
  :maintainer "CHIBA Masaomi"
  :version "0.0.1"
  :serial T
  :components ((:file "package")
               (:file "emacsify")
               (:file "lw-rect")))


;;; *EOF*
