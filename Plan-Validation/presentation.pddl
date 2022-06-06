(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        ;Train Name
        drutojan-express shapla-express - train
        ;Station Name
        Dhaka Dhaka-Biman-Bandar Tongi Joydebpur Narsingdi Bhairab - station
        ;Forward Line
        fl1 fl2 fl3 fl4 - forward-line
        ;Reverse Line
        rl7 rl8 rl9 rl10 - reverse-line
        ;Single Line
        sl1 - single-line
    )
    (:init
        (=(total-cost)0)
        ;Forward Move
        (valid-move Dhaka Dhaka-Biman-Bandar fl1)
        ..................................
        ;line-status
        (free-line fl1)
        ...............
        ;station-distance
        (= (station-distance Dhaka Dhaka-Biman-Bandar)20)
        ................................................
        ;train speed
        (=(train-speed drutojan-express)15)
        (=(train-speed shapla-express)20)

        (train-at drutojan-express Dhaka)
        (visited drutojan-express Dhaka)
        (train-at shapla-express Bhairab)
        (visited shapla-express Bhairab)
        (stoppage-at drutojan-express Dhaka-Biman-Bandar)
        (stoppage-at shapla-express Tongi)
        (stoppage-at shapla-express Dhaka-Biman-Bandar)


)
(:goal
(and(visited drutojan-express Dhaka-Biman-Bandar)
(visited shapla-express Tongi)
(visited shapla-express Dhaka-Biman-Bandar)

))
(:metric minimize (total-cost))
)

