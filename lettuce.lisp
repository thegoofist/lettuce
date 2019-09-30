;;;; lettuce.lisp

(in-package #:lettuce)

(defmacro let-when ((var test) &body body)
  `(let ((,var ,test))
     (when ,var ,@body)))

(defmacro let-if ((var test) then &optional else)
  `(let ((,var ,test))
     (if ,var ,then ,else)))

(defmacro let-cond (&body forms)
  (let ((tmp-var (gensym)))
    `(let (,tmp-var)
       (cond
         ,@(loop :for (var test . body) :in forms
                 :if (eq var t)
                   :collect (list* t (cons test body))
                 :else
                   :collect `((setf ,tmp-var ,test)
                              (let ((,var ,tmp-var))
                                ,@body)))))))

