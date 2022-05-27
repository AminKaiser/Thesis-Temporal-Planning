(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        t1 t2 - train
        s0 s1 s2 s3 s4 s5 s6 - station
        fl1 fl2 fl3 fl4 - forward-line
        rl1 rl2 rl3 rl4 - reverse-line
        sl1 sl2 - single-line

        pf1 pf2 pf3 - s0

    )
    
    (:init
        (train-at t1 s0)
        (train-at t2 s6)
        
        (visited t1 s0)
        (visited t2 s6)

        ;Adding stoppage
        (stoppage-at t1 s5)
        (stoppage-at t1 s6)

        (stoppage-at t2 s2)
        (stoppage-at t2 s0)

        ;Line under Maintenance
        (maintenance-line sl1)



        ;Forward Move
        (valid-move s0 s1 fl1)
        (valid-move s1 s2 fl2)
        (valid-move s2 s3 fl3)
        (valid-move s3 s4 fl4)
        (valid-move s4 s5 sl1)
        (valid-move s5 s6 sl2)

        ;Reverse Move
        (valid-move s6 s5 sl2)
        (valid-move s5 s4 sl1)
        (valid-move s4 s3 rl1)
        (valid-move s3 s2 rl2)
        (valid-move s2 s1 rl3)
        (valid-move s1 s0 rl4)

        ;line-status

        (free-line fl1)
        (free-line fl2)
        (free-line fl3)
        (free-line fl4)

        (free-line rl1)
        (free-line rl2)
        (free-line rl3)
        (free-line rl4)

        (free-line sl1)
        (free-line sl2)





        

        ;waiting time for per stoppage
        (=(waiting-time) 5)
        
        
        ;station-distance in meters
        (= (station-distance s0 s1)50)
        (= (station-distance s1 s2)80)
        (= (station-distance s2 s3)25)
        (= (station-distance s3 s4)70)
        (= (station-distance s4 s5)60)
        (= (station-distance s5 s6)60)
        
        (= (station-distance s1 s0)50)
        (= (station-distance s2 s1)80)
        (= (station-distance s3 s2)25)
        (= (station-distance s4 s3)70)
        (= (station-distance s5 s4)60)
        (= (station-distance s6 s5)60)
        
        ;train-speed meters/sec
        
        (=(train-speed t1)15)
        (=(train-speed t2)15)
    )
    
    (:goal
        (and(visited t1 s5)
        (visited t1 s6)
        (visited t2 s2)
        (visited t2 s0)
        )
    )
    (:metric minimize (total-time))

)
