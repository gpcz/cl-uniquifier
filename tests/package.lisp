(defpackage :cl-uniquifier/tests
  #+:genera
  (:shadowing-import-from :common-lisp :lambda :simple-string :string)
  (:use #-:genera :cl #+:genera :future-common-lisp :fiveam :cl-uniquifier)
  (:export run!))
