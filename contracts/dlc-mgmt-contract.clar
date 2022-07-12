
;; dlc-mgmt-contract
;; <add a description here>

;; constants
;;

;; data maps and vars
;;

;; private functions
;;

;; public functions
;; ;;
(use-trait cb-trait .dlc-create-callback-trait.dlc-create-callback-trait)

(define-public (create-dlc (callback-contract <cb-trait>) (nonce uint))
        ;; (let (( txsend tx-sender))
        (ok (try! (as-contract (contract-call? callback-contract post-create-handler nonce 0x6E65775F75756964))))
        ;; )
)
