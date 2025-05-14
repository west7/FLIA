(define (problem problemagarra) (:domain gripper-typed)
(:objects
salaA salaB salaC  - room
bola1 bola2 bola3 bola4  - ball
)(:init
(at-robby salaA)
(free left) (free right)
(at bola1 salaA)
(at bola2 salaB)
(at bola3 salaC)
(at bola4 salaB)
)
(:goal (and 
(at bola1 salaC)
(at bola2 salaC)
(at bola3 salaA)
(at bola4 salaA)
)))
