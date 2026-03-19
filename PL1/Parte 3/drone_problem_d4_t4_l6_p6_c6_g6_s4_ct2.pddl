(define (problem drone_problem_d4_t4_l6_p6_c6_g6_s4_ct2)
(:domain emergency-logistics-transporters)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
	drone4 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	loc6 - location
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	box1 - box
	box2 - box
	box3 - box
	box4 - box
	box5 - box
	box6 - box
	food - content
	medicine - content
	transporter1 - transporter
	transporter2 - transporter
	transporter3 - transporter
	transporter4 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(= (fly-cost depot loc1) 189)
	(= (fly-cost depot loc2) 211)
	(= (fly-cost depot loc3) 169)
	(= (fly-cost depot loc4) 106)
	(= (fly-cost depot loc5) 81)
	(= (fly-cost depot loc6) 207)
	(= (fly-cost loc1 depot) 189)
	(= (fly-cost loc1 loc2) 99)
	(= (fly-cost loc1 loc3) 87)
	(= (fly-cost loc1 loc4) 190)
	(= (fly-cost loc1 loc5) 144)
	(= (fly-cost loc1 loc6) 168)
	(= (fly-cost loc2 depot) 211)
	(= (fly-cost loc2 loc1) 99)
	(= (fly-cost loc2 loc3) 43)
	(= (fly-cost loc2 loc4) 159)
	(= (fly-cost loc2 loc5) 136)
	(= (fly-cost loc2 loc6) 81)
	(= (fly-cost loc3 depot) 169)
	(= (fly-cost loc3 loc1) 87)
	(= (fly-cost loc3 loc2) 43)
	(= (fly-cost loc3 loc4) 123)
	(= (fly-cost loc3 loc5) 95)
	(= (fly-cost loc3 loc6) 83)
	(= (fly-cost loc4 depot) 106)
	(= (fly-cost loc4 loc1) 190)
	(= (fly-cost loc4 loc2) 159)
	(= (fly-cost loc4 loc3) 123)
	(= (fly-cost loc4 loc5) 53)
	(= (fly-cost loc4 loc6) 119)
	(= (fly-cost loc5 depot) 81)
	(= (fly-cost loc5 loc1) 144)
	(= (fly-cost loc5 loc2) 136)
	(= (fly-cost loc5 loc3) 95)
	(= (fly-cost loc5 loc4) 53)
	(= (fly-cost loc5 loc6) 127)
	(= (fly-cost loc6 depot) 207)
	(= (fly-cost loc6 loc1) 168)
	(= (fly-cost loc6 loc2) 81)
	(= (fly-cost loc6 loc3) 83)
	(= (fly-cost loc6 loc4) 119)
	(= (fly-cost loc6 loc5) 127)
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(arm-free drone1)
	(drone-free drone1)
	(arm-free drone2)
	(drone-free drone2)
	(arm-free drone3)
	(drone-free drone3)
	(arm-free drone4)
	(drone-free drone4)
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
	(at-box box5 depot)
	(box-has box5 medicine)
	(full-box box5)
	(at-box box6 depot)
	(box-has box6 medicine)
	(full-box box6)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(at-drone drone4 depot)
	(person-has person1 food)
	(person-has person2 food)
	(person-has person4 medicine)
	(person-has person5 food)
	(person-has person5 medicine)
	(person-has person6 medicine)
	))
(:metric minimize (total-time))
)
