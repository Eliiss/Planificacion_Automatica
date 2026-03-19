(define (problem drone_problem_d3_t3_l5_p5_c5_g5_s4_ct2)
(:domain emergency-logistics-transporters)
(:objects
	drone1 - drone
	drone2 - drone
	drone3 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	box1 - box
	box2 - box
	box3 - box
	box4 - box
	box5 - box
	food - content
	medicine - content
	transporter1 - transporter
	transporter2 - transporter
	transporter3 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(= (fly-cost depot loc1) 119)
	(= (fly-cost depot loc2) 169)
	(= (fly-cost depot loc3) 87)
	(= (fly-cost depot loc4) 196)
	(= (fly-cost depot loc5) 85)
	(= (fly-cost loc1 depot) 119)
	(= (fly-cost loc1 loc2) 75)
	(= (fly-cost loc1 loc3) 36)
	(= (fly-cost loc1 loc4) 89)
	(= (fly-cost loc1 loc5) 42)
	(= (fly-cost loc2 depot) 169)
	(= (fly-cost loc2 loc1) 75)
	(= (fly-cost loc2 loc3) 105)
	(= (fly-cost loc2 loc4) 127)
	(= (fly-cost loc2 loc5) 112)
	(= (fly-cost loc3 depot) 87)
	(= (fly-cost loc3 loc1) 36)
	(= (fly-cost loc3 loc2) 105)
	(= (fly-cost loc3 loc4) 112)
	(= (fly-cost loc3 loc5) 8)
	(= (fly-cost loc4 depot) 196)
	(= (fly-cost loc4 loc1) 89)
	(= (fly-cost loc4 loc2) 127)
	(= (fly-cost loc4 loc3) 112)
	(= (fly-cost loc4 loc5) 112)
	(= (fly-cost loc5 depot) 85)
	(= (fly-cost loc5 loc1) 42)
	(= (fly-cost loc5 loc2) 112)
	(= (fly-cost loc5 loc3) 8)
	(= (fly-cost loc5 loc4) 112)
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(arm-free drone1)
	(drone-free drone1)
	(arm-free drone2)
	(drone-free drone2)
	(arm-free drone3)
	(drone-free drone3)
	(at-transporter transporter1 depot)
	(free-slots transporter1 n4)
	(transporter-free transporter1)
	(at-transporter transporter2 depot)
	(free-slots transporter2 n4)
	(transporter-free transporter2)
	(at-transporter transporter3 depot)
	(free-slots transporter3 n4)
	(transporter-free transporter3)
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
	(at-box box1 depot)
	(box-has box1 food)
	(full-box box1)
	(at-box box2 depot)
	(box-has box2 food)
	(full-box box2)
	(at-box box3 depot)
	(box-has box3 medicine)
	(full-box box3)
	(at-box box4 depot)
	(box-has box4 medicine)
	(full-box box4)
	(at-box box5 depot)
	(box-has box5 medicine)
	(full-box box5)
)
(:goal (and
	(at-drone drone1 depot)
	(at-drone drone2 depot)
	(at-drone drone3 depot)
	(person-has person1 food)
	(person-has person2 food)
	(person-has person2 medicine)
	(person-has person4 medicine)
	(person-has person5 medicine)
	))
(:metric minimize (total-time))
)
