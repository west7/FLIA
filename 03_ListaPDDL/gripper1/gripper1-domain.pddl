(define (domain gripper-typed)
    (:requirements :typing)
    (:types
        room ball gripper
    )
    (:constants
        left right - gripper
    )
    (:predicates
        (at-robby ?r - room) ;; o robô está em uma sala
        (at ?b - ball ?r - room) ;; uma bola está em um sala
        (free ?g - gripper) ;; o gripper está livre
        (carry ?o - ball ?g - gripper) ;; o gripper está carregando a bola
    )

    (:action move
        :parameters (?from ?to - room)
        :precondition (at-robby ?from)
        :effect (and (at-robby ?to)
            (not (at-robby ?from)))
    )

    (:action pick
        :parameters (?obj - ball ?room - room ?gripper - gripper)
        :precondition (and (at ?obj ?room) (at-robby ?room) (free ?gripper))
        :effect (and (carry ?obj ?gripper)
            (not (at ?obj ?room))
            (not (free ?gripper)))
    )

    (:action drop
        :parameters (?obj - ball ?room - room ?gripper - gripper)
        :precondition (and (carry ?obj ?gripper) (at-robby ?room))
        :effect (and (at ?obj ?room)
            (free ?gripper)
            (not (carry ?obj ?gripper)))
    )
)