(in-package :cl-uniquifier/tests)

(fiveam:def-suite uniquifier-tests
  :description "Tests basic uniquifier functionality.")
(fiveam:in-suite uniquifier-tests)

(fiveam:test basic-functionality
  (let ((q (cl-uniquifier:make-uniquifier)))
    (fiveam:is (equal 'A1 (funcall q :big-complicated-symbol)))))

(fiveam:test unique-retrieval
  (let ((q (cl-uniquifier:make-uniquifier)))
    (fiveam:is (equal 'A1 (funcall q :big-complicated-symbol)))
    (fiveam:is (equal 'A1 (funcall q :big-complicated-symbol)))))

(fiveam:test different-uniques
  (let ((q (cl-uniquifier:make-uniquifier)))
    (fiveam:is (equal 'A1 (funcall q :big-complicated-symbol)))
    (fiveam:is (equal 'A2 (funcall q :big-complicated-symbol2)))
    (fiveam:is (equal 'A1 (funcall q :big-complicated-symbol)))))

(fiveam:test altered-prefix
  (let ((q (cl-uniquifier:make-uniquifier "B")))
    (fiveam:is (equal 'B1 (funcall q :big-complicated-symbol)))
    (fiveam:is (equal 'B2 (funcall q :big-complicated-symbol2)))
    (fiveam:is (equal 'B1 (funcall q :big-complicated-symbol)))))

(defun run-test-suite ()
  (fiveam:run! 'uniquifier-tests))
