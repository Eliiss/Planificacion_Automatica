(define (problem p2)
  (:domain emergency-logistics)

  (:objects
    d1 - drone
    a1 a2 - arm
    depot loc1 loc2 - location

    bob carol - person

    box1 box2 box3 - box

    food medicine - content
  )

  (:init
    (at-drone d1 depot)

    (arm-of a1 d1)
    (arm-of a2 d1)
    (arm-free a1)
    (arm-free a2)

    (at-person bob loc1)
    (at-person carol loc2)

    (at-box box1 depot)
    (at-box box2 depot)
    (at-box box3 depot)

    (box-has box1 food)
    (box-has box2 medicine)
    (box-has box3 food)
  )

  (:goal (and
    (person-has bob food)
    (person-has carol medicine)
  ))
)