(define (problem turn-it-on)
    (:domain fliaswitch)
    ;; (:objects
    ;;     lamp1 lamp2 lamp3 lamp4 lamp5
    ;; )

    (:init
        (switch-is-off)
    )

    (:goal
        (and
            (switch-is-on)
        )
    )
)