; Generated by ProblemGenerator - Problem 10 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb10)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 - location
		bar2 bar3 bar8 bar14 - bar
	)
	(:init
		(at loc1)

		(connected loc7 loc4)
		(connected loc4 loc7)
		(connected loc4 loc14)
		(connected loc14 loc4)
		(connected loc7 loc13)
		(connected loc13 loc7)
		(connected loc13 loc8)
		(connected loc8 loc13)
		(connected loc8 loc1)
		(connected loc1 loc8)
		(connected loc1 loc2)
		(connected loc2 loc1)
		(connected loc4 loc3)
		(connected loc3 loc4)
		(connected loc3 loc6)
		(connected loc6 loc3)
		(connected loc1 loc12)
		(connected loc12 loc1)
		(connected loc6 loc5)
		(connected loc5 loc6)
		(connected loc12 loc10)
		(connected loc10 loc12)
		(connected loc14 loc15)
		(connected loc15 loc14)
		(connected loc2 loc11)
		(connected loc11 loc2)
		(connected loc10 loc9)
		(connected loc9 loc10)
		(connected loc2 loc1)
		(connected loc1 loc2)
		(connected loc2 loc10)
		(connected loc10 loc2)
		(connected loc4 loc2)
		(connected loc2 loc4)
		(connected loc6 loc4)
		(connected loc4 loc6)
		(connected loc6 loc10)
		(connected loc10 loc6)
		(connected loc8 loc3)
		(connected loc3 loc8)
		(connected loc11 loc1)
		(connected loc1 loc11)
		(connected loc12 loc6)
		(connected loc6 loc12)
		(connected loc12 loc9)
		(connected loc9 loc12)
		(connected loc13 loc14)
		(connected loc14 loc13)
		(connected loc14 loc10)
		(connected loc10 loc14)
		(connected loc14 loc12)
		(connected loc12 loc14)
		(connected loc15 loc8)
		(connected loc8 loc15)

		(in bar2 loc2)
		(in bar3 loc3)
		(in bar8 loc8)
		(in bar14 loc14)

	)

	(:goal
		(and
			(at loc15)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)