(define (problem pb1)
  (:domain drinkanddrive)
  (:requirements :strips :typing :negative-preconditions)
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
)