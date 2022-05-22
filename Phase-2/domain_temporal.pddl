(define (domain temporal-train-schedule)
    (:requirements :strips :typing :fluents :durative-actions)


    (:types
        station train - object
    )
    
    (:predicates
        (train-at ?t -train ?s - station)
        (visited ?t - train ?s - station)
        (valid-move ?t - train ?from ?to - station)
    )
    
    (:functions
        ;(drive-time ?from ?to - station)
        (train-speed ?t - train)
        (station-distance ?from ?to - station)
    
    )
    
    (:durative-action drive
        :parameters (?t - train ?from ?to - station)
        :duration (= ?duration (/(station-distance ?from ?to ) (train-speed ?t)))
        :condition (and (at start (train-at ?t ?from))
                        (at start (not(visited ?t ?to)))
                        (over all (valid-move ?t ?from ?to))
        )
        :effect(and(at start (not (train-at ?t ?from)))
                    (at end (train-at ?t ?to))
                    (at end (visited ?t ?to))
        
        )
    )
)
