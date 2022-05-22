(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        t1 t2 t3 - train
        s0 s1 s2 s3 - station
    )
    
    (:init
        (train-at t1 s0)
        (train-at t2 s3)
        
        (visited t1 s0)
        (visited t2 s3)
        
        (valid-move t1 s0 s1)
        (valid-move t1 s1 s2)
        (valid-move t1 s2 s3)
        
        (valid-move t1 s1 s0)
        (valid-move t1 s2 s1)
        (valid-move t1 s3 s2)
        
        
        (valid-move t2 s0 s1)
        (valid-move t2 s1 s2)
        (valid-move t2 s2 s3)
        
        (valid-move t2 s1 s0)
        (valid-move t2 s2 s1)
        (valid-move t2 s3 s2)
        
        ;drive time initialization
        (= (drive-time s0 s1)20)
        (= (drive-time s1 s2)30)
        (= (drive-time s2 s3)25)
        
        (= (drive-time s1 s0)20)
        (= (drive-time s2 s1)30)
        (= (drive-time s3 s2)25)
    )
    
    (:goal
        (and(visited t1 s3)
        (visited t2 s0)
        )
    
    )

)
