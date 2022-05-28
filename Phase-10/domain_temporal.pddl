(define (domain temporal-train-schedule)
    (:requirements :strips :typing :fluents :durative-actions :negative-preconditions :action-costs :duration-inequalities)


    (:types
        station train line - object
        forward-line reverse-line single-line - line
    )
    
    (:predicates
        (train-at ?t -train ?s - station)
        (visited ?t - train ?s - station)
        (valid-move ?from ?to - station ?l - line)
        (stoppage-at ?t - train ?s - station)
        (free-line ?l - line)
        (maintenance-line ?l - line)

    )
    (:functions
(train-speed ?t - train)
        (station-distance ?from ?to - station)
        (waiting-time)
    (total-cost) - number
    
    )
    
    (:durative-action drive
        :parameters (?t - train ?from ?to - station ?l - line)
        :duration (= ?duration (/(station-distance ?from ?to ) (train-speed ?t)))
        :condition (and (at start (train-at ?t ?from))
                        (at start (valid-move ?from ?to ?l))
                        (over all (free-line ?l))
                        (over all (not (maintenance-line ?l)))
                        
        )
        :effect(and(at start (not (train-at ?t ?from)))
                    (at start (not (free-line ?l)))
                    (at end (train-at ?t ?to))
                    (at end (free-line ?l))
                    (at end (increase (total-cost) (* ?duration 1)))
        
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
            (at end (increase (total-cost) (* ?duration 0)))
        )
    )

    (:durative-action wait-at
        :parameters (?from - station ?t - train ?to - station ?l - line)
        :duration (= ?duration 0)
        :condition (and 
            (at start (train-at ?t ?from))
            (at start (not(free-line ?l)))
            (over all (valid-move ?from ?to ?l)) 
        )
        :effect (and (at end (increase (total-cost) (* ?duration 0)))
        )
    )

    (:durative-action maintenance-for
        :parameters (?l - line ?t - train ?from - station ?to - station)
        :duration (= ?duration 3)
        :condition (and 
            (at start (train-at ?t ?from))
            (at start (maintenance-line ?l))
            (at start (valid-move ?from ?to ?l))

        )
        :effect (and 
            (at end (not(maintenance-line ?l) 
            ))
            (at end (increase (total-cost) (* ?duration 0)))
        )
    )
    
)
