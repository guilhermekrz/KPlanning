; Generated by ProblemGenerator - Problem 34 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb34)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 - location
		bar1 bar2 bar3 bar5 bar6 bar7 bar8 bar9 bar12 bar13 bar15 bar16 bar19 bar20 bar21 bar22 bar24 bar27 bar28 bar29 bar30 bar34 bar36 bar37 bar38 - bar
	)
	(:init
		(at loc1)

		(connected loc37 loc12)
		(connected loc12 loc37)
		(connected loc12 loc34)
		(connected loc34 loc12)
		(connected loc34 loc18)
		(connected loc18 loc34)
		(connected loc18 loc23)
		(connected loc23 loc18)
		(connected loc23 loc30)
		(connected loc30 loc23)
		(connected loc30 loc17)
		(connected loc17 loc30)
		(connected loc17 loc16)
		(connected loc16 loc17)
		(connected loc16 loc39)
		(connected loc39 loc16)
		(connected loc39 loc29)
		(connected loc29 loc39)
		(connected loc29 loc35)
		(connected loc35 loc29)
		(connected loc16 loc1)
		(connected loc1 loc16)
		(connected loc39 loc11)
		(connected loc11 loc39)
		(connected loc11 loc26)
		(connected loc26 loc11)
		(connected loc26 loc14)
		(connected loc14 loc26)
		(connected loc14 loc21)
		(connected loc21 loc14)
		(connected loc21 loc25)
		(connected loc25 loc21)
		(connected loc25 loc38)
		(connected loc38 loc25)
		(connected loc38 loc28)
		(connected loc28 loc38)
		(connected loc11 loc19)
		(connected loc19 loc11)
		(connected loc19 loc4)
		(connected loc4 loc19)
		(connected loc29 loc33)
		(connected loc33 loc29)
		(connected loc35 loc2)
		(connected loc2 loc35)
		(connected loc29 loc3)
		(connected loc3 loc29)
		(connected loc23 loc32)
		(connected loc32 loc23)
		(connected loc2 loc10)
		(connected loc10 loc2)
		(connected loc2 loc7)
		(connected loc7 loc2)
		(connected loc7 loc22)
		(connected loc22 loc7)
		(connected loc14 loc27)
		(connected loc27 loc14)
		(connected loc26 loc5)
		(connected loc5 loc26)
		(connected loc12 loc15)
		(connected loc15 loc12)
		(connected loc25 loc6)
		(connected loc6 loc25)
		(connected loc29 loc31)
		(connected loc31 loc29)
		(connected loc31 loc13)
		(connected loc13 loc31)
		(connected loc16 loc36)
		(connected loc36 loc16)
		(connected loc34 loc24)
		(connected loc24 loc34)
		(connected loc26 loc9)
		(connected loc9 loc26)
		(connected loc34 loc20)
		(connected loc20 loc34)
		(connected loc21 loc8)
		(connected loc8 loc21)
		(connected loc1 loc2)
		(connected loc2 loc1)
		(connected loc1 loc9)
		(connected loc9 loc1)
		(connected loc1 loc12)
		(connected loc12 loc1)
		(connected loc1 loc16)
		(connected loc16 loc1)
		(connected loc1 loc18)
		(connected loc18 loc1)
		(connected loc1 loc38)
		(connected loc38 loc1)
		(connected loc3 loc10)
		(connected loc10 loc3)
		(connected loc3 loc36)
		(connected loc36 loc3)
		(connected loc4 loc22)
		(connected loc22 loc4)
		(connected loc4 loc23)
		(connected loc23 loc4)
		(connected loc4 loc36)
		(connected loc36 loc4)
		(connected loc5 loc10)
		(connected loc10 loc5)
		(connected loc5 loc12)
		(connected loc12 loc5)
		(connected loc5 loc38)
		(connected loc38 loc5)
		(connected loc6 loc7)
		(connected loc7 loc6)
		(connected loc6 loc20)
		(connected loc20 loc6)
		(connected loc7 loc6)
		(connected loc6 loc7)
		(connected loc7 loc27)
		(connected loc27 loc7)
		(connected loc8 loc7)
		(connected loc7 loc8)
		(connected loc8 loc14)
		(connected loc14 loc8)
		(connected loc8 loc27)
		(connected loc27 loc8)
		(connected loc9 loc6)
		(connected loc6 loc9)
		(connected loc9 loc7)
		(connected loc7 loc9)
		(connected loc9 loc29)
		(connected loc29 loc9)
		(connected loc10 loc15)
		(connected loc15 loc10)
		(connected loc11 loc20)
		(connected loc20 loc11)
		(connected loc12 loc21)
		(connected loc21 loc12)
		(connected loc12 loc30)
		(connected loc30 loc12)
		(connected loc13 loc6)
		(connected loc6 loc13)
		(connected loc13 loc11)
		(connected loc11 loc13)
		(connected loc13 loc17)
		(connected loc17 loc13)
		(connected loc13 loc21)
		(connected loc21 loc13)
		(connected loc13 loc38)
		(connected loc38 loc13)
		(connected loc14 loc9)
		(connected loc9 loc14)
		(connected loc14 loc13)
		(connected loc13 loc14)
		(connected loc15 loc26)
		(connected loc26 loc15)
		(connected loc15 loc37)
		(connected loc37 loc15)
		(connected loc16 loc7)
		(connected loc7 loc16)
		(connected loc16 loc10)
		(connected loc10 loc16)
		(connected loc16 loc37)
		(connected loc37 loc16)
		(connected loc17 loc29)
		(connected loc29 loc17)
		(connected loc18 loc6)
		(connected loc6 loc18)
		(connected loc18 loc28)
		(connected loc28 loc18)
		(connected loc18 loc30)
		(connected loc30 loc18)
		(connected loc19 loc30)
		(connected loc30 loc19)
		(connected loc19 loc35)
		(connected loc35 loc19)
		(connected loc20 loc2)
		(connected loc2 loc20)
		(connected loc20 loc22)
		(connected loc22 loc20)
		(connected loc20 loc33)
		(connected loc33 loc20)
		(connected loc20 loc39)
		(connected loc39 loc20)
		(connected loc21 loc17)
		(connected loc17 loc21)
		(connected loc21 loc20)
		(connected loc20 loc21)
		(connected loc21 loc35)
		(connected loc35 loc21)
		(connected loc22 loc32)
		(connected loc32 loc22)
		(connected loc23 loc12)
		(connected loc12 loc23)
		(connected loc23 loc25)
		(connected loc25 loc23)
		(connected loc23 loc28)
		(connected loc28 loc23)
		(connected loc23 loc31)
		(connected loc31 loc23)
		(connected loc24 loc9)
		(connected loc9 loc24)
		(connected loc24 loc31)
		(connected loc31 loc24)
		(connected loc25 loc2)
		(connected loc2 loc25)
		(connected loc25 loc3)
		(connected loc3 loc25)
		(connected loc25 loc20)
		(connected loc20 loc25)
		(connected loc25 loc29)
		(connected loc29 loc25)
		(connected loc26 loc10)
		(connected loc10 loc26)
		(connected loc26 loc22)
		(connected loc22 loc26)
		(connected loc26 loc24)
		(connected loc24 loc26)
		(connected loc26 loc39)
		(connected loc39 loc26)
		(connected loc27 loc24)
		(connected loc24 loc27)
		(connected loc27 loc30)
		(connected loc30 loc27)
		(connected loc28 loc27)
		(connected loc27 loc28)
		(connected loc29 loc19)
		(connected loc19 loc29)
		(connected loc30 loc8)
		(connected loc8 loc30)
		(connected loc30 loc36)
		(connected loc36 loc30)
		(connected loc31 loc32)
		(connected loc32 loc31)
		(connected loc33 loc5)
		(connected loc5 loc33)
		(connected loc33 loc14)
		(connected loc14 loc33)
		(connected loc33 loc18)
		(connected loc18 loc33)
		(connected loc34 loc32)
		(connected loc32 loc34)
		(connected loc35 loc19)
		(connected loc19 loc35)
		(connected loc35 loc30)
		(connected loc30 loc35)
		(connected loc35 loc38)
		(connected loc38 loc35)
		(connected loc36 loc19)
		(connected loc19 loc36)
		(connected loc36 loc20)
		(connected loc20 loc36)
		(connected loc36 loc21)
		(connected loc21 loc36)
		(connected loc36 loc32)
		(connected loc32 loc36)
		(connected loc37 loc5)
		(connected loc5 loc37)
		(connected loc38 loc31)
		(connected loc31 loc38)

		(in bar1 loc1)
		(in bar2 loc2)
		(in bar3 loc3)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar7 loc7)
		(in bar8 loc8)
		(in bar9 loc9)
		(in bar12 loc12)
		(in bar13 loc13)
		(in bar15 loc15)
		(in bar16 loc16)
		(in bar19 loc19)
		(in bar20 loc20)
		(in bar21 loc21)
		(in bar22 loc22)
		(in bar24 loc24)
		(in bar27 loc27)
		(in bar28 loc28)
		(in bar29 loc29)
		(in bar30 loc30)
		(in bar34 loc34)
		(in bar36 loc36)
		(in bar37 loc37)
		(in bar38 loc38)

	)

	(:goal
		(and
			(at loc39)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)