;;; -*- mode: Lisp; coding: utf-8  -*-

(cl:in-package "https://github.com/g000001/lw-rect#internals")


(defun goto-char (pos)
  (ed.move-buffer-point-to-offset (current-buffer) pos))


(defun line-beginning-position ()
  (let ((p (current-point)))
    (1+ (max 0 (ed.find-previous-newline (ed.point-bigline p) (point-offset p))))))


(defun line-end-position ()
  (let ((p (current-point)))
    (ed.find-next-newline (ed.point-bigline p) (point-offset p))))


(defun copy-marker (point)
  (position-to-point point))


(defun bolp ()
  (= (point-position)
     (line-beginning-position)))


(defun eolp ()
  (= (point-position)
     (line-end-position)))


(defun forward-line (&optional (p 1))
  (let* ((point (current-point)))
    (dotimes (n p)
      (line-end point)
      (unless (ed.limited-character-offset (current-point) 1)
        (return-from forward-line p)))
    (setf (ed.last-command-type) :line-motion)
    0))


(defun move-to-column (column &optional forcep)
  (declare (ignore forcep))
  (line-start (current-point))
  (forward-character-command column)
  column)


(defun push-mark ()
  (set-current-mark (current-point)))


(defun current-column ()
  (point-column (current-point)))


(defun define-key (map keybind cmd)
  (ed.set-table-entry map
                      (ed.crunch-key keybind)
                      (typecase  cmd
                        (string (ed.find-command cmd))
                        (T cmd))))


(defun position-to-point (pos)
  (ed.make-i-point (ed.point-bigline (current-point)) pos :after-insert (current-buffer)))


;;; *EOF*
