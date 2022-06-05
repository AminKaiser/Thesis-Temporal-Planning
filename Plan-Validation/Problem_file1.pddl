(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        ;Train Name
        drutojan-express shapla-express - train
        ;Station Name
        Dhaka Dhaka-Biman-Bandar Tongi Joydebpur Narsingdi Bhairab - station
        
       
        ;Forward Line
        fl1 fl2 fl3 fl4 - forward-line
        ;Reverse Line
        rl7 rl8 rl9 rl10 - reverse-line
        ;Single Line
        sl1 - single-line
        
    )
    
    (:init
        
        (=(total-cost)0)


        ;Forward Move
        (valid-move Dhaka Dhaka-Biman-Bandar fl1)
        (valid-move Dhaka-Biman-Bandar Tongi fl2)
        (valid-move Tongi Narsingdi fl3)
        (valid-move Narsingdi Bhairab fl4)
       
        (valid-move Tongi Joydebpur sl1)
        
      
        ;Reverse Move
        (valid-move Joydebpur Tongi sl1)
        (valid-move Bhairab Narsingdi rl7)
        (valid-move Narsingdi Tongi rl8)
        (valid-move Tongi Dhaka-Biman-Bandar rl9)
        (valid-move Dhaka-Biman-Bandar Dhaka rl10)
        
       
        ;line-status

        (free-line fl1)
        (free-line fl2)
        (free-line fl3)
        (free-line fl4)
        
        (free-line rl7)
        (free-line rl8)
        (free-line rl9)
        (free-line rl10)

        (free-line sl1)
        
        
        ;station-distance in meters
        
        (= (station-distance Dhaka Dhaka-Biman-Bandar)20)
        (= (station-distance Dhaka-Biman-Bandar Tongi)15)
        (= (station-distance Tongi Narsingdi)18)
        (= (station-distance Narsingdi Bhairab)19)
        (= (station-distance Tongi Joydebpur)28)
     
      
        
        ; Reverse station-distance
        (= (station-distance Bhairab Narsingdi)19)
        (= (station-distance Narsingdi Tongi)18)
        (= (station-distance Tongi Dhaka-Biman-Bandar)15)
        (= (station-distance Dhaka-Biman-Bandar Dhaka)20)
        (= (station-distance Joydebpur Tongi)28)
        
        
        (=(train-speed drutojan-express)15)
        (=(train-speed shapla-express)20)
        (train-at drutojan-express Dhaka)
        (visited drutojan-express Dhaka)
        (train-at shapla-express Bhairab)
        (visited shapla-express Bhairab)
        (stoppage-at drutojan-express Dhaka-Biman-Bandar)
        (stoppage-at shapla-express Tongi)

)
(:goal
(and(visited drutojan-express Dhaka-Biman-Bandar)
(visited shapla-express Tongi)

))
(:metric minimize (total-cost))
)

