; Generated by ProblemGenerator - Problem 21 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb21)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 - location
		bar1 bar5 bar6 bar8 bar11 bar16 bar18 bar19 bar20 bar21 bar22 bar23 bar24 - bar
	)
	(:init
		(at loc1)

		(connected loc5 loc12)
		(connected loc12 loc5)
		(connected loc12 loc10)
		(connected loc10 loc12)
		(connected loc10 loc8)
		(connected loc8 loc10)
		(connected loc8 loc15)
		(connected loc15 loc8)
		(connected loc15 loc14)
		(connected loc14 loc15)
		(connected loc14 loc17)
		(connected loc17 loc14)
		(connected loc17 loc22)
		(connected loc22 loc17)
		(connected loc15 loc18)
		(connected loc18 loc15)
		(connected loc10 loc3)
		(connected loc3 loc10)
		(connected loc3 loc21)
		(connected loc21 loc3)
		(connected loc21 loc4)
		(connected loc4 loc21)
		(connected loc4 loc25)
		(connected loc25 loc4)
		(connected loc8 loc2)
		(connected loc2 loc8)
		(connected loc2 loc11)
		(connected loc11 loc2)
		(connected loc4 loc1)
		(connected loc1 loc4)
		(connected loc1 loc6)
		(connected loc6 loc1)
		(connected loc4 loc26)
		(connected loc26 loc4)
		(connected loc26 loc23)
		(connected loc23 loc26)
		(connected loc6 loc7)
		(connected loc7 loc6)
		(connected loc7 loc13)
		(connected loc13 loc7)
		(connected loc10 loc24)
		(connected loc24 loc10)
		(connected loc21 loc20)
		(connected loc20 loc21)
		(connected loc13 loc19)
		(connected loc19 loc13)
		(connected loc2 loc16)
		(connected loc16 loc2)
		(connected loc12 loc9)
		(connected loc9 loc12)
		(connected loc1 loc13)
		(connected loc13 loc1)
		(connected loc1 loc14)
		(connected loc14 loc1)
		(connected loc1 loc16)
		(connected loc16 loc1)
		(connected loc2 loc7)
		(connected loc7 loc2)
		(connected loc4 loc8)
		(connected loc8 loc4)
		(connected loc4 loc10)
		(connected loc10 loc4)
		(connected loc4 loc15)
		(connected loc15 loc4)
		(connected loc5 loc2)
		(connected loc2 loc5)
		(connected loc5 loc6)
		(connected loc6 loc5)
		(connected loc5 loc7)
		(connected loc7 loc5)
		(connected loc6 loc5)
		(connected loc5 loc6)
		(connected loc6 loc23)
		(connected loc23 loc6)
		(connected loc8 loc7)
		(connected loc7 loc8)
		(connected loc10 loc13)
		(connected loc13 loc10)
		(connected loc10 loc25)
		(connected loc25 loc10)
		(connected loc12 loc7)
		(connected loc7 loc12)
		(connected loc13 loc8)
		(connected loc8 loc13)
		(connected loc13 loc9)
		(connected loc9 loc13)
		(connected loc13 loc18)
		(connected loc18 loc13)
		(connected loc14 loc8)
		(connected loc8 loc14)
		(connected loc14 loc15)
		(connected loc15 loc14)
		(connected loc14 loc19)
		(connected loc19 loc14)
		(connected loc16 loc18)
		(connected loc18 loc16)
		(connected loc16 loc22)
		(connected loc22 loc16)
		(connected loc16 loc25)
		(connected loc25 loc16)
		(connected loc17 loc6)
		(connected loc6 loc17)
		(connected loc18 loc7)
		(connected loc7 loc18)
		(connected loc18 loc10)
		(connected loc10 loc18)
		(connected loc20 loc5)
		(connected loc5 loc20)
		(connected loc22 loc26)
		(connected loc26 loc22)
		(connected loc23 loc15)
		(connected loc15 loc23)
		(connected loc23 loc21)
		(connected loc21 loc23)
		(connected loc24 loc16)
		(connected loc16 loc24)
		(connected loc25 loc18)
		(connected loc18 loc25)
		(connected loc25 loc23)
		(connected loc23 loc25)

		(in bar1 loc1)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar8 loc8)
		(in bar11 loc11)
		(in bar16 loc16)
		(in bar18 loc18)
		(in bar19 loc19)
		(in bar20 loc20)
		(in bar21 loc21)
		(in bar22 loc22)
		(in bar23 loc23)
		(in bar24 loc24)

	)

	(:goal
		(and
			(at loc26)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)