(require 'asdf)

(asdf:initialize-source-registry
  (list
   :source-registry
   (list :tree "../common-lisp")
   :inherit-configuration))

(asdf:test-system :cl-uniquifier)
