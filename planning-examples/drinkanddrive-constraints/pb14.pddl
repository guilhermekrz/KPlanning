(define (problem pb1)
  (:domain drinkanddrive-constraints)
  (:requirements :strips :typing :negative-preconditions :constraints :preferences)
  (:objects
		a b - location
		bara - bar)
  (:init 
  			(at b)
  			
  			(in bara a)

  			(connected a b)
  			(connected b a)
  )
  (:goal 
  		(and
  			(at a)
  		)
  )
  (:constraints
    (and
        (preference a4 (sometime-after (at b) (and (at a) (drunk))))
    )
  )
)