
;; my-contract
;; <add a description here>

;; constants
;;

;; data maps and vars
;;

;; private functions
;;

;; public functions
;; ;;
(use-trait cb-trait .callback-trait.callback-trait)

(define-public (trigger-function (callback-contract <cb-trait>))
        (ok (try! (as-contract (contract-call? callback-contract callback-function u5))))
)
