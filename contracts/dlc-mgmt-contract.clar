
;; dlc-mgmt-contract
;; Sample DLC management contract.
;; Used by DLC.Link to manage DLCs on-chain, and trigger events for off-chain DLC creation and closing

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
        (ok (try! (as-contract (contract-call? callback-contract post-create-handler nonce 0x6E65775F75756964))))
)

;; Could we swap the callback-contract parameter for tx-sender?
