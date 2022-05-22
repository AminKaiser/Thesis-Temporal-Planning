(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        t1 t2 - train
        s0 s1 s2 s3 s4 - station
        fl1 fl2 fl3 fl4 - forward-line
        rl1 rl2 rl3 rl4 - reverse-line
        pf1 pf2 pf3 - s0

    )
    
    (:init
        (train-at t1 s0)
        (train-at t2 s4)
        
        (visited t1 s0)
        (visited t2 s4)

        (valid-move s0 s1 fl1)
        (valid-move s1 s2 fl2)
        (valid-move s2 s3 fl3)
        (valid-move s3 s4 fl4)

        (valid-move s4 s3 rl1)
        (valid-move s3 s2 rl2)
        (valid-move s2 s1 rl3)
        (valid-move s1 s0 rl4)
        
        
        ;station-distance in meters
        (= (station-distance s0 s1)50)
        (= (station-distance s1 s2)80)
        (= (station-distance s2 s3)25)
        (= (station-distance s3 s4)70)
        
        (= (station-distance s1 s0)50)
        (= (station-distance s2 s1)80)
        (= (station-distance s3 s2)25)
        (= (station-distance s4 s3)70)
        
        ;train-speed meters/sec
        
        (=(train-speed t1)20)
        (=(train-speed t2)15)
    )
    
    (:goal
        (and(visited t1 s4)
        (visited t2 s0)
        )
    
    )

)
