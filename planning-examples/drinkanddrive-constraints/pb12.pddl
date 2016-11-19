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
  			(at b)
  		)
  )
  (:constraints
    (and
        (preference a0 (always (and (not (drunk)))))
    )
  )
)