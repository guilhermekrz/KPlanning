(define (problem pb1)
  (:domain drinkanddrive)
  (:requirements :strips :typing :negative-preconditions) 
  (:objects
		a b c d e f g h i - location
		barA barB - bar)
  (:init 
  			; (at i)
  			(at A)
  			
  			(in barA a)
  			(in barB b)

  			(connected a b)
  			(connected a c)

  			(connected b a)
  			(connected c a)
  			
  			(connected b d)
  			(connected d b)

  			(connected b e)
  			(connected e b)

  			(connected c f)
  			(connected f c)
  			(connected c g)
  			(connected g c)

  			(connected d h)
  			(connected h d)
  			(connected e h)
  			(connected h e)
  			(connected f h)
  			(connected h f)
  			(connected g h)
  			(connected h g)

  			(connected a i)
  			(connected i a)
  )
  (:goal 
  		(and  
  			(drunk)
  			(at h)
  		)
  )
)