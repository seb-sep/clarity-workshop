;; Multiplayer Counter contract

;; principal: Stacks address
(define-map balances principal uint)

(define-read-only (get-balance (who principal))
    ;; map-get? returns an optional
    (default-to u0 (map-get? balances who))
)


;; Public function to add to a public account
(define-public (faucet (who principal))
  (let ((new-value (+ u10 (get-balance who))))
    (map-set balances who new-value)
    (ok new-value)
  )
)

(define-public (send (from principal) (to principal) (amount uint))
  (let ((from-balance (get-balance from))
        (to-balance (get-balance to)))
    (if (>= from-balance amount) 
        (begin 
            (map-set balances from (- from-balance amount))
            (map-set balances to (+ amount to-balance))
            (ok "Sent"))
        (err "Not enough balance"))
  )
)


