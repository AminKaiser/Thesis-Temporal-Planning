(define (domain temporal-train-schedule)
    (:requirements :strips :typing :fluents :durative-actions :negative-preconditions)


    (:types
        station train line - object
        forward-line reverse-line - line
    )
    
    (:predicates
        (train-at ?t -train ?s - station)
        (visited ?t - train ?s - station)
        (valid-move ?t - train ?from ?to - station ?l - line)
    )
    
    (:functions
        ;(drive-time ?from ?to - station)
        (train-speed ?t - train)
        (station-distance ?from ?to - station)
    
    )
    
    (:durative-action drive
        :parameters (?t - train ?from ?to - station ?l - line)
        :duration (= ?duration (/(station-distance ?from ?to ) (train-speed ?t)))
        ;:duration (= ?duration (drive-time ?from ?to))
        :condition (and (at start (train-at ?t ?from))
                        (at start (not(visited ?t ?to)))
                        (over all (valid-move ?t ?from ?to ?l))
        )
        :effect(and(at start (not (train-at ?t ?from)))
                    (at end (train-at ?t ?to))
                    (at end (visited ?t ?to))
        
        )
    )
)
