; Generated by ProblemGenerator - Problem 14 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb14)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 - location
		bar4 bar7 bar10 bar12 bar14 bar15 bar18 bar19 - bar
	)
	(:init
		(at loc1)

		(connected loc16 loc17)
		(connected loc17 loc16)
		(connected loc17 loc9)
		(connected loc9 loc17)
		(connected loc9 loc18)
		(connected loc18 loc9)
		(connected loc18 loc7)
		(connected loc7 loc18)
		(connected loc18 loc19)
		(connected loc19 loc18)
		(connected loc19 loc8)
		(connected loc8 loc19)
		(connected loc8 loc11)
		(connected loc11 loc8)
		(connected loc11 loc15)
		(connected loc15 loc11)
		(connected loc15 loc10)
		(connected loc10 loc15)
		(connected loc10 loc14)
		(connected loc14 loc10)
		(connected loc14 loc4)
		(connected loc4 loc14)
		(connected loc9 loc6)
		(connected loc6 loc9)
		(connected loc15 loc13)
		(connected loc13 loc15)
		(connected loc4 loc5)
		(connected loc5 loc4)
		(connected loc5 loc1)
		(connected loc1 loc5)
		(connected loc5 loc12)
		(connected loc12 loc5)
		(connected loc15 loc2)
		(connected loc2 loc15)
		(connected loc8 loc3)
		(connected loc3 loc8)
		(connected loc2 loc8)
		(connected loc8 loc2)
		(connected loc2 loc18)
		(connected loc18 loc2)
		(connected loc3 loc4)
		(connected loc4 loc3)
		(connected loc3 loc18)
		(connected loc18 loc3)
		(connected loc4 loc3)
		(connected loc3 loc4)
		(connected loc6 loc11)
		(connected loc11 loc6)
		(connected loc6 loc19)
		(connected loc19 loc6)
		(connected loc7 loc11)
		(connected loc11 loc7)
		(connected loc8 loc4)
		(connected loc4 loc8)
		(connected loc8 loc6)
		(connected loc6 loc8)
		(connected loc10 loc7)
		(connected loc7 loc10)
		(connected loc10 loc9)
		(connected loc9 loc10)
		(connected loc10 loc13)
		(connected loc13 loc10)
		(connected loc10 loc17)
		(connected loc17 loc10)
		(connected loc11 loc6)
		(connected loc6 loc11)
		(connected loc11 loc19)
		(connected loc19 loc11)
		(connected loc12 loc10)
		(connected loc10 loc12)
		(connected loc13 loc3)
		(connected loc3 loc13)
		(connected loc13 loc5)
		(connected loc5 loc13)
		(connected loc14 loc9)
		(connected loc9 loc14)
		(connected loc14 loc16)
		(connected loc16 loc14)
		(connected loc16 loc5)
		(connected loc5 loc16)
		(connected loc17 loc6)
		(connected loc6 loc17)
		(connected loc18 loc5)
		(connected loc5 loc18)

		(in bar4 loc4)
		(in bar7 loc7)
		(in bar10 loc10)
		(in bar12 loc12)
		(in bar14 loc14)
		(in bar15 loc15)
		(in bar18 loc18)
		(in bar19 loc19)

	)

	(:goal
		(and
			(at loc19)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)