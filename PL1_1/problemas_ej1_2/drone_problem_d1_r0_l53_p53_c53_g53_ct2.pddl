(define (problem drone_problem_d1_r0_l53_p53_c53_g53_ct2)
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
	loc11 - location
	loc12 - location
	loc13 - location
	loc14 - location
	loc15 - location
	loc16 - location
	loc17 - location
	loc18 - location
	loc19 - location
	loc20 - location
	loc21 - location
	loc22 - location
	loc23 - location
	loc24 - location
	loc25 - location
	loc26 - location
	loc27 - location
	loc28 - location
	loc29 - location
	loc30 - location
	loc31 - location
	loc32 - location
	loc33 - location
	loc34 - location
	loc35 - location
	loc36 - location
	loc37 - location
	loc38 - location
	loc39 - location
	loc40 - location
	loc41 - location
	loc42 - location
	loc43 - location
	loc44 - location
	loc45 - location
	loc46 - location
	loc47 - location
	loc48 - location
	loc49 - location
	loc50 - location
	loc51 - location
	loc52 - location
	loc53 - location
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
	person11 - person
	person12 - person
	person13 - person
	person14 - person
	person15 - person
	person16 - person
	person17 - person
	person18 - person
	person19 - person
	person20 - person
	person21 - person
	person22 - person
	person23 - person
	person24 - person
	person25 - person
	person26 - person
	person27 - person
	person28 - person
	person29 - person
	person30 - person
	person31 - person
	person32 - person
	person33 - person
	person34 - person
	person35 - person
	person36 - person
	person37 - person
	person38 - person
	person39 - person
	person40 - person
	person41 - person
	person42 - person
	person43 - person
	person44 - person
	person45 - person
	person46 - person
	person47 - person
	person48 - person
	person49 - person
	person50 - person
	person51 - person
	person52 - person
	person53 - person
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
	box11 - box
	box12 - box
	box13 - box
	box14 - box
	box15 - box
	box16 - box
	box17 - box
	box18 - box
	box19 - box
	box20 - box
	box21 - box
	box22 - box
	box23 - box
	box24 - box
	box25 - box
	box26 - box
	box27 - box
	box28 - box
	box29 - box
	box30 - box
	box31 - box
	box32 - box
	box33 - box
	box34 - box
	box35 - box
	box36 - box
	box37 - box
	box38 - box
	box39 - box
	box40 - box
	box41 - box
	box42 - box
	box43 - box
	box44 - box
	box45 - box
	box46 - box
	box47 - box
	box48 - box
	box49 - box
	box50 - box
	box51 - box
	box52 - box
	box53 - box
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
	(at-person person11 loc11)
	(at-person person12 loc12)
	(at-person person13 loc13)
	(at-person person14 loc14)
	(at-person person15 loc15)
	(at-person person16 loc16)
	(at-person person17 loc17)
	(at-person person18 loc18)
	(at-person person19 loc19)
	(at-person person20 loc20)
	(at-person person21 loc21)
	(at-person person22 loc22)
	(at-person person23 loc23)
	(at-person person24 loc24)
	(at-person person25 loc25)
	(at-person person26 loc26)
	(at-person person27 loc27)
	(at-person person28 loc28)
	(at-person person29 loc29)
	(at-person person30 loc30)
	(at-person person31 loc31)
	(at-person person32 loc32)
	(at-person person33 loc33)
	(at-person person34 loc34)
	(at-person person35 loc35)
	(at-person person36 loc36)
	(at-person person37 loc37)
	(at-person person38 loc38)
	(at-person person39 loc39)
	(at-person person40 loc40)
	(at-person person41 loc41)
	(at-person person42 loc42)
	(at-person person43 loc43)
	(at-person person44 loc44)
	(at-person person45 loc45)
	(at-person person46 loc46)
	(at-person person47 loc47)
	(at-person person48 loc48)
	(at-person person49 loc49)
	(at-person person50 loc50)
	(at-person person51 loc51)
	(at-person person52 loc52)
	(at-person person53 loc53)
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
	(box-has box7 food)
	(full-box box7)
	(at-box box8 depot)
	(box-has box8 food)
	(full-box box8)
	(at-box box9 depot)
	(box-has box9 food)
	(full-box box9)
	(at-box box10 depot)
	(box-has box10 food)
	(full-box box10)
	(at-box box11 depot)
	(box-has box11 food)
	(full-box box11)
	(at-box box12 depot)
	(box-has box12 food)
	(full-box box12)
	(at-box box13 depot)
	(box-has box13 food)
	(full-box box13)
	(at-box box14 depot)
	(box-has box14 food)
	(full-box box14)
	(at-box box15 depot)
	(box-has box15 food)
	(full-box box15)
	(at-box box16 depot)
	(box-has box16 food)
	(full-box box16)
	(at-box box17 depot)
	(box-has box17 food)
	(full-box box17)
	(at-box box18 depot)
	(box-has box18 food)
	(full-box box18)
	(at-box box19 depot)
	(box-has box19 food)
	(full-box box19)
	(at-box box20 depot)
	(box-has box20 food)
	(full-box box20)
	(at-box box21 depot)
	(box-has box21 food)
	(full-box box21)
	(at-box box22 depot)
	(box-has box22 food)
	(full-box box22)
	(at-box box23 depot)
	(box-has box23 food)
	(full-box box23)
	(at-box box24 depot)
	(box-has box24 food)
	(full-box box24)
	(at-box box25 depot)
	(box-has box25 food)
	(full-box box25)
	(at-box box26 depot)
	(box-has box26 food)
	(full-box box26)
	(at-box box27 depot)
	(box-has box27 food)
	(full-box box27)
	(at-box box28 depot)
	(box-has box28 medicine)
	(full-box box28)
	(at-box box29 depot)
	(box-has box29 medicine)
	(full-box box29)
	(at-box box30 depot)
	(box-has box30 medicine)
	(full-box box30)
	(at-box box31 depot)
	(box-has box31 medicine)
	(full-box box31)
	(at-box box32 depot)
	(box-has box32 medicine)
	(full-box box32)
	(at-box box33 depot)
	(box-has box33 medicine)
	(full-box box33)
	(at-box box34 depot)
	(box-has box34 medicine)
	(full-box box34)
	(at-box box35 depot)
	(box-has box35 medicine)
	(full-box box35)
	(at-box box36 depot)
	(box-has box36 medicine)
	(full-box box36)
	(at-box box37 depot)
	(box-has box37 medicine)
	(full-box box37)
	(at-box box38 depot)
	(box-has box38 medicine)
	(full-box box38)
	(at-box box39 depot)
	(box-has box39 medicine)
	(full-box box39)
	(at-box box40 depot)
	(box-has box40 medicine)
	(full-box box40)
	(at-box box41 depot)
	(box-has box41 medicine)
	(full-box box41)
	(at-box box42 depot)
	(box-has box42 medicine)
	(full-box box42)
	(at-box box43 depot)
	(box-has box43 medicine)
	(full-box box43)
	(at-box box44 depot)
	(box-has box44 medicine)
	(full-box box44)
	(at-box box45 depot)
	(box-has box45 medicine)
	(full-box box45)
	(at-box box46 depot)
	(box-has box46 medicine)
	(full-box box46)
	(at-box box47 depot)
	(box-has box47 medicine)
	(full-box box47)
	(at-box box48 depot)
	(box-has box48 medicine)
	(full-box box48)
	(at-box box49 depot)
	(box-has box49 medicine)
	(full-box box49)
	(at-box box50 depot)
	(box-has box50 medicine)
	(full-box box50)
	(at-box box51 depot)
	(box-has box51 medicine)
	(full-box box51)
	(at-box box52 depot)
	(box-has box52 medicine)
	(full-box box52)
	(at-box box53 depot)
	(box-has box53 medicine)
	(full-box box53)
)
(:goal (and
	(at-drone drone1 depot)
	(person-has person2 food)
	(person-has person2 medicine)
	(person-has person3 medicine)
	(person-has person4 food)
	(person-has person6 food)
	(person-has person7 food)
	(person-has person7 medicine)
	(person-has person10 food)
	(person-has person10 medicine)
	(person-has person12 food)
	(person-has person12 medicine)
	(person-has person13 medicine)
	(person-has person14 medicine)
	(person-has person15 food)
	(person-has person15 medicine)
	(person-has person16 food)
	(person-has person17 food)
	(person-has person17 medicine)
	(person-has person18 food)
	(person-has person18 medicine)
	(person-has person19 food)
	(person-has person21 medicine)
	(person-has person24 food)
	(person-has person24 medicine)
	(person-has person27 medicine)
	(person-has person28 food)
	(person-has person28 medicine)
	(person-has person29 food)
	(person-has person30 medicine)
	(person-has person31 medicine)
	(person-has person33 food)
	(person-has person35 food)
	(person-has person37 food)
	(person-has person37 medicine)
	(person-has person39 food)
	(person-has person39 medicine)
	(person-has person40 medicine)
	(person-has person42 food)
	(person-has person43 food)
	(person-has person44 medicine)
	(person-has person45 food)
	(person-has person45 medicine)
	(person-has person47 food)
	(person-has person47 medicine)
	(person-has person48 food)
	(person-has person48 medicine)
	(person-has person49 food)
	(person-has person49 medicine)
	(person-has person50 food)
	(person-has person51 food)
	(person-has person51 medicine)
	(person-has person52 food)
	(person-has person53 medicine)
	))
)
