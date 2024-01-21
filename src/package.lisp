(defpackage :cl-uniquifier
  #+:genera
  (:shadowing-import-from :common-lisp :lambda :simple-string :string)
  (:use #-:genera :cl #+:genera :future-common-lisp)
  (:export make-uniquifier))
