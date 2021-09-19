;;; -*- mode: Lisp; coding: utf-8  -*-

(cl:in-package "https://github.com/g000001/lw-rect#internals")


(defvar *ctl-x-r-map* (ed.make-key-table))


(define-key (ed.get-right-table :global :emacs) #("Control-x" "r") *ctl-x-r-map*)


(define-key *ctl-x-r-map* "d" "Delete Rectangle")


(define-key *ctl-x-r-map* "t" "String Rectangle")


(define-key *ctl-x-r-map* "k" "Kill Rectangle")


(define-key *ctl-x-r-map* "y" "Yank Rectangle")


;;; *EOF*
