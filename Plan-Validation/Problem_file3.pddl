(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        ;Train Name
        Druto-Jan Shapla - train
        ;Station Name
        Dhaka Dhaka-Biman-Bandar Tongi Joydebpur - station
        
       
        ;Forward Line
        fl1 fl2 fl3 fl4 fl5 fl6 fl7 fl8 fl9 fl10 - forward-line
        ;Reverse Line
        rl1 rl2 rl3 rl4 rl5 rl6 rl7 rl8 rl9 rl10 - reverse-line
        ;Single Line
        sl1 - single-line
        
    )
    
    (:init


        ;Forward Move
        (valid-move Dhaka Dhaka-Biman-Bandar fl1)
        (valid-move Dhaka-Biman-Bandar Tongi fl2)
       
        (valid-move Tongi Joydebpur sl1)
        
      
        ;Reverse Move
        (valid-move Joydebpur Tongi sl1)
   
        (valid-move Tongi Dhaka-Biman-Bandar rl9)
        (valid-move Dhaka-Biman-Bandar Dhaka rl10)
        
       
        
       
        ;line-status

        (free-line fl1)
        (free-line fl2)
        (free-line fl3)
        (free-line fl4)
        (free-line fl5)
        (free-line fl6)
        (free-line fl7)
        (free-line fl8)
        (free-line fl9)
        (free-line fl10)

        (free-line rl1)
        (free-line rl2)
        (free-line rl3)
        (free-line rl4)
        (free-line rl5)
        (free-line rl6)
        (free-line rl7)
        (free-line rl8)
        (free-line rl9)
        (free-line rl10)

        (free-line sl1)
        
        
        ;station-distance in meters
        
        (= (station-distance Dhaka-Biman-Bandar Dhaka)60)
        (= (station-distance Tongi Dhaka-Biman-Bandar)70)
     
        (= (station-distance Tongi Joydebpur)20)
      
        
        ; Reverse station-distance
        (= (station-distance Joydebpur Tongi)20)
        (= (station-distance Dhaka-Biman-Bandar Tongi)70)
        (= (station-distance Dhaka Dhaka-Biman-Bandar)60)
        
      

        

        


(=(train-speed Druto-Jan)15)
(=(train-speed Shapla)20)
(train-at Druto-Jan Tongi)
(visited Druto-Jan Tongi)
(train-at Shapla Joydebpur)
(visited Shapla Joydebpur)
(stoppage-at Druto-Jan Joydebpur)
(stoppage-at Shapla Dhaka-Biman-Bandar)

)
(:goal
(and(visited Druto-Jan Joydebpur)
(visited Shapla Dhaka-Biman-Bandar)

))
(:metric minimize (total-cost))
)

