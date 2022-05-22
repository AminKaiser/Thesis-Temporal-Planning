(define (domain temporal-train-schedule)
    (:requirements :strips :typing :fluents :durative-actions :negative-preconditions)


    (:types
        station train line - object
        forward-line reverse-line single-line - line
        ;s0 s1 s2 s3 s4 - station
        ;pf1 pf2 pf3 - s0
    )
    
    (:predicates
        (train-at ?t -train ?s - station)
        (visited ?t - train ?s - station)
        (valid-move ?from ?to - station ?l - line)
        (stoppage-at ?t - train ?s - station)
        (free-line ?l - line)
    )
    
    (:functions
        (train-speed ?t - train)
        (station-distance ?from ?to - station)
        (waiting-time)
    
    )
    
    (:durative-action drive
        :parameters (?t - train ?from ?to - station ?l - line)
        :duration (= ?duration (/(station-distance ?from ?to ) (train-speed ?t)))
        :condition (and (at start (train-at ?t ?from))
                        (at start (free-line ?l))
                        (over all (valid-move ?from ?to ?l))
        )
        :effect(and(at start (not (train-at ?t ?from)))
                    (at start (not (free-line ?l)))
                    (at end (train-at ?t ?to))
                    (at end (free-line ?l))
        
        )
    )

    (:durative-action stop
        :parameters (?t - train ?s - station)
        :duration (= ?duration 2)
        :condition (and 
            (over all (train-at ?t ?s))
            (at start (stoppage-at ?t ?s))
        )
        :effect (and 
            (at start (not (stoppage-at ?t ?s)))
            (at end (visited ?t ?s))
        )
    )

    (:durative-action wait-at
        :parameters (?from - station ?t - train ?to - station ?l - line)
        :duration (= ?duration 2)
        :condition (and 
            (at start (train-at ?t ?from))
            (at start (not(free-line ?l)))
            (over all (valid-move ?from ?to ?l)) 
        )
        :effect (and 
            (at end (train-at ?t ?from))
        )
    )
    
    
)
