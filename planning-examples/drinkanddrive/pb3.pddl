(define (problem pb3)
  (:domain drinkanddrive)
  (:requirements :strips :typing :negative-preconditions)
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
)