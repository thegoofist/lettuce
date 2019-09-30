;;;; lettuce.asd

(asdf:defsystem #:lettuce
  :description "Extensions to let that I end up rewriting for every project."
  :author "<thegoofist@protonmail.com>"
  :license  "Unlicense"
  :version "0.0.1"
  :serial t
  :components ((:file "package")
               (:file "lettuce")))
