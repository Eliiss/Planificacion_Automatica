(define (problem drone_problem_d2_t2_l4_p4_c4_g4_s4_ct2)
(:domain emergency-logistics-transporters)
(:objects
	drone1 - drone
	drone2 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	box1 - box
	box2 - box
	box3 - box
	box4 - box
	food - content
	medicine - content
	transporter1 - transporter
	transporter2 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(= (fly-cost depot loc1) 236)
	(= (fly-cost depot loc2) 177)
	(= (fly-cost depot loc3) 107)
	(= (fly-cost depot loc4) 112)
	(= (fly-cost loc1 depot) 236)
	(= (fly-cost loc1 loc2) 63)
	(= (fly-cost loc1 loc3) 140)
	(= (fly-cost loc1 loc4) 133)
	(= (fly-cost loc2 depot) 177)
	(= (fly-cost loc2 loc1) 63)
	(= (fly-cost loc2 loc3) 93)
	(= (fly-cost loc2 loc4) 86)
	(= (fly-cost loc3 depot) 107)
	(= (fly-cost loc3 loc1) 140)
	(= (fly-cost loc3 loc2) 93)
	(= (fly-cost loc3 loc4) 8)
	(= (fly-cost loc4 depot) 112)
	(= (fly-cost loc4 loc1) 133)
	(= (fly-cost loc4 loc2) 86)
	(= (fly-cost loc4 loc3) 8)
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(arm-free drone1)
	(drone-free drone1)
	(arm-free drone2)
	(drone-free drone2)
	(at-transporter transporter1 depot)
	(free-slots transporter1 n4)
	(transporter-free transporter1)
	(at-transporter transporter2 depot)
	(free-slots transporter2 n4)
	(transporter-free transporter2)
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
	(box-has box4 medicine)
	(full-box box4)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(person-has person2 food)
	(person-has person2 medicine)
	(person-has person3 food)
	(person-has person4 food)
	))
(:metric minimize (total-time))
)
