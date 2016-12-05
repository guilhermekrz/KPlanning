; Generated by ProblemGenerator - Problem 9 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb9)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 - location
		bar2 bar3 bar6 bar7 bar11 bar14 - bar
	)
	(:init
		(at loc1)

		(connected loc14 loc13)
		(connected loc13 loc14)
		(connected loc13 loc2)
		(connected loc2 loc13)
		(connected loc2 loc7)
		(connected loc7 loc2)
		(connected loc7 loc9)
		(connected loc9 loc7)
		(connected loc9 loc8)
		(connected loc8 loc9)
		(connected loc8 loc5)
		(connected loc5 loc8)
		(connected loc14 loc12)
		(connected loc12 loc14)
		(connected loc5 loc11)
		(connected loc11 loc5)
		(connected loc11 loc4)
		(connected loc4 loc11)
		(connected loc4 loc3)
		(connected loc3 loc4)
		(connected loc3 loc10)
		(connected loc10 loc3)
		(connected loc5 loc6)
		(connected loc6 loc5)
		(connected loc5 loc1)
		(connected loc1 loc5)
		(connected loc4 loc6)
		(connected loc6 loc4)
		(connected loc4 loc9)
		(connected loc9 loc4)
		(connected loc5 loc2)
		(connected loc2 loc5)
		(connected loc6 loc10)
		(connected loc10 loc6)
		(connected loc7 loc3)
		(connected loc3 loc7)
		(connected loc10 loc14)
		(connected loc14 loc10)
		(connected loc13 loc9)
		(connected loc9 loc13)
		(connected loc14 loc9)
		(connected loc9 loc14)

		(in bar2 loc2)
		(in bar3 loc3)
		(in bar6 loc6)
		(in bar7 loc7)
		(in bar11 loc11)
		(in bar14 loc14)

	)

	(:goal
		(and
			(at loc14)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)