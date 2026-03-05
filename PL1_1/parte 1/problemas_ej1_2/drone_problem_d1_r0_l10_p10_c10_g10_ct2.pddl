(define (problem drone_problem_d1_r0_l10_p10_c10_g10_ct2)
(:domain emergency-logistics)
(:objects
	drone1 - drone
	arm1 - arm
	arm2 - arm
	depot - location
	loc1 - location
	loc2 - location
	loc3 - location
	loc4 - location
	loc5 - location
	loc6 - location
	loc7 - location
	loc8 - location
	loc9 - location
	loc10 - location
	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person
	person6 - person
	person7 - person
	person8 - person
	person9 - person
	person10 - person
	box1 - box
	box2 - box
	box3 - box
	box4 - box
	box5 - box
	box6 - box
	box7 - box
	box8 - box
	box9 - box
	box10 - box
	food - content
	medicine - content
)
(:init
	(at-drone drone1 depot)
	(arm-of arm1 drone1)
	(arm-of arm2 drone1)
	(arm-free arm1)
	(arm-free arm2)
	(at-person person1 loc1)
	(at-person person2 loc2)
	(at-person person3 loc3)
	(at-person person4 loc4)
	(at-person person5 loc5)
	(at-person person6 loc6)
	(at-person person7 loc7)
	(at-person person8 loc8)
	(at-person person9 loc9)
	(at-person person10 loc10)
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
	(at-box box9 depot)
	(box-has box9 medicine)
	(full-box box9)
	(at-box box10 depot)
	(box-has box10 medicine)
	(full-box box10)
)
(:goal (and
	(at-drone drone1 depot)
	(person-has person1 medicine)
	(person-has person2 medicine)
	(person-has person4 medicine)
	(person-has person5 medicine)
	(person-has person7 food)
	(person-has person7 medicine)
	(person-has person8 food)
	(person-has person8 medicine)
	(person-has person9 medicine)
	(person-has person10 medicine)
	))
)
