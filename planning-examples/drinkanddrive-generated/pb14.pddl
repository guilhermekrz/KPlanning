; Generated by ProblemGenerator - Problem 14 at Mon Nov 28 15:07:20 BRST 2016
(define (problem pb14)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 loc62 loc63 loc64 - location
		bar1 bar3 bar4 bar7 bar11 bar18 bar20 bar22 bar26 bar27 bar28 bar30 bar34 bar35 bar36 bar38 bar40 bar42 bar48 bar55 bar57 bar60 bar61 bar63 - bar
	)
	(:init
		(at loc1)

		(connected loc17 loc51)
		(connected loc51 loc17)
		(connected loc51 loc8)
		(connected loc8 loc51)
		(connected loc51 loc33)
		(connected loc33 loc51)
		(connected loc51 loc37)
		(connected loc37 loc51)
		(connected loc37 loc25)
		(connected loc25 loc37)
		(connected loc25 loc30)
		(connected loc30 loc25)
		(connected loc30 loc14)
		(connected loc14 loc30)
		(connected loc14 loc3)
		(connected loc3 loc14)
		(connected loc3 loc19)
		(connected loc19 loc3)
		(connected loc19 loc10)
		(connected loc10 loc19)
		(connected loc10 loc7)
		(connected loc7 loc10)
		(connected loc7 loc21)
		(connected loc21 loc7)
		(connected loc21 loc18)
		(connected loc18 loc21)
		(connected loc18 loc53)
		(connected loc53 loc18)
		(connected loc53 loc26)
		(connected loc26 loc53)
		(connected loc26 loc59)
		(connected loc59 loc26)
		(connected loc51 loc42)
		(connected loc42 loc51)
		(connected loc42 loc12)
		(connected loc12 loc42)
		(connected loc12 loc36)
		(connected loc36 loc12)
		(connected loc36 loc23)
		(connected loc23 loc36)
		(connected loc3 loc20)
		(connected loc20 loc3)
		(connected loc36 loc48)
		(connected loc48 loc36)
		(connected loc8 loc44)
		(connected loc44 loc8)
		(connected loc33 loc58)
		(connected loc58 loc33)
		(connected loc51 loc13)
		(connected loc13 loc51)
		(connected loc51 loc6)
		(connected loc6 loc51)
		(connected loc6 loc57)
		(connected loc57 loc6)
		(connected loc57 loc43)
		(connected loc43 loc57)
		(connected loc43 loc5)
		(connected loc5 loc43)
		(connected loc5 loc27)
		(connected loc27 loc5)
		(connected loc33 loc45)
		(connected loc45 loc33)
		(connected loc42 loc28)
		(connected loc28 loc42)
		(connected loc48 loc24)
		(connected loc24 loc48)
		(connected loc24 loc22)
		(connected loc22 loc24)
		(connected loc37 loc11)
		(connected loc11 loc37)
		(connected loc11 loc52)
		(connected loc52 loc11)
		(connected loc51 loc29)
		(connected loc29 loc51)
		(connected loc58 loc35)
		(connected loc35 loc58)
		(connected loc14 loc1)
		(connected loc1 loc14)
		(connected loc37 loc46)
		(connected loc46 loc37)
		(connected loc14 loc39)
		(connected loc39 loc14)
		(connected loc33 loc61)
		(connected loc61 loc33)
		(connected loc19 loc34)
		(connected loc34 loc19)
		(connected loc25 loc16)
		(connected loc16 loc25)
		(connected loc57 loc15)
		(connected loc15 loc57)
		(connected loc59 loc32)
		(connected loc32 loc59)
		(connected loc3 loc62)
		(connected loc62 loc3)
		(connected loc62 loc63)
		(connected loc63 loc62)
		(connected loc43 loc50)
		(connected loc50 loc43)
		(connected loc35 loc9)
		(connected loc9 loc35)
		(connected loc53 loc31)
		(connected loc31 loc53)
		(connected loc31 loc40)
		(connected loc40 loc31)
		(connected loc63 loc56)
		(connected loc56 loc63)
		(connected loc56 loc55)
		(connected loc55 loc56)
		(connected loc25 loc38)
		(connected loc38 loc25)
		(connected loc17 loc60)
		(connected loc60 loc17)
		(connected loc42 loc54)
		(connected loc54 loc42)
		(connected loc39 loc4)
		(connected loc4 loc39)
		(connected loc55 loc49)
		(connected loc49 loc55)
		(connected loc40 loc2)
		(connected loc2 loc40)
		(connected loc14 loc47)
		(connected loc47 loc14)
		(connected loc13 loc41)
		(connected loc41 loc13)
		(connected loc60 loc64)
		(connected loc64 loc60)
		(connected loc1 loc30)
		(connected loc30 loc1)
		(connected loc2 loc1)
		(connected loc1 loc2)
		(connected loc2 loc35)
		(connected loc35 loc2)
		(connected loc2 loc40)
		(connected loc40 loc2)
		(connected loc3 loc9)
		(connected loc9 loc3)
		(connected loc3 loc15)
		(connected loc15 loc3)
		(connected loc3 loc18)
		(connected loc18 loc3)
		(connected loc3 loc25)
		(connected loc25 loc3)
		(connected loc3 loc40)
		(connected loc40 loc3)
		(connected loc3 loc44)
		(connected loc44 loc3)
		(connected loc3 loc49)
		(connected loc49 loc3)
		(connected loc4 loc9)
		(connected loc9 loc4)
		(connected loc4 loc29)
		(connected loc29 loc4)
		(connected loc4 loc35)
		(connected loc35 loc4)
		(connected loc5 loc13)
		(connected loc13 loc5)
		(connected loc5 loc14)
		(connected loc14 loc5)
		(connected loc5 loc16)
		(connected loc16 loc5)
		(connected loc5 loc32)
		(connected loc32 loc5)
		(connected loc5 loc53)
		(connected loc53 loc5)
		(connected loc5 loc55)
		(connected loc55 loc5)
		(connected loc6 loc9)
		(connected loc9 loc6)
		(connected loc6 loc25)
		(connected loc25 loc6)
		(connected loc6 loc59)
		(connected loc59 loc6)
		(connected loc7 loc8)
		(connected loc8 loc7)
		(connected loc7 loc9)
		(connected loc9 loc7)
		(connected loc7 loc16)
		(connected loc16 loc7)
		(connected loc8 loc15)
		(connected loc15 loc8)
		(connected loc8 loc16)
		(connected loc16 loc8)
		(connected loc8 loc23)
		(connected loc23 loc8)
		(connected loc8 loc46)
		(connected loc46 loc8)
		(connected loc8 loc53)
		(connected loc53 loc8)
		(connected loc9 loc5)
		(connected loc5 loc9)
		(connected loc9 loc12)
		(connected loc12 loc9)
		(connected loc9 loc17)
		(connected loc17 loc9)
		(connected loc9 loc31)
		(connected loc31 loc9)
		(connected loc9 loc45)
		(connected loc45 loc9)
		(connected loc9 loc48)
		(connected loc48 loc9)
		(connected loc10 loc35)
		(connected loc35 loc10)
		(connected loc11 loc12)
		(connected loc12 loc11)
		(connected loc12 loc56)
		(connected loc56 loc12)
		(connected loc12 loc58)
		(connected loc58 loc12)
		(connected loc13 loc11)
		(connected loc11 loc13)
		(connected loc13 loc12)
		(connected loc12 loc13)
		(connected loc14 loc22)
		(connected loc22 loc14)
		(connected loc15 loc4)
		(connected loc4 loc15)
		(connected loc15 loc7)
		(connected loc7 loc15)
		(connected loc15 loc10)
		(connected loc10 loc15)
		(connected loc15 loc19)
		(connected loc19 loc15)
		(connected loc15 loc25)
		(connected loc25 loc15)
		(connected loc15 loc42)
		(connected loc42 loc15)
		(connected loc16 loc29)
		(connected loc29 loc16)
		(connected loc16 loc34)
		(connected loc34 loc16)
		(connected loc16 loc40)
		(connected loc40 loc16)
		(connected loc17 loc7)
		(connected loc7 loc17)
		(connected loc17 loc16)
		(connected loc16 loc17)
		(connected loc17 loc22)
		(connected loc22 loc17)
		(connected loc17 loc25)
		(connected loc25 loc17)
		(connected loc17 loc30)
		(connected loc30 loc17)
		(connected loc17 loc35)
		(connected loc35 loc17)
		(connected loc19 loc18)
		(connected loc18 loc19)
		(connected loc19 loc21)
		(connected loc21 loc19)
		(connected loc19 loc25)
		(connected loc25 loc19)
		(connected loc19 loc42)
		(connected loc42 loc19)
		(connected loc19 loc46)
		(connected loc46 loc19)
		(connected loc20 loc6)
		(connected loc6 loc20)
		(connected loc20 loc25)
		(connected loc25 loc20)
		(connected loc20 loc39)
		(connected loc39 loc20)
		(connected loc20 loc44)
		(connected loc44 loc20)
		(connected loc21 loc8)
		(connected loc8 loc21)
		(connected loc21 loc26)
		(connected loc26 loc21)
		(connected loc21 loc51)
		(connected loc51 loc21)
		(connected loc21 loc55)
		(connected loc55 loc21)
		(connected loc21 loc58)
		(connected loc58 loc21)
		(connected loc21 loc59)
		(connected loc59 loc21)
		(connected loc22 loc6)
		(connected loc6 loc22)
		(connected loc22 loc8)
		(connected loc8 loc22)
		(connected loc22 loc10)
		(connected loc10 loc22)
		(connected loc22 loc19)
		(connected loc19 loc22)
		(connected loc22 loc23)
		(connected loc23 loc22)
		(connected loc22 loc38)
		(connected loc38 loc22)
		(connected loc22 loc46)
		(connected loc46 loc22)
		(connected loc23 loc7)
		(connected loc7 loc23)
		(connected loc23 loc13)
		(connected loc13 loc23)
		(connected loc23 loc24)
		(connected loc24 loc23)
		(connected loc23 loc32)
		(connected loc32 loc23)
		(connected loc23 loc33)
		(connected loc33 loc23)
		(connected loc23 loc39)
		(connected loc39 loc23)
		(connected loc23 loc41)
		(connected loc41 loc23)
		(connected loc23 loc55)
		(connected loc55 loc23)
		(connected loc24 loc5)
		(connected loc5 loc24)
		(connected loc24 loc32)
		(connected loc32 loc24)
		(connected loc24 loc41)
		(connected loc41 loc24)
		(connected loc25 loc13)
		(connected loc13 loc25)
		(connected loc25 loc29)
		(connected loc29 loc25)
		(connected loc26 loc1)
		(connected loc1 loc26)
		(connected loc26 loc4)
		(connected loc4 loc26)
		(connected loc26 loc17)
		(connected loc17 loc26)
		(connected loc26 loc49)
		(connected loc49 loc26)
		(connected loc27 loc38)
		(connected loc38 loc27)
		(connected loc27 loc53)
		(connected loc53 loc27)
		(connected loc28 loc12)
		(connected loc12 loc28)
		(connected loc28 loc19)
		(connected loc19 loc28)
		(connected loc28 loc36)
		(connected loc36 loc28)
		(connected loc28 loc38)
		(connected loc38 loc28)
		(connected loc28 loc39)
		(connected loc39 loc28)
		(connected loc28 loc52)
		(connected loc52 loc28)
		(connected loc28 loc53)
		(connected loc53 loc28)
		(connected loc29 loc3)
		(connected loc3 loc29)
		(connected loc29 loc10)
		(connected loc10 loc29)
		(connected loc29 loc27)
		(connected loc27 loc29)
		(connected loc29 loc32)
		(connected loc32 loc29)
		(connected loc29 loc34)
		(connected loc34 loc29)
		(connected loc29 loc51)
		(connected loc51 loc29)
		(connected loc29 loc63)
		(connected loc63 loc29)
		(connected loc31 loc43)
		(connected loc43 loc31)
		(connected loc31 loc44)
		(connected loc44 loc31)
		(connected loc31 loc53)
		(connected loc53 loc31)
		(connected loc32 loc2)
		(connected loc2 loc32)
		(connected loc32 loc15)
		(connected loc15 loc32)
		(connected loc32 loc27)
		(connected loc27 loc32)
		(connected loc32 loc51)
		(connected loc51 loc32)
		(connected loc32 loc54)
		(connected loc54 loc32)
		(connected loc32 loc63)
		(connected loc63 loc32)
		(connected loc33 loc8)
		(connected loc8 loc33)
		(connected loc33 loc18)
		(connected loc18 loc33)
		(connected loc33 loc19)
		(connected loc19 loc33)
		(connected loc33 loc28)
		(connected loc28 loc33)
		(connected loc33 loc32)
		(connected loc32 loc33)
		(connected loc33 loc42)
		(connected loc42 loc33)
		(connected loc33 loc55)
		(connected loc55 loc33)
		(connected loc33 loc64)
		(connected loc64 loc33)
		(connected loc34 loc4)
		(connected loc4 loc34)
		(connected loc34 loc5)
		(connected loc5 loc34)
		(connected loc34 loc7)
		(connected loc7 loc34)
		(connected loc34 loc13)
		(connected loc13 loc34)
		(connected loc35 loc22)
		(connected loc22 loc35)
		(connected loc35 loc27)
		(connected loc27 loc35)
		(connected loc35 loc33)
		(connected loc33 loc35)
		(connected loc35 loc38)
		(connected loc38 loc35)
		(connected loc35 loc48)
		(connected loc48 loc35)
		(connected loc35 loc57)
		(connected loc57 loc35)
		(connected loc36 loc15)
		(connected loc15 loc36)
		(connected loc36 loc33)
		(connected loc33 loc36)
		(connected loc36 loc34)
		(connected loc34 loc36)
		(connected loc36 loc43)
		(connected loc43 loc36)
		(connected loc36 loc50)
		(connected loc50 loc36)
		(connected loc36 loc52)
		(connected loc52 loc36)
		(connected loc36 loc55)
		(connected loc55 loc36)
		(connected loc36 loc56)
		(connected loc56 loc36)
		(connected loc36 loc57)
		(connected loc57 loc36)
		(connected loc36 loc59)
		(connected loc59 loc36)
		(connected loc37 loc4)
		(connected loc4 loc37)
		(connected loc37 loc26)
		(connected loc26 loc37)
		(connected loc37 loc32)
		(connected loc32 loc37)
		(connected loc37 loc39)
		(connected loc39 loc37)
		(connected loc38 loc12)
		(connected loc12 loc38)
		(connected loc38 loc42)
		(connected loc42 loc38)
		(connected loc38 loc49)
		(connected loc49 loc38)
		(connected loc38 loc61)
		(connected loc61 loc38)
		(connected loc39 loc53)
		(connected loc53 loc39)
		(connected loc40 loc24)
		(connected loc24 loc40)
		(connected loc40 loc27)
		(connected loc27 loc40)
		(connected loc40 loc58)
		(connected loc58 loc40)
		(connected loc41 loc4)
		(connected loc4 loc41)
		(connected loc41 loc13)
		(connected loc13 loc41)
		(connected loc41 loc28)
		(connected loc28 loc41)
		(connected loc41 loc32)
		(connected loc32 loc41)
		(connected loc41 loc37)
		(connected loc37 loc41)
		(connected loc41 loc55)
		(connected loc55 loc41)
		(connected loc42 loc3)
		(connected loc3 loc42)
		(connected loc42 loc24)
		(connected loc24 loc42)
		(connected loc42 loc30)
		(connected loc30 loc42)
		(connected loc42 loc43)
		(connected loc43 loc42)
		(connected loc42 loc55)
		(connected loc55 loc42)
		(connected loc42 loc56)
		(connected loc56 loc42)
		(connected loc42 loc62)
		(connected loc62 loc42)
		(connected loc43 loc9)
		(connected loc9 loc43)
		(connected loc43 loc29)
		(connected loc29 loc43)
		(connected loc43 loc46)
		(connected loc46 loc43)
		(connected loc43 loc57)
		(connected loc57 loc43)
		(connected loc44 loc9)
		(connected loc9 loc44)
		(connected loc44 loc16)
		(connected loc16 loc44)
		(connected loc44 loc31)
		(connected loc31 loc44)
		(connected loc44 loc36)
		(connected loc36 loc44)
		(connected loc44 loc41)
		(connected loc41 loc44)
		(connected loc44 loc48)
		(connected loc48 loc44)
		(connected loc44 loc51)
		(connected loc51 loc44)
		(connected loc44 loc54)
		(connected loc54 loc44)
		(connected loc44 loc61)
		(connected loc61 loc44)
		(connected loc45 loc8)
		(connected loc8 loc45)
		(connected loc45 loc48)
		(connected loc48 loc45)
		(connected loc45 loc59)
		(connected loc59 loc45)
		(connected loc46 loc18)
		(connected loc18 loc46)
		(connected loc46 loc52)
		(connected loc52 loc46)
		(connected loc47 loc11)
		(connected loc11 loc47)
		(connected loc47 loc12)
		(connected loc12 loc47)
		(connected loc47 loc40)
		(connected loc40 loc47)
		(connected loc47 loc51)
		(connected loc51 loc47)
		(connected loc48 loc34)
		(connected loc34 loc48)
		(connected loc48 loc43)
		(connected loc43 loc48)
		(connected loc48 loc49)
		(connected loc49 loc48)
		(connected loc48 loc53)
		(connected loc53 loc48)
		(connected loc49 loc30)
		(connected loc30 loc49)
		(connected loc49 loc40)
		(connected loc40 loc49)
		(connected loc49 loc58)
		(connected loc58 loc49)
		(connected loc49 loc64)
		(connected loc64 loc49)
		(connected loc50 loc11)
		(connected loc11 loc50)
		(connected loc50 loc14)
		(connected loc14 loc50)
		(connected loc50 loc26)
		(connected loc26 loc50)
		(connected loc50 loc47)
		(connected loc47 loc50)
		(connected loc50 loc52)
		(connected loc52 loc50)
		(connected loc50 loc58)
		(connected loc58 loc50)
		(connected loc51 loc5)
		(connected loc5 loc51)
		(connected loc51 loc24)
		(connected loc24 loc51)
		(connected loc51 loc45)
		(connected loc45 loc51)
		(connected loc51 loc47)
		(connected loc47 loc51)
		(connected loc51 loc56)
		(connected loc56 loc51)
		(connected loc52 loc7)
		(connected loc7 loc52)
		(connected loc52 loc33)
		(connected loc33 loc52)
		(connected loc52 loc50)
		(connected loc50 loc52)
		(connected loc52 loc60)
		(connected loc60 loc52)
		(connected loc52 loc63)
		(connected loc63 loc52)
		(connected loc53 loc4)
		(connected loc4 loc53)
		(connected loc53 loc54)
		(connected loc54 loc53)
		(connected loc54 loc9)
		(connected loc9 loc54)
		(connected loc54 loc17)
		(connected loc17 loc54)
		(connected loc54 loc25)
		(connected loc25 loc54)
		(connected loc54 loc32)
		(connected loc32 loc54)
		(connected loc54 loc43)
		(connected loc43 loc54)
		(connected loc54 loc61)
		(connected loc61 loc54)
		(connected loc55 loc6)
		(connected loc6 loc55)
		(connected loc55 loc8)
		(connected loc8 loc55)
		(connected loc55 loc11)
		(connected loc11 loc55)
		(connected loc55 loc14)
		(connected loc14 loc55)
		(connected loc57 loc3)
		(connected loc3 loc57)
		(connected loc57 loc40)
		(connected loc40 loc57)
		(connected loc57 loc50)
		(connected loc50 loc57)
		(connected loc58 loc18)
		(connected loc18 loc58)
		(connected loc58 loc44)
		(connected loc44 loc58)
		(connected loc58 loc45)
		(connected loc45 loc58)
		(connected loc58 loc47)
		(connected loc47 loc58)
		(connected loc59 loc13)
		(connected loc13 loc59)
		(connected loc59 loc37)
		(connected loc37 loc59)
		(connected loc59 loc41)
		(connected loc41 loc59)
		(connected loc59 loc46)
		(connected loc46 loc59)
		(connected loc59 loc48)
		(connected loc48 loc59)
		(connected loc59 loc58)
		(connected loc58 loc59)
		(connected loc60 loc11)
		(connected loc11 loc60)
		(connected loc60 loc31)
		(connected loc31 loc60)
		(connected loc60 loc57)
		(connected loc57 loc60)
		(connected loc61 loc7)
		(connected loc7 loc61)
		(connected loc61 loc39)
		(connected loc39 loc61)
		(connected loc62 loc31)
		(connected loc31 loc62)
		(connected loc62 loc41)
		(connected loc41 loc62)
		(connected loc62 loc42)
		(connected loc42 loc62)
		(connected loc62 loc52)
		(connected loc52 loc62)
		(connected loc64 loc27)
		(connected loc27 loc64)

		(in bar1 loc1)
		(in bar3 loc3)
		(in bar4 loc4)
		(in bar7 loc7)
		(in bar11 loc11)
		(in bar18 loc18)
		(in bar20 loc20)
		(in bar22 loc22)
		(in bar26 loc26)
		(in bar27 loc27)
		(in bar28 loc28)
		(in bar30 loc30)
		(in bar34 loc34)
		(in bar35 loc35)
		(in bar36 loc36)
		(in bar38 loc38)
		(in bar40 loc40)
		(in bar42 loc42)
		(in bar48 loc48)
		(in bar55 loc55)
		(in bar57 loc57)
		(in bar60 loc60)
		(in bar61 loc61)
		(in bar63 loc63)

	)

	(:goal
		(and
			(at loc64)
		)
	)
)