(define (problem pb21)
  (:domain drinkanddrive-constraints)
  (:requirements :strips :typing :negative-preconditions :constraints :preferences)
  (:objects
		a b c d e f g - location
		barA barC barE - bar)
  (:init
  		(at A)

  		(in barA a)
        (in barC c)
        (in barE e)

  		(connected a b)
  		(connected b a)

        (connected a c)
        (connected c a)

        (connected b c)
        (connected c b)

        (connected a e)
        (connected e a)

        (connected d c)
        (connected c d)

        (connected d e)
        (connected e d)

        (connected d f)
        (connected f d)

        (connected d g)
        (connected g d)

        (connected e g)
        (connected g e)

        (connected f g)
        (connected g f)
  )
  (:goal
  		(and
  			(drunk)
  			(at g)
  		)
  )
  (:constraints
      (and
          (preference a0 (always (at a)))
          (preference a1 (at end (at a)))
          (preference a2 (sometime (drunk)))
          (preference a3 (at-most-once (inbar bara)))
          (preference a4 (sometime-after (at b) (and (at a) (drunk))))
          (preference a5 (sometime-before (and (at a) (drunk)) (at b)))
          (preference a6 (always-within 1 (inbar bara) (drunk)))
      )
    )
)