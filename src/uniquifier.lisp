(in-package :cl-uniquifier)

(declaim (ftype (function (simple-string fixnum)
                          (values symbol
                                  (member nil :inherited :external
                                              :internal)
                                  &optional))
                make-unique-designation))
(defun make-unique-designation (prefix uniq-counter)
  (intern (format nil "~A~A" prefix uniq-counter)))

;;; External functions

(declaim (ftype (function (&optional simple-string)
                          (values function &optional))
                make-uniquifier))
(defun make-uniquifier (&optional (prefix "A"))
  (let ((uniq-hash-table (make-hash-table))
        (uniq-counter 1))
    (lambda (the-symbol)
      (or (gethash the-symbol uniq-hash-table)
          (prog1
              (setf (gethash the-symbol uniq-hash-table)
                    (make-unique-designation prefix uniq-counter))
            (incf uniq-counter))))))
