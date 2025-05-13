(define (domain fliaswitch)
    (:requirements :strips)

    (:predicates
        (switch-is-on)      ;;interruptor está ligado
        (switch-is-off)     ;;interruptor está desligado
    )

    (:action switch-on
        :parameters ()
        :precondition ( 
            switch-is-off
        )
        ::effect (and 
            (switch-is-on) 
            not (switch-is-off) 
        )
    )

    (:action switch-off
        :parameters ()
        :precondition (
            switch-is-on
        )
        :effect (and 
            (switch-is-off)
            not (switch-is-on)
        )
    )
)