; Generated by ProblemGenerator - Problem 55 at Sat Nov 26 18:02:21 BRST 2016
(define (problem pb55)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 - location
		bar1 bar2 bar4 bar5 bar9 bar11 bar13 bar15 bar19 bar21 bar23 bar24 bar25 bar26 bar30 bar31 bar32 bar34 bar35 bar39 bar40 bar41 bar42 bar45 bar47 bar49 bar51 bar52 bar53 bar54 bar55 bar59 - bar
	)
	(:init
		(at loc1)

		(connected loc49 loc15)
		(connected loc15 loc49)
		(connected loc15 loc46)
		(connected loc46 loc15)
		(connected loc46 loc30)
		(connected loc30 loc46)
		(connected loc30 loc32)
		(connected loc32 loc30)
		(connected loc32 loc5)
		(connected loc5 loc32)
		(connected loc5 loc57)
		(connected loc57 loc5)
		(connected loc57 loc22)
		(connected loc22 loc57)
		(connected loc22 loc44)
		(connected loc44 loc22)
		(connected loc49 loc25)
		(connected loc25 loc49)
		(connected loc25 loc56)
		(connected loc56 loc25)
		(connected loc56 loc1)
		(connected loc1 loc56)
		(connected loc1 loc60)
		(connected loc60 loc1)
		(connected loc60 loc29)
		(connected loc29 loc60)
		(connected loc29 loc26)
		(connected loc26 loc29)
		(connected loc26 loc36)
		(connected loc36 loc26)
		(connected loc36 loc12)
		(connected loc12 loc36)
		(connected loc60 loc24)
		(connected loc24 loc60)
		(connected loc24 loc17)
		(connected loc17 loc24)
		(connected loc17 loc59)
		(connected loc59 loc17)
		(connected loc59 loc45)
		(connected loc45 loc59)
		(connected loc45 loc20)
		(connected loc20 loc45)
		(connected loc20 loc11)
		(connected loc11 loc20)
		(connected loc11 loc2)
		(connected loc2 loc11)
		(connected loc17 loc51)
		(connected loc51 loc17)
		(connected loc56 loc27)
		(connected loc27 loc56)
		(connected loc51 loc47)
		(connected loc47 loc51)
		(connected loc47 loc3)
		(connected loc3 loc47)
		(connected loc44 loc16)
		(connected loc16 loc44)
		(connected loc16 loc14)
		(connected loc14 loc16)
		(connected loc14 loc6)
		(connected loc6 loc14)
		(connected loc59 loc19)
		(connected loc19 loc59)
		(connected loc19 loc21)
		(connected loc21 loc19)
		(connected loc21 loc33)
		(connected loc33 loc21)
		(connected loc16 loc48)
		(connected loc48 loc16)
		(connected loc1 loc50)
		(connected loc50 loc1)
		(connected loc45 loc38)
		(connected loc38 loc45)
		(connected loc2 loc42)
		(connected loc42 loc2)
		(connected loc42 loc7)
		(connected loc7 loc42)
		(connected loc7 loc55)
		(connected loc55 loc7)
		(connected loc55 loc8)
		(connected loc8 loc55)
		(connected loc16 loc13)
		(connected loc13 loc16)
		(connected loc26 loc9)
		(connected loc9 loc26)
		(connected loc25 loc58)
		(connected loc58 loc25)
		(connected loc33 loc34)
		(connected loc34 loc33)
		(connected loc34 loc4)
		(connected loc4 loc34)
		(connected loc4 loc10)
		(connected loc10 loc4)
		(connected loc58 loc37)
		(connected loc37 loc58)
		(connected loc15 loc39)
		(connected loc39 loc15)
		(connected loc56 loc43)
		(connected loc43 loc56)
		(connected loc43 loc41)
		(connected loc41 loc43)
		(connected loc20 loc40)
		(connected loc40 loc20)
		(connected loc44 loc54)
		(connected loc54 loc44)
		(connected loc44 loc35)
		(connected loc35 loc44)
		(connected loc25 loc52)
		(connected loc52 loc25)
		(connected loc25 loc53)
		(connected loc53 loc25)
		(connected loc39 loc28)
		(connected loc28 loc39)
		(connected loc8 loc23)
		(connected loc23 loc8)
		(connected loc23 loc31)
		(connected loc31 loc23)
		(connected loc5 loc18)
		(connected loc18 loc5)
		(connected loc1 loc3)
		(connected loc3 loc1)
		(connected loc1 loc7)
		(connected loc7 loc1)
		(connected loc1 loc10)
		(connected loc10 loc1)
		(connected loc1 loc30)
		(connected loc30 loc1)
		(connected loc1 loc51)
		(connected loc51 loc1)
		(connected loc2 loc15)
		(connected loc15 loc2)
		(connected loc2 loc22)
		(connected loc22 loc2)
		(connected loc2 loc24)
		(connected loc24 loc2)
		(connected loc2 loc25)
		(connected loc25 loc2)
		(connected loc2 loc55)
		(connected loc55 loc2)
		(connected loc3 loc15)
		(connected loc15 loc3)
		(connected loc3 loc18)
		(connected loc18 loc3)
		(connected loc3 loc26)
		(connected loc26 loc3)
		(connected loc3 loc27)
		(connected loc27 loc3)
		(connected loc4 loc13)
		(connected loc13 loc4)
		(connected loc4 loc16)
		(connected loc16 loc4)
		(connected loc4 loc35)
		(connected loc35 loc4)
		(connected loc5 loc16)
		(connected loc16 loc5)
		(connected loc5 loc32)
		(connected loc32 loc5)
		(connected loc5 loc35)
		(connected loc35 loc5)
		(connected loc7 loc26)
		(connected loc26 loc7)
		(connected loc7 loc28)
		(connected loc28 loc7)
		(connected loc7 loc33)
		(connected loc33 loc7)
		(connected loc7 loc43)
		(connected loc43 loc7)
		(connected loc8 loc34)
		(connected loc34 loc8)
		(connected loc8 loc43)
		(connected loc43 loc8)
		(connected loc9 loc20)
		(connected loc20 loc9)
		(connected loc9 loc31)
		(connected loc31 loc9)
		(connected loc9 loc55)
		(connected loc55 loc9)
		(connected loc10 loc5)
		(connected loc5 loc10)
		(connected loc10 loc26)
		(connected loc26 loc10)
		(connected loc10 loc40)
		(connected loc40 loc10)
		(connected loc10 loc42)
		(connected loc42 loc10)
		(connected loc11 loc14)
		(connected loc14 loc11)
		(connected loc11 loc54)
		(connected loc54 loc11)
		(connected loc12 loc9)
		(connected loc9 loc12)
		(connected loc12 loc29)
		(connected loc29 loc12)
		(connected loc12 loc51)
		(connected loc51 loc12)
		(connected loc13 loc18)
		(connected loc18 loc13)
		(connected loc13 loc28)
		(connected loc28 loc13)
		(connected loc13 loc48)
		(connected loc48 loc13)
		(connected loc14 loc15)
		(connected loc15 loc14)
		(connected loc14 loc25)
		(connected loc25 loc14)
		(connected loc14 loc31)
		(connected loc31 loc14)
		(connected loc14 loc36)
		(connected loc36 loc14)
		(connected loc14 loc48)
		(connected loc48 loc14)
		(connected loc15 loc6)
		(connected loc6 loc15)
		(connected loc15 loc7)
		(connected loc7 loc15)
		(connected loc15 loc8)
		(connected loc8 loc15)
		(connected loc15 loc19)
		(connected loc19 loc15)
		(connected loc15 loc29)
		(connected loc29 loc15)
		(connected loc15 loc41)
		(connected loc41 loc15)
		(connected loc15 loc57)
		(connected loc57 loc15)
		(connected loc16 loc18)
		(connected loc18 loc16)
		(connected loc16 loc24)
		(connected loc24 loc16)
		(connected loc16 loc40)
		(connected loc40 loc16)
		(connected loc17 loc14)
		(connected loc14 loc17)
		(connected loc17 loc19)
		(connected loc19 loc17)
		(connected loc17 loc27)
		(connected loc27 loc17)
		(connected loc17 loc31)
		(connected loc31 loc17)
		(connected loc17 loc38)
		(connected loc38 loc17)
		(connected loc17 loc52)
		(connected loc52 loc17)
		(connected loc18 loc8)
		(connected loc8 loc18)
		(connected loc18 loc16)
		(connected loc16 loc18)
		(connected loc18 loc24)
		(connected loc24 loc18)
		(connected loc18 loc30)
		(connected loc30 loc18)
		(connected loc18 loc36)
		(connected loc36 loc18)
		(connected loc19 loc24)
		(connected loc24 loc19)
		(connected loc19 loc27)
		(connected loc27 loc19)
		(connected loc19 loc42)
		(connected loc42 loc19)
		(connected loc19 loc46)
		(connected loc46 loc19)
		(connected loc20 loc7)
		(connected loc7 loc20)
		(connected loc20 loc12)
		(connected loc12 loc20)
		(connected loc20 loc24)
		(connected loc24 loc20)
		(connected loc20 loc25)
		(connected loc25 loc20)
		(connected loc20 loc33)
		(connected loc33 loc20)
		(connected loc20 loc35)
		(connected loc35 loc20)
		(connected loc20 loc51)
		(connected loc51 loc20)
		(connected loc21 loc1)
		(connected loc1 loc21)
		(connected loc21 loc15)
		(connected loc15 loc21)
		(connected loc21 loc27)
		(connected loc27 loc21)
		(connected loc21 loc41)
		(connected loc41 loc21)
		(connected loc21 loc42)
		(connected loc42 loc21)
		(connected loc21 loc52)
		(connected loc52 loc21)
		(connected loc21 loc54)
		(connected loc54 loc21)
		(connected loc22 loc1)
		(connected loc1 loc22)
		(connected loc22 loc6)
		(connected loc6 loc22)
		(connected loc22 loc29)
		(connected loc29 loc22)
		(connected loc22 loc49)
		(connected loc49 loc22)
		(connected loc22 loc55)
		(connected loc55 loc22)
		(connected loc23 loc19)
		(connected loc19 loc23)
		(connected loc23 loc26)
		(connected loc26 loc23)
		(connected loc23 loc28)
		(connected loc28 loc23)
		(connected loc23 loc33)
		(connected loc33 loc23)
		(connected loc23 loc48)
		(connected loc48 loc23)
		(connected loc24 loc22)
		(connected loc22 loc24)
		(connected loc24 loc44)
		(connected loc44 loc24)
		(connected loc25 loc8)
		(connected loc8 loc25)
		(connected loc25 loc9)
		(connected loc9 loc25)
		(connected loc25 loc14)
		(connected loc14 loc25)
		(connected loc25 loc40)
		(connected loc40 loc25)
		(connected loc25 loc41)
		(connected loc41 loc25)
		(connected loc25 loc49)
		(connected loc49 loc25)
		(connected loc26 loc3)
		(connected loc3 loc26)
		(connected loc26 loc4)
		(connected loc4 loc26)
		(connected loc26 loc38)
		(connected loc38 loc26)
		(connected loc26 loc47)
		(connected loc47 loc26)
		(connected loc27 loc12)
		(connected loc12 loc27)
		(connected loc27 loc16)
		(connected loc16 loc27)
		(connected loc27 loc32)
		(connected loc32 loc27)
		(connected loc27 loc38)
		(connected loc38 loc27)
		(connected loc27 loc50)
		(connected loc50 loc27)
		(connected loc27 loc56)
		(connected loc56 loc27)
		(connected loc28 loc21)
		(connected loc21 loc28)
		(connected loc28 loc33)
		(connected loc33 loc28)
		(connected loc28 loc35)
		(connected loc35 loc28)
		(connected loc28 loc55)
		(connected loc55 loc28)
		(connected loc29 loc17)
		(connected loc17 loc29)
		(connected loc29 loc24)
		(connected loc24 loc29)
		(connected loc29 loc44)
		(connected loc44 loc29)
		(connected loc29 loc60)
		(connected loc60 loc29)
		(connected loc30 loc17)
		(connected loc17 loc30)
		(connected loc30 loc22)
		(connected loc22 loc30)
		(connected loc30 loc31)
		(connected loc31 loc30)
		(connected loc30 loc36)
		(connected loc36 loc30)
		(connected loc30 loc48)
		(connected loc48 loc30)
		(connected loc30 loc59)
		(connected loc59 loc30)
		(connected loc31 loc27)
		(connected loc27 loc31)
		(connected loc31 loc51)
		(connected loc51 loc31)
		(connected loc32 loc14)
		(connected loc14 loc32)
		(connected loc32 loc16)
		(connected loc16 loc32)
		(connected loc32 loc38)
		(connected loc38 loc32)
		(connected loc32 loc41)
		(connected loc41 loc32)
		(connected loc32 loc44)
		(connected loc44 loc32)
		(connected loc33 loc8)
		(connected loc8 loc33)
		(connected loc33 loc35)
		(connected loc35 loc33)
		(connected loc33 loc36)
		(connected loc36 loc33)
		(connected loc33 loc59)
		(connected loc59 loc33)
		(connected loc33 loc60)
		(connected loc60 loc33)
		(connected loc34 loc22)
		(connected loc22 loc34)
		(connected loc34 loc27)
		(connected loc27 loc34)
		(connected loc34 loc30)
		(connected loc30 loc34)
		(connected loc34 loc45)
		(connected loc45 loc34)
		(connected loc34 loc47)
		(connected loc47 loc34)
		(connected loc35 loc10)
		(connected loc10 loc35)
		(connected loc35 loc31)
		(connected loc31 loc35)
		(connected loc35 loc32)
		(connected loc32 loc35)
		(connected loc35 loc37)
		(connected loc37 loc35)
		(connected loc36 loc37)
		(connected loc37 loc36)
		(connected loc36 loc40)
		(connected loc40 loc36)
		(connected loc37 loc23)
		(connected loc23 loc37)
		(connected loc37 loc26)
		(connected loc26 loc37)
		(connected loc37 loc30)
		(connected loc30 loc37)
		(connected loc37 loc58)
		(connected loc58 loc37)
		(connected loc38 loc3)
		(connected loc3 loc38)
		(connected loc38 loc17)
		(connected loc17 loc38)
		(connected loc38 loc30)
		(connected loc30 loc38)
		(connected loc38 loc36)
		(connected loc36 loc38)
		(connected loc38 loc53)
		(connected loc53 loc38)
		(connected loc39 loc14)
		(connected loc14 loc39)
		(connected loc39 loc27)
		(connected loc27 loc39)
		(connected loc39 loc42)
		(connected loc42 loc39)
		(connected loc40 loc16)
		(connected loc16 loc40)
		(connected loc40 loc18)
		(connected loc18 loc40)
		(connected loc40 loc23)
		(connected loc23 loc40)
		(connected loc40 loc28)
		(connected loc28 loc40)
		(connected loc40 loc56)
		(connected loc56 loc40)
		(connected loc40 loc57)
		(connected loc57 loc40)
		(connected loc41 loc18)
		(connected loc18 loc41)
		(connected loc41 loc32)
		(connected loc32 loc41)
		(connected loc41 loc45)
		(connected loc45 loc41)
		(connected loc41 loc48)
		(connected loc48 loc41)
		(connected loc41 loc50)
		(connected loc50 loc41)
		(connected loc41 loc55)
		(connected loc55 loc41)
		(connected loc42 loc21)
		(connected loc21 loc42)
		(connected loc42 loc34)
		(connected loc34 loc42)
		(connected loc42 loc47)
		(connected loc47 loc42)
		(connected loc43 loc19)
		(connected loc19 loc43)
		(connected loc43 loc28)
		(connected loc28 loc43)
		(connected loc43 loc35)
		(connected loc35 loc43)
		(connected loc44 loc4)
		(connected loc4 loc44)
		(connected loc44 loc19)
		(connected loc19 loc44)
		(connected loc44 loc31)
		(connected loc31 loc44)
		(connected loc44 loc43)
		(connected loc43 loc44)
		(connected loc45 loc28)
		(connected loc28 loc45)
		(connected loc45 loc41)
		(connected loc41 loc45)
		(connected loc45 loc60)
		(connected loc60 loc45)
		(connected loc46 loc41)
		(connected loc41 loc46)
		(connected loc46 loc45)
		(connected loc45 loc46)
		(connected loc46 loc51)
		(connected loc51 loc46)
		(connected loc47 loc14)
		(connected loc14 loc47)
		(connected loc47 loc36)
		(connected loc36 loc47)
		(connected loc47 loc55)
		(connected loc55 loc47)
		(connected loc47 loc57)
		(connected loc57 loc47)
		(connected loc48 loc39)
		(connected loc39 loc48)
		(connected loc48 loc40)
		(connected loc40 loc48)
		(connected loc48 loc45)
		(connected loc45 loc48)
		(connected loc48 loc47)
		(connected loc47 loc48)
		(connected loc49 loc4)
		(connected loc4 loc49)
		(connected loc49 loc29)
		(connected loc29 loc49)
		(connected loc49 loc47)
		(connected loc47 loc49)
		(connected loc49 loc50)
		(connected loc50 loc49)
		(connected loc49 loc55)
		(connected loc55 loc49)
		(connected loc49 loc56)
		(connected loc56 loc49)
		(connected loc50 loc24)
		(connected loc24 loc50)
		(connected loc50 loc26)
		(connected loc26 loc50)
		(connected loc50 loc48)
		(connected loc48 loc50)
		(connected loc50 loc52)
		(connected loc52 loc50)
		(connected loc51 loc15)
		(connected loc15 loc51)
		(connected loc51 loc17)
		(connected loc17 loc51)
		(connected loc51 loc33)
		(connected loc33 loc51)
		(connected loc51 loc35)
		(connected loc35 loc51)
		(connected loc52 loc31)
		(connected loc31 loc52)
		(connected loc52 loc44)
		(connected loc44 loc52)
		(connected loc52 loc56)
		(connected loc56 loc52)
		(connected loc53 loc9)
		(connected loc9 loc53)
		(connected loc53 loc28)
		(connected loc28 loc53)
		(connected loc53 loc55)
		(connected loc55 loc53)
		(connected loc54 loc25)
		(connected loc25 loc54)
		(connected loc54 loc43)
		(connected loc43 loc54)
		(connected loc54 loc51)
		(connected loc51 loc54)
		(connected loc54 loc52)
		(connected loc52 loc54)
		(connected loc55 loc6)
		(connected loc6 loc55)
		(connected loc55 loc14)
		(connected loc14 loc55)
		(connected loc55 loc29)
		(connected loc29 loc55)
		(connected loc56 loc44)
		(connected loc44 loc56)
		(connected loc56 loc45)
		(connected loc45 loc56)
		(connected loc56 loc51)
		(connected loc51 loc56)
		(connected loc56 loc57)
		(connected loc57 loc56)
		(connected loc58 loc59)
		(connected loc59 loc58)
		(connected loc59 loc7)
		(connected loc7 loc59)
		(connected loc59 loc35)
		(connected loc35 loc59)
		(connected loc60 loc28)
		(connected loc28 loc60)
		(connected loc60 loc34)
		(connected loc34 loc60)
		(connected loc60 loc50)
		(connected loc50 loc60)
		(connected loc60 loc55)
		(connected loc55 loc60)
		(connected loc60 loc56)
		(connected loc56 loc60)

		(in bar1 loc1)
		(in bar2 loc2)
		(in bar4 loc4)
		(in bar5 loc5)
		(in bar9 loc9)
		(in bar11 loc11)
		(in bar13 loc13)
		(in bar15 loc15)
		(in bar19 loc19)
		(in bar21 loc21)
		(in bar23 loc23)
		(in bar24 loc24)
		(in bar25 loc25)
		(in bar26 loc26)
		(in bar30 loc30)
		(in bar31 loc31)
		(in bar32 loc32)
		(in bar34 loc34)
		(in bar35 loc35)
		(in bar39 loc39)
		(in bar40 loc40)
		(in bar41 loc41)
		(in bar42 loc42)
		(in bar45 loc45)
		(in bar47 loc47)
		(in bar49 loc49)
		(in bar51 loc51)
		(in bar52 loc52)
		(in bar53 loc53)
		(in bar54 loc54)
		(in bar55 loc55)
		(in bar59 loc59)

	)

	(:goal
		(and
			(at loc60)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)