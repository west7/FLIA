(define
    (domain puzznic)
    (:requirements :strips :typing :negative-preconditions :conditional-effects :numeric-fluents)
    (:types
        block - object
        movable-block immovable-block - block
        matching-block - movable-block
    )
    (:functions
        (num-steps)
    )
    (:predicates
        (is-empty ?b - block)
        (is-immovable ?b - block)

        (is-falling ?b - matching-block)
        (is-on-falling-cooldown ?b - matching-block)

        (is-marked ?b - matching-block)
        (is-matching ?b - matching-block)
        (might-fall ?b - matching-block)

        (left ?b1 - block ?b2 - block)
        (right ?b1 - block ?b2 - block)
        (up ?b1 - block ?b2 - block)
        (down ?b1 - block ?b2 - block)

        (same-color ?b1 - matching-block ?b2 - matching-block)

        (has-time-swapped)

        (blocks-are-falling)
        (blocks-are-matching)
        (blocks-are-priority-matching)
        (at-the-end-of-falling-cycle)
        (has-match-caused-falling)
    )

    (:action SWAP-BLOCK-LEFT
        :parameters (?b1 - matching-block ?b2 - movable-block ?b1up ?b1down ?b1right ?b2up ?b2down ?b2left - block)
        :precondition (and
                        (not (blocks-are-matching))
                        (not (blocks-are-falling))

                        (not (is-empty ?b1))
                        (is-empty ?b2)

                        (not (is-falling ?b1))

                        (left ?b1 ?b2)

                        (right ?b1 ?b1right)
                        (up ?b1 ?b1up)
                        (down ?b1 ?b1down)

                        (left ?b2 ?b2left)
                        (up ?b2 ?b2up)
                        (down ?b2 ?b2down)
                      )
        :effect (and
                    (increase (num-steps) 1)

                    (left ?b2 ?b1)
                    (right ?b1 ?b2)

                    (left ?b1 ?b2left)
                    (right ?b2left ?b1)

                    (down ?b1 ?b2down)
                    (up ?b2down ?b1)

                    (up ?b1 ?b2up)
                    (down ?b2up ?b1)

                    (right ?b2 ?b1right)
                    (left ?b1right ?b2)

                    (down ?b2 ?b1down)
                    (up ?b1down ?b2)

                    (up ?b2 ?b1up)
                    (down ?b1up ?b2)

                    (not (right ?b2 ?b1))
                    (not (left ?b1right ?b1))
                    (not (down ?b1up ?b1))
                    (not (up ?b1down ?b1))
                    (not (right ?b2left ?b2))
                    (not (down ?b2up ?b2))
                    (not (up ?b2down ?b2))

                    (not (left ?b1 ?b2))
                    (not (right ?b1 ?b1right))
                    (not (up ?b1 ?b1up))
                    (not (down ?b1 ?b1down))
                    (not (left ?b2 ?b2left))
                    (not (up ?b2 ?b2up))
                    (not (down ?b2 ?b2down))

                    (when
                        (and
                            (not (is-empty ?b2down))
                            (or
                                (and
                                    (not (is-empty ?b2up))
                                    (not (is-falling ?b2up))
                                    (same-color ?b1 ?b2up)
                                )
                                (and
                                    (not (is-empty ?b2down))
                                    (not (is-falling ?b2down))
                                    (same-color ?b1 ?b2down)
                                )
                                (and
                                    (not (is-empty ?b2left))
                                    (not (is-falling ?b2left))
                                    (same-color ?b1 ?b2left)
                                )
                            )
                        )

                        (and
                            (blocks-are-matching)
                            (blocks-are-priority-matching)
                            (is-matching ?b1)
                            (is-marked ?b1)
                        )
                    )

                    (when
                        (is-empty ?b2down)
                        (and
                            (is-falling ?b1)
                            (not (is-on-falling-cooldown ?b1))
                            (blocks-are-falling)
                        )
                    )

                    (when
                        (and
                            (not (is-empty ?b1up))
                            (not (is-immovable ?b1up))
                        )
                        (and
                            (is-falling ?b1up)
                            (not (is-on-falling-cooldown ?b1up))
                            (blocks-are-falling)
                        )
                    )
                )
    )

    (:action TIMED-SWAP-BLOCK-LEFT
        :parameters (?b1 - matching-block ?b2 - movable-block ?b1up ?b1down ?b1right ?b2up ?b2down ?b2left - block)
        :precondition (and
                        (not (blocks-are-matching))
                        (at-the-end-of-falling-cycle)
                        (not (has-time-swapped))

                        (not (is-empty ?b1))
                        (is-empty ?b2)

                        (not (is-falling ?b1))

                        (left ?b1 ?b2)

                        (right ?b1 ?b1right)
                        (up ?b1 ?b1up)
                        (down ?b1 ?b1down)

                        (left ?b2 ?b2left)
                        (up ?b2 ?b2up)
                        (down ?b2 ?b2down)
                      )
        :effect (and
                    (increase (num-steps) 1)

                    (left ?b2 ?b1)
                    (right ?b1 ?b2)

                    (left ?b1 ?b2left)
                    (right ?b2left ?b1)

                    (down ?b1 ?b2down)
                    (up ?b2down ?b1)

                    (up ?b1 ?b2up)
                    (down ?b2up ?b1)

                    (right ?b2 ?b1right)
                    (left ?b1right ?b2)

                    (down ?b2 ?b1down)
                    (up ?b1down ?b2)

                    (up ?b2 ?b1up)
                    (down ?b1up ?b2)

                    (not (right ?b2 ?b1))
                    (not (left ?b1right ?b1))
                    (not (down ?b1up ?b1))
                    (not (up ?b1down ?b1))
                    (not (right ?b2left ?b2))
                    (not (down ?b2up ?b2))
                    (not (up ?b2down ?b2))

                    (not (left ?b1 ?b2))
                    (not (right ?b1 ?b1right))
                    (not (up ?b1 ?b1up))
                    (not (down ?b1 ?b1down))
                    (not (left ?b2 ?b2left))
                    (not (up ?b2 ?b2up))
                    (not (down ?b2 ?b2down))

                    (has-time-swapped)

                    (when
                        (and
                            (not (is-empty ?b2down))
                            (or
                                (and
                                    (not (is-empty ?b2up))
                                    (not (is-falling ?b2up))
                                    (same-color ?b1 ?b2up)
                                )
                                (and
                                    (not (is-empty ?b2down))
                                    (not (is-falling ?b2down))
                                    (same-color ?b1 ?b2down)
                                )
                                (and
                                    (not (is-empty ?b2left))
                                    (not (is-falling ?b2left))
                                    (same-color ?b1 ?b2left)
                                )
                            )
                        )

                        (and
                            (blocks-are-matching)
                            (blocks-are-priority-matching)
                            (is-matching ?b1)
                            (is-marked ?b1)
                        )
                    )

                    (when
                        (is-empty ?b2down)
                        (and
                            (is-falling ?b1)
                            (not (is-on-falling-cooldown ?b1))
                            (blocks-are-falling)
                        )
                    )

                    (when
                        (and
                            (not (is-empty ?b1up))
                            (not (is-immovable ?b1up))
                        )
                        (and
                            (is-falling ?b1up)
                            (not (is-on-falling-cooldown ?b1up))
                            (blocks-are-falling)
                        )
                    )
                )
    )
    
    (:action SWAP-BLOCK-RIGHT
        :parameters (?b1 - matching-block ?b2 - movable-block ?b1up ?b1down ?b1left ?b2up ?b2down ?b2right - block)
        :precondition (and
                        (not (blocks-are-matching))
                        (not (blocks-are-falling))

                        (not (is-empty ?b1))
                        (is-empty ?b2)

                        (not (is-falling ?b1))

                        (right ?b1 ?b2)

                        (left ?b1 ?b1left)
                        (up ?b1 ?b1up)
                        (down ?b1 ?b1down)
                        
                        (right ?b2 ?b2right)
                        (up ?b2 ?b2up)
                        (down ?b2 ?b2down)
                      )
        :effect (and
                    (increase (num-steps) 1)
                    
                    (right ?b2 ?b1)
                    (left ?b1 ?b2)

                    (right ?b1 ?b2right)
                    (left ?b2right ?b1)
                    
                    (down ?b1 ?b2down)
                    (up ?b2down ?b1)

                    (up ?b1 ?b2up)
                    (down ?b2up ?b1)

                    (left ?b2 ?b1left)
                    (right ?b1left ?b2)

                    (down ?b2 ?b1down)
                    (up ?b1down ?b2)

                    (up ?b2 ?b1up)
                    (down ?b1up ?b2)

                    (not (right ?b1 ?b2))
                    (not (left ?b1 ?b1left))
                    (not (up ?b1 ?b1up))
                    (not (down ?b1 ?b1down))
                    (not (right ?b2 ?b2right))
                    (not (up ?b2 ?b2up))
                    (not (down ?b2 ?b2down))

                    (not (left ?b2 ?b1))
                    (not (right ?b1left ?b1))
                    (not (down ?b1up ?b1))
                    (not (up ?b1down ?b1))
                    (not (left ?b2right ?b2))
                    (not (down ?b2up ?b2))
                    (not (up ?b2down ?b2))

                    (when 
                        (and
                            (not (is-empty ?b2down))
                            (or
                                (and
                                    (not (is-empty ?b2up))
                                    (not (is-falling ?b2up))
                                    (same-color ?b1 ?b2up)
                                )
                                (and
                                    (not (is-empty ?b2down))
                                    (not (is-falling ?b2down))
                                    (same-color ?b1 ?b2down)
                                )
                                (and
                                    (not (is-empty ?b2right))
                                    (not (is-falling ?b2right))
                                    (same-color ?b1 ?b2right)
                                )
                            )
                        )

                        (and
                            (blocks-are-matching)
                            (blocks-are-priority-matching)
                            (is-matching ?b1)
                            (is-marked ?b1)
                        )
                    )

                    (when
                        (is-empty ?b2down)
                        (and
                            (is-falling ?b1)
                            (not (is-on-falling-cooldown ?b1))
                            (blocks-are-falling)
                        )
                    )

                    (when
                        (and
                            (not (is-empty ?b1up))
                            (not (is-immovable ?b1up))
                        )
                        (and
                            (is-falling ?b1up)
                            (not (is-on-falling-cooldown ?b1up))
                            (blocks-are-falling)
                        )
                    )
                )
    )

    (:action TIMED-SWAP-BLOCK-RIGHT
        :parameters (?b1 - matching-block ?b2 - movable-block ?b1up ?b1down ?b1left ?b2up ?b2down ?b2right - block)
        :precondition (and
                        (not (blocks-are-matching))
                        (at-the-end-of-falling-cycle)
                        (not (has-time-swapped))

                        (not (is-empty ?b1))
                        (is-empty ?b2)

                        (not (is-falling ?b1))

                        (right ?b1 ?b2)

                        (left ?b1 ?b1left)
                        (up ?b1 ?b1up)
                        (down ?b1 ?b1down)

                        (right ?b2 ?b2right)
                        (up ?b2 ?b2up)
                        (down ?b2 ?b2down)
                      )
        :effect (and
                    (increase (num-steps) 1)
                    
                    (right ?b2 ?b1)
                    (left ?b1 ?b2)

                    (right ?b1 ?b2right)
                    (left ?b2right ?b1)
                    
                    (down ?b1 ?b2down)
                    (up ?b2down ?b1)

                    (up ?b1 ?b2up)
                    (down ?b2up ?b1)

                    (left ?b2 ?b1left)
                    (right ?b1left ?b2)

                    (down ?b2 ?b1down)
                    (up ?b1down ?b2)

                    (up ?b2 ?b1up)
                    (down ?b1up ?b2)

                    (not (right ?b1 ?b2))
                    (not (left ?b1 ?b1left))
                    (not (up ?b1 ?b1up))
                    (not (down ?b1 ?b1down))
                    (not (right ?b2 ?b2right))
                    (not (up ?b2 ?b2up))
                    (not (down ?b2 ?b2down))

                    (not (left ?b2 ?b1))
                    (not (right ?b1left ?b1))
                    (not (down ?b1up ?b1))
                    (not (up ?b1down ?b1))
                    (not (left ?b2right ?b2))
                    (not (down ?b2up ?b2))
                    (not (up ?b2down ?b2))

                    (has-time-swapped)

                    (when 
                        (and
                            (not (is-empty ?b2down))
                            (or
                                (and
                                    (not (is-empty ?b2up))
                                    (not (is-falling ?b2up))
                                    (same-color ?b1 ?b2up)
                                )
                                (and
                                    (not (is-empty ?b2down))
                                    (not (is-falling ?b2down))
                                    (same-color ?b1 ?b2down)
                                )
                                (and
                                    (not (is-empty ?b2right))
                                    (not (is-falling ?b2right))
                                    (same-color ?b1 ?b2right)
                                )
                            )
                        )

                        (and
                            (blocks-are-matching)
                            (blocks-are-priority-matching)
                            (is-matching ?b1)
                            (is-marked ?b1)
                        )
                    )

                    (when
                        (is-empty ?b2down)
                        (and
                            (is-falling ?b1)
                            (not (is-on-falling-cooldown ?b1))
                            (blocks-are-falling)
                        )
                    )

                    (when
                        (and
                            (not (is-empty ?b1up))
                            (not (is-immovable ?b1up))
                        )
                        (and
                            (is-falling ?b1up)
                            (not (is-on-falling-cooldown ?b1up))
                            (blocks-are-falling)
                        )
                    )
                )
    )

    (:action FALL-BLOCK
        :parameters (?b1 - matching-block ?b2 - movable-block ?b1left ?b1right ?b1up ?b2left ?b2right ?b2down - block)
        :precondition (and
            (not (at-the-end-of-falling-cycle))
            (blocks-are-falling)
            (not (blocks-are-priority-matching))

            (not (is-on-falling-cooldown ?b1))

            (is-falling ?b1)
            (not (is-falling ?b2))

            (not (is-empty ?b1))
            (is-empty ?b2)

            (down ?b1 ?b2)

            (left ?b1 ?b1left)
            (right ?b1 ?b1right)
            (up ?b1 ?b1up)

            (left ?b2 ?b2left)
            (right ?b2 ?b2right)
            (down ?b2 ?b2down)
        )
        :effect (and 
            (up ?b1 ?b2)
            (down ?b2 ?b1)

            (left ?b1 ?b2left)
            (right ?b2left ?b1)

            (right ?b1 ?b2right)
            (left ?b2right ?b1)

            (down ?b1 ?b2down)
            (up ?b2down ?b1)

            (left ?b2 ?b1left)
            (right ?b1left ?b2)

            (right ?b2 ?b1right)
            (left ?b1right ?b2)

            (up ?b2 ?b1up)
            (down ?b1up ?b2)

            (not (left ?b1 ?b1left))
            (not (right ?b1 ?b1right))
            (not (up ?b1 ?b1up))
            (not (down ?b1 ?b2))
            (not (left ?b2 ?b2left))
            (not (right ?b2 ?b2right))
            (not (down ?b2 ?b2down))

            (not (right ?b1left ?b1))
            (not (left ?b1right ?b1))
            (not (down ?b1up ?b1))
            (not (up ?b2 ?b1))
            (not (right ?b2left ?b2))
            (not (left ?b2right ?b2))
            (not (up ?b2down ?b2))

            (is-on-falling-cooldown ?b1)
            
            (when
                (and
                    (not (is-empty ?b2down))
                    (not (is-falling ?b2down))
                )

                (and
                    (not (is-falling ?b1))

                    (when 
                        (or
                            (and
                                (not (is-empty ?b2left))
                                (same-color ?b1 ?b2left)
                            )
                            (and
                                (not (is-empty ?b2right))
                                (same-color ?b1 ?b2right)
                            )
                            (and
                                (not (is-empty ?b2down))
                                (same-color ?b1 ?b2down)
                            )
                        )
                        
                        (and
                            (is-matching ?b1)
                            (is-marked ?b1)
                            (blocks-are-matching)         
                        )
                    )
                )
            )

            (when
                (not (is-empty ?b1up))

                (and
                    (is-falling ?b1up)
                    (not (is-on-falling-cooldown ?b1up))
                    (blocks-are-falling)
                )
            )
        )
    )

    (:action END-FALLING
        :precondition (and
            (blocks-are-falling)
            (forall (?b - matching-block)
                (not (is-falling ?b))
            )
        )
        :effect (and
            (not (blocks-are-falling))
            (not (at-the-end-of-falling-cycle))
            (not (has-time-swapped))
        )
    )

    (:action ACTIVATE-AT-END-OF-FALLING-CYCLE
        :precondition (and
            (blocks-are-falling)
            (not (at-the-end-of-falling-cycle))
            (exists (?b - matching-block) (is-falling ?b))
            (forall (?b - matching-block)
                (or
                    (not (is-falling ?b))
                    (is-on-falling-cooldown ?b)
                    (and
                        (is-falling ?b)
                        (is-on-falling-cooldown ?b)
                    )
                )
            )
        )
        :effect (at-the-end-of-falling-cycle)
    )

    (:action DEACTIVATE-AT-END-OF-FALLING-CYCLE
        :precondition (and
            (at-the-end-of-falling-cycle)
            (not (blocks-are-matching))
        )
        :effect (and
            (not (at-the-end-of-falling-cycle))
            (not (has-time-swapped))
            (forall (?b - matching-block)
                (not (is-on-falling-cooldown ?b))
            )
        )
    )

    (:action SPREAD-MATCH-LEFT
        :parameters (?b1 ?b2 - matching-block ?b2up - block)
        :precondition (and
            (blocks-are-matching)
            (or
                (blocks-are-priority-matching)
                (not (blocks-are-falling))
                (at-the-end-of-falling-cycle)
            )

            (not (is-empty ?b1))
            (not (is-empty ?b2))

            (not (is-matching ?b2))
            (not (is-falling ?b2))

            (same-color ?b1 ?b2)

            (left ?b1 ?b2)
            (up ?b2 ?b2up)
        )
        :effect (and
            (is-matching ?b2)
            (is-marked ?b2)
            (not (might-fall ?b2))

            (when
                (and
                    (not (is-empty ?b2up))
                    (not (is-matching ?b2up))
                    (not (same-color ?b2 ?b2up))
                )

                (and
                    (might-fall ?b2up)
                    (not (is-on-falling-cooldown ?b2up))
                    (has-match-caused-falling)
                )
            )
        )
    )

    (:action SPREAD-MATCH-RIGHT
        :parameters (?b1 ?b2 - matching-block ?b2up - block)
        :precondition (and
            (blocks-are-matching)
            (or
                (blocks-are-priority-matching)
                (not (blocks-are-falling))
                (at-the-end-of-falling-cycle)
            )

            (not (is-empty ?b1))
            (not (is-empty ?b2))

            (not (is-matching ?b2))
            (not (is-falling ?b2))

            (same-color ?b1 ?b2)

            (right ?b1 ?b2)
            (up ?b2 ?b2up)
        )
        :effect (and
            (is-matching ?b2)
            (is-marked ?b2)
            (not (might-fall ?b2))

            (when
                (and
                    (not (is-empty ?b2up))
                    (not (is-matching ?b2up))
                    (not (same-color ?b2 ?b2up))
                )

                (and
                    (might-fall ?b2up)
                    (not (is-on-falling-cooldown ?b2up))
                    (has-match-caused-falling)
                )
            )
        )
    )

    (:action SPREAD-MATCH-UP
        :parameters (?b1 ?b2 - matching-block ?b2up - block)
        :precondition (and
            (blocks-are-matching)
            (or
                (blocks-are-priority-matching)
                (not (blocks-are-falling))
                (at-the-end-of-falling-cycle)
            )

            (not (is-empty ?b1))
            (not (is-empty ?b2))

            (not (is-matching ?b2))
            (not (is-falling ?b2))

            (same-color ?b1 ?b2)

            (up ?b1 ?b2)
            (up ?b2 ?b2up)
        )
        :effect (and
            (is-matching ?b2)
            (is-marked ?b2)
            (not (might-fall ?b2))

            (when
                (and
                    (not (is-empty ?b2up))
                    (not (is-matching ?b2up))
                    (not (same-color ?b2 ?b2up))
                )

                (and
                    (might-fall ?b2up)
                    (not (is-on-falling-cooldown ?b2up))
                    (has-match-caused-falling)
                )
            )
        )
    )

    (:action SPREAD-MATCH-DOWN
        :parameters (?b1 ?b2 - matching-block ?b1up)
        :precondition (and
            (blocks-are-matching)
            (or
                (blocks-are-priority-matching)
                (not (blocks-are-falling))
                (at-the-end-of-falling-cycle)
            )

            (not (is-empty ?b1))
            (not (is-empty ?b2))

            (not (is-matching ?b2))
            (not (is-falling ?b2))

            (same-color ?b1 ?b2)

            (down ?b1 ?b2)
            (up ?b1 ?b1up)
        )
        :effect (and
            (is-matching ?b2)
            (is-marked ?b2)
            (not (might-fall ?b2))

            (when
                (and
                    (not (is-empty ?b1up))
                    (not (is-matching ?b1up))
                    (not (same-color ?b1 ?b1up))
                )

                (and
                    (might-fall ?b1up)
                    (not (is-on-falling-cooldown ?b1up))
                    (has-match-caused-falling)
                )
            )
        )
    )

    (:action REMOVE-MARK
        :parameters (?b1 - matching-block ?b1left ?b1up ?b1right ?b1down - block)
        :precondition (and
            (blocks-are-matching)
            (or
                (blocks-are-priority-matching)
                (not (blocks-are-falling))
                (at-the-end-of-falling-cycle)
            )

            (is-marked ?b1)

            (left ?b1 ?b1left)
            (up ?b1 ?b1up)
            (right ?b1 ?b1right)
            (down ?b1 ?b1down)

            (or
                (is-empty ?b1left)
                (is-matching ?b1left)
                (is-falling ?b1left)
                (not (same-color ?b1 ?b1left))
            )

            (or
                (is-empty ?b1up)
                (is-matching ?b1up)
                (is-falling ?b1up)
                (not (same-color ?b1 ?b1up))
            )

            (or
                (is-empty ?b1right)
                (is-matching ?b1right)
                (is-falling ?b1right)
                (not (same-color ?b1 ?b1right))
            )

            (or
                (is-empty ?b1down)
                (is-matching ?b1down)
                (is-falling ?b1down)
                (not (same-color ?b1 ?b1down))
            )
        )
        :effect (not (is-marked ?b1))
    )
    
    (:action MATCH-BLOCKS
        :precondition (and
            (blocks-are-matching)
            (or
                (blocks-are-priority-matching)
                (not (blocks-are-falling))
                (at-the-end-of-falling-cycle)
            )
            (forall (?b - matching-block)
                (not (is-marked ?b))
            )
        )
        :effect (and
            (not (blocks-are-matching))
            (not (blocks-are-priority-matching))
            (forall (?b - matching-block)
                (when
                    (is-matching ?b)
                    
                    (and
                        (is-empty ?b)
                        (not (is-matching ?b))
                    )
                )
            )

            (when
                (has-match-caused-falling)

                (and
                    (blocks-are-falling)
                    (not (has-match-caused-falling))
                    (forall (?b - matching-block)
                        (when
                            (and
                                (might-fall ?b)
                                (not (is-matching ?b))
                            )
                            
                            (and
                                (is-falling ?b)
                                (not (might-fall ?b))
                            )
                        )
                    )
                )
            )
        )
    )
)
