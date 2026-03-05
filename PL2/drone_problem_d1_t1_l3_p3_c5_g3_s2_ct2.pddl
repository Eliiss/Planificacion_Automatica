(define (problem drone_problem_d1_t1_l3_p3_c5_g3_s2_ct2)
(:domain emergency-logistics-transporters)
(:objects
	drone1 - drone
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	person1 - person
	person2 - person
	person3 - person
	box1 - box
	box2 - box
	box3 - box
	box4 - box
	box5 - box
	food - content
	medicine - content
	transporter1 - transporter
	n0 - num
	n1 - num
	n2 - num
)
(:init
	(= (total-cost) 0)
	(= (fly-cost depot loc1) 197)
	(= (fly-cost depot loc2) 216)
	(= (fly-cost depot loc3) 125)
	(= (fly-cost loc1 depot) 197)
	(= (fly-cost loc1 loc2) 20)
	(= (fly-cost loc1 loc3) 157)
	(= (fly-cost loc2 depot) 216)
	(= (fly-cost loc2 loc1) 20)
	(= (fly-cost loc2 loc3) 170)
	(= (fly-cost loc3 depot) 125)
	(= (fly-cost loc3 loc1) 157)
	(= (fly-cost loc3 loc2) 170)
	(at-drone drone1 depot)
	(arm-free drone1)
	(at-transporter transporter1 depot)
	(free-slots transporter1 n2)
	(siguiente n0 n1)
	(siguiente n1 n2)
	(at-person person1 loc1)
	(at-person person2 loc2)
	(at-person person3 loc3)
	(at-box box1 depot)
	(box-has box1 food)
	(full-box box1)
	(at-box box2 depot)
	(box-has box2 medicine)
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
	(person-has person1 medicine)
	(person-has person2 food)
	(person-has person3 medicine)
	))
(:metric minimize (total-cost))
)
