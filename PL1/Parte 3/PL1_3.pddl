(define (domain emergency-logistics-transporters)
  (:requirements :strips :typing :durative-actions :fluents)

  (:types
    drone location person box content transporter num - object
  )

  (:predicates
    ;; Posiciones
    (at-drone ?d - drone ?l - location)
    (at-person ?p - person ?l - location)
    (at-box ?c - box ?l - location)
    (at-transporter ?tr - transporter ?l - location)

    ;; Recursos para concurrencia
    (drone-free ?d - drone)
    (transporter-free ?tr - transporter)
    (person-free ?p - person)

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
    (siguiente ?a - num ?b - num)
    (free-slots ?tr - transporter ?n - num)
  )

  (:functions
    (fly-cost ?from - location ?to - location)
  )

  ;; Vuelo del dron
  (:durative-action fly
    :parameters (?d - drone ?from - location ?to - location)
    :duration (= ?duration (fly-cost ?from ?to))
    :condition (and
      (at start (drone-free ?d))
      (at start (at-drone ?d ?from))
    )
    :effect (and
      (at start (not (drone-free ?d)))
      (at start (not (at-drone ?d ?from)))
      (at end (at-drone ?d ?to))
      (at end (drone-free ?d))
    )
  )

  ;; Vuelo del dron llevando el transportador
  (:durative-action fly-with-transporter
    :parameters (?d - drone ?tr - transporter ?from - location ?to - location)
    :duration (= ?duration (fly-cost ?from ?to))
    :condition (and
      (at start (drone-free ?d))
      (at start (transporter-free ?tr))
      (at start (arm-free ?d))
      (at start (at-drone ?d ?from))
      (at start (at-transporter ?tr ?from))
    )
    :effect (and
      (at start (not (drone-free ?d)))
      (at start (not (transporter-free ?tr)))
      (at start (not (at-drone ?d ?from)))
      (at start (not (at-transporter ?tr ?from)))

      (at end (at-drone ?d ?to))
      (at end (at-transporter ?tr ?to))
      (at end (drone-free ?d))
      (at end (transporter-free ?tr))
    )
  )

  ;; Coger caja del suelo
  (:durative-action pick-box
    :parameters (?d - drone ?c - box ?l - location)
    :duration (= ?duration 5)
    :condition (and
      (at start (drone-free ?d))
      (at start (at-drone ?d ?l))
      (at start (at-box ?c ?l))
      (at start (arm-free ?d))
      (at start (full-box ?c))
    )
    :effect (and
      (at start (not (drone-free ?d)))
      (at start (not (at-box ?c ?l)))

      (at end (holding ?d ?c))
      (at end (not (arm-free ?d)))
      (at end (drone-free ?d))
    )
  )

  ;; Meter caja en transportador
  (:durative-action put-box-in-transporter
    :parameters (?d - drone ?tr - transporter ?c - box ?l - location ?nPrev - num ?n - num)
    :duration (= ?duration 5)
    :condition (and
      (at start (drone-free ?d))
      (at start (transporter-free ?tr))
      (at start (at-drone ?d ?l))
      (at start (at-transporter ?tr ?l))
      (at start (holding ?d ?c))
      (at start (free-slots ?tr ?n))
      (at start (siguiente ?nPrev ?n))
    )
    :effect (and
      (at start (not (drone-free ?d)))
      (at start (not (transporter-free ?tr)))
      (at start (not (holding ?d ?c)))
      (at start (not (free-slots ?tr ?n)))

      (at end (box-in ?c ?tr))
      (at end (arm-free ?d))
      (at end (free-slots ?tr ?nPrev))
      (at end (drone-free ?d))
      (at end (transporter-free ?tr))
    )
  )

  ;; Sacar caja del transportador
  (:durative-action take-box-from-transporter
    :parameters (?d - drone ?tr - transporter ?c - box ?l - location ?n - num ?nNext - num)
    :duration (= ?duration 5)
    :condition (and
      (at start (drone-free ?d))
      (at start (transporter-free ?tr))
      (at start (at-drone ?d ?l))
      (at start (at-transporter ?tr ?l))
      (at start (box-in ?c ?tr))
      (at start (arm-free ?d))
      (at start (free-slots ?tr ?n))
      (at start (siguiente ?n ?nNext))
    )
    :effect (and
      (at start (not (drone-free ?d)))
      (at start (not (transporter-free ?tr)))
      (at start (not (box-in ?c ?tr)))
      (at start (not (free-slots ?tr ?n)))

      (at end (holding ?d ?c))
      (at end (not (arm-free ?d)))
      (at end (free-slots ?tr ?nNext))
      (at end (drone-free ?d))
      (at end (transporter-free ?tr))
    )
  )

  ;; Entregar caja a una persona
  (:durative-action deliver
    :parameters (?d - drone ?c - box ?p - person ?l - location ?t - content)
    :duration (= ?duration 5)
    :condition (and
      (at start (drone-free ?d))
      (at start (person-free ?p))
      (at start (at-drone ?d ?l))
      (at start (at-person ?p ?l))
      (at start (holding ?d ?c))
      (at start (box-has ?c ?t))
    )
    :effect (and
      (at start (not (drone-free ?d)))
      (at start (not (person-free ?p)))
      (at start (not (holding ?d ?c)))

      (at end (person-has ?p ?t))
      (at end (at-box ?c ?l))
      (at end (arm-free ?d))
      (at end (not (full-box ?c)))
      (at end (drone-free ?d))
      (at end (person-free ?p))
    )
  )
)