(defpackage :utils
  (:use :cl)
  (:export :string-to-list))

(defpackage :shell
  (:use :cl)
  (:import-from :utils
                :string-to-list)
  (:export :log-to-stdout
           :execute-in-system
           :get-result-from-system
           :get-list-from-system
           :exists-in-system-p
           :execute-if-exists))

(defpackage :interface
  (:use :cl)
  (:import-from :shell
                :log-to-stdout
                :execute-if-exists)
  (:export :log-to-user))

(defpackage :system
  (:use :cl)
  (:import-from :shell
                :execute-in-system
                :exists-in-system-p)
  (:import-from :interface
                :log-to-user)
  (:export :suspend-system))

(defpackage :hardware
  (:use :cl)
  (:import-from :shell
                :get-result-from-system
                :get-list-from-system)
  (:export :get-batteries
           :get-remaining-charge))

(defpackage :main
  (:use :cl)
  (:import-from :shell
                :log-to-stdout
                :execute-if-exists)
  (:import-from :interface
                :log-to-user)
  (:import-from :system
                :suspend-system)
  (:import-from :hardware
                :get-batteries
                :get-remaining-charge)
  (:export :main))
