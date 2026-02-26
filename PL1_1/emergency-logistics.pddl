(define (domain emergency-logistics)
  (:requirements :strips :typing)

  (:types
    drone arm location person box content - object
  )

  (:predicates
    (at-drone ?d - drone ?l - location)
    (at-person ?p - person ?l - location)
    (at-box ?c - box ?l - location)

    (arm-of ?a - arm ?d - drone)
    (arm-free ?a - arm)
    (holding ?a - arm ?c - box)

    (box-has ?c - box ?t - content)
    (full-box ?c -box)
    (person-has ?p - person ?t - content)
  )

  (:action fly
    :parameters (?d - drone ?from - location ?to - location)
    :precondition (at-drone ?d ?from)
    :effect (and
      (at-drone ?d ?to)
      (not (at-drone ?d ?from))
    )
  )

  (:action pick
    :parameters (?d - drone ?a - arm ?c - box ?l - location)
    :precondition (and
      (arm-of ?a ?d)
      (arm-free ?a)
      (at-drone ?d ?l)
      (at-box ?c ?l)
      (full-box ?c)
    )
    :effect (and
      (holding ?a ?c)
      (not (arm-free ?a))
      (not (at-box ?c ?l))
    )
  )

  (:action deliver
    :parameters (?d - drone ?a - arm ?c - box ?p - person ?l - location ?t - content)
    :precondition (and
      (arm-of ?a ?d)
      (at-drone ?d ?l)
      (at-person ?p ?l)
      (holding ?a ?c)
      (box-has ?c ?t)
    )
    :effect (and
      (person-has ?p ?t)
      (at-box ?c ?l)
      (arm-free ?a)
      (not (holding ?a ?c))
      (not (full-box ?c))
    )
  )
)
