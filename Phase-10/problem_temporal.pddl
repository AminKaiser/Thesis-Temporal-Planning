(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        ;Train Name
        t1 t2 - train
        ;Station Name
        Dhaka Dhaka-Biman-Bandar Tongi Narsingdi Bhairab Brahmanbaria Akhaura Laksham Chittagong - station
        Shaestaganj Kulaura Sylhet Joydebpur Mymensingh Tangail Bangabandhu-Setu Ishwardi Khulna Abdulpur Panchagar Rajshahi - station
        ;Forward Line
        fl1 fl2 fl3 fl4 fl5 fl6 fl7 fl8 - forward-line
        ;Reverse Line
        rl1 rl2 rl3 rl4 rl5 rl6 rl7 rl8 - reverse-line
        ;Single Line
        sl1 sl2 sl3 sl4 sl5 sl6 sl7 sl8 sl9 sl10 sl11 sl12 - single-line
        ;Platform in Each Station
        pf1 pf2 pf3 - s0

    )
    
    (:init
        (train-at t1 Dhaka)
        (train-at t2 Chittagong)
        
        (visited t1 Dhaka)
        (visited t2 Chittagong)

        ;Adding stoppage
        (stoppage-at t1 Dhaka-Biman-Bandar)
        (stoppage-at t1 Chittagong)

        (stoppage-at t2 Laksham)
        (stoppage-at t2 Dhaka-Biman-Bandar)
        (stoppage-at t2 Dhaka)

        ;Line under Maintenance
        (maintenance-line sl1)

        ;Forward Move
        (valid-move Dhaka Dhaka-Biman-Bandar fl1)
        (valid-move Dhaka-Biman-Bandar Tongi fl2)
        (valid-move Tongi Narsingdi fl3)
        (valid-move Narsingdi Bhairab fl4)
        (valid-move Bhairab Brahmanbaria fl5)
        (valid-move Brahmanbaria Akhaura fl6)
        (valid-move Akhaura Laksham fl7)
        (valid-move Laksham Chittagong fl8)

        (valid-move Tongi Joydebpur sl1)
        (valid-move Joydebpur Mymensingh sl2)
        (valid-move Joydebpur Tangail sl3)
        (valid-move Tangail Bangabandhu-Setu sl4)
        (valid-move Bangabandhu-Setu Ishwardi sl5)
        (valid-move Ishwardi Khulna sl6)
        (valid-move Ishwardi Abdulpur sl7)
        (valid-move Abdulpur Panchagar sl8)
        (valid-move Abdulpur Rajshahi sl9)
        

        (valid-move Akhaura Shaestaganj sl10)
        (valid-move Shaestaganj Kulaura sl11)
        (valid-move Kulaura Sylhet sl12)

        ;Reverse Move
        (valid-move Chittagong Laksham rl1)
        (valid-move Laksham Akhaura rl2)
        (valid-move Akhaura Brahmanbaria rl3)
        (valid-move Brahmanbaria Bhairab rl4)
        (valid-move Bhairab Narsingdi rl5)
        (valid-move Narsingdi Tongi rl6)
        (valid-move Tongi Dhaka-Biman-Bandar rl7)
        (valid-move Dhaka-Biman-Bandar Dhaka rl8)

        (valid-move Joydebpur Tongi sl1)
        (valid-move Mymensingh Joydebpur sl2)
        (valid-move Tangail Joydebpur sl3)
        (valid-move Bangabandhu-Setu Tangail sl4)
        (valid-move Ishwardi Bangabandhu-Setu sl5)
        (valid-move Khulna Ishwardi sl6)
        (valid-move Abdulpur Ishwardi sl7)
        (valid-move Panchagar Abdulpur sl8)
        (valid-move Rajshahi Abdulpur sl9)
        
        (valid-move Shaestaganj Akhaura sl10)
        (valid-move Kulaura Shaestaganj sl11)
        (valid-move Sylhet Kulaura sl12)

       
        ;line-status

        (free-line fl1)
        (free-line fl2)
        (free-line fl3)
        (free-line fl4)
        (free-line fl5)
        (free-line fl6)
        (free-line fl7)
        (free-line fl8)

        (free-line rl1)
        (free-line rl2)
        (free-line rl3)
        (free-line rl4)
        (free-line rl5)
        (free-line rl6)
        (free-line rl7)
        (free-line rl8)

        (free-line sl1)
        (free-line sl2)
        (free-line sl3)
        (free-line sl4)
        (free-line sl5)
        (free-line sl6)
        (free-line sl7)
        (free-line sl8)
        (free-line sl9)
        (free-line sl10)
        (free-line sl11)
        (free-line sl12)
        




        

        ;waiting time for per stoppage
        (=(waiting-time) 5)
        
        
        ;station-distance in meters
        (= (station-distance Dhaka Dhaka-Biman-Bandar)60)
        (= (station-distance Dhaka-Biman-Bandar Tongi)70)
        (= (station-distance Tongi Narsingdi)50)
        (= (station-distance Narsingdi Bhairab)80)
        (= (station-distance Bhairab Brahmanbaria)75)
        (= (station-distance Brahmanbaria Akhaura)55)
        (= (station-distance Akhaura Laksham)25)
        (= (station-distance Laksham Chittagong)90)

        (= (station-distance Tongi Joydebpur)20)
        (= (station-distance Joydebpur Mymensingh)40)
        (= (station-distance Joydebpur Tangail)40)
        (= (station-distance Tangail Bangabandhu-Setu)60)
        (= (station-distance Bangabandhu-Setu Ishwardi)30)
        (= (station-distance Ishwardi Khulna)95)
        (= (station-distance Ishwardi Abdulpur)25)
        (= (station-distance Abdulpur Panchagar)80)
        (= (station-distance Abdulpur Rajshahi)75)

        (= (station-distance Akhaura Shaestaganj)45)
        (= (station-distance Shaestaganj Kulaura)20)
        (= (station-distance Kulaura Sylhet)70)

       

        
        (= (station-distance Dhaka-Biman-Bandar Dhaka)60)
        (= (station-distance Tongi Dhaka-Biman-Bandar)70)
        (= (station-distance Narsingdi Tongi)50)
        (= (station-distance Bhairab Narsingdi)80)
        (= (station-distance Brahmanbaria Bhairab)75)
        (= (station-distance Akhaura Brahmanbaria)55)
        (= (station-distance Laksham Akhaura)25)
        (= (station-distance Chittagong Laksham)90)

        (= (station-distance Joydebpur Tongi)20)
        (= (station-distance Mymensingh Joydebpur)40)
        (= (station-distance Tangail Joydebpur)40)
        (= (station-distance Bangabandhu-Setu Tangail)60)
        (= (station-distance Ishwardi Bangabandhu-Setu)30)
        (= (station-distance Khulna Ishwardi)95)
        (= (station-distance Abdulpur Ishwardi)25)
        (= (station-distance Panchagar Abdulpur)80)
        (= (station-distance Rajshahi Abdulpur)75)

        (= (station-distance Shaestaganj Akhaura)45)
        (= (station-distance Kulaura Shaestaganj)20)
        (= (station-distance Sylhet Kulaura)70)
        
        ;train-speed meters/sec
        
        (=(train-speed t1)15)
        (=(train-speed t2)15)
    )
    
    (:goal
        (and(visited t1 Dhaka-Biman-Bandar)
        (visited t1 Chittagong)

        (visited t2 Laksham)
        (visited t2 Dhaka-Biman-Bandar)
        (visited t2 Dhaka)
        )
    )
    (:metric minimize (total-time))

)
