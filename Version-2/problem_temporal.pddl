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
        (valid-move Kaunia Bonapara sl18)
        (valid-move Jaypurhat Santahar sl19)
        (valid-move Bheramara Chuadanga sl20)
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
        
        (= (station-distance Dhaka-Biman-Bandar Dhaka)60)
        (= (station-distance Tongi Dhaka-Biman-Bandar)70)
        (= (station-distance Narsingdi Tongi)50)
        (= (station-distance Bhairab Narsingdi)80)
        (= (station-distance Brahmanbaria Bhairab)75)
        (= (station-distance Akhaura Brahmanbaria)55)
        (= (station-distance Cumilla Akhaura)28)
        (= (station-distance Laksham Cumilla)25)
        (= (station-distance Laksham Feni)90)
        (= (station-distance Feni Chittagong)52)

        (= (station-distance Tongi Joydebpur)20)
        (= (station-distance Joydebpur Mymensingh)40)
        (= (station-distance Joydebpur Tangail)40)
        (= (station-distance Tangail Bangabandhu-Setu)60)
        (= (station-distance Bangabandhu-Setu Ishwardi)30)
        (= (station-distance Ishwardi Bheramara)95)
        (= (station-distance Bheramara Chuadanga)25)
        (= (station-distance Chuadanga Darshana)80)
        (= (station-distance Darshana Jessore)75)

        (= (station-distance Jessore Khulna)45)
        (= (station-distance Ishwardi Abdulpur)20)
        (= (station-distance Abdulpur Rajshahi)70)
        (= (station-distance Rajshahi Amnura)50)
        (= (station-distance Amnura Chanpainawabganj)65)
        (= (station-distance Abdulpur Santahar)55)
        (= (station-distance Santahar Bogra)40)
        (= (station-distance Bogra Bonapara)30)
        (= (station-distance Bonapara Gaibanda)40)
        (= (station-distance Gaibanda Kaunia)20)
        (= (station-distance Santahar Jaypurhat)35)
        (= (station-distance Jaypurhat Parbatipur)60)
        (= (station-distance Parbatipur Dinajpur)26)
        (= (station-distance Dinajpur Thakurgaon)47)
        (= (station-distance Thakurgaon Panchagar)50)
        (= (station-distance Parbatipur Rangpur)36)
        (= (station-distance Rangpur Kaunia)61)
        (= (station-distance Kaunia Tista)47)
        (= (station-distance Tista Lalmonir-Hat)36)
        (= (station-distance Lalmonir-Hat Tush-Bhandar)45)
        (= (station-distance Tush-Bhandar Patgram)55)
        (= (station-distance Patgram Burimari)68)
        (= (station-distance Tista Kurigram)88)
        (= (station-distance Akhaura Shaestaganj)35)
        (= (station-distance Shaestaganj Kulaura)40)
        (= (station-distance Kulaura Sylhet)30)
        (= (station-distance Cumilla Maijdi-Court)42)
        (= (station-distance Maijdi-Court Noakhali)80)

        (= (station-distance Parbatipur Saiydpur)45)
        (= (station-distance Saiydpur Nilphamari)65)
        (= (station-distance Nilphamari Chilahati)55)
        
        
        ; Reverse station-distance
        (= (station-distance Dhaka Dhaka-Biman-Bandar)60)
        (= (station-distance Dhaka-Biman-Bandar Tongi)70)
        (= (station-distance Tongi Narsingdi)50)
        (= (station-distance Narsingdi Bhairab)80)
        (= (station-distance Bhairab Brahmanbaria)75)
        (= (station-distance Brahmanbaria Akhaura)55)
        (= (station-distance Akhaura Cumilla)28)
        (= (station-distance Cumilla Laksham)25)
        (= (station-distance Laksham Feni)90)
        (= (station-distance Feni Chittagong)52)

        (= (station-distance Joydebpur Tongi)20)
        (= (station-distance Mymensingh Joydebpur)40)
        (= (station-distance Tangail Joydebpur)40)
        (= (station-distance Bangabandhu-Setu Tangail)60)
        (= (station-distance Ishwardi Bangabandhu-Setu)30)
        (= (station-distance Bheramara Ishwardi)95)
        (= (station-distance Chuadanga Bheramara)25)
        (= (station-distance Darshana Chuadanga)80)
        (= (station-distance Jessore Darshana)75)

        (= (station-distance Khulna Jessore)45)
        (= (station-distance Abdulpur Ishwardi)20)
        (= (station-distance Rajshahi Abdulpur)70)
        (= (station-distance Amnura Rajshahi)50)
        (= (station-distance Chanpainawabganj Amnura)65)
        (= (station-distance Santahar Abdulpur)55)
        (= (station-distance Bogra Santahar)40)
        (= (station-distance Bonapara Bogra)30)
        (= (station-distance Gaibanda Bonapara)40)
        (= (station-distance Kaunia Gaibanda)20)
        (= (station-distance Jaypurhat Santahar)35)
        (= (station-distance Parbatipur Jaypurhat)60)
        (= (station-distance Dinajpur Parbatipur)26)
        (= (station-distance Thakurgaon Dinajpur)47)
        (= (station-distance Panchagar Thakurgaon)50)
        (= (station-distance Rangpur Parbatipur)36)
        (= (station-distance Kaunia Rangpur)61)
        (= (station-distance Tista Kaunia)47)
        (= (station-distance Lalmonir-Hat Tista)36)
        (= (station-distance Tush-Bhandar Lalmonir-Hat)45)
        (= (station-distance Patgram Tush-Bhandar)55)
        (= (station-distance Burimari Patgram)68)
        (= (station-distance Kurigram Tista)88)
        (= (station-distance Shaestaganj Akhaura)35)
        (= (station-distance Kulaura Shaestaganj)40)
        (= (station-distance Sylhet Kulaura)30)
        (= (station-distance Maijdi-Court Cumilla)42)
        (= (station-distance Noakhali Maijdi-Court)80)


        (= (station-distance Saiydpur Parbatipur)45)
        (= (station-distance Nilphamari Saiydpur)65)
        (= (station-distance Chilahati Nilphamari)55)

        
        

        
