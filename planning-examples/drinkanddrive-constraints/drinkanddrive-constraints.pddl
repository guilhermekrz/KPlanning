(define (domain drinkanddrive-constraints)
  (:requirements :strips :typing :negative-preconditions :constraints :preferences)
  (:types 
  	location bar - object
  )

  (:predicates 	
  		(at ?l - location)
  		(inbar ?b - bar)
  		(in ?b - bar ?l - location)
  		(connected ?l1 - location ?l2 - location)
  		(drunk)
  		;(sober)
  )

	(:action move                                
     :parameters (?l1 - location ?l2 - location)
     :precondition (and (at ?l1)
              (not (at ?l2))
     					(connected ?l1 ?l2) 
     					;(not (drunk))  ; This should be a norm
     					;(sober)
     				)
     :effect (and 
     				(not (at ?l1))
     				(at ?l2) 
             )
     )

    (:action enter                                
     :parameters (?l - location ?b - bar)
     :precondition (and (at ?l) 
     					(in ?b ?l)
     				)
     :effect 	(and 
     				(not (at ?l))
     				(inbar ?b)
     			)
 	)

 	(:action exit                                
     :parameters (?l - location ?b - bar)
     :precondition (and (inBar ?b) 
     					(in ?b ?l)
     				)
     :effect 	(and 
     				(not (inbar ?b))
     				(at ?l) 
     			)
 	)

 	(:action drink                                
     :parameters (?b - bar)
     :precondition (and (inbar ?b)
     				)
     :effect 	(and 
     				(drunk) 
     				;(not (sober))
     			)
 	)

 	(:action sleep                                
     :parameters (?l - location)
     :precondition (and (at ?l)
     				)
     :effect 	(and 
     				(not (drunk)) 
     				;(sober)
     			)
 	)
)
