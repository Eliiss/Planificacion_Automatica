(define (problem drone_problem_d1_t1_l4_p5_c8_g5_s3_ct2)
(:domain emergency-logistics-transporters)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
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
	box6 - box
	box7 - box
	box8 - box
	food - content
	medicine - content
	transporter1 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
)
(:init
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 210)
	(= (fly-cost depot loc2) 144)
	(= (fly-cost depot loc3) 253)
	(= (fly-cost depot loc4) 189)
	(= (fly-cost loc1 depot) 210)
	(= (fly-cost loc1 loc2) 161)
	(= (fly-cost loc1 loc3) 49)
	(= (fly-cost loc1 loc4) 25)
	(= (fly-cost loc2 depot) 144)
	(= (fly-cost loc2 loc1) 161)
	(= (fly-cost loc2 loc3) 180)
	(= (fly-cost loc2 loc4) 138)
	(= (fly-cost loc3 depot) 253)
	(= (fly-cost loc3 loc1) 49)
	(= (fly-cost loc3 loc2) 180)
	(= (fly-cost loc3 loc4) 66)
	(= (fly-cost loc4 depot) 189)
	(= (fly-cost loc4 loc1) 25)
	(= (fly-cost loc4 loc2) 138)
	(= (fly-cost loc4 loc3) 66)
	(at-drone drone1 depot)
	(arm-free drone1)
	(at-transporter transporter1 depot)
	(free-slots transporter1 n3)
	(siguiente n0 n1)
	(siguiente n1 n2)
	(siguiente n2 n3)
	(at-person person1 loc1)
	(at-person person2 loc2)
	(at-person person3 loc3)
	(at-person person4 loc4)
	(at-person person5 loc1)
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
	(at-box box6 depot)
	(box-has box6 medicine)
	(full-box box6)
	(at-box box7 depot)
	(box-has box7 medicine)
	(full-box box7)
	(at-box box8 depot)
	(box-has box8 medicine)
	(full-box box8)
)
(:goal (and
	(at-drone drone1 depot)
	(person-has person1 food)
	(person-has person2 medicine)
	(person-has person4 food)
	(person-has person4 medicine)
	(person-has person5 medicine)
	))
(:metric minimize (total-cost))
)
