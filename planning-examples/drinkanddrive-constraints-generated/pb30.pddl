; Generated by ProblemGenerator - Problem 30 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb30)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 - location
		bar2 bar3 bar4 bar5 bar6 bar7 bar8 bar9 bar10 bar13 bar16 bar17 bar20 bar22 bar23 bar27 bar28 bar30 bar31 bar32 bar33 bar34 bar35 - bar
	)
	(:init
		(at loc1)

		(connected loc20 loc30)
		(connected loc30 loc20)
		(connected loc30 loc26)
		(connected loc26 loc30)
		(connected loc30 loc35)
		(connected loc35 loc30)
		(connected loc35 loc32)
		(connected loc32 loc35)
		(connected loc32 loc18)
		(connected loc18 loc32)
		(connected loc18 loc27)
		(connected loc27 loc18)
		(connected loc27 loc1)
		(connected loc1 loc27)
		(connected loc1 loc9)
		(connected loc9 loc1)
		(connected loc9 loc7)
		(connected loc7 loc9)
		(connected loc7 loc21)
		(connected loc21 loc7)
		(connected loc27 loc13)
		(connected loc13 loc27)
		(connected loc13 loc23)
		(connected loc23 loc13)
		(connected loc23 loc34)
		(connected loc34 loc23)
		(connected loc13 loc6)
		(connected loc6 loc13)
		(connected loc7 loc28)
		(connected loc28 loc7)
		(connected loc35 loc14)
		(connected loc14 loc35)
		(connected loc34 loc4)
		(connected loc4 loc34)
		(connected loc4 loc22)
		(connected loc22 loc4)
		(connected loc32 loc33)
		(connected loc33 loc32)
		(connected loc21 loc8)
		(connected loc8 loc21)
		(connected loc33 loc17)
		(connected loc17 loc33)
		(connected loc27 loc11)
		(connected loc11 loc27)
		(connected loc8 loc2)
		(connected loc2 loc8)
		(connected loc28 loc24)
		(connected loc24 loc28)
		(connected loc14 loc16)
		(connected loc16 loc14)
		(connected loc16 loc5)
		(connected loc5 loc16)
		(connected loc18 loc31)
		(connected loc31 loc18)
		(connected loc31 loc29)
		(connected loc29 loc31)
		(connected loc16 loc12)
		(connected loc12 loc16)
		(connected loc4 loc19)
		(connected loc19 loc4)
		(connected loc12 loc25)
		(connected loc25 loc12)
		(connected loc34 loc15)
		(connected loc15 loc34)
		(connected loc15 loc10)
		(connected loc10 loc15)
		(connected loc25 loc3)
		(connected loc3 loc25)
		(connected loc1 loc8)
		(connected loc8 loc1)
		(connected loc1 loc24)
		(connected loc24 loc1)
		(connected loc2 loc10)
		(connected loc10 loc2)
		(connected loc3 loc6)
		(connected loc6 loc3)
		(connected loc3 loc11)
		(connected loc11 loc3)
		(connected loc3 loc23)
		(connected loc23 loc3)
		(connected loc3 loc30)
		(connected loc30 loc3)
		(connected loc4 loc6)
		(connected loc6 loc4)
		(connected loc5 loc12)
		(connected loc12 loc5)
		(connected loc6 loc30)
		(connected loc30 loc6)
		(connected loc7 loc6)
		(connected loc6 loc7)
		(connected loc7 loc11)
		(connected loc11 loc7)
		(connected loc8 loc1)
		(connected loc1 loc8)
		(connected loc8 loc7)
		(connected loc7 loc8)
		(connected loc8 loc10)
		(connected loc10 loc8)
		(connected loc8 loc17)
		(connected loc17 loc8)
		(connected loc8 loc22)
		(connected loc22 loc8)
		(connected loc10 loc4)
		(connected loc4 loc10)
		(connected loc10 loc5)
		(connected loc5 loc10)
		(connected loc11 loc6)
		(connected loc6 loc11)
		(connected loc12 loc1)
		(connected loc1 loc12)
		(connected loc12 loc16)
		(connected loc16 loc12)
		(connected loc12 loc29)
		(connected loc29 loc12)
		(connected loc12 loc31)
		(connected loc31 loc12)
		(connected loc14 loc13)
		(connected loc13 loc14)
		(connected loc14 loc17)
		(connected loc17 loc14)
		(connected loc15 loc23)
		(connected loc23 loc15)
		(connected loc16 loc17)
		(connected loc17 loc16)
		(connected loc16 loc19)
		(connected loc19 loc16)
		(connected loc16 loc26)
		(connected loc26 loc16)
		(connected loc17 loc14)
		(connected loc14 loc17)
		(connected loc17 loc20)
		(connected loc20 loc17)
		(connected loc17 loc24)
		(connected loc24 loc17)
		(connected loc17 loc32)
		(connected loc32 loc17)
		(connected loc18 loc21)
		(connected loc21 loc18)
		(connected loc18 loc32)
		(connected loc32 loc18)
		(connected loc18 loc33)
		(connected loc33 loc18)
		(connected loc19 loc14)
		(connected loc14 loc19)
		(connected loc19 loc34)
		(connected loc34 loc19)
		(connected loc20 loc15)
		(connected loc15 loc20)
		(connected loc20 loc23)
		(connected loc23 loc20)
		(connected loc21 loc11)
		(connected loc11 loc21)
		(connected loc21 loc29)
		(connected loc29 loc21)
		(connected loc22 loc27)
		(connected loc27 loc22)
		(connected loc22 loc30)
		(connected loc30 loc22)
		(connected loc22 loc35)
		(connected loc35 loc22)
		(connected loc23 loc24)
		(connected loc24 loc23)
		(connected loc23 loc33)
		(connected loc33 loc23)
		(connected loc24 loc12)
		(connected loc12 loc24)
		(connected loc24 loc16)
		(connected loc16 loc24)
		(connected loc24 loc21)
		(connected loc21 loc24)
		(connected loc24 loc29)
		(connected loc29 loc24)
		(connected loc24 loc32)
		(connected loc32 loc24)
		(connected loc25 loc20)
		(connected loc20 loc25)
		(connected loc25 loc22)
		(connected loc22 loc25)
		(connected loc25 loc28)
		(connected loc28 loc25)
		(connected loc25 loc34)
		(connected loc34 loc25)
		(connected loc26 loc8)
		(connected loc8 loc26)
		(connected loc26 loc9)
		(connected loc9 loc26)
		(connected loc26 loc12)
		(connected loc12 loc26)
		(connected loc27 loc5)
		(connected loc5 loc27)
		(connected loc27 loc24)
		(connected loc24 loc27)
		(connected loc27 loc25)
		(connected loc25 loc27)
		(connected loc27 loc26)
		(connected loc26 loc27)
		(connected loc28 loc31)
		(connected loc31 loc28)
		(connected loc28 loc32)
		(connected loc32 loc28)
		(connected loc29 loc21)
		(connected loc21 loc29)
		(connected loc29 loc25)
		(connected loc25 loc29)
		(connected loc30 loc5)
		(connected loc5 loc30)
		(connected loc31 loc21)
		(connected loc21 loc31)
		(connected loc31 loc35)
		(connected loc35 loc31)
		(connected loc32 loc24)
		(connected loc24 loc32)
		(connected loc34 loc12)
		(connected loc12 loc34)
		(connected loc34 loc35)
		(connected loc35 loc34)
		(connected loc35 loc20)
		(connected loc20 loc35)

		(in bar2 loc2)
		(in bar3 loc3)
		(in bar4 loc4)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar7 loc7)
		(in bar8 loc8)
		(in bar9 loc9)
		(in bar10 loc10)
		(in bar13 loc13)
		(in bar16 loc16)
		(in bar17 loc17)
		(in bar20 loc20)
		(in bar22 loc22)
		(in bar23 loc23)
		(in bar27 loc27)
		(in bar28 loc28)
		(in bar30 loc30)
		(in bar31 loc31)
		(in bar32 loc32)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar35 loc35)

	)

	(:goal
		(and
			(at loc35)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)