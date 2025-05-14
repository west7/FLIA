(define (problem gripper1)
    (:domain gripper-typed)
    (:objects
        rooma roomb - room
        ball1 ball2 ball3 ball4 - ball
    )

    (:init
        (at ball1 rooma)
        (at ball2 rooma)
        (at ball3 rooma)
        (at ball4 rooma)
        (free left)
        (free right)
        (at-robby rooma)
    )

    (:goal
        (and    
            (at ball1 roomb)
            (at ball2 roomb)
            (at ball3 roomb)
            (at ball4 roomb)
        )
    )
)