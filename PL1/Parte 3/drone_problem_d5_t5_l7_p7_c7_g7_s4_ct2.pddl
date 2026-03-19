(define (problem drone_problem_d5_t5_l7_p7_c7_g7_s4_ct2)
(:domain emergency-logistics-transporters)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
	drone4 - drone
	drone5 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	loc6 - location
	loc7 - location
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	box1 - box
	box2 - box
	box3 - box
	box4 - box
	box5 - box
	box6 - box
	box7 - box
	food - content
	medicine - content
	transporter1 - transporter
	transporter2 - transporter
	transporter3 - transporter
	transporter4 - transporter
	transporter5 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(= (fly-cost depot loc1) 98)
	(= (fly-cost depot loc2) 278)
	(= (fly-cost depot loc3) 201)
	(= (fly-cost depot loc4) 24)
	(= (fly-cost depot loc5) 225)
	(= (fly-cost depot loc6) 110)
	(= (fly-cost depot loc7) 195)
	(= (fly-cost loc1 depot) 98)
	(= (fly-cost loc1 loc2) 220)
	(= (fly-cost loc1 loc3) 108)
	(= (fly-cost loc1 loc4) 97)
	(= (fly-cost loc1 loc5) 198)
	(= (fly-cost loc1 loc6) 75)
	(= (fly-cost loc1 loc7) 187)
	(= (fly-cost loc2 depot) 278)
	(= (fly-cost loc2 loc1) 220)
	(= (fly-cost loc2 loc3) 152)
	(= (fly-cost loc2 loc4) 259)
	(= (fly-cost loc2 loc5) 90)
	(= (fly-cost loc2 loc6) 168)
	(= (fly-cost loc2 loc7) 134)
	(= (fly-cost loc3 depot) 201)
	(= (fly-cost loc3 loc1) 108)
	(= (fly-cost loc3 loc2) 152)
	(= (fly-cost loc3 loc4) 193)
	(= (fly-cost loc3 loc5) 176)
	(= (fly-cost loc3 loc6) 117)
	(= (fly-cost loc3 loc7) 192)
	(= (fly-cost loc4 depot) 24)
	(= (fly-cost loc4 loc1) 97)
	(= (fly-cost loc4 loc2) 259)
	(= (fly-cost loc4 loc3) 193)
	(= (fly-cost loc4 loc5) 203)
	(= (fly-cost loc4 loc6) 93)
	(= (fly-cost loc4 loc7) 172)
	(= (fly-cost loc5 depot) 225)
	(= (fly-cost loc5 loc1) 198)
	(= (fly-cost loc5 loc2) 90)
	(= (fly-cost loc5 loc3) 176)
	(= (fly-cost loc5 loc4) 203)
	(= (fly-cost loc5 loc6) 127)
	(= (fly-cost loc5 loc7) 47)
	(= (fly-cost loc6 depot) 110)
	(= (fly-cost loc6 loc1) 75)
	(= (fly-cost loc6 loc2) 168)
	(= (fly-cost loc6 loc3) 117)
	(= (fly-cost loc6 loc4) 93)
	(= (fly-cost loc6 loc5) 127)
	(= (fly-cost loc6 loc7) 112)
	(= (fly-cost loc7 depot) 195)
	(= (fly-cost loc7 loc1) 187)
	(= (fly-cost loc7 loc2) 134)
	(= (fly-cost loc7 loc3) 192)
	(= (fly-cost loc7 loc4) 172)
	(= (fly-cost loc7 loc5) 47)
	(= (fly-cost loc7 loc6) 112)
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(arm-free drone1)
	(drone-free drone1)
	(arm-free drone2)
	(drone-free drone2)
	(arm-free drone3)
	(drone-free drone3)
	(arm-free drone4)
	(drone-free drone4)
	(arm-free drone5)
	(drone-free drone5)
	(at-transporter transporter1 depot)
	(free-slots transporter1 n4)
	(transporter-free transporter1)
	(at-transporter transporter2 depot)
	(free-slots transporter2 n4)
	(transporter-free transporter2)
	(at-transporter transporter3 depot)
	(free-slots transporter3 n4)
	(transporter-free transporter3)
	(at-transporter transporter4 depot)
	(free-slots transporter4 n4)
	(transporter-free transporter4)
	(at-transporter transporter5 depot)
	(free-slots transporter5 n4)
	(transporter-free transporter5)
	(siguiente n0 n1)
	(siguiente n1 n2)
	(siguiente n2 n3)
	(siguiente n3 n4)
	(at-person person1 loc1)
	(person-free person1)
	(at-person person2 loc2)
	(person-free person2)
	(at-person person3 loc3)
	(person-free person3)
	(at-person person4 loc4)
	(person-free person4)
	(at-person person5 loc5)
	(person-free person5)
	(at-person person6 loc6)
	(person-free person6)
	(at-person person7 loc7)
	(person-free person7)
	(at-box box1 depot)
	(box-has box1 food)
	(full-box box1)
	(at-box box2 depot)
	(box-has box2 food)
	(full-box box2)
	(at-box box3 depot)
	(box-has box3 food)
	(full-box box3)
	(at-box box4 depot)
	(box-has box4 food)
	(full-box box4)
	(at-box box5 depot)
	(box-has box5 food)
	(full-box box5)
	(at-box box6 depot)
	(box-has box6 food)
	(full-box box6)
	(at-box box7 depot)
	(box-has box7 medicine)
	(full-box box7)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(at-drone drone5 depot)
	(person-has person1 food)
	(person-has person2 food)
	(person-has person2 medicine)
	(person-has person3 food)
	(person-has person4 food)
	(person-has person6 food)
	(person-has person7 food)
	))
(:metric minimize (total-time))
)
