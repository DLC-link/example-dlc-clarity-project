
;; protocol-contract
;; <add a description here>

;; constants
(define-constant err-cant-unwrap (err u1000))
(define-constant err-unknown-user-contract (err u2003))
;;

;; data maps and vars
;;
(define-map usercontracts
	uint
	{
    dlc_uuid: (optional (buff 8)),
    nonce: uint
    ;; Other data about the user and their specific contract
	}
)


;; private functions
;;

;; public functions
;;

(use-trait cb-trait .dlc-create-callback-trait.dlc-create-callback-trait)
(impl-trait .dlc-create-callback-trait.dlc-create-callback-trait)

;; implemented from the trait, this is what is used to pass back the uuid created by the DLC system
(define-public (post-create-handler (nonce uint) (uuid (buff 8)))
    (begin
        (print {uuid: uuid, nonce: nonce})
        (map-set usercontracts nonce (
            merge (unwrap! (map-get? usercontracts nonce) err-unknown-user-contract ) {
            dlc_uuid: (some uuid),
            nonce: nonce
        }))
        (ok true)
    )
)

(define-public (setup-user-contract (target <cb-trait>))
    ;; as one of the steps in the setup-user-contract function, it calls the dlc contract to create a dlc
    (let ((nonce u12345))
    (begin
        (map-set usercontracts nonce {
                dlc_uuid: none,
                nonce: nonce
            })
        (unwrap! (ok (as-contract (contract-call? .dlc-mgmt-contract create-dlc target u12345))) err-cant-unwrap)
    ))
)
;; Calling setup-user-contract should return 3, as the initial value of 1 gets incremented twice
;; Once in create-dlc, and once in post-create-handler
;; Call with (contract-call? .protocol-contract setup-user-contract .protocol-contract)

