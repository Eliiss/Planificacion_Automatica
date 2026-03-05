(define (problem drone_problem_d1_r0_l5_p5_c5_g5_ct2)
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
	(at-box box1 depot)
	(box-has box1 food)
	(at-box box2 depot)
	(box-has box2 food)
	(at-box box3 depot)
	(box-has box3 food)
	(at-box box4 depot)
	(box-has box4 food)
	(at-box box5 depot)
	(box-has box5 medicine)
	(full-box box1)
	(full-box box2)
	(full-box box3)
	(full-box box4)
	(full-box box5)
)
(:goal (and
	(at-drone drone1 depot)
	(person-has person1 food)
	(person-has person2 food)
	(person-has person3 food)
	(person-has person4 food)
	(person-has person4 medicine)
	))
)
