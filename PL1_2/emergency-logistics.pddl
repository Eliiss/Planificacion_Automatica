(define (domain emergency-logistics-transporters)
  (:requirements :strips :typing :action-costs :fluents)

  (:types
    drone location person box content transporter num - object
  )

  (:predicates
    ;; Posiciones
    (at-drone ?d - drone ?l - location)
    (at-person ?p - person ?l - location)
    (at-box ?c - box ?l - location)
    (at-transporter ?tr - transporter ?l - location)

    ;; Dron con un único brazo
    (arm-free ?d - drone)
    (holding ?d - drone ?c - box)

    ;; Caja dentro del transportador 
    (box-in ?c - box ?tr - transporter)

    ;; Contenido
    (box-has ?c - box ?t - content)
    (full-box ?c - box)
    (person-has ?p - person ?t - content)

    ;; "Números" con objetos
    (siguiente ?a ?b - num)          
    (free-slots ?tr - transporter ?n - num) 
  )

  (:functions
    (total-cost)
    (fly-cost ?from ?to - location)
  )


  ;; Movimientos

  (:action fly
    :parameters (?d - drone ?from - location ?to - location)
    :precondition (at-drone ?d ?from)
    :effect (and
      (not (at-drone ?d ?from))
      (at-drone ?d ?to)
      (increase (total-cost) (fly-cost ?from ?to))
    )
  )

  (:action fly-with-transporter
    :parameters (?d - drone ?tr - transporter ?from - location ?to - location)
    :precondition (and
      (at-drone ?d ?from)
      (at-transporter ?tr ?from)
      (arm-free ?d)
    )
    :effect (and
      (not (at-drone ?d ?from))
      (at-drone ?d ?to)
      (not (at-transporter ?d ?from))
      (at-transporter ?d ?to)
      (increase (total-cost) (fly-cost ?from ?to))
    )
  )

 
  (:action pick-box
    :parameters (?d - drone ?c - box ?l - location)
    :precondition (and
      (at-drone ?d ?l)
      (at-box ?c ?l)
      (arm-free ?d)
      (full-box ?c)
    )
    :effect (and
      (holding ?d ?c)
      (not (arm-free ?d))
      (not (at-box ?c ?l))
      (increase (total-cost) 1)
    )
  )

  (:action put-box-in-transporter
    :parameters (?d - drone ?tr - transporter ?c - box ?l - location ?nPrev ?n - num)
    :precondition (and
      (at-drone ?d ?l)
      (at-transporter ?tr ?l)
      (holding ?d ?c)
      (free-slots ?tr ?n)
      (siguiente ?nPrev ?n)
    )
    :effect (and
      (box-in ?c ?tr)
      (not (holding ?d ?c))
      (arm-free ?d)
      (not (free-slots ?tr ?n))
      (free-slots ?tr ?nPrev)
      (increase (total-cost) 1)
    )
  )


  (:action take-box-from-transporter
    :parameters (?d - drone ?tr - transporter ?c - box ?l - location ?n ?nNext - num)
    :precondition (and
      (at-drone ?d ?l)
      (at-transporter ?tr ?l)
      (box-in ?c ?tr)
      (arm-free ?d)
      (free-slots ?tr ?n)
      (siguiente ?n ?nNext)
    )
    :effect (and
      (holding ?d ?c)
      (not (arm-free ?d))
      (not (box-in ?c ?tr))
      (not (free-slots ?tr ?n))
      (free-slots ?tr ?nNext)
      (increase (total-cost) 1)
    )
  )

  (:action deliver
    :parameters (?d - drone ?c - box ?p - person ?l - location ?t - content)
    :precondition (and
      (at-drone ?d ?l)
      (at-person ?p ?l)
      (holding ?d ?c)
      (box-has ?c ?t)
    )
    :effect (and
      (person-has ?p ?t)
      (at-box ?c ?l)
      (arm-free ?d)
      (not (holding ?d ?c))
      (not (full-box ?c))
      (increase (total-cost) 1)
    )
  )
)