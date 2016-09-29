(define (problem pb6)
  (:domain dwr)
  (:requirements :strips :typing :negative-preconditions)
  (:objects
   r1 - robot
   l1 l2 l3 - location
   k1 k2 - crane
   p1 p2 - pile
   ca cb cc cd ce cf pallet - container)
   
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
	 (in cc p1)
	 (in cd p1)
	 (in ce p1)
	 
	 (on ce cd)
	 (on cd cc)
	 (on cc cb)
	 (on cb ca)
	 (on ca pallet)
	 (top ce p1)
	 (empty k1)
	 
	 (holding k2 cf)
	 
	 (top pallet p2)
   )
   
   (:goal
       (and 	
			(in ca p2)
	        (in cb p2)
			(in cc p2)
			(in cd p2)
	        (in ce p2)
			(in cf p2)

			(on ca cb)
			(on cb cc)
			(on cc cd)
			(on cd ce)
			(on ce cf)
			(on cf pallet)
			
	   )
	)
)