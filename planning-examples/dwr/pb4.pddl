(define (problem pb4)
  (:domain dwr)
  (:requirements :strips :typing :negative-preconditions)
  (:objects
   r1 - robot
   l1 l2 l3 - location
   k1 k2 - crane
   p1 p2 - pile
   ca cb cc cd pallet - container)
   
   (:init
     (adjacent l1 l2)
     (adjacent l2 l1)
	 (adjacent l2 l3)
	 (adjacent l3 l2)
	 
	 (attached p1 l1)
	 (attached p2 l3)
	 
	 (belong k1 l1)
	 (belong k2 l3)
	 
	 (at r1 l2)
	 (unloaded r1)
	 (occupied l2)
	 
	 (in ca p1)
	 (in cb p1)
	 
	 (on cb ca)
	 (on ca pallet)
	 (top cb p1)
	 (holding k1 cc)
	 
	 (holding k2 cd)
	 
	 (top pallet p2)
   )
   
   (:goal
       (and (in ca p2)
	        (in cb p2)
	        (in cc p2)
	        (in cd p2)
			(on cd pallet)
			(on cc cd)
			(on cb cc)
			(on ca cb)	   
	   )
	)
)