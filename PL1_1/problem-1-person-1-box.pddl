(define (problem p1)
  (:domain emergency-logistics)

  (:objects
    d1 - drone
    a1 a2 - arm
    depot loc1 - location
    alice - person
    box1 - box
    food - content
  )

  (:init
    (at-drone d1 depot)

    (arm-of a1 d1)
    (arm-of a2 d1)
    (arm-free a1)
    (arm-free a2)

    (at-person alice loc1)

    (at-box box1 depot)
    (box-has box1 food)
  )

  (:goal (and
    (person-has alice food)
  ))
)