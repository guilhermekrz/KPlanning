; Generated by ProblemGenerator - Problem 40 at Sat Nov 26 18:02:20 BRST 2016
(define (problem pb40)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 - location
		bar1 bar4 bar7 bar8 bar9 bar10 bar12 bar13 bar15 bar16 bar21 bar22 bar25 bar26 bar27 bar28 bar29 bar30 bar31 bar33 bar35 bar36 bar37 bar38 bar39 bar41 bar44 - bar
	)
	(:init
		(at loc1)

		(connected loc5 loc6)
		(connected loc6 loc5)
		(connected loc6 loc27)
		(connected loc27 loc6)
		(connected loc27 loc17)
		(connected loc17 loc27)
		(connected loc17 loc22)
		(connected loc22 loc17)
		(connected loc22 loc40)
		(connected loc40 loc22)
		(connected loc40 loc19)
		(connected loc19 loc40)
		(connected loc19 loc2)
		(connected loc2 loc19)
		(connected loc27 loc44)
		(connected loc44 loc27)
		(connected loc44 loc23)
		(connected loc23 loc44)
		(connected loc23 loc7)
		(connected loc7 loc23)
		(connected loc7 loc39)
		(connected loc39 loc7)
		(connected loc39 loc38)
		(connected loc38 loc39)
		(connected loc38 loc3)
		(connected loc3 loc38)
		(connected loc3 loc20)
		(connected loc20 loc3)
		(connected loc17 loc11)
		(connected loc11 loc17)
		(connected loc11 loc35)
		(connected loc35 loc11)
		(connected loc35 loc41)
		(connected loc41 loc35)
		(connected loc22 loc24)
		(connected loc24 loc22)
		(connected loc23 loc31)
		(connected loc31 loc23)
		(connected loc31 loc26)
		(connected loc26 loc31)
		(connected loc26 loc32)
		(connected loc32 loc26)
		(connected loc7 loc36)
		(connected loc36 loc7)
		(connected loc36 loc21)
		(connected loc21 loc36)
		(connected loc40 loc10)
		(connected loc10 loc40)
		(connected loc3 loc1)
		(connected loc1 loc3)
		(connected loc17 loc29)
		(connected loc29 loc17)
		(connected loc29 loc28)
		(connected loc28 loc29)
		(connected loc38 loc16)
		(connected loc16 loc38)
		(connected loc5 loc15)
		(connected loc15 loc5)
		(connected loc15 loc12)
		(connected loc12 loc15)
		(connected loc24 loc14)
		(connected loc14 loc24)
		(connected loc3 loc42)
		(connected loc42 loc3)
		(connected loc38 loc30)
		(connected loc30 loc38)
		(connected loc22 loc45)
		(connected loc45 loc22)
		(connected loc16 loc8)
		(connected loc8 loc16)
		(connected loc38 loc34)
		(connected loc34 loc38)
		(connected loc15 loc43)
		(connected loc43 loc15)
		(connected loc5 loc25)
		(connected loc25 loc5)
		(connected loc1 loc4)
		(connected loc4 loc1)
		(connected loc4 loc33)
		(connected loc33 loc4)
		(connected loc21 loc18)
		(connected loc18 loc21)
		(connected loc18 loc9)
		(connected loc9 loc18)
		(connected loc5 loc13)
		(connected loc13 loc5)
		(connected loc29 loc37)
		(connected loc37 loc29)
		(connected loc1 loc5)
		(connected loc5 loc1)
		(connected loc1 loc17)
		(connected loc17 loc1)
		(connected loc1 loc28)
		(connected loc28 loc1)
		(connected loc3 loc4)
		(connected loc4 loc3)
		(connected loc3 loc8)
		(connected loc8 loc3)
		(connected loc3 loc34)
		(connected loc34 loc3)
		(connected loc4 loc13)
		(connected loc13 loc4)
		(connected loc5 loc10)
		(connected loc10 loc5)
		(connected loc5 loc11)
		(connected loc11 loc5)
		(connected loc5 loc14)
		(connected loc14 loc5)
		(connected loc5 loc28)
		(connected loc28 loc5)
		(connected loc6 loc8)
		(connected loc8 loc6)
		(connected loc6 loc12)
		(connected loc12 loc6)
		(connected loc7 loc14)
		(connected loc14 loc7)
		(connected loc8 loc18)
		(connected loc18 loc8)
		(connected loc9 loc16)
		(connected loc16 loc9)
		(connected loc10 loc1)
		(connected loc1 loc10)
		(connected loc10 loc5)
		(connected loc5 loc10)
		(connected loc10 loc28)
		(connected loc28 loc10)
		(connected loc10 loc30)
		(connected loc30 loc10)
		(connected loc11 loc22)
		(connected loc22 loc11)
		(connected loc12 loc5)
		(connected loc5 loc12)
		(connected loc12 loc13)
		(connected loc13 loc12)
		(connected loc12 loc36)
		(connected loc36 loc12)
		(connected loc13 loc17)
		(connected loc17 loc13)
		(connected loc13 loc35)
		(connected loc35 loc13)
		(connected loc14 loc4)
		(connected loc4 loc14)
		(connected loc14 loc16)
		(connected loc16 loc14)
		(connected loc15 loc6)
		(connected loc6 loc15)
		(connected loc15 loc41)
		(connected loc41 loc15)
		(connected loc16 loc13)
		(connected loc13 loc16)
		(connected loc16 loc24)
		(connected loc24 loc16)
		(connected loc16 loc42)
		(connected loc42 loc16)
		(connected loc17 loc3)
		(connected loc3 loc17)
		(connected loc17 loc4)
		(connected loc4 loc17)
		(connected loc17 loc28)
		(connected loc28 loc17)
		(connected loc17 loc38)
		(connected loc38 loc17)
		(connected loc17 loc40)
		(connected loc40 loc17)
		(connected loc18 loc13)
		(connected loc13 loc18)
		(connected loc18 loc14)
		(connected loc14 loc18)
		(connected loc18 loc17)
		(connected loc17 loc18)
		(connected loc18 loc22)
		(connected loc22 loc18)
		(connected loc19 loc10)
		(connected loc10 loc19)
		(connected loc19 loc13)
		(connected loc13 loc19)
		(connected loc19 loc17)
		(connected loc17 loc19)
		(connected loc20 loc10)
		(connected loc10 loc20)
		(connected loc20 loc13)
		(connected loc13 loc20)
		(connected loc21 loc3)
		(connected loc3 loc21)
		(connected loc21 loc12)
		(connected loc12 loc21)
		(connected loc21 loc20)
		(connected loc20 loc21)
		(connected loc21 loc37)
		(connected loc37 loc21)
		(connected loc22 loc42)
		(connected loc42 loc22)
		(connected loc23 loc12)
		(connected loc12 loc23)
		(connected loc24 loc20)
		(connected loc20 loc24)
		(connected loc24 loc23)
		(connected loc23 loc24)
		(connected loc24 loc28)
		(connected loc28 loc24)
		(connected loc24 loc30)
		(connected loc30 loc24)
		(connected loc24 loc36)
		(connected loc36 loc24)
		(connected loc24 loc45)
		(connected loc45 loc24)
		(connected loc25 loc4)
		(connected loc4 loc25)
		(connected loc25 loc17)
		(connected loc17 loc25)
		(connected loc25 loc21)
		(connected loc21 loc25)
		(connected loc25 loc30)
		(connected loc30 loc25)
		(connected loc26 loc20)
		(connected loc20 loc26)
		(connected loc26 loc38)
		(connected loc38 loc26)
		(connected loc26 loc45)
		(connected loc45 loc26)
		(connected loc27 loc23)
		(connected loc23 loc27)
		(connected loc27 loc24)
		(connected loc24 loc27)
		(connected loc27 loc39)
		(connected loc39 loc27)
		(connected loc27 loc42)
		(connected loc42 loc27)
		(connected loc28 loc22)
		(connected loc22 loc28)
		(connected loc28 loc29)
		(connected loc29 loc28)
		(connected loc28 loc31)
		(connected loc31 loc28)
		(connected loc28 loc32)
		(connected loc32 loc28)
		(connected loc28 loc35)
		(connected loc35 loc28)
		(connected loc28 loc39)
		(connected loc39 loc28)
		(connected loc28 loc45)
		(connected loc45 loc28)
		(connected loc29 loc6)
		(connected loc6 loc29)
		(connected loc29 loc20)
		(connected loc20 loc29)
		(connected loc29 loc26)
		(connected loc26 loc29)
		(connected loc29 loc41)
		(connected loc41 loc29)
		(connected loc30 loc28)
		(connected loc28 loc30)
		(connected loc31 loc14)
		(connected loc14 loc31)
		(connected loc31 loc18)
		(connected loc18 loc31)
		(connected loc32 loc13)
		(connected loc13 loc32)
		(connected loc33 loc4)
		(connected loc4 loc33)
		(connected loc34 loc27)
		(connected loc27 loc34)
		(connected loc34 loc31)
		(connected loc31 loc34)
		(connected loc34 loc32)
		(connected loc32 loc34)
		(connected loc34 loc36)
		(connected loc36 loc34)
		(connected loc34 loc40)
		(connected loc40 loc34)
		(connected loc36 loc19)
		(connected loc19 loc36)
		(connected loc36 loc22)
		(connected loc22 loc36)
		(connected loc37 loc18)
		(connected loc18 loc37)
		(connected loc37 loc27)
		(connected loc27 loc37)
		(connected loc38 loc2)
		(connected loc2 loc38)
		(connected loc38 loc5)
		(connected loc5 loc38)
		(connected loc38 loc6)
		(connected loc6 loc38)
		(connected loc38 loc36)
		(connected loc36 loc38)
		(connected loc38 loc43)
		(connected loc43 loc38)
		(connected loc39 loc23)
		(connected loc23 loc39)
		(connected loc39 loc24)
		(connected loc24 loc39)
		(connected loc39 loc36)
		(connected loc36 loc39)
		(connected loc40 loc16)
		(connected loc16 loc40)
		(connected loc41 loc23)
		(connected loc23 loc41)
		(connected loc41 loc35)
		(connected loc35 loc41)
		(connected loc43 loc20)
		(connected loc20 loc43)
		(connected loc43 loc45)
		(connected loc45 loc43)
		(connected loc44 loc27)
		(connected loc27 loc44)
		(connected loc44 loc32)
		(connected loc32 loc44)
		(connected loc45 loc22)
		(connected loc22 loc45)
		(connected loc45 loc28)
		(connected loc28 loc45)
		(connected loc45 loc43)
		(connected loc43 loc45)

		(in bar1 loc1)
		(in bar4 loc4)
		(in bar7 loc7)
		(in bar8 loc8)
		(in bar9 loc9)
		(in bar10 loc10)
		(in bar12 loc12)
		(in bar13 loc13)
		(in bar15 loc15)
		(in bar16 loc16)
		(in bar21 loc21)
		(in bar22 loc22)
		(in bar25 loc25)
		(in bar26 loc26)
		(in bar27 loc27)
		(in bar28 loc28)
		(in bar29 loc29)
		(in bar30 loc30)
		(in bar31 loc31)
		(in bar33 loc33)
		(in bar35 loc35)
		(in bar36 loc36)
		(in bar37 loc37)
		(in bar38 loc38)
		(in bar39 loc39)
		(in bar41 loc41)
		(in bar44 loc44)

	)

	(:goal
		(and
			(at loc45)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)