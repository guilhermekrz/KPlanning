; Generated by ProblemGenerator - Problem 59 at Sat Nov 26 18:02:21 BRST 2016
(define (problem pb59)
	(:domain drinkanddrive-constraints-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 - location
		bar3 bar4 bar5 bar6 bar11 bar12 bar15 bar17 bar18 bar21 bar22 bar24 bar26 bar27 bar30 bar33 bar34 bar35 bar41 bar43 bar46 bar48 bar53 bar54 bar55 bar56 bar58 bar61 - bar
	)
	(:init
		(at loc1)

		(connected loc30 loc15)
		(connected loc15 loc30)
		(connected loc15 loc4)
		(connected loc4 loc15)
		(connected loc15 loc57)
		(connected loc57 loc15)
		(connected loc57 loc45)
		(connected loc45 loc57)
		(connected loc45 loc8)
		(connected loc8 loc45)
		(connected loc8 loc58)
		(connected loc58 loc8)
		(connected loc58 loc27)
		(connected loc27 loc58)
		(connected loc27 loc12)
		(connected loc12 loc27)
		(connected loc12 loc26)
		(connected loc26 loc12)
		(connected loc26 loc63)
		(connected loc63 loc26)
		(connected loc63 loc42)
		(connected loc42 loc63)
		(connected loc42 loc36)
		(connected loc36 loc42)
		(connected loc36 loc18)
		(connected loc18 loc36)
		(connected loc18 loc31)
		(connected loc31 loc18)
		(connected loc31 loc53)
		(connected loc53 loc31)
		(connected loc8 loc3)
		(connected loc3 loc8)
		(connected loc3 loc35)
		(connected loc35 loc3)
		(connected loc45 loc7)
		(connected loc7 loc45)
		(connected loc7 loc6)
		(connected loc6 loc7)
		(connected loc3 loc28)
		(connected loc28 loc3)
		(connected loc28 loc52)
		(connected loc52 loc28)
		(connected loc27 loc48)
		(connected loc48 loc27)
		(connected loc48 loc64)
		(connected loc64 loc48)
		(connected loc64 loc10)
		(connected loc10 loc64)
		(connected loc10 loc37)
		(connected loc37 loc10)
		(connected loc37 loc21)
		(connected loc21 loc37)
		(connected loc21 loc59)
		(connected loc59 loc21)
		(connected loc59 loc19)
		(connected loc19 loc59)
		(connected loc19 loc60)
		(connected loc60 loc19)
		(connected loc4 loc43)
		(connected loc43 loc4)
		(connected loc43 loc22)
		(connected loc22 loc43)
		(connected loc22 loc40)
		(connected loc40 loc22)
		(connected loc40 loc50)
		(connected loc50 loc40)
		(connected loc50 loc41)
		(connected loc41 loc50)
		(connected loc41 loc11)
		(connected loc11 loc41)
		(connected loc22 loc61)
		(connected loc61 loc22)
		(connected loc58 loc25)
		(connected loc25 loc58)
		(connected loc45 loc56)
		(connected loc56 loc45)
		(connected loc56 loc29)
		(connected loc29 loc56)
		(connected loc27 loc23)
		(connected loc23 loc27)
		(connected loc10 loc2)
		(connected loc2 loc10)
		(connected loc19 loc14)
		(connected loc14 loc19)
		(connected loc14 loc24)
		(connected loc24 loc14)
		(connected loc24 loc5)
		(connected loc5 loc24)
		(connected loc52 loc49)
		(connected loc49 loc52)
		(connected loc52 loc17)
		(connected loc17 loc52)
		(connected loc35 loc1)
		(connected loc1 loc35)
		(connected loc8 loc51)
		(connected loc51 loc8)
		(connected loc31 loc16)
		(connected loc16 loc31)
		(connected loc61 loc33)
		(connected loc33 loc61)
		(connected loc33 loc44)
		(connected loc44 loc33)
		(connected loc53 loc55)
		(connected loc55 loc53)
		(connected loc41 loc9)
		(connected loc9 loc41)
		(connected loc56 loc20)
		(connected loc20 loc56)
		(connected loc2 loc34)
		(connected loc34 loc2)
		(connected loc11 loc46)
		(connected loc46 loc11)
		(connected loc37 loc38)
		(connected loc38 loc37)
		(connected loc30 loc62)
		(connected loc62 loc30)
		(connected loc63 loc39)
		(connected loc39 loc63)
		(connected loc55 loc54)
		(connected loc54 loc55)
		(connected loc1 loc32)
		(connected loc32 loc1)
		(connected loc3 loc47)
		(connected loc47 loc3)
		(connected loc45 loc13)
		(connected loc13 loc45)
		(connected loc1 loc3)
		(connected loc3 loc1)
		(connected loc1 loc10)
		(connected loc10 loc1)
		(connected loc1 loc12)
		(connected loc12 loc1)
		(connected loc1 loc34)
		(connected loc34 loc1)
		(connected loc1 loc36)
		(connected loc36 loc1)
		(connected loc1 loc43)
		(connected loc43 loc1)
		(connected loc1 loc46)
		(connected loc46 loc1)
		(connected loc2 loc3)
		(connected loc3 loc2)
		(connected loc2 loc8)
		(connected loc8 loc2)
		(connected loc2 loc10)
		(connected loc10 loc2)
		(connected loc2 loc21)
		(connected loc21 loc2)
		(connected loc2 loc23)
		(connected loc23 loc2)
		(connected loc2 loc31)
		(connected loc31 loc2)
		(connected loc2 loc35)
		(connected loc35 loc2)
		(connected loc2 loc39)
		(connected loc39 loc2)
		(connected loc3 loc19)
		(connected loc19 loc3)
		(connected loc3 loc30)
		(connected loc30 loc3)
		(connected loc4 loc5)
		(connected loc5 loc4)
		(connected loc4 loc17)
		(connected loc17 loc4)
		(connected loc4 loc24)
		(connected loc24 loc4)
		(connected loc4 loc35)
		(connected loc35 loc4)
		(connected loc4 loc45)
		(connected loc45 loc4)
		(connected loc5 loc8)
		(connected loc8 loc5)
		(connected loc5 loc22)
		(connected loc22 loc5)
		(connected loc5 loc25)
		(connected loc25 loc5)
		(connected loc5 loc27)
		(connected loc27 loc5)
		(connected loc5 loc41)
		(connected loc41 loc5)
		(connected loc5 loc48)
		(connected loc48 loc5)
		(connected loc5 loc55)
		(connected loc55 loc5)
		(connected loc6 loc4)
		(connected loc4 loc6)
		(connected loc6 loc17)
		(connected loc17 loc6)
		(connected loc6 loc23)
		(connected loc23 loc6)
		(connected loc7 loc8)
		(connected loc8 loc7)
		(connected loc7 loc24)
		(connected loc24 loc7)
		(connected loc8 loc57)
		(connected loc57 loc8)
		(connected loc9 loc12)
		(connected loc12 loc9)
		(connected loc9 loc21)
		(connected loc21 loc9)
		(connected loc10 loc5)
		(connected loc5 loc10)
		(connected loc10 loc9)
		(connected loc9 loc10)
		(connected loc10 loc15)
		(connected loc15 loc10)
		(connected loc10 loc17)
		(connected loc17 loc10)
		(connected loc10 loc19)
		(connected loc19 loc10)
		(connected loc10 loc23)
		(connected loc23 loc10)
		(connected loc10 loc25)
		(connected loc25 loc10)
		(connected loc10 loc31)
		(connected loc31 loc10)
		(connected loc10 loc36)
		(connected loc36 loc10)
		(connected loc10 loc39)
		(connected loc39 loc10)
		(connected loc11 loc1)
		(connected loc1 loc11)
		(connected loc11 loc4)
		(connected loc4 loc11)
		(connected loc11 loc6)
		(connected loc6 loc11)
		(connected loc11 loc19)
		(connected loc19 loc11)
		(connected loc11 loc21)
		(connected loc21 loc11)
		(connected loc11 loc23)
		(connected loc23 loc11)
		(connected loc11 loc25)
		(connected loc25 loc11)
		(connected loc11 loc27)
		(connected loc27 loc11)
		(connected loc13 loc14)
		(connected loc14 loc13)
		(connected loc13 loc20)
		(connected loc20 loc13)
		(connected loc13 loc21)
		(connected loc21 loc13)
		(connected loc13 loc32)
		(connected loc32 loc13)
		(connected loc13 loc38)
		(connected loc38 loc13)
		(connected loc14 loc8)
		(connected loc8 loc14)
		(connected loc14 loc40)
		(connected loc40 loc14)
		(connected loc15 loc10)
		(connected loc10 loc15)
		(connected loc15 loc21)
		(connected loc21 loc15)
		(connected loc15 loc28)
		(connected loc28 loc15)
		(connected loc15 loc30)
		(connected loc30 loc15)
		(connected loc16 loc1)
		(connected loc1 loc16)
		(connected loc16 loc3)
		(connected loc3 loc16)
		(connected loc16 loc8)
		(connected loc8 loc16)
		(connected loc16 loc13)
		(connected loc13 loc16)
		(connected loc16 loc14)
		(connected loc14 loc16)
		(connected loc16 loc17)
		(connected loc17 loc16)
		(connected loc16 loc36)
		(connected loc36 loc16)
		(connected loc17 loc1)
		(connected loc1 loc17)
		(connected loc17 loc5)
		(connected loc5 loc17)
		(connected loc17 loc7)
		(connected loc7 loc17)
		(connected loc17 loc25)
		(connected loc25 loc17)
		(connected loc17 loc48)
		(connected loc48 loc17)
		(connected loc18 loc50)
		(connected loc50 loc18)
		(connected loc19 loc1)
		(connected loc1 loc19)
		(connected loc19 loc3)
		(connected loc3 loc19)
		(connected loc19 loc17)
		(connected loc17 loc19)
		(connected loc19 loc20)
		(connected loc20 loc19)
		(connected loc19 loc55)
		(connected loc55 loc19)
		(connected loc20 loc5)
		(connected loc5 loc20)
		(connected loc20 loc19)
		(connected loc19 loc20)
		(connected loc20 loc27)
		(connected loc27 loc20)
		(connected loc20 loc29)
		(connected loc29 loc20)
		(connected loc20 loc54)
		(connected loc54 loc20)
		(connected loc21 loc63)
		(connected loc63 loc21)
		(connected loc22 loc5)
		(connected loc5 loc22)
		(connected loc22 loc19)
		(connected loc19 loc22)
		(connected loc22 loc62)
		(connected loc62 loc22)
		(connected loc23 loc6)
		(connected loc6 loc23)
		(connected loc23 loc14)
		(connected loc14 loc23)
		(connected loc23 loc15)
		(connected loc15 loc23)
		(connected loc23 loc46)
		(connected loc46 loc23)
		(connected loc23 loc51)
		(connected loc51 loc23)
		(connected loc24 loc16)
		(connected loc16 loc24)
		(connected loc24 loc37)
		(connected loc37 loc24)
		(connected loc24 loc41)
		(connected loc41 loc24)
		(connected loc24 loc54)
		(connected loc54 loc24)
		(connected loc25 loc2)
		(connected loc2 loc25)
		(connected loc25 loc36)
		(connected loc36 loc25)
		(connected loc25 loc46)
		(connected loc46 loc25)
		(connected loc25 loc52)
		(connected loc52 loc25)
		(connected loc26 loc32)
		(connected loc32 loc26)
		(connected loc26 loc62)
		(connected loc62 loc26)
		(connected loc27 loc15)
		(connected loc15 loc27)
		(connected loc27 loc17)
		(connected loc17 loc27)
		(connected loc27 loc31)
		(connected loc31 loc27)
		(connected loc28 loc9)
		(connected loc9 loc28)
		(connected loc28 loc22)
		(connected loc22 loc28)
		(connected loc28 loc23)
		(connected loc23 loc28)
		(connected loc28 loc32)
		(connected loc32 loc28)
		(connected loc28 loc51)
		(connected loc51 loc28)
		(connected loc29 loc25)
		(connected loc25 loc29)
		(connected loc29 loc27)
		(connected loc27 loc29)
		(connected loc29 loc40)
		(connected loc40 loc29)
		(connected loc29 loc41)
		(connected loc41 loc29)
		(connected loc29 loc42)
		(connected loc42 loc29)
		(connected loc29 loc57)
		(connected loc57 loc29)
		(connected loc29 loc64)
		(connected loc64 loc29)
		(connected loc30 loc5)
		(connected loc5 loc30)
		(connected loc30 loc25)
		(connected loc25 loc30)
		(connected loc30 loc50)
		(connected loc50 loc30)
		(connected loc32 loc34)
		(connected loc34 loc32)
		(connected loc32 loc39)
		(connected loc39 loc32)
		(connected loc33 loc8)
		(connected loc8 loc33)
		(connected loc33 loc32)
		(connected loc32 loc33)
		(connected loc33 loc37)
		(connected loc37 loc33)
		(connected loc34 loc11)
		(connected loc11 loc34)
		(connected loc34 loc13)
		(connected loc13 loc34)
		(connected loc34 loc20)
		(connected loc20 loc34)
		(connected loc35 loc37)
		(connected loc37 loc35)
		(connected loc35 loc48)
		(connected loc48 loc35)
		(connected loc35 loc50)
		(connected loc50 loc35)
		(connected loc36 loc50)
		(connected loc50 loc36)
		(connected loc38 loc53)
		(connected loc53 loc38)
		(connected loc38 loc57)
		(connected loc57 loc38)
		(connected loc39 loc12)
		(connected loc12 loc39)
		(connected loc39 loc32)
		(connected loc32 loc39)
		(connected loc39 loc37)
		(connected loc37 loc39)
		(connected loc39 loc44)
		(connected loc44 loc39)
		(connected loc39 loc46)
		(connected loc46 loc39)
		(connected loc40 loc28)
		(connected loc28 loc40)
		(connected loc40 loc52)
		(connected loc52 loc40)
		(connected loc40 loc53)
		(connected loc53 loc40)
		(connected loc41 loc5)
		(connected loc5 loc41)
		(connected loc41 loc16)
		(connected loc16 loc41)
		(connected loc41 loc26)
		(connected loc26 loc41)
		(connected loc41 loc58)
		(connected loc58 loc41)
		(connected loc42 loc31)
		(connected loc31 loc42)
		(connected loc42 loc62)
		(connected loc62 loc42)
		(connected loc43 loc25)
		(connected loc25 loc43)
		(connected loc43 loc48)
		(connected loc48 loc43)
		(connected loc43 loc50)
		(connected loc50 loc43)
		(connected loc43 loc64)
		(connected loc64 loc43)
		(connected loc44 loc34)
		(connected loc34 loc44)
		(connected loc44 loc35)
		(connected loc35 loc44)
		(connected loc44 loc40)
		(connected loc40 loc44)
		(connected loc44 loc49)
		(connected loc49 loc44)
		(connected loc44 loc60)
		(connected loc60 loc44)
		(connected loc45 loc15)
		(connected loc15 loc45)
		(connected loc45 loc40)
		(connected loc40 loc45)
		(connected loc45 loc41)
		(connected loc41 loc45)
		(connected loc45 loc42)
		(connected loc42 loc45)
		(connected loc45 loc49)
		(connected loc49 loc45)
		(connected loc46 loc35)
		(connected loc35 loc46)
		(connected loc46 loc39)
		(connected loc39 loc46)
		(connected loc46 loc40)
		(connected loc40 loc46)
		(connected loc47 loc14)
		(connected loc14 loc47)
		(connected loc47 loc43)
		(connected loc43 loc47)
		(connected loc47 loc44)
		(connected loc44 loc47)
		(connected loc47 loc61)
		(connected loc61 loc47)
		(connected loc48 loc46)
		(connected loc46 loc48)
		(connected loc48 loc58)
		(connected loc58 loc48)
		(connected loc49 loc14)
		(connected loc14 loc49)
		(connected loc49 loc20)
		(connected loc20 loc49)
		(connected loc49 loc22)
		(connected loc22 loc49)
		(connected loc49 loc33)
		(connected loc33 loc49)
		(connected loc49 loc38)
		(connected loc38 loc49)
		(connected loc49 loc39)
		(connected loc39 loc49)
		(connected loc49 loc48)
		(connected loc48 loc49)
		(connected loc50 loc33)
		(connected loc33 loc50)
		(connected loc50 loc59)
		(connected loc59 loc50)
		(connected loc51 loc13)
		(connected loc13 loc51)
		(connected loc51 loc25)
		(connected loc25 loc51)
		(connected loc51 loc28)
		(connected loc28 loc51)
		(connected loc51 loc39)
		(connected loc39 loc51)
		(connected loc51 loc44)
		(connected loc44 loc51)
		(connected loc51 loc47)
		(connected loc47 loc51)
		(connected loc51 loc49)
		(connected loc49 loc51)
		(connected loc51 loc50)
		(connected loc50 loc51)
		(connected loc53 loc12)
		(connected loc12 loc53)
		(connected loc53 loc31)
		(connected loc31 loc53)
		(connected loc53 loc52)
		(connected loc52 loc53)
		(connected loc53 loc57)
		(connected loc57 loc53)
		(connected loc54 loc37)
		(connected loc37 loc54)
		(connected loc54 loc63)
		(connected loc63 loc54)
		(connected loc55 loc53)
		(connected loc53 loc55)
		(connected loc56 loc24)
		(connected loc24 loc56)
		(connected loc56 loc25)
		(connected loc25 loc56)
		(connected loc56 loc31)
		(connected loc31 loc56)
		(connected loc56 loc35)
		(connected loc35 loc56)
		(connected loc56 loc49)
		(connected loc49 loc56)
		(connected loc58 loc49)
		(connected loc49 loc58)
		(connected loc58 loc50)
		(connected loc50 loc58)
		(connected loc58 loc57)
		(connected loc57 loc58)
		(connected loc59 loc20)
		(connected loc20 loc59)
		(connected loc59 loc29)
		(connected loc29 loc59)
		(connected loc59 loc41)
		(connected loc41 loc59)
		(connected loc59 loc43)
		(connected loc43 loc59)
		(connected loc60 loc19)
		(connected loc19 loc60)
		(connected loc60 loc27)
		(connected loc27 loc60)
		(connected loc60 loc56)
		(connected loc56 loc60)
		(connected loc61 loc37)
		(connected loc37 loc61)
		(connected loc61 loc47)
		(connected loc47 loc61)
		(connected loc61 loc48)
		(connected loc48 loc61)
		(connected loc61 loc57)
		(connected loc57 loc61)
		(connected loc61 loc64)
		(connected loc64 loc61)
		(connected loc62 loc23)
		(connected loc23 loc62)
		(connected loc62 loc41)
		(connected loc41 loc62)
		(connected loc62 loc46)
		(connected loc46 loc62)
		(connected loc62 loc47)
		(connected loc47 loc62)
		(connected loc62 loc57)
		(connected loc57 loc62)
		(connected loc63 loc25)
		(connected loc25 loc63)
		(connected loc63 loc37)
		(connected loc37 loc63)
		(connected loc63 loc41)
		(connected loc41 loc63)
		(connected loc64 loc7)
		(connected loc7 loc64)
		(connected loc64 loc29)
		(connected loc29 loc64)
		(connected loc64 loc45)
		(connected loc45 loc64)
		(connected loc64 loc49)
		(connected loc49 loc64)
		(connected loc64 loc58)
		(connected loc58 loc64)
		(connected loc64 loc60)
		(connected loc60 loc64)

		(in bar3 loc3)
		(in bar4 loc4)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar11 loc11)
		(in bar12 loc12)
		(in bar15 loc15)
		(in bar17 loc17)
		(in bar18 loc18)
		(in bar21 loc21)
		(in bar22 loc22)
		(in bar24 loc24)
		(in bar26 loc26)
		(in bar27 loc27)
		(in bar30 loc30)
		(in bar33 loc33)
		(in bar34 loc34)
		(in bar35 loc35)
		(in bar41 loc41)
		(in bar43 loc43)
		(in bar46 loc46)
		(in bar48 loc48)
		(in bar53 loc53)
		(in bar54 loc54)
		(in bar55 loc55)
		(in bar56 loc56)
		(in bar58 loc58)
		(in bar61 loc61)

	)

	(:goal
		(and
			(at loc64)
		)
	)
	(:constraints
		(and
			(preference a1 (sometime (drunk)))
		)
	)
)