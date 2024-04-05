
;; title: foo
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;
(define-data-var count int 0)
(define-public (add-number (number int))
    (let
        (
            (current-count count)
        )

        (var-set count (+ 1 number))
        (ok (var-get count))
    )
)


(add-number 5)
;; constants
;;

;; data vars
;;

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; private functions
;;

