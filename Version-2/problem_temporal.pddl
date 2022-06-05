(define (problem train-scheduling)
    (:domain temporal-train-schedule)
    (:objects 
        ;Train Name
        suborno-express truna-express bonolota-express - train
        ekota-express drutojan-express chitra-express - train
        sundorban-express paharika-express upobon-express - train
        titumir-express rupsha-express kurigram-express - train
        kapataksha-express udayan-express upokul-express - train
        ;Station Name
        Dhaka Dhaka-Biman-Bandar Tongi Narsingdi Bhairab - station
        Brahmanbaria Akhaura Cumilla Laksham Feni Chittagong - station
        Maijdi-Court Noakhali Shaestaganj Kulaura Sylhet - station
        Joydebpur Mymensingh Tangail Bangabandhu-Setu - station
        Ishwardi Khulna Abdulpur Rajshahi - station
        Bheramara Chuadanga Darshana Jessore Amnura - station
        Chanpainawabganj Santahar Jaypurhat Parbatipur - station
        Bogra Bonapara Gaibanda Dinajpur Thakurgaon - station
        Panchagar Rangpur Kaunia Tista Kurigram - station
        Lalmonir-Hat Tush-Bhandar Patgram Burimari - station
        Nilphamari Chilahati Saiydpur - station
        ;Forward Line
        fl1 fl2 fl3 fl4 fl5 fl6 fl7 fl8 fl9 fl10 - forward-line
        ;Reverse Line
        rl1 rl2 rl3 rl4 rl5 rl6 rl7 rl8 rl9 rl10 - reverse-line
        ;Single Line
        sl1 sl2 sl3 sl4 sl5 sl6 sl7 sl8 sl9 sl10 - single-line
        sl11 sl12 sl13 sl14 sl15 sl16 sl17 sl18 - single-line 
        sl19 sl20 sl21 sl22 sl23 sl24 sl25 sl26  - single-line
        sl27 sl28 sl29 sl30 sl31 sl32 sl33 sl34 - single-line
        sl35 sl36 sl37 sl38 sl39 sl40 - single-line

    )
    
    (:init


        ;Forward Move
        (valid-move Dhaka Dhaka-Biman-Bandar fl1)
        (valid-move Dhaka-Biman-Bandar Tongi fl2)
        (valid-move Tongi Narsingdi fl3)
        (valid-move Narsingdi Bhairab fl4)
        (valid-move Bhairab Brahmanbaria fl5)

        (valid-move Brahmanbaria Akhaura fl6)
        (valid-move Akhaura Cumilla fl7)
        (valid-move Cumilla Laksham fl8)
        (valid-move Laksham Feni fl9)
        (valid-move Feni Chittagong fl10)

        (valid-move Tongi Joydebpur sl1)
        (valid-move Joydebpur Mymensingh sl2)
        (valid-move Joydebpur Tangail sl3)
        (valid-move Tangail Bangabandhu-Setu sl4)
        (valid-move Bangabandhu-Setu Ishwardi sl5)
        (valid-move Ishwardi Bheramara sl6)
        (valid-move Bheramara Chuadanga sl7)
        (valid-move Chuadanga Darshana sl8)
        (valid-move Darshana Jessore sl9)
        (valid-move Jessore Khulna sl10)
        (valid-move Ishwardi Abdulpur sl11)
        (valid-move Abdulpur Rajshahi sl12)
        (valid-move Rajshahi Amnura sl13)
        
        (valid-move Amnura Chanpainawabganj sl14)
        (valid-move Abdulpur Santahar sl15)
        (valid-move Santahar Bogra sl16)
        (valid-move Bogra Bonapara sl17)
        (valid-move Bonapara Gaibanda sl18)
        (valid-move Gaibanda Kaunia sl19)
        (valid-move Santahar Jaypurhat sl20)
        (valid-move Jaypurhat Parbatipur sl21)
        (valid-move Parbatipur Dinajpur sl22)
        (valid-move Dinajpur Thakurgaon sl23)
        (valid-move Thakurgaon Panchagar sl24)
        (valid-move Parbatipur Rangpur sl25)
        (valid-move Rangpur Kaunia sl26)

       
        
        (valid-move Kaunia Tista sl27)
        (valid-move Tista Lalmonir-Hat sl28)
        (valid-move Lalmonir-Hat Tush-Bhandar sl29)
        (valid-move Tush-Bhandar Patgram sl30)
        (valid-move Patgram Burimari sl31)
        (valid-move Tista Kurigram sl32)
        (valid-move Akhaura Shaestaganj sl33)
        (valid-move Shaestaganj Kulaura sl34)
        (valid-move Kulaura Sylhet sl35)
        (valid-move Cumilla Maijdi-Court sl36)
        (valid-move Maijdi-Court Noakhali sl37)

        (valid-move  Parbatipur Saiydpur sl38)
        (valid-move  Saiydpur Nilphamari sl39)
        (valid-move  Nilphamari Chilahati sl40)
      
        ;Reverse Move
        (valid-move Chittagong Feni rl1)
        (valid-move Feni Laksham rl2)
        (valid-move Laksham Cumilla rl3)
        (valid-move Cumilla Akhaura rl4)
        (valid-move Akhaura Brahmanbaria rl5)
        (valid-move Brahmanbaria Bhairab rl6)
        (valid-move Bhairab Narsingdi rl7)
        (valid-move Narsingdi Tongi rl8)
        (valid-move Tongi Dhaka-Biman-Bandar rl9)
        (valid-move Dhaka-Biman-Bandar Dhaka rl10)
        
        (valid-move Joydebpur Tongi sl1)
        (valid-move Mymensingh Joydebpur sl2)
        (valid-move Tangail Joydebpur sl3)
        (valid-move Bangabandhu-Setu Tangail sl4)
        (valid-move Ishwardi Bangabandhu-Setu sl5)
        (valid-move Bheramara Ishwardi sl6)
        (valid-move Chuadanga Bheramara sl7)
        (valid-move Darshana Chuadanga sl8)
        (valid-move Jessore Darshana sl9)
        (valid-move Khulna Jessore sl10)
        
        (valid-move Abdulpur Ishwardi sl11)
        (valid-move Rajshahi Abdulpur sl12)
        (valid-move Amnura Rajshahi sl13)
        (valid-move Chanpainawabganj Amnura sl14)
        (valid-move Santahar Abdulpur sl15)
        (valid-move Bogra Santahar sl16)
        (valid-move Bonapara Bogra sl17)
        (valid-move Gaibanda Bonapara sl18)
        (valid-move Kaunia Gaibanda sl19)
        (valid-move Jaypurhat Santahar sl20)
        (valid-move Parbatipur Jaypurhat sl21)
        (valid-move Dinajpur Parbatipur sl22)
        (valid-move Thakurgaon Dinajpur sl23)
        (valid-move Panchagar Thakurgaon sl24)
        (valid-move Rangpur Parbatipur sl25)
        (valid-move Kaunia Rangpur sl26)

        
        
        (valid-move Tista Kaunia sl27)
        (valid-move Lalmonir-Hat Tista sl28)
        (valid-move Tush-Bhandar Lalmonir-Hat sl29)
        (valid-move Patgram Tush-Bhandar sl30)
        (valid-move Burimari Patgram sl31)
        (valid-move Kurigram Tista sl32)
        (valid-move Shaestaganj Akhaura sl33)
        (valid-move Kulaura Shaestaganj sl34)
        (valid-move Sylhet Kulaura sl35)
        (valid-move Maijdi-Court Cumilla sl36)
        (valid-move Noakhali Maijdi-Court sl37)

        (valid-move  Saiydpur Parbatipur sl38)
        (valid-move  Nilphamari Saiydpur sl39)
        (valid-move  Chilahati Nilphamari sl40)
        
        

       
        ;line-status

        (free-line fl1)
        (free-line fl2)
        (free-line fl3)
        (free-line fl4)
        (free-line fl5)
        (free-line fl6)
        (free-line fl7)
        (free-line fl8)
        (free-line fl9)
        (free-line fl10)

        (free-line rl1)
        (free-line rl2)
        (free-line rl3)
        (free-line rl4)
        (free-line rl5)
        (free-line rl6)
        (free-line rl7)
        (free-line rl8)
        (free-line rl9)
        (free-line rl10)

        (free-line sl1)
        (free-line sl2)
        (free-line sl3)
        (free-line sl4)
        (free-line sl5)
        (free-line sl6)
        (free-line sl7)
        (free-line sl8)
        (free-line sl9)
        (free-line sl10)
        (free-line sl11)
        (free-line sl12)
        
        
        (free-line sl13)
        (free-line sl14)
        (free-line sl15)
        (free-line sl16)
        (free-line sl17)
        (free-line sl18)
        (free-line sl19)
        (free-line sl20)
        (free-line sl21)
        (free-line sl22)
        

        (free-line sl23)
        (free-line sl24)
        (free-line sl25)
        (free-line sl26)
        (free-line sl27)
        (free-line sl28)
        (free-line sl29)
        (free-line sl30)
        (free-line sl31)
        (free-line sl32)
        (free-line sl33)
        (free-line sl34)
        (free-line sl35)
        (free-line sl36)
        (free-line sl37)
        (free-line sl38)
        (free-line sl39)
        (free-line sl40)

        
        ;station-distance in meters
        


        (= (station-distance Dhaka Dhaka-Biman-Bandar)20)
        (= (station-distance Dhaka-Biman-Bandar Tongi)15)
        (= (station-distance Tongi Narsingdi)18)
        (= (station-distance Narsingdi Bhairab)19)
        (= (station-distance Bhairab Brahmanbaria)25)
        (= (station-distance Brahmanbaria Akhaura)28)
        (= (station-distance Akhaura Cumilla)25)
        (= (station-distance Cumilla Laksham)23)
        (= (station-distance Laksham Feni)15)
        (= (station-distance Feni Chittagong)20)
        (= (station-distance Tongi Joydebpur)28)
        (= (station-distance Joydebpur Mymensingh)18)
        (= (station-distance Joydebpur Tangail)30)
        (= (station-distance Tangail Bangabandhu-Setu)25)
        (= (station-distance Bangabandhu-Setu Ishwardi)30)
        (= (station-distance Ishwardi Bheramara)38)
        (= (station-distance Bheramara Chuadanga)25)
        (= (station-distance Chuadanga Darshana)23)
        (= (station-distance Darshana Jessore)21)
        (= (station-distance Jessore Khulna)20)
        (= (station-distance Ishwardi Abdulpur)27)
        (= (station-distance Abdulpur Rajshahi)38)
        (= (station-distance Rajshahi Amnura)31)
        (= (station-distance Amnura Chanpainawabganj)35)
        (= (station-distance Abdulpur Santahar)22)
        (= (station-distance Santahar Bogra)28)
       
        (= (station-distance Bogra Bonapara)30)
        (= (station-distance Bonapara Gaibanda)31)
        (= (station-distance Gaibanda Kaunia)20)
        (= (station-distance Santahar Jaypurhat)35)
        (= (station-distance Jaypurhat Parbatipur)34)
        (= (station-distance Parbatipur Dinajpur)26)
        (= (station-distance Dinajpur Thakurgaon)16)
        (= (station-distance Thakurgaon Panchagar)27)
        (= (station-distance Parbatipur Rangpur)36)
        (= (station-distance Rangpur Kaunia)31)
        (= (station-distance Kaunia Tista)37)
        (= (station-distance Tista Lalmonir-Hat)36)
        (= (station-distance Lalmonir-Hat Tush-Bhandar)25)
        (= (station-distance Tush-Bhandar Patgram)18)
        (= (station-distance Patgram Burimari)28)
        (= (station-distance Tista Kurigram)19)
        (= (station-distance Akhaura Shaestaganj)35)
        (= (station-distance Shaestaganj Kulaura)34)
        (= (station-distance Kulaura Sylhet)30)
        (= (station-distance Cumilla Maijdi-Court)32)
        (= (station-distance Maijdi-Court Noakhali)20)
        (= (station-distance Parbatipur Saiydpur)35)
        (= (station-distance Saiydpur Nilphamari)20)
        (= (station-distance Nilphamari Chilahati)15)
        
        
        ; Reverse station-distance
        (= (station-distance Dhaka-Biman-Bandar Dhaka)20)
        (= (station-distance Tongi Dhaka-Biman-Bandar)15)
        (= (station-distance Narsingdi Tongi)18)
        (= (station-distance Bhairab Narsingdi)19)
        (= (station-distance Brahmanbaria Bhairab)25)
        (= (station-distance Akhaura Brahmanbaria)28)
        (= (station-distance Cumilla Akhaura)25)
        (= (station-distance Laksham Cumilla)23)
        (= (station-distance Feni Laksham)15)
        (= (station-distance Chittagong Feni)20)
        (= (station-distance Joydebpur Tongi)28)
        (= (station-distance Mymensingh Joydebpur)18)
        (= (station-distance Tangail Joydebpur)30)
        (= (station-distance Bangabandhu-Setu Tangail)25)
        (= (station-distance Ishwardi Bangabandhu-Setu)30)
        (= (station-distance Bheramara Ishwardi)38)
        (= (station-distance Chuadanga Bheramara)25)
        (= (station-distance Darshana Chuadanga)23)
        (= (station-distance Jessore Darshana)21)
        (= (station-distance Khulna Jessore)20)


        (= (station-distance Abdulpur Ishwardi)27)
        (= (station-distance Rajshahi Abdulpur)38)
        (= (station-distance Amnura Rajshahi)31)
        (= (station-distance Chanpainawabganj Amnura)35)
        (= (station-distance Santahar Abdulpur)22)
        (= (station-distance Bogra Santahar)28)
       
        (= (station-distance Bonapara Bogra)30)
        (= (station-distance Gaibanda Bonapara)31)
        (= (station-distance Kaunia Gaibanda)20)
        (= (station-distance Jaypurhat Santahar)35)
        (= (station-distance Parbatipur Jaypurhat)34)
        (= (station-distance Dinajpur Parbatipur)26)
        (= (station-distance Thakurgaon Dinajpur)16)
        (= (station-distance Panchagar Thakurgaon)27)
        (= (station-distance Rangpur Parbatipur)36)
        (= (station-distance Kaunia Rangpur)31)
        (= (station-distance Tista Kaunia)37)
        (= (station-distance Lalmonir-Hat Tista)36)
        (= (station-distance Tush-Bhandar Lalmonir-Hat)25)
        (= (station-distance Patgram Tush-Bhandar)18)
        (= (station-distance Burimari Patgram)28)
        (= (station-distance Kurigram Tista)19)
        (= (station-distance Shaestaganj Akhaura)35)
        (= (station-distance Kulaura Shaestaganj)34)
        (= (station-distance Sylhet Kulaura)30)
        (= (station-distance Maijdi-Court Cumilla)32)
        (= (station-distance Noakhali Maijdi-Court)20)
        (= (station-distance Saiydpur Parbatipur)35)
        (= (station-distance Nilphamari Saiydpur)20)
        (= (station-distance Chilahati Nilphamari)15)
    
        

        
(=(train-speed chitra-express)15)
(train-at chitra-express Khulna)
(visited chitra-express Khulna)
(stoppage-at chitra-express Ishwardi)
(stoppage-at chitra-express Bangabandhu-Setu)
(stoppage-at chitra-express Tangail)
(stoppage-at chitra-express Joydebpur)
(stoppage-at chitra-express Dhaka-Biman-Bandar)
(stoppage-at chitra-express Dhaka)

(=(train-speed rupsha-express)15)
(train-at rupsha-express Khulna)
(visited rupsha-express Khulna)
(stoppage-at rupsha-express Jessore)
(stoppage-at rupsha-express Chuadanga)
(stoppage-at rupsha-express Bheramara)
(stoppage-at rupsha-express Abdulpur)
(stoppage-at rupsha-express Santahar)
(stoppage-at rupsha-express Jaypurhat)
(stoppage-at rupsha-express Parbatipur)
(stoppage-at rupsha-express Saiydpur)
(stoppage-at rupsha-express Nilphamari)
(stoppage-at rupsha-express Chilahati)
)
(:goal
(and(visited chitra-express Ishwardi)
(visited chitra-express Bangabandhu-Setu)
(visited chitra-express Tangail)
(visited chitra-express Joydebpur)
(visited chitra-express Dhaka-Biman-Bandar)
(visited chitra-express Dhaka)
(visited rupsha-express Jessore)
(visited rupsha-express Chuadanga)
(visited rupsha-express Bheramara)
(visited rupsha-express Abdulpur)
(visited rupsha-express Santahar)
(visited rupsha-express Jaypurhat)
(visited rupsha-express Parbatipur)
(visited rupsha-express Saiydpur)
(visited rupsha-express Nilphamari)
(visited rupsha-express Chilahati)
))
(:metric minimize (total-cost))
)
