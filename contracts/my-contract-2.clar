
;; my-contract-2
;; <add a description here>

;; constants
(define-constant err-cant-unwrap (err u1000))
;;

;; data maps and vars
;;

;; private functions
;;

;; public functions
;;

;; (use-trait cb-trait .callback-trait.callback-trait)
(impl-trait .callback-trait.callback-trait)

(define-public (callback-function (p1 uint))
    (ok (+ p1 p1))
)

(define-public (main-function)
        (unwrap! (ok (as-contract (contract-call? .my-contract trigger-function .my-contract-2))) err-cant-unwrap)
)
