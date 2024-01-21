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
  "Given optional simple-string PREFIX, generate a function that takes
   in a symbol and returns another unique symbol.  These symbols will
   be the same for the same input symbol, but different for different
   symbols.  Useful for code obfuscation or when you need simplified
   names as proxies for complicated ones."
  (let ((uniq-hash-table (make-hash-table))
        (uniq-counter 1)
        (uniq-lock (bt:make-lock)))
    (lambda (the-symbol)
      (bt:with-lock-held (uniq-lock)
        (or (gethash the-symbol uniq-hash-table)
            (prog1
                (setf (gethash the-symbol uniq-hash-table)
                      (make-unique-designation prefix uniq-counter))
              (incf uniq-counter)))))))
