(define (problem drone_problem_d1_t1_l3_p3_c3_g3_s4_ct2)
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
	food - content
	medicine - content
	transporter1 - transporter
	n0 - num
	n1 - num
	n2 - num
	n3 - num
	n4 - num
)
(:init
	(= (fly-cost depot loc1) 229)
	(= (fly-cost depot loc2) 218)
	(= (fly-cost depot loc3) 87)
	(= (fly-cost loc1 depot) 229)
	(= (fly-cost loc1 loc2) 108)
	(= (fly-cost loc1 loc3) 172)
	(= (fly-cost loc2 depot) 218)
	(= (fly-cost loc2 loc1) 108)
	(= (fly-cost loc2 loc3) 135)
	(= (fly-cost loc3 depot) 87)
	(= (fly-cost loc3 loc1) 172)
	(= (fly-cost loc3 loc2) 135)
	(at-drone drone1 depot)
	(arm-free drone1)
	(drone-free drone1)
	(at-transporter transporter1 depot)
	(free-slots transporter1 n4)
	(transporter-free transporter1)
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
	(at-box box1 depot)
	(box-has box1 food)
	(full-box box1)
	(at-box box2 depot)
	(box-has box2 medicine)
	(full-box box2)
	(at-box box3 depot)
	(box-has box3 medicine)
	(full-box box3)
)
(:goal (and
	(at-drone drone1 depot)
	(person-has person2 food)
	(person-has person2 medicine)
	(person-has person3 medicine)
	))
(:metric minimize (total-time))
)
