(define (domain temporal-train-schedule)
    (:requirements :strips :typing :fluents :durative-actions :negative-preconditions)


    (:types
        station train line - object
        forward-line reverse-line - line
        ;s0 s1 s2 s3 s4 - station
        ;pf1 pf2 pf3 - s0
    )
    
    (:predicates
        (train-at ?t -train ?s - station)
        (visited ?t - train ?s - station)
        (valid-move ?from ?to - station ?l - line)
    )
    
    (:functions
        (train-speed ?t - train)
        (station-distance ?from ?to - station)
    
    )
    
    (:durative-action drive
        :parameters (?t - train ?from ?to - station ?l - line)
        :duration (= ?duration (/(station-distance ?from ?to ) (train-speed ?t)))
        :condition (and (at start (train-at ?t ?from))
                        (at start (not(visited ?t ?to)))
                        (over all (valid-move ?from ?to ?l))
        )
        :effect(and(at start (not (train-at ?t ?from)))
                    (at end (train-at ?t ?to))
                    (at end (visited ?t ?to))
        
        )
    )
)
