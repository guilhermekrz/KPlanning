; Generated by ProblemGenerator - Problem 2 at Tue Nov 22 16:23:54 BRST 2016
(define (problem pb2)
	(:domain drinkanddrive-generated)
	(:requirements :strips :typing :negative-preconditions)
	(:objects
		loc1 loc2 loc3 loc4 loc5 loc6 loc7 - location
		bar1 bar2 bar3 bar5 bar6 bar7 - bar
	)
	(:init
		(at loc1)

		(connected loc5 loc6)
		(connected loc6 loc5)
		(connected loc6 loc3)
		(connected loc3 loc6)
		(connected loc3 loc1)
		(connected loc1 loc3)
		(connected loc1 loc7)
		(connected loc7 loc1)
		(connected loc1 loc2)
		(connected loc2 loc1)
		(connected loc2 loc4)
		(connected loc4 loc2)
		(connected loc2 loc1)
		(connected loc1 loc2)
		(connected loc3 loc2)
		(connected loc2 loc3)
		(connected loc3 loc7)
		(connected loc7 loc3)
		(connected loc4 loc3)
		(connected loc3 loc4)
		(connected loc5 loc2)
		(connected loc2 loc5)
		(connected loc5 loc4)
		(connected loc4 loc5)
		(connected loc6 loc2)
		(connected loc2 loc6)
		(connected loc7 loc4)
		(connected loc4 loc7)

		(in bar1 loc1)
		(in bar2 loc2)
		(in bar3 loc3)
		(in bar5 loc5)
		(in bar6 loc6)
		(in bar7 loc7)

	)

	(:goal
		(and
			(at loc7)
		)
	)
)