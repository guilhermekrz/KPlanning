; Generated by ProblemGenerator - Problem 17 at Mon Nov 28 15:07:21 BRST 2016
(define (problem pb17)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 loc65 loc66 loc67 - location
		bar1 bar5 bar6 bar9 bar10 bar11 bar15 bar16 bar18 bar21 bar22 bar24 bar25 bar27 bar30 bar32 bar34 bar37 bar38 bar43 bar44 bar45 bar49 bar50 bar52 bar55 bar56 bar59 bar60 bar61 bar64 bar65 bar66 - bar
	)
	(:init
		(at loc1)

		(connected loc29 loc37)
		(connected loc37 loc29)
		(connected loc37 loc36)
		(connected loc36 loc37)
		(connected loc36 loc45)
		(connected loc45 loc36)
		(connected loc45 loc16)
		(connected loc16 loc45)
		(connected loc16 loc59)
		(connected loc59 loc16)
		(connected loc59 loc25)
		(connected loc25 loc59)
		(connected loc25 loc13)
		(connected loc13 loc25)
		(connected loc13 loc64)
		(connected loc64 loc13)
		(connected loc36 loc57)
		(connected loc57 loc36)
		(connected loc57 loc5)
		(connected loc5 loc57)
		(connected loc5 loc66)
		(connected loc66 loc5)
		(connected loc66 loc7)
		(connected loc7 loc66)
		(connected loc7 loc11)
		(connected loc11 loc7)
		(connected loc11 loc54)
		(connected loc54 loc11)
		(connected loc54 loc62)
		(connected loc62 loc54)
		(connected loc13 loc46)
		(connected loc46 loc13)
		(connected loc46 loc51)
		(connected loc51 loc46)
		(connected loc51 loc34)
		(connected loc34 loc51)
		(connected loc16 loc17)
		(connected loc17 loc16)
		(connected loc17 loc43)
		(connected loc43 loc17)
		(connected loc11 loc52)
		(connected loc52 loc11)
		(connected loc51 loc6)
		(connected loc6 loc51)
		(connected loc6 loc56)
		(connected loc56 loc6)
		(connected loc56 loc53)
		(connected loc53 loc56)
		(connected loc36 loc9)
		(connected loc9 loc36)
		(connected loc9 loc40)
		(connected loc40 loc9)
		(connected loc40 loc60)
		(connected loc60 loc40)
		(connected loc60 loc27)
		(connected loc27 loc60)
		(connected loc27 loc18)
		(connected loc18 loc27)
		(connected loc18 loc21)
		(connected loc21 loc18)
		(connected loc17 loc50)
		(connected loc50 loc17)
		(connected loc50 loc2)
		(connected loc2 loc50)
		(connected loc2 loc55)
		(connected loc55 loc2)
		(connected loc52 loc12)
		(connected loc12 loc52)
		(connected loc12 loc1)
		(connected loc1 loc12)
		(connected loc1 loc14)
		(connected loc14 loc1)
		(connected loc14 loc26)
		(connected loc26 loc14)
		(connected loc36 loc67)
		(connected loc67 loc36)
		(connected loc67 loc15)
		(connected loc15 loc67)
		(connected loc6 loc31)
		(connected loc31 loc6)
		(connected loc31 loc8)
		(connected loc8 loc31)
		(connected loc7 loc65)
		(connected loc65 loc7)
		(connected loc8 loc58)
		(connected loc58 loc8)
		(connected loc58 loc38)
		(connected loc38 loc58)
		(connected loc38 loc61)
		(connected loc61 loc38)
		(connected loc61 loc48)
		(connected loc48 loc61)
		(connected loc57 loc41)
		(connected loc41 loc57)
		(connected loc18 loc24)
		(connected loc24 loc18)
		(connected loc2 loc10)
		(connected loc10 loc2)
		(connected loc38 loc49)
		(connected loc49 loc38)
		(connected loc49 loc33)
		(connected loc33 loc49)
		(connected loc33 loc42)
		(connected loc42 loc33)
		(connected loc60 loc39)
		(connected loc39 loc60)
		(connected loc39 loc63)
		(connected loc63 loc39)
		(connected loc55 loc19)
		(connected loc19 loc55)
		(connected loc53 loc32)
		(connected loc32 loc53)
		(connected loc53 loc4)
		(connected loc4 loc53)
		(connected loc24 loc28)
		(connected loc28 loc24)
		(connected loc54 loc22)
		(connected loc22 loc54)
		(connected loc55 loc44)
		(connected loc44 loc55)
		(connected loc22 loc23)
		(connected loc23 loc22)
		(connected loc56 loc35)
		(connected loc35 loc56)
		(connected loc19 loc20)
		(connected loc20 loc19)
		(connected loc66 loc30)
		(connected loc30 loc66)
		(connected loc13 loc3)
		(connected loc3 loc13)
		(connected loc13 loc47)
		(connected loc47 loc13)
		(connected loc1 loc18)
		(connected loc18 loc1)
		(connected loc2 loc9)
		(connected loc9 loc2)
		(connected loc3 loc16)
		(connected loc16 loc3)
		(connected loc3 loc19)
		(connected loc19 loc3)
		(connected loc3 loc35)
		(connected loc35 loc3)
		(connected loc3 loc41)
		(connected loc41 loc3)
		(connected loc4 loc1)
		(connected loc1 loc4)
		(connected loc4 loc6)
		(connected loc6 loc4)
		(connected loc4 loc37)
		(connected loc37 loc4)
		(connected loc4 loc45)
		(connected loc45 loc4)
		(connected loc4 loc51)
		(connected loc51 loc4)
		(connected loc5 loc7)
		(connected loc7 loc5)
		(connected loc5 loc12)
		(connected loc12 loc5)
		(connected loc5 loc17)
		(connected loc17 loc5)
		(connected loc6 loc10)
		(connected loc10 loc6)
		(connected loc6 loc18)
		(connected loc18 loc6)
		(connected loc6 loc43)
		(connected loc43 loc6)
		(connected loc6 loc58)
		(connected loc58 loc6)
		(connected loc7 loc1)
		(connected loc1 loc7)
		(connected loc7 loc10)
		(connected loc10 loc7)
		(connected loc7 loc30)
		(connected loc30 loc7)
		(connected loc8 loc1)
		(connected loc1 loc8)
		(connected loc8 loc6)
		(connected loc6 loc8)
		(connected loc8 loc18)
		(connected loc18 loc8)
		(connected loc8 loc21)
		(connected loc21 loc8)
		(connected loc8 loc27)
		(connected loc27 loc8)
		(connected loc9 loc7)
		(connected loc7 loc9)
		(connected loc9 loc11)
		(connected loc11 loc9)
		(connected loc9 loc13)
		(connected loc13 loc9)
		(connected loc9 loc20)
		(connected loc20 loc9)
		(connected loc9 loc26)
		(connected loc26 loc9)
		(connected loc9 loc28)
		(connected loc28 loc9)
		(connected loc9 loc34)
		(connected loc34 loc9)
		(connected loc10 loc14)
		(connected loc14 loc10)
		(connected loc10 loc26)
		(connected loc26 loc10)
		(connected loc10 loc30)
		(connected loc30 loc10)
		(connected loc11 loc21)
		(connected loc21 loc11)
		(connected loc11 loc26)
		(connected loc26 loc11)
		(connected loc11 loc27)
		(connected loc27 loc11)
		(connected loc11 loc39)
		(connected loc39 loc11)
		(connected loc11 loc58)
		(connected loc58 loc11)
		(connected loc12 loc10)
		(connected loc10 loc12)
		(connected loc12 loc25)
		(connected loc25 loc12)
		(connected loc12 loc26)
		(connected loc26 loc12)
		(connected loc12 loc29)
		(connected loc29 loc12)
		(connected loc13 loc7)
		(connected loc7 loc13)
		(connected loc13 loc11)
		(connected loc11 loc13)
		(connected loc13 loc31)
		(connected loc31 loc13)
		(connected loc13 loc58)
		(connected loc58 loc13)
		(connected loc14 loc5)
		(connected loc5 loc14)
		(connected loc14 loc21)
		(connected loc21 loc14)
		(connected loc14 loc22)
		(connected loc22 loc14)
		(connected loc14 loc23)
		(connected loc23 loc14)
		(connected loc14 loc25)
		(connected loc25 loc14)
		(connected loc14 loc27)
		(connected loc27 loc14)
		(connected loc14 loc31)
		(connected loc31 loc14)
		(connected loc14 loc35)
		(connected loc35 loc14)
		(connected loc14 loc36)
		(connected loc36 loc14)
		(connected loc14 loc42)
		(connected loc42 loc14)
		(connected loc14 loc46)
		(connected loc46 loc14)
		(connected loc14 loc47)
		(connected loc47 loc14)
		(connected loc15 loc2)
		(connected loc2 loc15)
		(connected loc15 loc5)
		(connected loc5 loc15)
		(connected loc15 loc19)
		(connected loc19 loc15)
		(connected loc15 loc56)
		(connected loc56 loc15)
		(connected loc16 loc9)
		(connected loc9 loc16)
		(connected loc16 loc35)
		(connected loc35 loc16)
		(connected loc17 loc1)
		(connected loc1 loc17)
		(connected loc17 loc2)
		(connected loc2 loc17)
		(connected loc17 loc19)
		(connected loc19 loc17)
		(connected loc17 loc57)
		(connected loc57 loc17)
		(connected loc18 loc16)
		(connected loc16 loc18)
		(connected loc18 loc28)
		(connected loc28 loc18)
		(connected loc18 loc51)
		(connected loc51 loc18)
		(connected loc18 loc54)
		(connected loc54 loc18)
		(connected loc19 loc21)
		(connected loc21 loc19)
		(connected loc19 loc64)
		(connected loc64 loc19)
		(connected loc20 loc7)
		(connected loc7 loc20)
		(connected loc20 loc35)
		(connected loc35 loc20)
		(connected loc20 loc39)
		(connected loc39 loc20)
		(connected loc21 loc2)
		(connected loc2 loc21)
		(connected loc21 loc3)
		(connected loc3 loc21)
		(connected loc21 loc17)
		(connected loc17 loc21)
		(connected loc21 loc26)
		(connected loc26 loc21)
		(connected loc21 loc38)
		(connected loc38 loc21)
		(connected loc22 loc17)
		(connected loc17 loc22)
		(connected loc22 loc25)
		(connected loc25 loc22)
		(connected loc22 loc27)
		(connected loc27 loc22)
		(connected loc22 loc36)
		(connected loc36 loc22)
		(connected loc22 loc40)
		(connected loc40 loc22)
		(connected loc23 loc13)
		(connected loc13 loc23)
		(connected loc23 loc15)
		(connected loc15 loc23)
		(connected loc23 loc24)
		(connected loc24 loc23)
		(connected loc23 loc33)
		(connected loc33 loc23)
		(connected loc23 loc39)
		(connected loc39 loc23)
		(connected loc23 loc60)
		(connected loc60 loc23)
		(connected loc24 loc6)
		(connected loc6 loc24)
		(connected loc24 loc8)
		(connected loc8 loc24)
		(connected loc24 loc11)
		(connected loc11 loc24)
		(connected loc25 loc8)
		(connected loc8 loc25)
		(connected loc25 loc46)
		(connected loc46 loc25)
		(connected loc25 loc53)
		(connected loc53 loc25)
		(connected loc26 loc11)
		(connected loc11 loc26)
		(connected loc26 loc16)
		(connected loc16 loc26)
		(connected loc26 loc32)
		(connected loc32 loc26)
		(connected loc26 loc38)
		(connected loc38 loc26)
		(connected loc26 loc43)
		(connected loc43 loc26)
		(connected loc26 loc46)
		(connected loc46 loc26)
		(connected loc26 loc52)
		(connected loc52 loc26)
		(connected loc27 loc25)
		(connected loc25 loc27)
		(connected loc27 loc30)
		(connected loc30 loc27)
		(connected loc27 loc31)
		(connected loc31 loc27)
		(connected loc27 loc36)
		(connected loc36 loc27)
		(connected loc27 loc39)
		(connected loc39 loc27)
		(connected loc28 loc7)
		(connected loc7 loc28)
		(connected loc28 loc26)
		(connected loc26 loc28)
		(connected loc28 loc43)
		(connected loc43 loc28)
		(connected loc28 loc47)
		(connected loc47 loc28)
		(connected loc28 loc50)
		(connected loc50 loc28)
		(connected loc28 loc57)
		(connected loc57 loc28)
		(connected loc29 loc9)
		(connected loc9 loc29)
		(connected loc29 loc20)
		(connected loc20 loc29)
		(connected loc29 loc23)
		(connected loc23 loc29)
		(connected loc29 loc24)
		(connected loc24 loc29)
		(connected loc29 loc30)
		(connected loc30 loc29)
		(connected loc29 loc33)
		(connected loc33 loc29)
		(connected loc29 loc55)
		(connected loc55 loc29)
		(connected loc29 loc56)
		(connected loc56 loc29)
		(connected loc30 loc11)
		(connected loc11 loc30)
		(connected loc30 loc38)
		(connected loc38 loc30)
		(connected loc30 loc40)
		(connected loc40 loc30)
		(connected loc30 loc42)
		(connected loc42 loc30)
		(connected loc30 loc66)
		(connected loc66 loc30)
		(connected loc31 loc3)
		(connected loc3 loc31)
		(connected loc31 loc6)
		(connected loc6 loc31)
		(connected loc31 loc14)
		(connected loc14 loc31)
		(connected loc31 loc36)
		(connected loc36 loc31)
		(connected loc32 loc1)
		(connected loc1 loc32)
		(connected loc32 loc10)
		(connected loc10 loc32)
		(connected loc32 loc15)
		(connected loc15 loc32)
		(connected loc32 loc16)
		(connected loc16 loc32)
		(connected loc32 loc21)
		(connected loc21 loc32)
		(connected loc32 loc36)
		(connected loc36 loc32)
		(connected loc32 loc41)
		(connected loc41 loc32)
		(connected loc32 loc61)
		(connected loc61 loc32)
		(connected loc33 loc12)
		(connected loc12 loc33)
		(connected loc33 loc15)
		(connected loc15 loc33)
		(connected loc33 loc24)
		(connected loc24 loc33)
		(connected loc33 loc25)
		(connected loc25 loc33)
		(connected loc33 loc26)
		(connected loc26 loc33)
		(connected loc33 loc36)
		(connected loc36 loc33)
		(connected loc33 loc48)
		(connected loc48 loc33)
		(connected loc33 loc50)
		(connected loc50 loc33)
		(connected loc33 loc52)
		(connected loc52 loc33)
		(connected loc33 loc56)
		(connected loc56 loc33)
		(connected loc34 loc7)
		(connected loc7 loc34)
		(connected loc34 loc16)
		(connected loc16 loc34)
		(connected loc34 loc17)
		(connected loc17 loc34)
		(connected loc34 loc22)
		(connected loc22 loc34)
		(connected loc34 loc26)
		(connected loc26 loc34)
		(connected loc34 loc28)
		(connected loc28 loc34)
		(connected loc34 loc33)
		(connected loc33 loc34)
		(connected loc34 loc36)
		(connected loc36 loc34)
		(connected loc34 loc45)
		(connected loc45 loc34)
		(connected loc35 loc4)
		(connected loc4 loc35)
		(connected loc35 loc20)
		(connected loc20 loc35)
		(connected loc35 loc30)
		(connected loc30 loc35)
		(connected loc35 loc36)
		(connected loc36 loc35)
		(connected loc35 loc38)
		(connected loc38 loc35)
		(connected loc35 loc39)
		(connected loc39 loc35)
		(connected loc35 loc50)
		(connected loc50 loc35)
		(connected loc35 loc63)
		(connected loc63 loc35)
		(connected loc36 loc12)
		(connected loc12 loc36)
		(connected loc36 loc19)
		(connected loc19 loc36)
		(connected loc36 loc31)
		(connected loc31 loc36)
		(connected loc36 loc50)
		(connected loc50 loc36)
		(connected loc37 loc21)
		(connected loc21 loc37)
		(connected loc37 loc22)
		(connected loc22 loc37)
		(connected loc37 loc23)
		(connected loc23 loc37)
		(connected loc37 loc40)
		(connected loc40 loc37)
		(connected loc37 loc43)
		(connected loc43 loc37)
		(connected loc37 loc50)
		(connected loc50 loc37)
		(connected loc37 loc58)
		(connected loc58 loc37)
		(connected loc38 loc17)
		(connected loc17 loc38)
		(connected loc38 loc41)
		(connected loc41 loc38)
		(connected loc38 loc47)
		(connected loc47 loc38)
		(connected loc39 loc35)
		(connected loc35 loc39)
		(connected loc39 loc38)
		(connected loc38 loc39)
		(connected loc39 loc40)
		(connected loc40 loc39)
		(connected loc39 loc42)
		(connected loc42 loc39)
		(connected loc39 loc44)
		(connected loc44 loc39)
		(connected loc39 loc46)
		(connected loc46 loc39)
		(connected loc39 loc57)
		(connected loc57 loc39)
		(connected loc39 loc58)
		(connected loc58 loc39)
		(connected loc39 loc59)
		(connected loc59 loc39)
		(connected loc40 loc6)
		(connected loc6 loc40)
		(connected loc40 loc22)
		(connected loc22 loc40)
		(connected loc40 loc23)
		(connected loc23 loc40)
		(connected loc40 loc30)
		(connected loc30 loc40)
		(connected loc40 loc45)
		(connected loc45 loc40)
		(connected loc41 loc2)
		(connected loc2 loc41)
		(connected loc41 loc6)
		(connected loc6 loc41)
		(connected loc41 loc26)
		(connected loc26 loc41)
		(connected loc41 loc27)
		(connected loc27 loc41)
		(connected loc41 loc34)
		(connected loc34 loc41)
		(connected loc42 loc28)
		(connected loc28 loc42)
		(connected loc42 loc39)
		(connected loc39 loc42)
		(connected loc42 loc47)
		(connected loc47 loc42)
		(connected loc43 loc27)
		(connected loc27 loc43)
		(connected loc43 loc54)
		(connected loc54 loc43)
		(connected loc43 loc56)
		(connected loc56 loc43)
		(connected loc43 loc61)
		(connected loc61 loc43)
		(connected loc44 loc22)
		(connected loc22 loc44)
		(connected loc44 loc33)
		(connected loc33 loc44)
		(connected loc44 loc40)
		(connected loc40 loc44)
		(connected loc44 loc63)
		(connected loc63 loc44)
		(connected loc45 loc13)
		(connected loc13 loc45)
		(connected loc45 loc32)
		(connected loc32 loc45)
		(connected loc45 loc34)
		(connected loc34 loc45)
		(connected loc45 loc48)
		(connected loc48 loc45)
		(connected loc45 loc49)
		(connected loc49 loc45)
		(connected loc45 loc53)
		(connected loc53 loc45)
		(connected loc45 loc60)
		(connected loc60 loc45)
		(connected loc46 loc35)
		(connected loc35 loc46)
		(connected loc46 loc60)
		(connected loc60 loc46)
		(connected loc46 loc64)
		(connected loc64 loc46)
		(connected loc47 loc31)
		(connected loc31 loc47)
		(connected loc47 loc33)
		(connected loc33 loc47)
		(connected loc47 loc37)
		(connected loc37 loc47)
		(connected loc47 loc62)
		(connected loc62 loc47)
		(connected loc47 loc67)
		(connected loc67 loc47)
		(connected loc48 loc6)
		(connected loc6 loc48)
		(connected loc48 loc30)
		(connected loc30 loc48)
		(connected loc48 loc54)
		(connected loc54 loc48)
		(connected loc48 loc56)
		(connected loc56 loc48)
		(connected loc48 loc65)
		(connected loc65 loc48)
		(connected loc49 loc21)
		(connected loc21 loc49)
		(connected loc49 loc38)
		(connected loc38 loc49)
		(connected loc49 loc41)
		(connected loc41 loc49)
		(connected loc49 loc58)
		(connected loc58 loc49)
		(connected loc49 loc61)
		(connected loc61 loc49)
		(connected loc50 loc32)
		(connected loc32 loc50)
		(connected loc50 loc37)
		(connected loc37 loc50)
		(connected loc50 loc38)
		(connected loc38 loc50)
		(connected loc50 loc40)
		(connected loc40 loc50)
		(connected loc50 loc62)
		(connected loc62 loc50)
		(connected loc51 loc9)
		(connected loc9 loc51)
		(connected loc51 loc66)
		(connected loc66 loc51)
		(connected loc52 loc24)
		(connected loc24 loc52)
		(connected loc52 loc26)
		(connected loc26 loc52)
		(connected loc52 loc39)
		(connected loc39 loc52)
		(connected loc52 loc47)
		(connected loc47 loc52)
		(connected loc52 loc50)
		(connected loc50 loc52)
		(connected loc52 loc54)
		(connected loc54 loc52)
		(connected loc54 loc29)
		(connected loc29 loc54)
		(connected loc54 loc35)
		(connected loc35 loc54)
		(connected loc54 loc36)
		(connected loc36 loc54)
		(connected loc54 loc47)
		(connected loc47 loc54)
		(connected loc54 loc63)
		(connected loc63 loc54)
		(connected loc55 loc33)
		(connected loc33 loc55)
		(connected loc55 loc47)
		(connected loc47 loc55)
		(connected loc55 loc50)
		(connected loc50 loc55)
		(connected loc55 loc58)
		(connected loc58 loc55)
		(connected loc55 loc61)
		(connected loc61 loc55)
		(connected loc56 loc1)
		(connected loc1 loc56)
		(connected loc56 loc30)
		(connected loc30 loc56)
		(connected loc56 loc39)
		(connected loc39 loc56)
		(connected loc56 loc52)
		(connected loc52 loc56)
		(connected loc56 loc65)
		(connected loc65 loc56)
		(connected loc57 loc44)
		(connected loc44 loc57)
		(connected loc57 loc61)
		(connected loc61 loc57)
		(connected loc57 loc65)
		(connected loc65 loc57)
		(connected loc58 loc40)
		(connected loc40 loc58)
		(connected loc58 loc43)
		(connected loc43 loc58)
		(connected loc59 loc20)
		(connected loc20 loc59)
		(connected loc59 loc32)
		(connected loc32 loc59)
		(connected loc59 loc57)
		(connected loc57 loc59)
		(connected loc60 loc2)
		(connected loc2 loc60)
		(connected loc60 loc36)
		(connected loc36 loc60)
		(connected loc60 loc40)
		(connected loc40 loc60)
		(connected loc60 loc50)
		(connected loc50 loc60)
		(connected loc61 loc16)
		(connected loc16 loc61)
		(connected loc61 loc51)
		(connected loc51 loc61)
		(connected loc61 loc56)
		(connected loc56 loc61)
		(connected loc62 loc9)
		(connected loc9 loc62)
		(connected loc62 loc10)
		(connected loc10 loc62)
		(connected loc64 loc55)
		(connected loc55 loc64)
		(connected loc64 loc65)
		(connected loc65 loc64)
		(connected loc65 loc48)
		(connected loc48 loc65)
		(connected loc65 loc58)
		(connected loc58 loc65)
		(connected loc65 loc64)
		(connected loc64 loc65)
		(connected loc67 loc14)
		(connected loc14 loc67)
		(connected loc67 loc62)
		(connected loc62 loc67)
		(connected loc67 loc63)
		(connected loc63 loc67)

		(in bar1 loc1)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar9 loc9)
		(in bar10 loc10)
		(in bar11 loc11)
		(in bar15 loc15)
		(in bar16 loc16)
		(in bar18 loc18)
		(in bar21 loc21)
		(in bar22 loc22)
		(in bar24 loc24)
		(in bar25 loc25)
		(in bar27 loc27)
		(in bar30 loc30)
		(in bar32 loc32)
		(in bar34 loc34)
		(in bar37 loc37)
		(in bar38 loc38)
		(in bar43 loc43)
		(in bar44 loc44)
		(in bar45 loc45)
		(in bar49 loc49)
		(in bar50 loc50)
		(in bar52 loc52)
		(in bar55 loc55)
		(in bar56 loc56)
		(in bar59 loc59)
		(in bar60 loc60)
		(in bar61 loc61)
		(in bar64 loc64)
		(in bar65 loc65)
		(in bar66 loc66)

	)

	(:goal
		(and
			(at loc67)
		)
	)
)