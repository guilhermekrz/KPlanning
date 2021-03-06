; Generated by ProblemGenerator - Problem 20 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb20)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 - location
		bar1 bar5 bar6 bar12 bar15 bar19 bar20 bar21 bar23 bar24 bar25 - bar
	)
	(:init
		(at loc1)

		(connected loc1 loc10)
		(connected loc10 loc1)
		(connected loc10 loc2)
		(connected loc2 loc10)
		(connected loc2 loc20)
		(connected loc20 loc2)
		(connected loc20 loc8)
		(connected loc8 loc20)
		(connected loc8 loc17)
		(connected loc17 loc8)
		(connected loc17 loc16)
		(connected loc16 loc17)
		(connected loc16 loc4)
		(connected loc4 loc16)
		(connected loc1 loc13)
		(connected loc13 loc1)
		(connected loc4 loc21)
		(connected loc21 loc4)
		(connected loc21 loc11)
		(connected loc11 loc21)
		(connected loc11 loc5)
		(connected loc5 loc11)
		(connected loc5 loc3)
		(connected loc3 loc5)
		(connected loc3 loc7)
		(connected loc7 loc3)
		(connected loc7 loc22)
		(connected loc22 loc7)
		(connected loc21 loc19)
		(connected loc19 loc21)
		(connected loc5 loc23)
		(connected loc23 loc5)
		(connected loc13 loc24)
		(connected loc24 loc13)
		(connected loc24 loc6)
		(connected loc6 loc24)
		(connected loc4 loc14)
		(connected loc14 loc4)
		(connected loc5 loc18)
		(connected loc18 loc5)
		(connected loc18 loc15)
		(connected loc15 loc18)
		(connected loc3 loc12)
		(connected loc12 loc3)
		(connected loc15 loc9)
		(connected loc9 loc15)
		(connected loc2 loc25)
		(connected loc25 loc2)
		(connected loc1 loc3)
		(connected loc3 loc1)
		(connected loc1 loc5)
		(connected loc5 loc1)
		(connected loc1 loc12)
		(connected loc12 loc1)
		(connected loc2 loc3)
		(connected loc3 loc2)
		(connected loc2 loc4)
		(connected loc4 loc2)
		(connected loc3 loc2)
		(connected loc2 loc3)
		(connected loc4 loc12)
		(connected loc12 loc4)
		(connected loc5 loc4)
		(connected loc4 loc5)
		(connected loc6 loc15)
		(connected loc15 loc6)
		(connected loc6 loc17)
		(connected loc17 loc6)
		(connected loc7 loc1)
		(connected loc1 loc7)
		(connected loc7 loc21)
		(connected loc21 loc7)
		(connected loc8 loc3)
		(connected loc3 loc8)
		(connected loc8 loc9)
		(connected loc9 loc8)
		(connected loc9 loc1)
		(connected loc1 loc9)
		(connected loc9 loc14)
		(connected loc14 loc9)
		(connected loc9 loc24)
		(connected loc24 loc9)
		(connected loc10 loc5)
		(connected loc5 loc10)
		(connected loc10 loc8)
		(connected loc8 loc10)
		(connected loc10 loc11)
		(connected loc11 loc10)
		(connected loc10 loc21)
		(connected loc21 loc10)
		(connected loc11 loc8)
		(connected loc8 loc11)
		(connected loc12 loc23)
		(connected loc23 loc12)
		(connected loc13 loc3)
		(connected loc3 loc13)
		(connected loc14 loc10)
		(connected loc10 loc14)
		(connected loc14 loc12)
		(connected loc12 loc14)
		(connected loc14 loc18)
		(connected loc18 loc14)
		(connected loc17 loc3)
		(connected loc3 loc17)
		(connected loc17 loc25)
		(connected loc25 loc17)
		(connected loc18 loc7)
		(connected loc7 loc18)
		(connected loc18 loc13)
		(connected loc13 loc18)
		(connected loc18 loc16)
		(connected loc16 loc18)
		(connected loc18 loc23)
		(connected loc23 loc18)
		(connected loc19 loc22)
		(connected loc22 loc19)
		(connected loc20 loc6)
		(connected loc6 loc20)
		(connected loc20 loc16)
		(connected loc16 loc20)
		(connected loc22 loc17)
		(connected loc17 loc22)
		(connected loc22 loc19)
		(connected loc19 loc22)
		(connected loc25 loc12)
		(connected loc12 loc25)

		(in bar1 loc1)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar12 loc12)
		(in bar15 loc15)
		(in bar19 loc19)
		(in bar20 loc20)
		(in bar21 loc21)
		(in bar23 loc23)
		(in bar24 loc24)
		(in bar25 loc25)

	)

	(:goal
		(and
			(at loc25)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)