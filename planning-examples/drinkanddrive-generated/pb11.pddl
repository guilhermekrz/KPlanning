; Generated by ProblemGenerator - Problem 11 at Mon Nov 28 15:07:20 BRST 2016
(define (problem pb11)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 loc8 loc9 loc10 loc11 loc12 loc13 loc14 loc15 loc16 loc17 loc18 loc19 loc20 loc21 loc22 loc23 loc24 loc25 loc26 loc27 loc28 loc29 loc30 loc31 loc32 loc33 loc34 loc35 loc36 loc37 loc38 loc39 loc40 loc41 loc42 loc43 loc44 loc45 loc46 loc47 loc48 loc49 loc50 loc51 loc52 loc53 loc54 loc55 loc56 loc57 loc58 loc59 loc60 loc61 - location
		bar2 bar3 bar4 bar6 bar8 bar9 bar10 bar16 bar20 bar22 bar23 bar25 bar29 bar30 bar31 bar33 bar39 bar42 bar43 bar45 bar47 bar50 bar51 bar54 bar55 bar56 bar58 - bar
	)
	(:init
		(at loc1)

		(connected loc24 loc56)
		(connected loc56 loc24)
		(connected loc56 loc57)
		(connected loc57 loc56)
		(connected loc57 loc11)
		(connected loc11 loc57)
		(connected loc11 loc36)
		(connected loc36 loc11)
		(connected loc36 loc23)
		(connected loc23 loc36)
		(connected loc23 loc4)
		(connected loc4 loc23)
		(connected loc4 loc21)
		(connected loc21 loc4)
		(connected loc21 loc30)
		(connected loc30 loc21)
		(connected loc30 loc16)
		(connected loc16 loc30)
		(connected loc16 loc50)
		(connected loc50 loc16)
		(connected loc50 loc18)
		(connected loc18 loc50)
		(connected loc18 loc44)
		(connected loc44 loc18)
		(connected loc44 loc14)
		(connected loc14 loc44)
		(connected loc14 loc59)
		(connected loc59 loc14)
		(connected loc59 loc61)
		(connected loc61 loc59)
		(connected loc44 loc52)
		(connected loc52 loc44)
		(connected loc52 loc51)
		(connected loc51 loc52)
		(connected loc51 loc55)
		(connected loc55 loc51)
		(connected loc55 loc48)
		(connected loc48 loc55)
		(connected loc48 loc17)
		(connected loc17 loc48)
		(connected loc17 loc5)
		(connected loc5 loc17)
		(connected loc17 loc35)
		(connected loc35 loc17)
		(connected loc18 loc60)
		(connected loc60 loc18)
		(connected loc60 loc26)
		(connected loc26 loc60)
		(connected loc59 loc45)
		(connected loc45 loc59)
		(connected loc45 loc3)
		(connected loc3 loc45)
		(connected loc3 loc22)
		(connected loc22 loc3)
		(connected loc5 loc25)
		(connected loc25 loc5)
		(connected loc25 loc47)
		(connected loc47 loc25)
		(connected loc57 loc20)
		(connected loc20 loc57)
		(connected loc52 loc2)
		(connected loc2 loc52)
		(connected loc2 loc33)
		(connected loc33 loc2)
		(connected loc33 loc40)
		(connected loc40 loc33)
		(connected loc40 loc6)
		(connected loc6 loc40)
		(connected loc47 loc15)
		(connected loc15 loc47)
		(connected loc15 loc1)
		(connected loc1 loc15)
		(connected loc59 loc37)
		(connected loc37 loc59)
		(connected loc37 loc34)
		(connected loc34 loc37)
		(connected loc34 loc9)
		(connected loc9 loc34)
		(connected loc9 loc42)
		(connected loc42 loc9)
		(connected loc22 loc32)
		(connected loc32 loc22)
		(connected loc37 loc46)
		(connected loc46 loc37)
		(connected loc46 loc27)
		(connected loc27 loc46)
		(connected loc26 loc41)
		(connected loc41 loc26)
		(connected loc6 loc54)
		(connected loc54 loc6)
		(connected loc54 loc8)
		(connected loc8 loc54)
		(connected loc50 loc38)
		(connected loc38 loc50)
		(connected loc25 loc13)
		(connected loc13 loc25)
		(connected loc18 loc29)
		(connected loc29 loc18)
		(connected loc47 loc12)
		(connected loc12 loc47)
		(connected loc30 loc53)
		(connected loc53 loc30)
		(connected loc8 loc43)
		(connected loc43 loc8)
		(connected loc2 loc28)
		(connected loc28 loc2)
		(connected loc9 loc49)
		(connected loc49 loc9)
		(connected loc46 loc58)
		(connected loc58 loc46)
		(connected loc58 loc31)
		(connected loc31 loc58)
		(connected loc48 loc19)
		(connected loc19 loc48)
		(connected loc46 loc7)
		(connected loc7 loc46)
		(connected loc19 loc39)
		(connected loc39 loc19)
		(connected loc7 loc10)
		(connected loc10 loc7)
		(connected loc1 loc6)
		(connected loc6 loc1)
		(connected loc1 loc8)
		(connected loc8 loc1)
		(connected loc1 loc23)
		(connected loc23 loc1)
		(connected loc1 loc41)
		(connected loc41 loc1)
		(connected loc1 loc53)
		(connected loc53 loc1)
		(connected loc2 loc46)
		(connected loc46 loc2)
		(connected loc3 loc24)
		(connected loc24 loc3)
		(connected loc4 loc2)
		(connected loc2 loc4)
		(connected loc4 loc7)
		(connected loc7 loc4)
		(connected loc4 loc11)
		(connected loc11 loc4)
		(connected loc4 loc38)
		(connected loc38 loc4)
		(connected loc5 loc7)
		(connected loc7 loc5)
		(connected loc5 loc13)
		(connected loc13 loc5)
		(connected loc5 loc31)
		(connected loc31 loc5)
		(connected loc5 loc37)
		(connected loc37 loc5)
		(connected loc6 loc1)
		(connected loc1 loc6)
		(connected loc6 loc13)
		(connected loc13 loc6)
		(connected loc6 loc22)
		(connected loc22 loc6)
		(connected loc7 loc4)
		(connected loc4 loc7)
		(connected loc7 loc6)
		(connected loc6 loc7)
		(connected loc7 loc12)
		(connected loc12 loc7)
		(connected loc7 loc30)
		(connected loc30 loc7)
		(connected loc8 loc4)
		(connected loc4 loc8)
		(connected loc8 loc15)
		(connected loc15 loc8)
		(connected loc8 loc16)
		(connected loc16 loc8)
		(connected loc9 loc2)
		(connected loc2 loc9)
		(connected loc9 loc11)
		(connected loc11 loc9)
		(connected loc9 loc31)
		(connected loc31 loc9)
		(connected loc9 loc39)
		(connected loc39 loc9)
		(connected loc9 loc51)
		(connected loc51 loc9)
		(connected loc10 loc8)
		(connected loc8 loc10)
		(connected loc10 loc13)
		(connected loc13 loc10)
		(connected loc10 loc17)
		(connected loc17 loc10)
		(connected loc10 loc27)
		(connected loc27 loc10)
		(connected loc10 loc41)
		(connected loc41 loc10)
		(connected loc10 loc45)
		(connected loc45 loc10)
		(connected loc10 loc54)
		(connected loc54 loc10)
		(connected loc11 loc13)
		(connected loc13 loc11)
		(connected loc11 loc19)
		(connected loc19 loc11)
		(connected loc11 loc23)
		(connected loc23 loc11)
		(connected loc11 loc33)
		(connected loc33 loc11)
		(connected loc11 loc55)
		(connected loc55 loc11)
		(connected loc12 loc10)
		(connected loc10 loc12)
		(connected loc12 loc11)
		(connected loc11 loc12)
		(connected loc12 loc15)
		(connected loc15 loc12)
		(connected loc12 loc17)
		(connected loc17 loc12)
		(connected loc12 loc20)
		(connected loc20 loc12)
		(connected loc12 loc25)
		(connected loc25 loc12)
		(connected loc12 loc38)
		(connected loc38 loc12)
		(connected loc13 loc23)
		(connected loc23 loc13)
		(connected loc13 loc43)
		(connected loc43 loc13)
		(connected loc13 loc53)
		(connected loc53 loc13)
		(connected loc14 loc4)
		(connected loc4 loc14)
		(connected loc14 loc9)
		(connected loc9 loc14)
		(connected loc14 loc23)
		(connected loc23 loc14)
		(connected loc14 loc25)
		(connected loc25 loc14)
		(connected loc15 loc9)
		(connected loc9 loc15)
		(connected loc15 loc17)
		(connected loc17 loc15)
		(connected loc15 loc23)
		(connected loc23 loc15)
		(connected loc15 loc25)
		(connected loc25 loc15)
		(connected loc15 loc30)
		(connected loc30 loc15)
		(connected loc16 loc4)
		(connected loc4 loc16)
		(connected loc16 loc15)
		(connected loc15 loc16)
		(connected loc16 loc17)
		(connected loc17 loc16)
		(connected loc17 loc14)
		(connected loc14 loc17)
		(connected loc17 loc59)
		(connected loc59 loc17)
		(connected loc18 loc3)
		(connected loc3 loc18)
		(connected loc18 loc7)
		(connected loc7 loc18)
		(connected loc18 loc9)
		(connected loc9 loc18)
		(connected loc18 loc11)
		(connected loc11 loc18)
		(connected loc18 loc21)
		(connected loc21 loc18)
		(connected loc18 loc46)
		(connected loc46 loc18)
		(connected loc19 loc18)
		(connected loc18 loc19)
		(connected loc19 loc30)
		(connected loc30 loc19)
		(connected loc19 loc33)
		(connected loc33 loc19)
		(connected loc20 loc5)
		(connected loc5 loc20)
		(connected loc20 loc21)
		(connected loc21 loc20)
		(connected loc21 loc5)
		(connected loc5 loc21)
		(connected loc21 loc20)
		(connected loc20 loc21)
		(connected loc21 loc28)
		(connected loc28 loc21)
		(connected loc22 loc7)
		(connected loc7 loc22)
		(connected loc22 loc16)
		(connected loc16 loc22)
		(connected loc22 loc28)
		(connected loc28 loc22)
		(connected loc22 loc49)
		(connected loc49 loc22)
		(connected loc22 loc58)
		(connected loc58 loc22)
		(connected loc23 loc8)
		(connected loc8 loc23)
		(connected loc23 loc15)
		(connected loc15 loc23)
		(connected loc23 loc19)
		(connected loc19 loc23)
		(connected loc23 loc26)
		(connected loc26 loc23)
		(connected loc23 loc40)
		(connected loc40 loc23)
		(connected loc23 loc53)
		(connected loc53 loc23)
		(connected loc24 loc18)
		(connected loc18 loc24)
		(connected loc24 loc23)
		(connected loc23 loc24)
		(connected loc24 loc33)
		(connected loc33 loc24)
		(connected loc25 loc17)
		(connected loc17 loc25)
		(connected loc25 loc27)
		(connected loc27 loc25)
		(connected loc25 loc31)
		(connected loc31 loc25)
		(connected loc25 loc36)
		(connected loc36 loc25)
		(connected loc25 loc39)
		(connected loc39 loc25)
		(connected loc25 loc59)
		(connected loc59 loc25)
		(connected loc26 loc5)
		(connected loc5 loc26)
		(connected loc26 loc16)
		(connected loc16 loc26)
		(connected loc26 loc36)
		(connected loc36 loc26)
		(connected loc26 loc38)
		(connected loc38 loc26)
		(connected loc27 loc2)
		(connected loc2 loc27)
		(connected loc27 loc6)
		(connected loc6 loc27)
		(connected loc27 loc23)
		(connected loc23 loc27)
		(connected loc27 loc26)
		(connected loc26 loc27)
		(connected loc28 loc5)
		(connected loc5 loc28)
		(connected loc28 loc15)
		(connected loc15 loc28)
		(connected loc28 loc47)
		(connected loc47 loc28)
		(connected loc28 loc50)
		(connected loc50 loc28)
		(connected loc28 loc53)
		(connected loc53 loc28)
		(connected loc28 loc56)
		(connected loc56 loc28)
		(connected loc29 loc11)
		(connected loc11 loc29)
		(connected loc29 loc13)
		(connected loc13 loc29)
		(connected loc29 loc24)
		(connected loc24 loc29)
		(connected loc29 loc26)
		(connected loc26 loc29)
		(connected loc29 loc30)
		(connected loc30 loc29)
		(connected loc29 loc32)
		(connected loc32 loc29)
		(connected loc29 loc46)
		(connected loc46 loc29)
		(connected loc29 loc47)
		(connected loc47 loc29)
		(connected loc29 loc56)
		(connected loc56 loc29)
		(connected loc30 loc35)
		(connected loc35 loc30)
		(connected loc30 loc43)
		(connected loc43 loc30)
		(connected loc30 loc48)
		(connected loc48 loc30)
		(connected loc31 loc24)
		(connected loc24 loc31)
		(connected loc31 loc28)
		(connected loc28 loc31)
		(connected loc31 loc34)
		(connected loc34 loc31)
		(connected loc31 loc44)
		(connected loc44 loc31)
		(connected loc32 loc12)
		(connected loc12 loc32)
		(connected loc32 loc19)
		(connected loc19 loc32)
		(connected loc32 loc50)
		(connected loc50 loc32)
		(connected loc32 loc58)
		(connected loc58 loc32)
		(connected loc33 loc12)
		(connected loc12 loc33)
		(connected loc33 loc21)
		(connected loc21 loc33)
		(connected loc33 loc48)
		(connected loc48 loc33)
		(connected loc33 loc49)
		(connected loc49 loc33)
		(connected loc34 loc4)
		(connected loc4 loc34)
		(connected loc34 loc10)
		(connected loc10 loc34)
		(connected loc34 loc15)
		(connected loc15 loc34)
		(connected loc34 loc21)
		(connected loc21 loc34)
		(connected loc34 loc36)
		(connected loc36 loc34)
		(connected loc34 loc43)
		(connected loc43 loc34)
		(connected loc34 loc53)
		(connected loc53 loc34)
		(connected loc35 loc1)
		(connected loc1 loc35)
		(connected loc35 loc10)
		(connected loc10 loc35)
		(connected loc35 loc14)
		(connected loc14 loc35)
		(connected loc35 loc18)
		(connected loc18 loc35)
		(connected loc35 loc22)
		(connected loc22 loc35)
		(connected loc35 loc26)
		(connected loc26 loc35)
		(connected loc35 loc27)
		(connected loc27 loc35)
		(connected loc35 loc34)
		(connected loc34 loc35)
		(connected loc35 loc36)
		(connected loc36 loc35)
		(connected loc35 loc42)
		(connected loc42 loc35)
		(connected loc36 loc16)
		(connected loc16 loc36)
		(connected loc36 loc20)
		(connected loc20 loc36)
		(connected loc36 loc32)
		(connected loc32 loc36)
		(connected loc36 loc38)
		(connected loc38 loc36)
		(connected loc36 loc45)
		(connected loc45 loc36)
		(connected loc36 loc52)
		(connected loc52 loc36)
		(connected loc36 loc54)
		(connected loc54 loc36)
		(connected loc37 loc3)
		(connected loc3 loc37)
		(connected loc38 loc9)
		(connected loc9 loc38)
		(connected loc38 loc33)
		(connected loc33 loc38)
		(connected loc38 loc36)
		(connected loc36 loc38)
		(connected loc38 loc42)
		(connected loc42 loc38)
		(connected loc39 loc29)
		(connected loc29 loc39)
		(connected loc39 loc32)
		(connected loc32 loc39)
		(connected loc39 loc35)
		(connected loc35 loc39)
		(connected loc40 loc49)
		(connected loc49 loc40)
		(connected loc40 loc50)
		(connected loc50 loc40)
		(connected loc40 loc59)
		(connected loc59 loc40)
		(connected loc41 loc20)
		(connected loc20 loc41)
		(connected loc41 loc37)
		(connected loc37 loc41)
		(connected loc41 loc39)
		(connected loc39 loc41)
		(connected loc41 loc48)
		(connected loc48 loc41)
		(connected loc41 loc57)
		(connected loc57 loc41)
		(connected loc42 loc8)
		(connected loc8 loc42)
		(connected loc42 loc11)
		(connected loc11 loc42)
		(connected loc42 loc29)
		(connected loc29 loc42)
		(connected loc42 loc32)
		(connected loc32 loc42)
		(connected loc42 loc44)
		(connected loc44 loc42)
		(connected loc42 loc61)
		(connected loc61 loc42)
		(connected loc43 loc6)
		(connected loc6 loc43)
		(connected loc43 loc13)
		(connected loc13 loc43)
		(connected loc43 loc39)
		(connected loc39 loc43)
		(connected loc43 loc51)
		(connected loc51 loc43)
		(connected loc43 loc55)
		(connected loc55 loc43)
		(connected loc44 loc2)
		(connected loc2 loc44)
		(connected loc44 loc16)
		(connected loc16 loc44)
		(connected loc44 loc31)
		(connected loc31 loc44)
		(connected loc44 loc32)
		(connected loc32 loc44)
		(connected loc44 loc34)
		(connected loc34 loc44)
		(connected loc44 loc39)
		(connected loc39 loc44)
		(connected loc44 loc42)
		(connected loc42 loc44)
		(connected loc44 loc46)
		(connected loc46 loc44)
		(connected loc44 loc48)
		(connected loc48 loc44)
		(connected loc45 loc37)
		(connected loc37 loc45)
		(connected loc45 loc48)
		(connected loc48 loc45)
		(connected loc45 loc51)
		(connected loc51 loc45)
		(connected loc45 loc58)
		(connected loc58 loc45)
		(connected loc46 loc19)
		(connected loc19 loc46)
		(connected loc46 loc39)
		(connected loc39 loc46)
		(connected loc46 loc43)
		(connected loc43 loc46)
		(connected loc46 loc52)
		(connected loc52 loc46)
		(connected loc47 loc30)
		(connected loc30 loc47)
		(connected loc47 loc53)
		(connected loc53 loc47)
		(connected loc48 loc38)
		(connected loc38 loc48)
		(connected loc48 loc42)
		(connected loc42 loc48)
		(connected loc48 loc46)
		(connected loc46 loc48)
		(connected loc49 loc54)
		(connected loc54 loc49)
		(connected loc49 loc56)
		(connected loc56 loc49)
		(connected loc49 loc57)
		(connected loc57 loc49)
		(connected loc49 loc58)
		(connected loc58 loc49)
		(connected loc50 loc31)
		(connected loc31 loc50)
		(connected loc50 loc37)
		(connected loc37 loc50)
		(connected loc50 loc40)
		(connected loc40 loc50)
		(connected loc50 loc43)
		(connected loc43 loc50)
		(connected loc50 loc47)
		(connected loc47 loc50)
		(connected loc50 loc49)
		(connected loc49 loc50)
		(connected loc50 loc51)
		(connected loc51 loc50)
		(connected loc50 loc53)
		(connected loc53 loc50)
		(connected loc51 loc36)
		(connected loc36 loc51)
		(connected loc51 loc37)
		(connected loc37 loc51)
		(connected loc51 loc43)
		(connected loc43 loc51)
		(connected loc51 loc48)
		(connected loc48 loc51)
		(connected loc52 loc26)
		(connected loc26 loc52)
		(connected loc52 loc50)
		(connected loc50 loc52)
		(connected loc52 loc55)
		(connected loc55 loc52)
		(connected loc53 loc26)
		(connected loc26 loc53)
		(connected loc53 loc28)
		(connected loc28 loc53)
		(connected loc53 loc37)
		(connected loc37 loc53)
		(connected loc54 loc22)
		(connected loc22 loc54)
		(connected loc54 loc30)
		(connected loc30 loc54)
		(connected loc54 loc34)
		(connected loc34 loc54)
		(connected loc54 loc41)
		(connected loc41 loc54)
		(connected loc54 loc51)
		(connected loc51 loc54)
		(connected loc55 loc19)
		(connected loc19 loc55)
		(connected loc55 loc28)
		(connected loc28 loc55)
		(connected loc55 loc40)
		(connected loc40 loc55)
		(connected loc55 loc53)
		(connected loc53 loc55)
		(connected loc55 loc54)
		(connected loc54 loc55)
		(connected loc56 loc26)
		(connected loc26 loc56)
		(connected loc56 loc31)
		(connected loc31 loc56)
		(connected loc56 loc38)
		(connected loc38 loc56)
		(connected loc56 loc43)
		(connected loc43 loc56)
		(connected loc57 loc34)
		(connected loc34 loc57)
		(connected loc57 loc52)
		(connected loc52 loc57)
		(connected loc57 loc53)
		(connected loc53 loc57)
		(connected loc58 loc12)
		(connected loc12 loc58)
		(connected loc58 loc25)
		(connected loc25 loc58)
		(connected loc58 loc59)
		(connected loc59 loc58)
		(connected loc59 loc10)
		(connected loc10 loc59)
		(connected loc59 loc28)
		(connected loc28 loc59)
		(connected loc59 loc42)
		(connected loc42 loc59)
		(connected loc59 loc47)
		(connected loc47 loc59)
		(connected loc59 loc48)
		(connected loc48 loc59)
		(connected loc59 loc51)
		(connected loc51 loc59)
		(connected loc60 loc52)
		(connected loc52 loc60)
		(connected loc60 loc55)
		(connected loc55 loc60)

		(in bar2 loc2)
		(in bar3 loc3)
		(in bar4 loc4)
		(in bar6 loc6)
		(in bar8 loc8)
		(in bar9 loc9)
		(in bar10 loc10)
		(in bar16 loc16)
		(in bar20 loc20)
		(in bar22 loc22)
		(in bar23 loc23)
		(in bar25 loc25)
		(in bar29 loc29)
		(in bar30 loc30)
		(in bar31 loc31)
		(in bar33 loc33)
		(in bar39 loc39)
		(in bar42 loc42)
		(in bar43 loc43)
		(in bar45 loc45)
		(in bar47 loc47)
		(in bar50 loc50)
		(in bar51 loc51)
		(in bar54 loc54)
		(in bar55 loc55)
		(in bar56 loc56)
		(in bar58 loc58)

	)

	(:goal
		(and
			(at loc61)
		)
	)
)