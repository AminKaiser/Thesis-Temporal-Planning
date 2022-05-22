(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        t1 t2 - train
        s0 s1 s2 s3 - station
        fl1 fl2 fl3 - forward-line
        rl1 rl2 rl3 - reverse-line

    )
    
    (:init
        (train-at t1 s0)
        (train-at t2 s3)
        
        (visited t1 s0)
        (visited t2 s3)

        ;(valid-move s0 s1)
        ;(valid-move s1 s2)
        ;(valid-move s2 s3)
        
        (valid-move t1 s0 s1 fl1)
        (valid-move t1 s1 s2 fl2)
        (valid-move t1 s2 s3 fl3)
        
        (valid-move t2 s3 s2 rl1)
        (valid-move t2 s2 s1 rl2)
        (valid-move t2 s1 s0 rl3)
        
        ;drive time initialization
        ; (= (drive-time s0 s1)20)
        ; (= (drive-time s1 s2)30)
        ; (= (drive-time s2 s3)25)
        
        ; (= (drive-time s1 s0)20)
        ; (= (drive-time s2 s1)30)
        ; (= (drive-time s3 s2)25)

        ;station-distance in meters
        (= (station-distance s0 s1)100)
        (= (station-distance s1 s2)200)
        (= (station-distance s2 s3)150)
        
        (= (station-distance s1 s0)100)
        (= (station-distance s2 s1)200)
        (= (station-distance s3 s2)150)
        
        ;train-speed meters/sec
        
        (=(train-speed t1)20)
        (=(train-speed t2)15)
    )
    
    (:goal
        (and(visited t1 s3)
        (visited t2 s0)
        )
    
    )

)
