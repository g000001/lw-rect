;;;; package.lisp -*- Mode: Lisp;-*- 
(cl:in-package "COMMON-LISP-USER")


(defpackage "https://github.com/g000001/lw-rect"
  (:nicknames lw-rect)
  (:use)
  (:export
   *ctl-x-r-map*
   delete-rectangle-command
   kill-rectangle-command
   yank-rectangle-command
   string-rectangle-command))


(defpackage "https://github.com/g000001/lw-rect#internals"
  (:use "https://github.com/g000001/lw-rect"
        "COMMON-LISP"
        "EDITOR"))


(cl:in-package "https://github.com/g000001/lw-rect#internals")


(macrolet ((define-aliases (&rest syms)
             `(progn
                ,@(mapcar (lambda (name)
                            `(defmacro ,(intern (concatenate 'string 
                                                             (load-time-value (string 'ed.))
                                                             (string name)))
                                       (&rest args)
                               (declare (hcl:lambda-list ,@(lw:function-lambda-list name)))
                               `(,',name ,@args)))
                          syms))))
  (define-aliases
   editor::call-delete-points-and-save
   editor::crunch-key
   editor::find-command
   editor::find-next-newline
   editor::find-previous-newline
   editor::get-right-table
   editor::last-command-type
   editor::limited-character-offset
   editor::make-i-point
   editor::make-key-table
   editor::point-bigline
   editor::set-table-entry
   editor::move-buffer-point-to-offset
   ))


;;; *EOF*
