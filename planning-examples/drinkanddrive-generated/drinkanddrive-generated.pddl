(define (domain drinkanddrive-generated)
  (:requirements :strips :typing :negative-preconditions)
  (:types 
  	location bar - object
  )

  (:predicates 	
  		(at ?l - location)
  		(inbar ?b - bar)
  		(in ?b - bar ?l - location)
  		(connected ?l1 - location ?l2 - location)
  		(drunk)
  )

	(:action move                                
     :parameters (?l1 - location ?l2 - location)
     :precondition (and (at ?l1)
     					(connected ?l1 ?l2)
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
     			)
 	)

 	(:action sleep                                
     :parameters (?l - location)
     :precondition (and (at ?l)
     				)
     :effect 	(and 
     				(not (drunk))
     			)
 	)
)