(maintenance-line rl2)

(=(train-speed titumir-express)45)
(train-at titumir-express Rajshahi)
(visited titumir-express Rajshahi)
(stoppage-at titumir-express Abdulpur)
(stoppage-at titumir-express Santahar)
(stoppage-at titumir-express Jaypurhat)
(stoppage-at titumir-express Parbatipur)
(stoppage-at titumir-express Saiydpur)
(stoppage-at titumir-express Nilphamari)
(stoppage-at titumir-express Chilahati)

(=(train-speed upobon-express)40)
(train-at upobon-express Sylhet)
(visited upobon-express Sylhet)
(stoppage-at upobon-express Kulaura)
(stoppage-at upobon-express Shaestaganj)
(stoppage-at upobon-express Akhaura)
(stoppage-at upobon-express Brahmanbaria)
(stoppage-at upobon-express Bhairab)
(stoppage-at upobon-express Dhaka-Biman-Bandar)
(stoppage-at upobon-express Dhaka)
)
(:goal
(and(visited titumir-express Abdulpur)
(visited titumir-express Santahar)
(visited titumir-express Jaypurhat)
(visited titumir-express Parbatipur)
(visited titumir-express Saiydpur)
(visited titumir-express Nilphamari)
(visited titumir-express Chilahati)
(visited upobon-express Kulaura)
(visited upobon-express Shaestaganj)
(visited upobon-express Akhaura)
(visited upobon-express Brahmanbaria)
(visited upobon-express Bhairab)
(visited upobon-express Dhaka-Biman-Bandar)
(visited upobon-express Dhaka)
))
(:metric minimize (total-cost))
)
