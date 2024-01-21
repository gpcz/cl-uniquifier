(defsystem "cl-uniquifier"
  :author "Greg Czerniak"
  :description "Produces a function that will return a new simple unique
                symbol for every symbol that is introduced.
                Good for generating files that require simple names for
                things, code obfuscation, etc."
  :license "MIT"
  :version "1.0.1"
  :depends-on ("bordeaux-threads")
  :pathname "src/"
  :components
  ((:file "package")
   (:file "uniquifier" :depends-on ("package")))
  :in-order-to ((test-op (test-op "cl-uniquifier/tests"))))

(defsystem "cl-uniquifier/tests"
  :author "Greg Czerniak"
  :description "Tests the functionality of uniquifier"
  :license "MIT"
  :pathname "tests/"
  :depends-on ("cl-uniquifier" "fiveam")
  :components ((:file "package")
               (:file "uniquifier-tests" :depends-on ("package")))
  :perform (test-op (o c) (symbol-call :cl-uniquifier/tests :run-test-suite)))
