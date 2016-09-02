(define (problem pb1)
  (:domain drinkanddrive-constraints)
  (:requirements :strips :typing :negative-preconditions :constraints :preferences)
  (:objects
		a b - location
		bara - bar)
  (:init
  			(at a)

  			(in bara a)

  			(connected a b)
  			(connected b a)
  )
  (:goal
  		(and
  			(drunk)
  			(at b)
  		)
  )
  (:constraints
    (and
        ;(preference a0 (always (at a)))
        ;(preference a1 (always (at b)))
        ;(preference a2 (at end (at a)))
        ;(preference a3 (sometime (drunk)))
        ;(preference a4 (at-most-once (inbar bara)))
        ;(preference a5 (sometime-after (at b) (and (at a) (drunk))))
        ;(preference a6 (sometime-before (and (at a) (drunk)) (at b)))
        ;(preference a6 (always-within 1 (inbar bara) (drunk)))
    )
  )
)