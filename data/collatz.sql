-- create collatz graph
-- collatz sequence is calculated using 3x+1 when _id is odd and x/2 when it is even
-- _id: the id being operated on as an int in the collatz sequence
-- prev_set: a possible set of _ids that, when processed, resulted in the current _id
-- next_set: the _id of the next number in the sequence
CREATE TABLE collatz_flotz (_id id, prev_set idset, next_set id);

-- select the next_set from the table where the _id is a given number
SELECT next_set FROM collatz_flotz WHERE _id = 4
SELECT next_set FROM collatz_flotz WHERE _id = 2
SELECT next_set FROM collatz_flotz WHERE _id = 1

-- having reached the end of the line (1), or have found the connection, we insert
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (4, [1], 2),(2, [4], 1),(1, [2], 4);

-- continue the process (here we have a duplicate entry for 1, which only happens once due to the code being written the way it is)
SELECT next_set FROM collatz_flotz WHERE _id = 1
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1, [2], 4);

-- continuing on...
SELECT next_set FROM collatz_flotz WHERE _id = 10
SELECT next_set FROM collatz_flotz WHERE _id = 5
SELECT next_set FROM collatz_flotz WHERE _id = 16
SELECT next_set FROM collatz_flotz WHERE _id = 8
SELECT next_set FROM collatz_flotz WHERE _id = 4
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (10, [3], 5),(5, [10], 16),(16, [5], 8),(8, [16], 4),(4, [8], 2);
SELECT next_set FROM collatz_flotz WHERE _id = 2
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (2, [4], 1);
SELECT next_set FROM collatz_flotz WHERE _id = 16
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (16, [5], 8);
SELECT next_set FROM collatz_flotz WHERE _id = 3
SELECT next_set FROM collatz_flotz WHERE _id = 10
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (3, [6], 10),(10, [3], 5);

-- here we find a longer sequence that we have before
SELECT next_set FROM collatz_flotz WHERE _id = 22
SELECT next_set FROM collatz_flotz WHERE _id = 11
SELECT next_set FROM collatz_flotz WHERE _id = 34
SELECT next_set FROM collatz_flotz WHERE _id = 17
SELECT next_set FROM collatz_flotz WHERE _id = 52
SELECT next_set FROM collatz_flotz WHERE _id = 26
SELECT next_set FROM collatz_flotz WHERE _id = 13
SELECT next_set FROM collatz_flotz WHERE _id = 40
SELECT next_set FROM collatz_flotz WHERE _id = 20
SELECT next_set FROM collatz_flotz WHERE _id = 10
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (22, [7], 11),(11, [22], 34),(34, [11], 17),(17, [34], 52),(52, [17], 26),(26, [52], 13),(13, [26], 40),(40, [13], 20),(20, [40], 10),(10, [20], 5);
-- and we insert it

-- continuing on
SELECT next_set FROM collatz_flotz WHERE _id = 4
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (4, [8], 2);
SELECT next_set FROM collatz_flotz WHERE _id = 28
SELECT next_set FROM collatz_flotz WHERE _id = 14
SELECT next_set FROM collatz_flotz WHERE _id = 7
SELECT next_set FROM collatz_flotz WHERE _id = 22
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (28, [9], 14),(14, [28], 7),(7, [14], 22),(22, [7], 11);
SELECT next_set FROM collatz_flotz WHERE _id = 5
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (5, [10], 16);
SELECT next_set FROM collatz_flotz WHERE _id = 34
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (34, [11], 17);
SELECT next_set FROM collatz_flotz WHERE _id = 6
SELECT next_set FROM collatz_flotz WHERE _id = 3
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (6, [12], 3),(3, [6], 10);
SELECT next_set FROM collatz_flotz WHERE _id = 40
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (40, [13], 20);
SELECT next_set FROM collatz_flotz WHERE _id = 7
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (7, [14], 22);
SELECT next_set FROM collatz_flotz WHERE _id = 46
SELECT next_set FROM collatz_flotz WHERE _id = 23
SELECT next_set FROM collatz_flotz WHERE _id = 70
SELECT next_set FROM collatz_flotz WHERE _id = 35
SELECT next_set FROM collatz_flotz WHERE _id = 106
SELECT next_set FROM collatz_flotz WHERE _id = 53
SELECT next_set FROM collatz_flotz WHERE _id = 160
SELECT next_set FROM collatz_flotz WHERE _id = 80
SELECT next_set FROM collatz_flotz WHERE _id = 40
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (46, [15], 23),(23, [46], 70),(70, [23], 35),(35, [70], 106),(106, [35], 53),(53, [106], 160),(160, [53], 80),(80, [160], 40),(40, [80], 20);
SELECT next_set FROM collatz_flotz WHERE _id = 8
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (8, [16], 4);
SELECT next_set FROM collatz_flotz WHERE _id = 52
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (52, [17], 26);
SELECT next_set FROM collatz_flotz WHERE _id = 9
SELECT next_set FROM collatz_flotz WHERE _id = 28
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (9, [18], 28),(28, [9], 14);
SELECT next_set FROM collatz_flotz WHERE _id = 58
SELECT next_set FROM collatz_flotz WHERE _id = 29
SELECT next_set FROM collatz_flotz WHERE _id = 88
SELECT next_set FROM collatz_flotz WHERE _id = 44
SELECT next_set FROM collatz_flotz WHERE _id = 22
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (58, [19], 29),(29, [58], 88),(88, [29], 44),(44, [88], 22),(22, [44], 11);
SELECT next_set FROM collatz_flotz WHERE _id = 10
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (10, [20], 5);
SELECT next_set FROM collatz_flotz WHERE _id = 64
SELECT next_set FROM collatz_flotz WHERE _id = 32
SELECT next_set FROM collatz_flotz WHERE _id = 16
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (64, [21], 32),(32, [64], 16),(16, [32], 8);
SELECT next_set FROM collatz_flotz WHERE _id = 11
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (11, [22], 34);
SELECT next_set FROM collatz_flotz WHERE _id = 70
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (70, [23], 35);
SELECT next_set FROM collatz_flotz WHERE _id = 12
SELECT next_set FROM collatz_flotz WHERE _id = 6
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (12, [24], 6),(6, [12], 3);
SELECT next_set FROM collatz_flotz WHERE _id = 76
SELECT next_set FROM collatz_flotz WHERE _id = 38
SELECT next_set FROM collatz_flotz WHERE _id = 19
SELECT next_set FROM collatz_flotz WHERE _id = 58
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (76, [25], 38),(38, [76], 19),(19, [38], 58),(58, [19], 29);
SELECT next_set FROM collatz_flotz WHERE _id = 13
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (13, [26], 40);

-- we start a large run, where we don't find any of the numbers to connect the graph to
SELECT next_set FROM collatz_flotz WHERE _id = 82
SELECT next_set FROM collatz_flotz WHERE _id = 41
SELECT next_set FROM collatz_flotz WHERE _id = 124
SELECT next_set FROM collatz_flotz WHERE _id = 62
SELECT next_set FROM collatz_flotz WHERE _id = 31
SELECT next_set FROM collatz_flotz WHERE _id = 94
SELECT next_set FROM collatz_flotz WHERE _id = 47
SELECT next_set FROM collatz_flotz WHERE _id = 142
SELECT next_set FROM collatz_flotz WHERE _id = 71
SELECT next_set FROM collatz_flotz WHERE _id = 214
SELECT next_set FROM collatz_flotz WHERE _id = 107
SELECT next_set FROM collatz_flotz WHERE _id = 322
SELECT next_set FROM collatz_flotz WHERE _id = 161
SELECT next_set FROM collatz_flotz WHERE _id = 484
SELECT next_set FROM collatz_flotz WHERE _id = 242
SELECT next_set FROM collatz_flotz WHERE _id = 121
SELECT next_set FROM collatz_flotz WHERE _id = 364
SELECT next_set FROM collatz_flotz WHERE _id = 182
SELECT next_set FROM collatz_flotz WHERE _id = 91
SELECT next_set FROM collatz_flotz WHERE _id = 274
SELECT next_set FROM collatz_flotz WHERE _id = 137
SELECT next_set FROM collatz_flotz WHERE _id = 412
SELECT next_set FROM collatz_flotz WHERE _id = 206
SELECT next_set FROM collatz_flotz WHERE _id = 103
SELECT next_set FROM collatz_flotz WHERE _id = 310
SELECT next_set FROM collatz_flotz WHERE _id = 155
SELECT next_set FROM collatz_flotz WHERE _id = 466
SELECT next_set FROM collatz_flotz WHERE _id = 233
SELECT next_set FROM collatz_flotz WHERE _id = 700
SELECT next_set FROM collatz_flotz WHERE _id = 350
SELECT next_set FROM collatz_flotz WHERE _id = 175
SELECT next_set FROM collatz_flotz WHERE _id = 526
SELECT next_set FROM collatz_flotz WHERE _id = 263
SELECT next_set FROM collatz_flotz WHERE _id = 790
SELECT next_set FROM collatz_flotz WHERE _id = 395
SELECT next_set FROM collatz_flotz WHERE _id = 1186
SELECT next_set FROM collatz_flotz WHERE _id = 593
SELECT next_set FROM collatz_flotz WHERE _id = 1780
SELECT next_set FROM collatz_flotz WHERE _id = 890
SELECT next_set FROM collatz_flotz WHERE _id = 445
SELECT next_set FROM collatz_flotz WHERE _id = 1336
SELECT next_set FROM collatz_flotz WHERE _id = 668
SELECT next_set FROM collatz_flotz WHERE _id = 334
SELECT next_set FROM collatz_flotz WHERE _id = 167
SELECT next_set FROM collatz_flotz WHERE _id = 502
SELECT next_set FROM collatz_flotz WHERE _id = 251
SELECT next_set FROM collatz_flotz WHERE _id = 754
SELECT next_set FROM collatz_flotz WHERE _id = 377
SELECT next_set FROM collatz_flotz WHERE _id = 1132
SELECT next_set FROM collatz_flotz WHERE _id = 566
SELECT next_set FROM collatz_flotz WHERE _id = 283
SELECT next_set FROM collatz_flotz WHERE _id = 850
SELECT next_set FROM collatz_flotz WHERE _id = 425
SELECT next_set FROM collatz_flotz WHERE _id = 1276
SELECT next_set FROM collatz_flotz WHERE _id = 638
SELECT next_set FROM collatz_flotz WHERE _id = 319
SELECT next_set FROM collatz_flotz WHERE _id = 958
SELECT next_set FROM collatz_flotz WHERE _id = 479
SELECT next_set FROM collatz_flotz WHERE _id = 1438
SELECT next_set FROM collatz_flotz WHERE _id = 719
SELECT next_set FROM collatz_flotz WHERE _id = 2158
SELECT next_set FROM collatz_flotz WHERE _id = 1079
SELECT next_set FROM collatz_flotz WHERE _id = 3238
SELECT next_set FROM collatz_flotz WHERE _id = 1619
SELECT next_set FROM collatz_flotz WHERE _id = 4858
SELECT next_set FROM collatz_flotz WHERE _id = 2429
SELECT next_set FROM collatz_flotz WHERE _id = 7288
SELECT next_set FROM collatz_flotz WHERE _id = 3644
SELECT next_set FROM collatz_flotz WHERE _id = 1822
SELECT next_set FROM collatz_flotz WHERE _id = 911
SELECT next_set FROM collatz_flotz WHERE _id = 2734
SELECT next_set FROM collatz_flotz WHERE _id = 1367
SELECT next_set FROM collatz_flotz WHERE _id = 4102
SELECT next_set FROM collatz_flotz WHERE _id = 2051
SELECT next_set FROM collatz_flotz WHERE _id = 6154
SELECT next_set FROM collatz_flotz WHERE _id = 3077
SELECT next_set FROM collatz_flotz WHERE _id = 9232
SELECT next_set FROM collatz_flotz WHERE _id = 4616
SELECT next_set FROM collatz_flotz WHERE _id = 2308
SELECT next_set FROM collatz_flotz WHERE _id = 1154
SELECT next_set FROM collatz_flotz WHERE _id = 577
SELECT next_set FROM collatz_flotz WHERE _id = 1732
SELECT next_set FROM collatz_flotz WHERE _id = 866
SELECT next_set FROM collatz_flotz WHERE _id = 433
SELECT next_set FROM collatz_flotz WHERE _id = 1300
SELECT next_set FROM collatz_flotz WHERE _id = 650
SELECT next_set FROM collatz_flotz WHERE _id = 325
SELECT next_set FROM collatz_flotz WHERE _id = 976
SELECT next_set FROM collatz_flotz WHERE _id = 488
SELECT next_set FROM collatz_flotz WHERE _id = 244
SELECT next_set FROM collatz_flotz WHERE _id = 122
SELECT next_set FROM collatz_flotz WHERE _id = 61
SELECT next_set FROM collatz_flotz WHERE _id = 184
SELECT next_set FROM collatz_flotz WHERE _id = 92
SELECT next_set FROM collatz_flotz WHERE _id = 46

-- and finally, we find a place to insert it
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (82, [27], 41),(41, [82], 124),(124, [41], 62),(62, [124], 31),(31, [62], 94),(94, [31], 47),(47, [94], 142),(142, [47], 71),(71, [142], 214),(214, [71], 107),(107, [214], 322),(322, [107], 161),(161, [322], 484),(484, [161], 242),(242, [484], 121),(121, [242], 364),(364, [121], 182),(182, [364], 91),(91, [182], 274),(274, [91], 137),(137, [274], 412),(412, [137], 206),(206, [412], 103),(103, [206], 310),(310, [103], 155),(155, [310], 466),(466, [155], 233),(233, [466], 700),(700, [233], 350),(350, [700], 175),(175, [350], 526),(526, [175], 263),(263, [526], 790),(790, [263], 395),(395, [790], 1186),(1186, [395], 593),(593, [1186], 1780),(1780, [593], 890),(890, [1780], 445),(445, [890], 1336),(1336, [445], 668),(668, [1336], 334),(334, [668], 167),(167, [334], 502),(502, [167], 251),(251, [502], 754),(754, [251], 377),(377, [754], 1132),(1132, [377], 566),(566, [1132], 283),(283, [566], 850),(850, [283], 425),(425, [850], 1276),(1276, [425], 638),(638, [1276], 319),(319, [638], 958),(958, [319], 479),(479, [958], 1438),(1438, [479], 719),(719, [1438], 2158),(2158, [719], 1079),(1079, [2158], 3238),(3238, [1079], 1619),(1619, [3238], 4858),(4858, [1619], 2429),(2429, [4858], 7288),(7288, [2429], 3644),(3644, [7288], 1822),(1822, [3644], 911),(911, [1822], 2734),(2734, [911], 1367),(1367, [2734], 4102),(4102, [1367], 2051),(2051, [4102], 6154),(6154, [2051], 3077),(3077, [6154], 9232),(9232, [3077], 4616),(4616, [9232], 2308),(2308, [4616], 1154),(1154, [2308], 577),(577, [1154], 1732),(1732, [577], 866),(866, [1732], 433),(433, [866], 1300),(1300, [433], 650),(650, [1300], 325),(325, [650], 976),(976, [325], 488),(488, [976], 244),(244, [488], 122),(122, [244], 61),(61, [122], 184),(184, [61], 92),(92, [184], 46),(46, [92], 23);

-- and continue on with our exploration
SELECT next_set FROM collatz_flotz WHERE _id = 14
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (14, [28], 7);
SELECT next_set FROM collatz_flotz WHERE _id = 88
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (88, [29], 44);
SELECT next_set FROM collatz_flotz WHERE _id = 15
SELECT next_set FROM collatz_flotz WHERE _id = 46
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (15, [30], 46),(46, [15], 23);
SELECT next_set FROM collatz_flotz WHERE _id = 94
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (94, [31], 47);
SELECT next_set FROM collatz_flotz WHERE _id = 16
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (16, [32], 8);
SELECT next_set FROM collatz_flotz WHERE _id = 100
SELECT next_set FROM collatz_flotz WHERE _id = 50
SELECT next_set FROM collatz_flotz WHERE _id = 25
SELECT next_set FROM collatz_flotz WHERE _id = 76
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (100, [33], 50),(50, [100], 25),(25, [50], 76),(76, [25], 38);
SELECT next_set FROM collatz_flotz WHERE _id = 17
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (17, [34], 52);
SELECT next_set FROM collatz_flotz WHERE _id = 106
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (106, [35], 53);
SELECT next_set FROM collatz_flotz WHERE _id = 18
SELECT next_set FROM collatz_flotz WHERE _id = 9
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (18, [36], 9),(9, [18], 28);
SELECT next_set FROM collatz_flotz WHERE _id = 112
SELECT next_set FROM collatz_flotz WHERE _id = 56
SELECT next_set FROM collatz_flotz WHERE _id = 28
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (112, [37], 56),(56, [112], 28),(28, [56], 14);
SELECT next_set FROM collatz_flotz WHERE _id = 19
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (19, [38], 58);
SELECT next_set FROM collatz_flotz WHERE _id = 118
SELECT next_set FROM collatz_flotz WHERE _id = 59
SELECT next_set FROM collatz_flotz WHERE _id = 178
SELECT next_set FROM collatz_flotz WHERE _id = 89
SELECT next_set FROM collatz_flotz WHERE _id = 268
SELECT next_set FROM collatz_flotz WHERE _id = 134
SELECT next_set FROM collatz_flotz WHERE _id = 67
SELECT next_set FROM collatz_flotz WHERE _id = 202
SELECT next_set FROM collatz_flotz WHERE _id = 101
SELECT next_set FROM collatz_flotz WHERE _id = 304
SELECT next_set FROM collatz_flotz WHERE _id = 152
SELECT next_set FROM collatz_flotz WHERE _id = 76
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (118, [39], 59),(59, [118], 178),(178, [59], 89),(89, [178], 268),(268, [89], 134),(134, [268], 67),(67, [134], 202),(202, [67], 101),(101, [202], 304),(304, [101], 152),(152, [304], 76),(76, [152], 38);
SELECT next_set FROM collatz_flotz WHERE _id = 20
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (20, [40], 10);
SELECT next_set FROM collatz_flotz WHERE _id = 124
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (124, [41], 62);
SELECT next_set FROM collatz_flotz WHERE _id = 21
SELECT next_set FROM collatz_flotz WHERE _id = 64
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (21, [42], 64),(64, [21], 32);
SELECT next_set FROM collatz_flotz WHERE _id = 130
SELECT next_set FROM collatz_flotz WHERE _id = 65
SELECT next_set FROM collatz_flotz WHERE _id = 196
SELECT next_set FROM collatz_flotz WHERE _id = 98
SELECT next_set FROM collatz_flotz WHERE _id = 49
SELECT next_set FROM collatz_flotz WHERE _id = 148
SELECT next_set FROM collatz_flotz WHERE _id = 74
SELECT next_set FROM collatz_flotz WHERE _id = 37
SELECT next_set FROM collatz_flotz WHERE _id = 112
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (130, [43], 65),(65, [130], 196),(196, [65], 98),(98, [196], 49),(49, [98], 148),(148, [49], 74),(74, [148], 37),(37, [74], 112),(112, [37], 56);
SELECT next_set FROM collatz_flotz WHERE _id = 22
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (22, [44], 11);
SELECT next_set FROM collatz_flotz WHERE _id = 136
SELECT next_set FROM collatz_flotz WHERE _id = 68
SELECT next_set FROM collatz_flotz WHERE _id = 34
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (136, [45], 68),(68, [136], 34),(34, [68], 17);
SELECT next_set FROM collatz_flotz WHERE _id = 23
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (23, [46], 70);
SELECT next_set FROM collatz_flotz WHERE _id = 142
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (142, [47], 71);
SELECT next_set FROM collatz_flotz WHERE _id = 24
SELECT next_set FROM collatz_flotz WHERE _id = 12
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (24, [48], 12),(12, [24], 6);
SELECT next_set FROM collatz_flotz WHERE _id = 148
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (148, [49], 74);
SELECT next_set FROM collatz_flotz WHERE _id = 25
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (25, [50], 76);
SELECT next_set FROM collatz_flotz WHERE _id = 154
SELECT next_set FROM collatz_flotz WHERE _id = 77
SELECT next_set FROM collatz_flotz WHERE _id = 232
SELECT next_set FROM collatz_flotz WHERE _id = 116
SELECT next_set FROM collatz_flotz WHERE _id = 58
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (154, [51], 77),(77, [154], 232),(232, [77], 116),(116, [232], 58),(58, [116], 29);
SELECT next_set FROM collatz_flotz WHERE _id = 26
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (26, [52], 13);
SELECT next_set FROM collatz_flotz WHERE _id = 160
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (160, [53], 80);
SELECT next_set FROM collatz_flotz WHERE _id = 27
SELECT next_set FROM collatz_flotz WHERE _id = 82
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (27, [54], 82),(82, [27], 41);
SELECT next_set FROM collatz_flotz WHERE _id = 166
SELECT next_set FROM collatz_flotz WHERE _id = 83
SELECT next_set FROM collatz_flotz WHERE _id = 250
SELECT next_set FROM collatz_flotz WHERE _id = 125
SELECT next_set FROM collatz_flotz WHERE _id = 376
SELECT next_set FROM collatz_flotz WHERE _id = 188
SELECT next_set FROM collatz_flotz WHERE _id = 94
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (166, [55], 83),(83, [166], 250),(250, [83], 125),(125, [250], 376),(376, [125], 188),(188, [376], 94),(94, [188], 47);
SELECT next_set FROM collatz_flotz WHERE _id = 28
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (28, [56], 14);
SELECT next_set FROM collatz_flotz WHERE _id = 172
SELECT next_set FROM collatz_flotz WHERE _id = 86
SELECT next_set FROM collatz_flotz WHERE _id = 43
SELECT next_set FROM collatz_flotz WHERE _id = 130
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (172, [57], 86),(86, [172], 43),(43, [86], 130),(130, [43], 65);
SELECT next_set FROM collatz_flotz WHERE _id = 29
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (29, [58], 88);
SELECT next_set FROM collatz_flotz WHERE _id = 178
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (178, [59], 89);
SELECT next_set FROM collatz_flotz WHERE _id = 30
SELECT next_set FROM collatz_flotz WHERE _id = 15
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (30, [60], 15),(15, [30], 46);
SELECT next_set FROM collatz_flotz WHERE _id = 184
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (184, [61], 92);
SELECT next_set FROM collatz_flotz WHERE _id = 31
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (31, [62], 94);
SELECT next_set FROM collatz_flotz WHERE _id = 190
SELECT next_set FROM collatz_flotz WHERE _id = 95
SELECT next_set FROM collatz_flotz WHERE _id = 286
SELECT next_set FROM collatz_flotz WHERE _id = 143
SELECT next_set FROM collatz_flotz WHERE _id = 430
SELECT next_set FROM collatz_flotz WHERE _id = 215
SELECT next_set FROM collatz_flotz WHERE _id = 646
SELECT next_set FROM collatz_flotz WHERE _id = 323
SELECT next_set FROM collatz_flotz WHERE _id = 970
SELECT next_set FROM collatz_flotz WHERE _id = 485
SELECT next_set FROM collatz_flotz WHERE _id = 1456
SELECT next_set FROM collatz_flotz WHERE _id = 728
SELECT next_set FROM collatz_flotz WHERE _id = 364
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (190, [63], 95),(95, [190], 286),(286, [95], 143),(143, [286], 430),(430, [143], 215),(215, [430], 646),(646, [215], 323),(323, [646], 970),(970, [323], 485),(485, [970], 1456),(1456, [485], 728),(728, [1456], 364),(364, [728], 182);
SELECT next_set FROM collatz_flotz WHERE _id = 32
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (32, [64], 16);
SELECT next_set FROM collatz_flotz WHERE _id = 196
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (196, [65], 98);
SELECT next_set FROM collatz_flotz WHERE _id = 33
SELECT next_set FROM collatz_flotz WHERE _id = 100
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (33, [66], 100),(100, [33], 50);
SELECT next_set FROM collatz_flotz WHERE _id = 202
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (202, [67], 101);
SELECT next_set FROM collatz_flotz WHERE _id = 34
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (34, [68], 17);
SELECT next_set FROM collatz_flotz WHERE _id = 208
SELECT next_set FROM collatz_flotz WHERE _id = 104
SELECT next_set FROM collatz_flotz WHERE _id = 52
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (208, [69], 104),(104, [208], 52),(52, [104], 26);
SELECT next_set FROM collatz_flotz WHERE _id = 35
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (35, [70], 106);
SELECT next_set FROM collatz_flotz WHERE _id = 214
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (214, [71], 107);
SELECT next_set FROM collatz_flotz WHERE _id = 36
SELECT next_set FROM collatz_flotz WHERE _id = 18
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (36, [72], 18),(18, [36], 9);
SELECT next_set FROM collatz_flotz WHERE _id = 220
SELECT next_set FROM collatz_flotz WHERE _id = 110
SELECT next_set FROM collatz_flotz WHERE _id = 55
SELECT next_set FROM collatz_flotz WHERE _id = 166
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (220, [73], 110),(110, [220], 55),(55, [110], 166),(166, [55], 83);
SELECT next_set FROM collatz_flotz WHERE _id = 37
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (37, [74], 112);
SELECT next_set FROM collatz_flotz WHERE _id = 226
SELECT next_set FROM collatz_flotz WHERE _id = 113
SELECT next_set FROM collatz_flotz WHERE _id = 340
SELECT next_set FROM collatz_flotz WHERE _id = 170
SELECT next_set FROM collatz_flotz WHERE _id = 85
SELECT next_set FROM collatz_flotz WHERE _id = 256
SELECT next_set FROM collatz_flotz WHERE _id = 128
SELECT next_set FROM collatz_flotz WHERE _id = 64
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (226, [75], 113),(113, [226], 340),(340, [113], 170),(170, [340], 85),(85, [170], 256),(256, [85], 128),(128, [256], 64),(64, [128], 32);
SELECT next_set FROM collatz_flotz WHERE _id = 38
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (38, [76], 19);
SELECT next_set FROM collatz_flotz WHERE _id = 232
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (232, [77], 116);
SELECT next_set FROM collatz_flotz WHERE _id = 39
SELECT next_set FROM collatz_flotz WHERE _id = 118
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (39, [78], 118),(118, [39], 59);
SELECT next_set FROM collatz_flotz WHERE _id = 238
SELECT next_set FROM collatz_flotz WHERE _id = 119
SELECT next_set FROM collatz_flotz WHERE _id = 358
SELECT next_set FROM collatz_flotz WHERE _id = 179
SELECT next_set FROM collatz_flotz WHERE _id = 538
SELECT next_set FROM collatz_flotz WHERE _id = 269
SELECT next_set FROM collatz_flotz WHERE _id = 808
SELECT next_set FROM collatz_flotz WHERE _id = 404
SELECT next_set FROM collatz_flotz WHERE _id = 202
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (238, [79], 119),(119, [238], 358),(358, [119], 179),(179, [358], 538),(538, [179], 269),(269, [538], 808),(808, [269], 404),(404, [808], 202),(202, [404], 101);
SELECT next_set FROM collatz_flotz WHERE _id = 40
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (40, [80], 20);
SELECT next_set FROM collatz_flotz WHERE _id = 244
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (244, [81], 122);
SELECT next_set FROM collatz_flotz WHERE _id = 41
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (41, [82], 124);
SELECT next_set FROM collatz_flotz WHERE _id = 250
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (250, [83], 125);
SELECT next_set FROM collatz_flotz WHERE _id = 42
SELECT next_set FROM collatz_flotz WHERE _id = 21
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (42, [84], 21),(21, [42], 64);
SELECT next_set FROM collatz_flotz WHERE _id = 256
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (256, [85], 128);
SELECT next_set FROM collatz_flotz WHERE _id = 43
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (43, [86], 130);
SELECT next_set FROM collatz_flotz WHERE _id = 262
SELECT next_set FROM collatz_flotz WHERE _id = 131
SELECT next_set FROM collatz_flotz WHERE _id = 394
SELECT next_set FROM collatz_flotz WHERE _id = 197
SELECT next_set FROM collatz_flotz WHERE _id = 592
SELECT next_set FROM collatz_flotz WHERE _id = 296
SELECT next_set FROM collatz_flotz WHERE _id = 148
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (262, [87], 131),(131, [262], 394),(394, [131], 197),(197, [394], 592),(592, [197], 296),(296, [592], 148),(148, [296], 74);
SELECT next_set FROM collatz_flotz WHERE _id = 44
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (44, [88], 22);
SELECT next_set FROM collatz_flotz WHERE _id = 268
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (268, [89], 134);
SELECT next_set FROM collatz_flotz WHERE _id = 45
SELECT next_set FROM collatz_flotz WHERE _id = 136
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (45, [90], 136),(136, [45], 68);
SELECT next_set FROM collatz_flotz WHERE _id = 274
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (274, [91], 137);
SELECT next_set FROM collatz_flotz WHERE _id = 46
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (46, [92], 23);
SELECT next_set FROM collatz_flotz WHERE _id = 280
SELECT next_set FROM collatz_flotz WHERE _id = 140
SELECT next_set FROM collatz_flotz WHERE _id = 70
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (280, [93], 140),(140, [280], 70),(70, [140], 35);
SELECT next_set FROM collatz_flotz WHERE _id = 47
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (47, [94], 142);
SELECT next_set FROM collatz_flotz WHERE _id = 286
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (286, [95], 143);
SELECT next_set FROM collatz_flotz WHERE _id = 48
SELECT next_set FROM collatz_flotz WHERE _id = 24
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (48, [96], 24),(24, [48], 12);
SELECT next_set FROM collatz_flotz WHERE _id = 292
SELECT next_set FROM collatz_flotz WHERE _id = 146
SELECT next_set FROM collatz_flotz WHERE _id = 73
SELECT next_set FROM collatz_flotz WHERE _id = 220
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (292, [97], 146),(146, [292], 73),(73, [146], 220),(220, [73], 110);
SELECT next_set FROM collatz_flotz WHERE _id = 49
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (49, [98], 148);
SELECT next_set FROM collatz_flotz WHERE _id = 298
SELECT next_set FROM collatz_flotz WHERE _id = 149
SELECT next_set FROM collatz_flotz WHERE _id = 448
SELECT next_set FROM collatz_flotz WHERE _id = 224
SELECT next_set FROM collatz_flotz WHERE _id = 112
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (298, [99], 149),(149, [298], 448),(448, [149], 224),(224, [448], 112),(112, [224], 56);
SELECT next_set FROM collatz_flotz WHERE _id = 50
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (50, [100], 25);
SELECT next_set FROM collatz_flotz WHERE _id = 304
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (304, [101], 152);
SELECT next_set FROM collatz_flotz WHERE _id = 51
SELECT next_set FROM collatz_flotz WHERE _id = 154
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (51, [102], 154),(154, [51], 77);
SELECT next_set FROM collatz_flotz WHERE _id = 310
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (310, [103], 155);
SELECT next_set FROM collatz_flotz WHERE _id = 52
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (52, [104], 26);
SELECT next_set FROM collatz_flotz WHERE _id = 316
SELECT next_set FROM collatz_flotz WHERE _id = 158
SELECT next_set FROM collatz_flotz WHERE _id = 79
SELECT next_set FROM collatz_flotz WHERE _id = 238
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (316, [105], 158),(158, [316], 79),(79, [158], 238),(238, [79], 119);
SELECT next_set FROM collatz_flotz WHERE _id = 53
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (53, [106], 160);
SELECT next_set FROM collatz_flotz WHERE _id = 322
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (322, [107], 161);
SELECT next_set FROM collatz_flotz WHERE _id = 54
SELECT next_set FROM collatz_flotz WHERE _id = 27
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (54, [108], 27),(27, [54], 82);
SELECT next_set FROM collatz_flotz WHERE _id = 328
SELECT next_set FROM collatz_flotz WHERE _id = 164
SELECT next_set FROM collatz_flotz WHERE _id = 82
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (328, [109], 164),(164, [328], 82),(82, [164], 41);
SELECT next_set FROM collatz_flotz WHERE _id = 55
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (55, [110], 166);
SELECT next_set FROM collatz_flotz WHERE _id = 334
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (334, [111], 167);
SELECT next_set FROM collatz_flotz WHERE _id = 56
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (56, [112], 28);
SELECT next_set FROM collatz_flotz WHERE _id = 340
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (340, [113], 170);
SELECT next_set FROM collatz_flotz WHERE _id = 57
SELECT next_set FROM collatz_flotz WHERE _id = 172
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (57, [114], 172),(172, [57], 86);
SELECT next_set FROM collatz_flotz WHERE _id = 346
SELECT next_set FROM collatz_flotz WHERE _id = 173
SELECT next_set FROM collatz_flotz WHERE _id = 520
SELECT next_set FROM collatz_flotz WHERE _id = 260
SELECT next_set FROM collatz_flotz WHERE _id = 130
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (346, [115], 173),(173, [346], 520),(520, [173], 260),(260, [520], 130),(130, [260], 65);
SELECT next_set FROM collatz_flotz WHERE _id = 58
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (58, [116], 29);
SELECT next_set FROM collatz_flotz WHERE _id = 352
SELECT next_set FROM collatz_flotz WHERE _id = 176
SELECT next_set FROM collatz_flotz WHERE _id = 88
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (352, [117], 176),(176, [352], 88),(88, [176], 44);
SELECT next_set FROM collatz_flotz WHERE _id = 59
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (59, [118], 178);
SELECT next_set FROM collatz_flotz WHERE _id = 358
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (358, [119], 179);
SELECT next_set FROM collatz_flotz WHERE _id = 60
SELECT next_set FROM collatz_flotz WHERE _id = 30
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (60, [120], 30),(30, [60], 15);
SELECT next_set FROM collatz_flotz WHERE _id = 364
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (364, [121], 182);
SELECT next_set FROM collatz_flotz WHERE _id = 61
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (61, [122], 184);
SELECT next_set FROM collatz_flotz WHERE _id = 370
SELECT next_set FROM collatz_flotz WHERE _id = 185
SELECT next_set FROM collatz_flotz WHERE _id = 556
SELECT next_set FROM collatz_flotz WHERE _id = 278
SELECT next_set FROM collatz_flotz WHERE _id = 139
SELECT next_set FROM collatz_flotz WHERE _id = 418
SELECT next_set FROM collatz_flotz WHERE _id = 209
SELECT next_set FROM collatz_flotz WHERE _id = 628
SELECT next_set FROM collatz_flotz WHERE _id = 314
SELECT next_set FROM collatz_flotz WHERE _id = 157
SELECT next_set FROM collatz_flotz WHERE _id = 472
SELECT next_set FROM collatz_flotz WHERE _id = 236
SELECT next_set FROM collatz_flotz WHERE _id = 118
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (370, [123], 185),(185, [370], 556),(556, [185], 278),(278, [556], 139),(139, [278], 418),(418, [139], 209),(209, [418], 628),(628, [209], 314),(314, [628], 157),(157, [314], 472),(472, [157], 236),(236, [472], 118),(118, [236], 59);
SELECT next_set FROM collatz_flotz WHERE _id = 62
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (62, [124], 31);
SELECT next_set FROM collatz_flotz WHERE _id = 376
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (376, [125], 188);
SELECT next_set FROM collatz_flotz WHERE _id = 63
SELECT next_set FROM collatz_flotz WHERE _id = 190
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (63, [126], 190),(190, [63], 95);
SELECT next_set FROM collatz_flotz WHERE _id = 382
SELECT next_set FROM collatz_flotz WHERE _id = 191
SELECT next_set FROM collatz_flotz WHERE _id = 574
SELECT next_set FROM collatz_flotz WHERE _id = 287
SELECT next_set FROM collatz_flotz WHERE _id = 862
SELECT next_set FROM collatz_flotz WHERE _id = 431
SELECT next_set FROM collatz_flotz WHERE _id = 1294
SELECT next_set FROM collatz_flotz WHERE _id = 647
SELECT next_set FROM collatz_flotz WHERE _id = 1942
SELECT next_set FROM collatz_flotz WHERE _id = 971
SELECT next_set FROM collatz_flotz WHERE _id = 2914
SELECT next_set FROM collatz_flotz WHERE _id = 1457
SELECT next_set FROM collatz_flotz WHERE _id = 4372
SELECT next_set FROM collatz_flotz WHERE _id = 2186
SELECT next_set FROM collatz_flotz WHERE _id = 1093
SELECT next_set FROM collatz_flotz WHERE _id = 3280
SELECT next_set FROM collatz_flotz WHERE _id = 1640
SELECT next_set FROM collatz_flotz WHERE _id = 820
SELECT next_set FROM collatz_flotz WHERE _id = 410
SELECT next_set FROM collatz_flotz WHERE _id = 205
SELECT next_set FROM collatz_flotz WHERE _id = 616
SELECT next_set FROM collatz_flotz WHERE _id = 308
SELECT next_set FROM collatz_flotz WHERE _id = 154
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (382, [127], 191),(191, [382], 574),(574, [191], 287),(287, [574], 862),(862, [287], 431),(431, [862], 1294),(1294, [431], 647),(647, [1294], 1942),(1942, [647], 971),(971, [1942], 2914),(2914, [971], 1457),(1457, [2914], 4372),(4372, [1457], 2186),(2186, [4372], 1093),(1093, [2186], 3280),(3280, [1093], 1640),(1640, [3280], 820),(820, [1640], 410),(410, [820], 205),(205, [410], 616),(616, [205], 308),(308, [616], 154),(154, [308], 77);
SELECT next_set FROM collatz_flotz WHERE _id = 64
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (64, [128], 32);
SELECT next_set FROM collatz_flotz WHERE _id = 388
SELECT next_set FROM collatz_flotz WHERE _id = 194
SELECT next_set FROM collatz_flotz WHERE _id = 97
SELECT next_set FROM collatz_flotz WHERE _id = 292
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (388, [129], 194),(194, [388], 97),(97, [194], 292),(292, [97], 146);
SELECT next_set FROM collatz_flotz WHERE _id = 65
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (65, [130], 196);
SELECT next_set FROM collatz_flotz WHERE _id = 394
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (394, [131], 197);
SELECT next_set FROM collatz_flotz WHERE _id = 66
SELECT next_set FROM collatz_flotz WHERE _id = 33
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (66, [132], 33),(33, [66], 100);
SELECT next_set FROM collatz_flotz WHERE _id = 400
SELECT next_set FROM collatz_flotz WHERE _id = 200
SELECT next_set FROM collatz_flotz WHERE _id = 100
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (400, [133], 200),(200, [400], 100),(100, [200], 50);
SELECT next_set FROM collatz_flotz WHERE _id = 67
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (67, [134], 202);
SELECT next_set FROM collatz_flotz WHERE _id = 406
SELECT next_set FROM collatz_flotz WHERE _id = 203
SELECT next_set FROM collatz_flotz WHERE _id = 610
SELECT next_set FROM collatz_flotz WHERE _id = 305
SELECT next_set FROM collatz_flotz WHERE _id = 916
SELECT next_set FROM collatz_flotz WHERE _id = 458
SELECT next_set FROM collatz_flotz WHERE _id = 229
SELECT next_set FROM collatz_flotz WHERE _id = 688
SELECT next_set FROM collatz_flotz WHERE _id = 344
SELECT next_set FROM collatz_flotz WHERE _id = 172
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (406, [135], 203),(203, [406], 610),(610, [203], 305),(305, [610], 916),(916, [305], 458),(458, [916], 229),(229, [458], 688),(688, [229], 344),(344, [688], 172),(172, [344], 86);
SELECT next_set FROM collatz_flotz WHERE _id = 68
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (68, [136], 34);
SELECT next_set FROM collatz_flotz WHERE _id = 412
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (412, [137], 206);
SELECT next_set FROM collatz_flotz WHERE _id = 69
SELECT next_set FROM collatz_flotz WHERE _id = 208
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (69, [138], 208),(208, [69], 104);
SELECT next_set FROM collatz_flotz WHERE _id = 418
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (418, [139], 209);
SELECT next_set FROM collatz_flotz WHERE _id = 70
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (70, [140], 35);
SELECT next_set FROM collatz_flotz WHERE _id = 424
SELECT next_set FROM collatz_flotz WHERE _id = 212
SELECT next_set FROM collatz_flotz WHERE _id = 106
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (424, [141], 212),(212, [424], 106),(106, [212], 53);
SELECT next_set FROM collatz_flotz WHERE _id = 71
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (71, [142], 214);
SELECT next_set FROM collatz_flotz WHERE _id = 430
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (430, [143], 215);
SELECT next_set FROM collatz_flotz WHERE _id = 72
SELECT next_set FROM collatz_flotz WHERE _id = 36
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (72, [144], 36),(36, [72], 18);
SELECT next_set FROM collatz_flotz WHERE _id = 436
SELECT next_set FROM collatz_flotz WHERE _id = 218
SELECT next_set FROM collatz_flotz WHERE _id = 109
SELECT next_set FROM collatz_flotz WHERE _id = 328
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (436, [145], 218),(218, [436], 109),(109, [218], 328),(328, [109], 164);
SELECT next_set FROM collatz_flotz WHERE _id = 73
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (73, [146], 220);
SELECT next_set FROM collatz_flotz WHERE _id = 442
SELECT next_set FROM collatz_flotz WHERE _id = 221
SELECT next_set FROM collatz_flotz WHERE _id = 664
SELECT next_set FROM collatz_flotz WHERE _id = 332
SELECT next_set FROM collatz_flotz WHERE _id = 166
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (442, [147], 221),(221, [442], 664),(664, [221], 332),(332, [664], 166),(166, [332], 83);
SELECT next_set FROM collatz_flotz WHERE _id = 74
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (74, [148], 37);
SELECT next_set FROM collatz_flotz WHERE _id = 448
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (448, [149], 224);
SELECT next_set FROM collatz_flotz WHERE _id = 75
SELECT next_set FROM collatz_flotz WHERE _id = 226
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (75, [150], 226),(226, [75], 113);
SELECT next_set FROM collatz_flotz WHERE _id = 454
SELECT next_set FROM collatz_flotz WHERE _id = 227
SELECT next_set FROM collatz_flotz WHERE _id = 682
SELECT next_set FROM collatz_flotz WHERE _id = 341
SELECT next_set FROM collatz_flotz WHERE _id = 1024
SELECT next_set FROM collatz_flotz WHERE _id = 512
SELECT next_set FROM collatz_flotz WHERE _id = 256
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (454, [151], 227),(227, [454], 682),(682, [227], 341),(341, [682], 1024),(1024, [341], 512),(512, [1024], 256),(256, [512], 128);
SELECT next_set FROM collatz_flotz WHERE _id = 76
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (76, [152], 38);
SELECT next_set FROM collatz_flotz WHERE _id = 460
SELECT next_set FROM collatz_flotz WHERE _id = 230
SELECT next_set FROM collatz_flotz WHERE _id = 115
SELECT next_set FROM collatz_flotz WHERE _id = 346
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (460, [153], 230),(230, [460], 115),(115, [230], 346),(346, [115], 173);
SELECT next_set FROM collatz_flotz WHERE _id = 77
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (77, [154], 232);
SELECT next_set FROM collatz_flotz WHERE _id = 466
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (466, [155], 233);
SELECT next_set FROM collatz_flotz WHERE _id = 78
SELECT next_set FROM collatz_flotz WHERE _id = 39
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (78, [156], 39),(39, [78], 118);
SELECT next_set FROM collatz_flotz WHERE _id = 472
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (472, [157], 236);
SELECT next_set FROM collatz_flotz WHERE _id = 79
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (79, [158], 238);
SELECT next_set FROM collatz_flotz WHERE _id = 478
SELECT next_set FROM collatz_flotz WHERE _id = 239
SELECT next_set FROM collatz_flotz WHERE _id = 718
SELECT next_set FROM collatz_flotz WHERE _id = 359
SELECT next_set FROM collatz_flotz WHERE _id = 1078
SELECT next_set FROM collatz_flotz WHERE _id = 539
SELECT next_set FROM collatz_flotz WHERE _id = 1618
SELECT next_set FROM collatz_flotz WHERE _id = 809
SELECT next_set FROM collatz_flotz WHERE _id = 2428
SELECT next_set FROM collatz_flotz WHERE _id = 1214
SELECT next_set FROM collatz_flotz WHERE _id = 607
SELECT next_set FROM collatz_flotz WHERE _id = 1822
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (478, [159], 239),(239, [478], 718),(718, [239], 359),(359, [718], 1078),(1078, [359], 539),(539, [1078], 1618),(1618, [539], 809),(809, [1618], 2428),(2428, [809], 1214),(1214, [2428], 607),(607, [1214], 1822),(1822, [607], 911);
SELECT next_set FROM collatz_flotz WHERE _id = 80
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (80, [160], 40);
SELECT next_set FROM collatz_flotz WHERE _id = 484
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (484, [161], 242);
SELECT next_set FROM collatz_flotz WHERE _id = 81
SELECT next_set FROM collatz_flotz WHERE _id = 244
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (81, [162], 244),(244, [81], 122);
SELECT next_set FROM collatz_flotz WHERE _id = 490
SELECT next_set FROM collatz_flotz WHERE _id = 245
SELECT next_set FROM collatz_flotz WHERE _id = 736
SELECT next_set FROM collatz_flotz WHERE _id = 368
SELECT next_set FROM collatz_flotz WHERE _id = 184
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (490, [163], 245),(245, [490], 736),(736, [245], 368),(368, [736], 184),(184, [368], 92);
SELECT next_set FROM collatz_flotz WHERE _id = 82
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (82, [164], 41);
SELECT next_set FROM collatz_flotz WHERE _id = 496
SELECT next_set FROM collatz_flotz WHERE _id = 248
SELECT next_set FROM collatz_flotz WHERE _id = 124
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (496, [165], 248),(248, [496], 124),(124, [248], 62);
SELECT next_set FROM collatz_flotz WHERE _id = 83
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (83, [166], 250);
SELECT next_set FROM collatz_flotz WHERE _id = 502
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (502, [167], 251);
SELECT next_set FROM collatz_flotz WHERE _id = 84
SELECT next_set FROM collatz_flotz WHERE _id = 42
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (84, [168], 42),(42, [84], 21);
SELECT next_set FROM collatz_flotz WHERE _id = 508
SELECT next_set FROM collatz_flotz WHERE _id = 254
SELECT next_set FROM collatz_flotz WHERE _id = 127
SELECT next_set FROM collatz_flotz WHERE _id = 382
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (508, [169], 254),(254, [508], 127),(127, [254], 382),(382, [127], 191);
SELECT next_set FROM collatz_flotz WHERE _id = 85
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (85, [170], 256);
SELECT next_set FROM collatz_flotz WHERE _id = 514
SELECT next_set FROM collatz_flotz WHERE _id = 257
SELECT next_set FROM collatz_flotz WHERE _id = 772
SELECT next_set FROM collatz_flotz WHERE _id = 386
SELECT next_set FROM collatz_flotz WHERE _id = 193
SELECT next_set FROM collatz_flotz WHERE _id = 580
SELECT next_set FROM collatz_flotz WHERE _id = 290
SELECT next_set FROM collatz_flotz WHERE _id = 145
SELECT next_set FROM collatz_flotz WHERE _id = 436
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (514, [171], 257),(257, [514], 772),(772, [257], 386),(386, [772], 193),(193, [386], 580),(580, [193], 290),(290, [580], 145),(145, [290], 436),(436, [145], 218);
SELECT next_set FROM collatz_flotz WHERE _id = 86
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (86, [172], 43);
SELECT next_set FROM collatz_flotz WHERE _id = 520
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (520, [173], 260);
SELECT next_set FROM collatz_flotz WHERE _id = 87
SELECT next_set FROM collatz_flotz WHERE _id = 262
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (87, [174], 262),(262, [87], 131);
SELECT next_set FROM collatz_flotz WHERE _id = 526
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (526, [175], 263);
SELECT next_set FROM collatz_flotz WHERE _id = 88
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (88, [176], 44);
SELECT next_set FROM collatz_flotz WHERE _id = 532
SELECT next_set FROM collatz_flotz WHERE _id = 266
SELECT next_set FROM collatz_flotz WHERE _id = 133
SELECT next_set FROM collatz_flotz WHERE _id = 400
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (532, [177], 266),(266, [532], 133),(133, [266], 400),(400, [133], 200);
SELECT next_set FROM collatz_flotz WHERE _id = 89
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (89, [178], 268);
SELECT next_set FROM collatz_flotz WHERE _id = 538
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (538, [179], 269);
SELECT next_set FROM collatz_flotz WHERE _id = 90
SELECT next_set FROM collatz_flotz WHERE _id = 45
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (90, [180], 45),(45, [90], 136);
SELECT next_set FROM collatz_flotz WHERE _id = 544
SELECT next_set FROM collatz_flotz WHERE _id = 272
SELECT next_set FROM collatz_flotz WHERE _id = 136
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (544, [181], 272),(272, [544], 136),(136, [272], 68);
SELECT next_set FROM collatz_flotz WHERE _id = 91
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (91, [182], 274);
SELECT next_set FROM collatz_flotz WHERE _id = 550
SELECT next_set FROM collatz_flotz WHERE _id = 275
SELECT next_set FROM collatz_flotz WHERE _id = 826
SELECT next_set FROM collatz_flotz WHERE _id = 413
SELECT next_set FROM collatz_flotz WHERE _id = 1240
SELECT next_set FROM collatz_flotz WHERE _id = 620
SELECT next_set FROM collatz_flotz WHERE _id = 310
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (550, [183], 275),(275, [550], 826),(826, [275], 413),(413, [826], 1240),(1240, [413], 620),(620, [1240], 310),(310, [620], 155);
SELECT next_set FROM collatz_flotz WHERE _id = 92
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (92, [184], 46);
SELECT next_set FROM collatz_flotz WHERE _id = 556
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (556, [185], 278);
SELECT next_set FROM collatz_flotz WHERE _id = 93
SELECT next_set FROM collatz_flotz WHERE _id = 280
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (93, [186], 280),(280, [93], 140);
SELECT next_set FROM collatz_flotz WHERE _id = 562
SELECT next_set FROM collatz_flotz WHERE _id = 281
SELECT next_set FROM collatz_flotz WHERE _id = 844
SELECT next_set FROM collatz_flotz WHERE _id = 422
SELECT next_set FROM collatz_flotz WHERE _id = 211
SELECT next_set FROM collatz_flotz WHERE _id = 634
SELECT next_set FROM collatz_flotz WHERE _id = 317
SELECT next_set FROM collatz_flotz WHERE _id = 952
SELECT next_set FROM collatz_flotz WHERE _id = 476
SELECT next_set FROM collatz_flotz WHERE _id = 238
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (562, [187], 281),(281, [562], 844),(844, [281], 422),(422, [844], 211),(211, [422], 634),(634, [211], 317),(317, [634], 952),(952, [317], 476),(476, [952], 238),(238, [476], 119);
SELECT next_set FROM collatz_flotz WHERE _id = 94
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (94, [188], 47);
SELECT next_set FROM collatz_flotz WHERE _id = 568
SELECT next_set FROM collatz_flotz WHERE _id = 284
SELECT next_set FROM collatz_flotz WHERE _id = 142
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (568, [189], 284),(284, [568], 142),(142, [284], 71);
SELECT next_set FROM collatz_flotz WHERE _id = 95
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (95, [190], 286);
SELECT next_set FROM collatz_flotz WHERE _id = 574
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (574, [191], 287);
SELECT next_set FROM collatz_flotz WHERE _id = 96
SELECT next_set FROM collatz_flotz WHERE _id = 48
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (96, [192], 48),(48, [96], 24);
SELECT next_set FROM collatz_flotz WHERE _id = 580
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (580, [193], 290);
SELECT next_set FROM collatz_flotz WHERE _id = 97
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (97, [194], 292);
SELECT next_set FROM collatz_flotz WHERE _id = 586
SELECT next_set FROM collatz_flotz WHERE _id = 293
SELECT next_set FROM collatz_flotz WHERE _id = 880
SELECT next_set FROM collatz_flotz WHERE _id = 440
SELECT next_set FROM collatz_flotz WHERE _id = 220
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (586, [195], 293),(293, [586], 880),(880, [293], 440),(440, [880], 220),(220, [440], 110);
SELECT next_set FROM collatz_flotz WHERE _id = 98
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (98, [196], 49);
SELECT next_set FROM collatz_flotz WHERE _id = 592
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (592, [197], 296);
SELECT next_set FROM collatz_flotz WHERE _id = 99
SELECT next_set FROM collatz_flotz WHERE _id = 298
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (99, [198], 298),(298, [99], 149);
SELECT next_set FROM collatz_flotz WHERE _id = 598
SELECT next_set FROM collatz_flotz WHERE _id = 299
SELECT next_set FROM collatz_flotz WHERE _id = 898
SELECT next_set FROM collatz_flotz WHERE _id = 449
SELECT next_set FROM collatz_flotz WHERE _id = 1348
SELECT next_set FROM collatz_flotz WHERE _id = 674
SELECT next_set FROM collatz_flotz WHERE _id = 337
SELECT next_set FROM collatz_flotz WHERE _id = 1012
SELECT next_set FROM collatz_flotz WHERE _id = 506
SELECT next_set FROM collatz_flotz WHERE _id = 253
SELECT next_set FROM collatz_flotz WHERE _id = 760
SELECT next_set FROM collatz_flotz WHERE _id = 380
SELECT next_set FROM collatz_flotz WHERE _id = 190
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (598, [199], 299),(299, [598], 898),(898, [299], 449),(449, [898], 1348),(1348, [449], 674),(674, [1348], 337),(337, [674], 1012),(1012, [337], 506),(506, [1012], 253),(253, [506], 760),(760, [253], 380),(380, [760], 190),(190, [380], 95);
SELECT next_set FROM collatz_flotz WHERE _id = 100
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (100, [200], 50);
SELECT next_set FROM collatz_flotz WHERE _id = 604
SELECT next_set FROM collatz_flotz WHERE _id = 302
SELECT next_set FROM collatz_flotz WHERE _id = 151
SELECT next_set FROM collatz_flotz WHERE _id = 454
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (604, [201], 302),(302, [604], 151),(151, [302], 454),(454, [151], 227);
SELECT next_set FROM collatz_flotz WHERE _id = 101
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (101, [202], 304);
SELECT next_set FROM collatz_flotz WHERE _id = 610
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (610, [203], 305);
SELECT next_set FROM collatz_flotz WHERE _id = 102
SELECT next_set FROM collatz_flotz WHERE _id = 51
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (102, [204], 51),(51, [102], 154);
SELECT next_set FROM collatz_flotz WHERE _id = 616
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (616, [205], 308);
SELECT next_set FROM collatz_flotz WHERE _id = 103
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (103, [206], 310);
SELECT next_set FROM collatz_flotz WHERE _id = 622
SELECT next_set FROM collatz_flotz WHERE _id = 311
SELECT next_set FROM collatz_flotz WHERE _id = 934
SELECT next_set FROM collatz_flotz WHERE _id = 467
SELECT next_set FROM collatz_flotz WHERE _id = 1402
SELECT next_set FROM collatz_flotz WHERE _id = 701
SELECT next_set FROM collatz_flotz WHERE _id = 2104
SELECT next_set FROM collatz_flotz WHERE _id = 1052
SELECT next_set FROM collatz_flotz WHERE _id = 526
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (622, [207], 311),(311, [622], 934),(934, [311], 467),(467, [934], 1402),(1402, [467], 701),(701, [1402], 2104),(2104, [701], 1052),(1052, [2104], 526),(526, [1052], 263);
SELECT next_set FROM collatz_flotz WHERE _id = 104
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (104, [208], 52);
SELECT next_set FROM collatz_flotz WHERE _id = 628
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (628, [209], 314);
SELECT next_set FROM collatz_flotz WHERE _id = 105
SELECT next_set FROM collatz_flotz WHERE _id = 316
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (105, [210], 316),(316, [105], 158);
SELECT next_set FROM collatz_flotz WHERE _id = 634
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (634, [211], 317);
SELECT next_set FROM collatz_flotz WHERE _id = 106
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (106, [212], 53);
SELECT next_set FROM collatz_flotz WHERE _id = 640
SELECT next_set FROM collatz_flotz WHERE _id = 320
SELECT next_set FROM collatz_flotz WHERE _id = 160
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (640, [213], 320),(320, [640], 160),(160, [320], 80);
SELECT next_set FROM collatz_flotz WHERE _id = 107
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (107, [214], 322);
SELECT next_set FROM collatz_flotz WHERE _id = 646
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (646, [215], 323);
SELECT next_set FROM collatz_flotz WHERE _id = 108
SELECT next_set FROM collatz_flotz WHERE _id = 54
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (108, [216], 54),(54, [108], 27);
SELECT next_set FROM collatz_flotz WHERE _id = 652
SELECT next_set FROM collatz_flotz WHERE _id = 326
SELECT next_set FROM collatz_flotz WHERE _id = 163
SELECT next_set FROM collatz_flotz WHERE _id = 490
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (652, [217], 326),(326, [652], 163),(163, [326], 490),(490, [163], 245);
SELECT next_set FROM collatz_flotz WHERE _id = 109
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (109, [218], 328);
SELECT next_set FROM collatz_flotz WHERE _id = 658
SELECT next_set FROM collatz_flotz WHERE _id = 329
SELECT next_set FROM collatz_flotz WHERE _id = 988
SELECT next_set FROM collatz_flotz WHERE _id = 494
SELECT next_set FROM collatz_flotz WHERE _id = 247
SELECT next_set FROM collatz_flotz WHERE _id = 742
SELECT next_set FROM collatz_flotz WHERE _id = 371
SELECT next_set FROM collatz_flotz WHERE _id = 1114
SELECT next_set FROM collatz_flotz WHERE _id = 557
SELECT next_set FROM collatz_flotz WHERE _id = 1672
SELECT next_set FROM collatz_flotz WHERE _id = 836
SELECT next_set FROM collatz_flotz WHERE _id = 418
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (658, [219], 329),(329, [658], 988),(988, [329], 494),(494, [988], 247),(247, [494], 742),(742, [247], 371),(371, [742], 1114),(1114, [371], 557),(557, [1114], 1672),(1672, [557], 836),(836, [1672], 418),(418, [836], 209);
SELECT next_set FROM collatz_flotz WHERE _id = 110
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (110, [220], 55);
SELECT next_set FROM collatz_flotz WHERE _id = 664
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (664, [221], 332);
SELECT next_set FROM collatz_flotz WHERE _id = 111
SELECT next_set FROM collatz_flotz WHERE _id = 334
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (111, [222], 334),(334, [111], 167);
SELECT next_set FROM collatz_flotz WHERE _id = 670
SELECT next_set FROM collatz_flotz WHERE _id = 335
SELECT next_set FROM collatz_flotz WHERE _id = 1006
SELECT next_set FROM collatz_flotz WHERE _id = 503
SELECT next_set FROM collatz_flotz WHERE _id = 1510
SELECT next_set FROM collatz_flotz WHERE _id = 755
SELECT next_set FROM collatz_flotz WHERE _id = 2266
SELECT next_set FROM collatz_flotz WHERE _id = 1133
SELECT next_set FROM collatz_flotz WHERE _id = 3400
SELECT next_set FROM collatz_flotz WHERE _id = 1700
SELECT next_set FROM collatz_flotz WHERE _id = 850
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (670, [223], 335),(335, [670], 1006),(1006, [335], 503),(503, [1006], 1510),(1510, [503], 755),(755, [1510], 2266),(2266, [755], 1133),(1133, [2266], 3400),(3400, [1133], 1700),(1700, [3400], 850),(850, [1700], 425);
SELECT next_set FROM collatz_flotz WHERE _id = 112
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (112, [224], 56);
SELECT next_set FROM collatz_flotz WHERE _id = 676
SELECT next_set FROM collatz_flotz WHERE _id = 338
SELECT next_set FROM collatz_flotz WHERE _id = 169
SELECT next_set FROM collatz_flotz WHERE _id = 508
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (676, [225], 338),(338, [676], 169),(169, [338], 508),(508, [169], 254);
SELECT next_set FROM collatz_flotz WHERE _id = 113
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (113, [226], 340);
SELECT next_set FROM collatz_flotz WHERE _id = 682
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (682, [227], 341);
SELECT next_set FROM collatz_flotz WHERE _id = 114
SELECT next_set FROM collatz_flotz WHERE _id = 57
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (114, [228], 57),(57, [114], 172);
SELECT next_set FROM collatz_flotz WHERE _id = 688
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (688, [229], 344);
SELECT next_set FROM collatz_flotz WHERE _id = 115
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (115, [230], 346);
SELECT next_set FROM collatz_flotz WHERE _id = 694
SELECT next_set FROM collatz_flotz WHERE _id = 347
SELECT next_set FROM collatz_flotz WHERE _id = 1042
SELECT next_set FROM collatz_flotz WHERE _id = 521
SELECT next_set FROM collatz_flotz WHERE _id = 1564
SELECT next_set FROM collatz_flotz WHERE _id = 782
SELECT next_set FROM collatz_flotz WHERE _id = 391
SELECT next_set FROM collatz_flotz WHERE _id = 1174
SELECT next_set FROM collatz_flotz WHERE _id = 587
SELECT next_set FROM collatz_flotz WHERE _id = 1762
SELECT next_set FROM collatz_flotz WHERE _id = 881
SELECT next_set FROM collatz_flotz WHERE _id = 2644
SELECT next_set FROM collatz_flotz WHERE _id = 1322
SELECT next_set FROM collatz_flotz WHERE _id = 661
SELECT next_set FROM collatz_flotz WHERE _id = 1984
SELECT next_set FROM collatz_flotz WHERE _id = 992
SELECT next_set FROM collatz_flotz WHERE _id = 496
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (694, [231], 347),(347, [694], 1042),(1042, [347], 521),(521, [1042], 1564),(1564, [521], 782),(782, [1564], 391),(391, [782], 1174),(1174, [391], 587),(587, [1174], 1762),(1762, [587], 881),(881, [1762], 2644),(2644, [881], 1322),(1322, [2644], 661),(661, [1322], 1984),(1984, [661], 992),(992, [1984], 496),(496, [992], 248);
SELECT next_set FROM collatz_flotz WHERE _id = 116
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (116, [232], 58);
SELECT next_set FROM collatz_flotz WHERE _id = 700
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (700, [233], 350);
SELECT next_set FROM collatz_flotz WHERE _id = 117
SELECT next_set FROM collatz_flotz WHERE _id = 352
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (117, [234], 352),(352, [117], 176);
SELECT next_set FROM collatz_flotz WHERE _id = 706
SELECT next_set FROM collatz_flotz WHERE _id = 353
SELECT next_set FROM collatz_flotz WHERE _id = 1060
SELECT next_set FROM collatz_flotz WHERE _id = 530
SELECT next_set FROM collatz_flotz WHERE _id = 265
SELECT next_set FROM collatz_flotz WHERE _id = 796
SELECT next_set FROM collatz_flotz WHERE _id = 398
SELECT next_set FROM collatz_flotz WHERE _id = 199
SELECT next_set FROM collatz_flotz WHERE _id = 598
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (706, [235], 353),(353, [706], 1060),(1060, [353], 530),(530, [1060], 265),(265, [530], 796),(796, [265], 398),(398, [796], 199),(199, [398], 598),(598, [199], 299);
SELECT next_set FROM collatz_flotz WHERE _id = 118
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (118, [236], 59);
SELECT next_set FROM collatz_flotz WHERE _id = 712
SELECT next_set FROM collatz_flotz WHERE _id = 356
SELECT next_set FROM collatz_flotz WHERE _id = 178
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (712, [237], 356),(356, [712], 178),(178, [356], 89);
SELECT next_set FROM collatz_flotz WHERE _id = 119
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (119, [238], 358);
SELECT next_set FROM collatz_flotz WHERE _id = 718
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (718, [239], 359);
SELECT next_set FROM collatz_flotz WHERE _id = 120
SELECT next_set FROM collatz_flotz WHERE _id = 60
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (120, [240], 60),(60, [120], 30);
SELECT next_set FROM collatz_flotz WHERE _id = 724
SELECT next_set FROM collatz_flotz WHERE _id = 362
SELECT next_set FROM collatz_flotz WHERE _id = 181
SELECT next_set FROM collatz_flotz WHERE _id = 544
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (724, [241], 362),(362, [724], 181),(181, [362], 544),(544, [181], 272);
SELECT next_set FROM collatz_flotz WHERE _id = 121
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (121, [242], 364);
SELECT next_set FROM collatz_flotz WHERE _id = 730
SELECT next_set FROM collatz_flotz WHERE _id = 365
SELECT next_set FROM collatz_flotz WHERE _id = 1096
SELECT next_set FROM collatz_flotz WHERE _id = 548
SELECT next_set FROM collatz_flotz WHERE _id = 274
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (730, [243], 365),(365, [730], 1096),(1096, [365], 548),(548, [1096], 274),(274, [548], 137);
SELECT next_set FROM collatz_flotz WHERE _id = 122
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (122, [244], 61);
SELECT next_set FROM collatz_flotz WHERE _id = 736
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (736, [245], 368);
SELECT next_set FROM collatz_flotz WHERE _id = 123
SELECT next_set FROM collatz_flotz WHERE _id = 370
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (123, [246], 370),(370, [123], 185);
SELECT next_set FROM collatz_flotz WHERE _id = 742
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (742, [247], 371);
SELECT next_set FROM collatz_flotz WHERE _id = 124
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (124, [248], 62);
SELECT next_set FROM collatz_flotz WHERE _id = 748
SELECT next_set FROM collatz_flotz WHERE _id = 374
SELECT next_set FROM collatz_flotz WHERE _id = 187
SELECT next_set FROM collatz_flotz WHERE _id = 562
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (748, [249], 374),(374, [748], 187),(187, [374], 562),(562, [187], 281);
SELECT next_set FROM collatz_flotz WHERE _id = 125
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (125, [250], 376);
SELECT next_set FROM collatz_flotz WHERE _id = 754
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (754, [251], 377);
SELECT next_set FROM collatz_flotz WHERE _id = 126
SELECT next_set FROM collatz_flotz WHERE _id = 63
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (126, [252], 63),(63, [126], 190);
SELECT next_set FROM collatz_flotz WHERE _id = 760
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (760, [253], 380);
SELECT next_set FROM collatz_flotz WHERE _id = 127
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (127, [254], 382);
SELECT next_set FROM collatz_flotz WHERE _id = 766
SELECT next_set FROM collatz_flotz WHERE _id = 383
SELECT next_set FROM collatz_flotz WHERE _id = 1150
SELECT next_set FROM collatz_flotz WHERE _id = 575
SELECT next_set FROM collatz_flotz WHERE _id = 1726
SELECT next_set FROM collatz_flotz WHERE _id = 863
SELECT next_set FROM collatz_flotz WHERE _id = 2590
SELECT next_set FROM collatz_flotz WHERE _id = 1295
SELECT next_set FROM collatz_flotz WHERE _id = 3886
SELECT next_set FROM collatz_flotz WHERE _id = 1943
SELECT next_set FROM collatz_flotz WHERE _id = 5830
SELECT next_set FROM collatz_flotz WHERE _id = 2915
SELECT next_set FROM collatz_flotz WHERE _id = 8746
SELECT next_set FROM collatz_flotz WHERE _id = 4373
SELECT next_set FROM collatz_flotz WHERE _id = 13120
SELECT next_set FROM collatz_flotz WHERE _id = 6560
SELECT next_set FROM collatz_flotz WHERE _id = 3280
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (766, [255], 383),(383, [766], 1150),(1150, [383], 575),(575, [1150], 1726),(1726, [575], 863),(863, [1726], 2590),(2590, [863], 1295),(1295, [2590], 3886),(3886, [1295], 1943),(1943, [3886], 5830),(5830, [1943], 2915),(2915, [5830], 8746),(8746, [2915], 4373),(4373, [8746], 13120),(13120, [4373], 6560),(6560, [13120], 3280),(3280, [6560], 1640);
SELECT next_set FROM collatz_flotz WHERE _id = 128
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (128, [256], 64);
SELECT next_set FROM collatz_flotz WHERE _id = 772
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (772, [257], 386);
SELECT next_set FROM collatz_flotz WHERE _id = 129
SELECT next_set FROM collatz_flotz WHERE _id = 388
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (129, [258], 388),(388, [129], 194);
SELECT next_set FROM collatz_flotz WHERE _id = 778
SELECT next_set FROM collatz_flotz WHERE _id = 389
SELECT next_set FROM collatz_flotz WHERE _id = 1168
SELECT next_set FROM collatz_flotz WHERE _id = 584
SELECT next_set FROM collatz_flotz WHERE _id = 292
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (778, [259], 389),(389, [778], 1168),(1168, [389], 584),(584, [1168], 292),(292, [584], 146);
SELECT next_set FROM collatz_flotz WHERE _id = 130
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (130, [260], 65);
SELECT next_set FROM collatz_flotz WHERE _id = 784
SELECT next_set FROM collatz_flotz WHERE _id = 392
SELECT next_set FROM collatz_flotz WHERE _id = 196
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (784, [261], 392),(392, [784], 196),(196, [392], 98);
SELECT next_set FROM collatz_flotz WHERE _id = 131
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (131, [262], 394);
SELECT next_set FROM collatz_flotz WHERE _id = 790
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (790, [263], 395);
SELECT next_set FROM collatz_flotz WHERE _id = 132
SELECT next_set FROM collatz_flotz WHERE _id = 66
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (132, [264], 66),(66, [132], 33);
SELECT next_set FROM collatz_flotz WHERE _id = 796
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (796, [265], 398);
SELECT next_set FROM collatz_flotz WHERE _id = 133
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (133, [266], 400);
SELECT next_set FROM collatz_flotz WHERE _id = 802
SELECT next_set FROM collatz_flotz WHERE _id = 401
SELECT next_set FROM collatz_flotz WHERE _id = 1204
SELECT next_set FROM collatz_flotz WHERE _id = 602
SELECT next_set FROM collatz_flotz WHERE _id = 301
SELECT next_set FROM collatz_flotz WHERE _id = 904
SELECT next_set FROM collatz_flotz WHERE _id = 452
SELECT next_set FROM collatz_flotz WHERE _id = 226
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (802, [267], 401),(401, [802], 1204),(1204, [401], 602),(602, [1204], 301),(301, [602], 904),(904, [301], 452),(452, [904], 226),(226, [452], 113);
SELECT next_set FROM collatz_flotz WHERE _id = 134
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (134, [268], 67);
SELECT next_set FROM collatz_flotz WHERE _id = 808
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (808, [269], 404);
SELECT next_set FROM collatz_flotz WHERE _id = 135
SELECT next_set FROM collatz_flotz WHERE _id = 406
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (135, [270], 406),(406, [135], 203);
SELECT next_set FROM collatz_flotz WHERE _id = 814
SELECT next_set FROM collatz_flotz WHERE _id = 407
SELECT next_set FROM collatz_flotz WHERE _id = 1222
SELECT next_set FROM collatz_flotz WHERE _id = 611
SELECT next_set FROM collatz_flotz WHERE _id = 1834
SELECT next_set FROM collatz_flotz WHERE _id = 917
SELECT next_set FROM collatz_flotz WHERE _id = 2752
SELECT next_set FROM collatz_flotz WHERE _id = 1376
SELECT next_set FROM collatz_flotz WHERE _id = 688
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (814, [271], 407),(407, [814], 1222),(1222, [407], 611),(611, [1222], 1834),(1834, [611], 917),(917, [1834], 2752),(2752, [917], 1376),(1376, [2752], 688),(688, [1376], 344);
SELECT next_set FROM collatz_flotz WHERE _id = 136
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (136, [272], 68);
SELECT next_set FROM collatz_flotz WHERE _id = 820
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (820, [273], 410);
SELECT next_set FROM collatz_flotz WHERE _id = 137
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (137, [274], 412);
SELECT next_set FROM collatz_flotz WHERE _id = 826
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (826, [275], 413);
SELECT next_set FROM collatz_flotz WHERE _id = 138
SELECT next_set FROM collatz_flotz WHERE _id = 69
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (138, [276], 69),(69, [138], 208);
SELECT next_set FROM collatz_flotz WHERE _id = 832
SELECT next_set FROM collatz_flotz WHERE _id = 416
SELECT next_set FROM collatz_flotz WHERE _id = 208
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (832, [277], 416),(416, [832], 208),(208, [416], 104);
SELECT next_set FROM collatz_flotz WHERE _id = 139
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (139, [278], 418);
SELECT next_set FROM collatz_flotz WHERE _id = 838
SELECT next_set FROM collatz_flotz WHERE _id = 419
SELECT next_set FROM collatz_flotz WHERE _id = 1258
SELECT next_set FROM collatz_flotz WHERE _id = 629
SELECT next_set FROM collatz_flotz WHERE _id = 1888
SELECT next_set FROM collatz_flotz WHERE _id = 944
SELECT next_set FROM collatz_flotz WHERE _id = 472
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (838, [279], 419),(419, [838], 1258),(1258, [419], 629),(629, [1258], 1888),(1888, [629], 944),(944, [1888], 472),(472, [944], 236);
SELECT next_set FROM collatz_flotz WHERE _id = 140
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (140, [280], 70);
SELECT next_set FROM collatz_flotz WHERE _id = 844
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (844, [281], 422);
SELECT next_set FROM collatz_flotz WHERE _id = 141
SELECT next_set FROM collatz_flotz WHERE _id = 424
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (141, [282], 424),(424, [141], 212);
SELECT next_set FROM collatz_flotz WHERE _id = 850
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (850, [283], 425);
SELECT next_set FROM collatz_flotz WHERE _id = 142
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (142, [284], 71);
SELECT next_set FROM collatz_flotz WHERE _id = 856
SELECT next_set FROM collatz_flotz WHERE _id = 428
SELECT next_set FROM collatz_flotz WHERE _id = 214
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (856, [285], 428),(428, [856], 214),(214, [428], 107);
SELECT next_set FROM collatz_flotz WHERE _id = 143
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (143, [286], 430);
SELECT next_set FROM collatz_flotz WHERE _id = 862
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (862, [287], 431);
SELECT next_set FROM collatz_flotz WHERE _id = 144
SELECT next_set FROM collatz_flotz WHERE _id = 72
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (144, [288], 72),(72, [144], 36);
SELECT next_set FROM collatz_flotz WHERE _id = 868
SELECT next_set FROM collatz_flotz WHERE _id = 434
SELECT next_set FROM collatz_flotz WHERE _id = 217
SELECT next_set FROM collatz_flotz WHERE _id = 652
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (868, [289], 434),(434, [868], 217),(217, [434], 652),(652, [217], 326);
SELECT next_set FROM collatz_flotz WHERE _id = 145
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (145, [290], 436);
SELECT next_set FROM collatz_flotz WHERE _id = 874
SELECT next_set FROM collatz_flotz WHERE _id = 437
SELECT next_set FROM collatz_flotz WHERE _id = 1312
SELECT next_set FROM collatz_flotz WHERE _id = 656
SELECT next_set FROM collatz_flotz WHERE _id = 328
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (874, [291], 437),(437, [874], 1312),(1312, [437], 656),(656, [1312], 328),(328, [656], 164);
SELECT next_set FROM collatz_flotz WHERE _id = 146
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (146, [292], 73);
SELECT next_set FROM collatz_flotz WHERE _id = 880
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (880, [293], 440);
SELECT next_set FROM collatz_flotz WHERE _id = 147
SELECT next_set FROM collatz_flotz WHERE _id = 442
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (147, [294], 442),(442, [147], 221);
SELECT next_set FROM collatz_flotz WHERE _id = 886
SELECT next_set FROM collatz_flotz WHERE _id = 443
SELECT next_set FROM collatz_flotz WHERE _id = 1330
SELECT next_set FROM collatz_flotz WHERE _id = 665
SELECT next_set FROM collatz_flotz WHERE _id = 1996
SELECT next_set FROM collatz_flotz WHERE _id = 998
SELECT next_set FROM collatz_flotz WHERE _id = 499
SELECT next_set FROM collatz_flotz WHERE _id = 1498
SELECT next_set FROM collatz_flotz WHERE _id = 749
SELECT next_set FROM collatz_flotz WHERE _id = 2248
SELECT next_set FROM collatz_flotz WHERE _id = 1124
SELECT next_set FROM collatz_flotz WHERE _id = 562
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (886, [295], 443),(443, [886], 1330),(1330, [443], 665),(665, [1330], 1996),(1996, [665], 998),(998, [1996], 499),(499, [998], 1498),(1498, [499], 749),(749, [1498], 2248),(2248, [749], 1124),(1124, [2248], 562),(562, [1124], 281);
SELECT next_set FROM collatz_flotz WHERE _id = 148
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (148, [296], 74);
SELECT next_set FROM collatz_flotz WHERE _id = 892
SELECT next_set FROM collatz_flotz WHERE _id = 446
SELECT next_set FROM collatz_flotz WHERE _id = 223
SELECT next_set FROM collatz_flotz WHERE _id = 670
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (892, [297], 446),(446, [892], 223),(223, [446], 670),(670, [223], 335);
SELECT next_set FROM collatz_flotz WHERE _id = 149
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (149, [298], 448);
SELECT next_set FROM collatz_flotz WHERE _id = 898
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (898, [299], 449);
SELECT next_set FROM collatz_flotz WHERE _id = 150
SELECT next_set FROM collatz_flotz WHERE _id = 75
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (150, [300], 75),(75, [150], 226);
SELECT next_set FROM collatz_flotz WHERE _id = 904
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (904, [301], 452);
SELECT next_set FROM collatz_flotz WHERE _id = 151
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (151, [302], 454);
SELECT next_set FROM collatz_flotz WHERE _id = 910
SELECT next_set FROM collatz_flotz WHERE _id = 455
SELECT next_set FROM collatz_flotz WHERE _id = 1366
SELECT next_set FROM collatz_flotz WHERE _id = 683
SELECT next_set FROM collatz_flotz WHERE _id = 2050
SELECT next_set FROM collatz_flotz WHERE _id = 1025
SELECT next_set FROM collatz_flotz WHERE _id = 3076
SELECT next_set FROM collatz_flotz WHERE _id = 1538
SELECT next_set FROM collatz_flotz WHERE _id = 769
SELECT next_set FROM collatz_flotz WHERE _id = 2308
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (910, [303], 455),(455, [910], 1366),(1366, [455], 683),(683, [1366], 2050),(2050, [683], 1025),(1025, [2050], 3076),(3076, [1025], 1538),(1538, [3076], 769),(769, [1538], 2308),(2308, [769], 1154);
SELECT next_set FROM collatz_flotz WHERE _id = 152
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (152, [304], 76);
SELECT next_set FROM collatz_flotz WHERE _id = 916
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (916, [305], 458);
SELECT next_set FROM collatz_flotz WHERE _id = 153
SELECT next_set FROM collatz_flotz WHERE _id = 460
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (153, [306], 460),(460, [153], 230);
SELECT next_set FROM collatz_flotz WHERE _id = 922
SELECT next_set FROM collatz_flotz WHERE _id = 461
SELECT next_set FROM collatz_flotz WHERE _id = 1384
SELECT next_set FROM collatz_flotz WHERE _id = 692
SELECT next_set FROM collatz_flotz WHERE _id = 346
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (922, [307], 461),(461, [922], 1384),(1384, [461], 692),(692, [1384], 346),(346, [692], 173);
SELECT next_set FROM collatz_flotz WHERE _id = 154
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (154, [308], 77);
SELECT next_set FROM collatz_flotz WHERE _id = 928
SELECT next_set FROM collatz_flotz WHERE _id = 464
SELECT next_set FROM collatz_flotz WHERE _id = 232
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (928, [309], 464),(464, [928], 232),(232, [464], 116);
SELECT next_set FROM collatz_flotz WHERE _id = 155
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (155, [310], 466);
SELECT next_set FROM collatz_flotz WHERE _id = 934
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (934, [311], 467);
SELECT next_set FROM collatz_flotz WHERE _id = 156
SELECT next_set FROM collatz_flotz WHERE _id = 78
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (156, [312], 78),(78, [156], 39);
SELECT next_set FROM collatz_flotz WHERE _id = 940
SELECT next_set FROM collatz_flotz WHERE _id = 470
SELECT next_set FROM collatz_flotz WHERE _id = 235
SELECT next_set FROM collatz_flotz WHERE _id = 706
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (940, [313], 470),(470, [940], 235),(235, [470], 706),(706, [235], 353);
SELECT next_set FROM collatz_flotz WHERE _id = 157
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (157, [314], 472);
SELECT next_set FROM collatz_flotz WHERE _id = 946
SELECT next_set FROM collatz_flotz WHERE _id = 473
SELECT next_set FROM collatz_flotz WHERE _id = 1420
SELECT next_set FROM collatz_flotz WHERE _id = 710
SELECT next_set FROM collatz_flotz WHERE _id = 355
SELECT next_set FROM collatz_flotz WHERE _id = 1066
SELECT next_set FROM collatz_flotz WHERE _id = 533
SELECT next_set FROM collatz_flotz WHERE _id = 1600
SELECT next_set FROM collatz_flotz WHERE _id = 800
SELECT next_set FROM collatz_flotz WHERE _id = 400
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (946, [315], 473),(473, [946], 1420),(1420, [473], 710),(710, [1420], 355),(355, [710], 1066),(1066, [355], 533),(533, [1066], 1600),(1600, [533], 800),(800, [1600], 400),(400, [800], 200);
SELECT next_set FROM collatz_flotz WHERE _id = 158
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (158, [316], 79);
SELECT next_set FROM collatz_flotz WHERE _id = 952
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (952, [317], 476);
SELECT next_set FROM collatz_flotz WHERE _id = 159
SELECT next_set FROM collatz_flotz WHERE _id = 478
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (159, [318], 478),(478, [159], 239);
SELECT next_set FROM collatz_flotz WHERE _id = 958
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (958, [319], 479);
SELECT next_set FROM collatz_flotz WHERE _id = 160
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (160, [320], 80);
SELECT next_set FROM collatz_flotz WHERE _id = 964
SELECT next_set FROM collatz_flotz WHERE _id = 482
SELECT next_set FROM collatz_flotz WHERE _id = 241
SELECT next_set FROM collatz_flotz WHERE _id = 724
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (964, [321], 482),(482, [964], 241),(241, [482], 724),(724, [241], 362);
SELECT next_set FROM collatz_flotz WHERE _id = 161
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (161, [322], 484);
SELECT next_set FROM collatz_flotz WHERE _id = 970
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (970, [323], 485);
SELECT next_set FROM collatz_flotz WHERE _id = 162
SELECT next_set FROM collatz_flotz WHERE _id = 81
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (162, [324], 81),(81, [162], 244);
SELECT next_set FROM collatz_flotz WHERE _id = 976
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (976, [325], 488);
SELECT next_set FROM collatz_flotz WHERE _id = 163
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (163, [326], 490);
SELECT next_set FROM collatz_flotz WHERE _id = 982
SELECT next_set FROM collatz_flotz WHERE _id = 491
SELECT next_set FROM collatz_flotz WHERE _id = 1474
SELECT next_set FROM collatz_flotz WHERE _id = 737
SELECT next_set FROM collatz_flotz WHERE _id = 2212
SELECT next_set FROM collatz_flotz WHERE _id = 1106
SELECT next_set FROM collatz_flotz WHERE _id = 553
SELECT next_set FROM collatz_flotz WHERE _id = 1660
SELECT next_set FROM collatz_flotz WHERE _id = 830
SELECT next_set FROM collatz_flotz WHERE _id = 415
SELECT next_set FROM collatz_flotz WHERE _id = 1246
SELECT next_set FROM collatz_flotz WHERE _id = 623
SELECT next_set FROM collatz_flotz WHERE _id = 1870
SELECT next_set FROM collatz_flotz WHERE _id = 935
SELECT next_set FROM collatz_flotz WHERE _id = 2806
SELECT next_set FROM collatz_flotz WHERE _id = 1403
SELECT next_set FROM collatz_flotz WHERE _id = 4210
SELECT next_set FROM collatz_flotz WHERE _id = 2105
SELECT next_set FROM collatz_flotz WHERE _id = 6316
SELECT next_set FROM collatz_flotz WHERE _id = 3158
SELECT next_set FROM collatz_flotz WHERE _id = 1579
SELECT next_set FROM collatz_flotz WHERE _id = 4738
SELECT next_set FROM collatz_flotz WHERE _id = 2369
SELECT next_set FROM collatz_flotz WHERE _id = 7108
SELECT next_set FROM collatz_flotz WHERE _id = 3554
SELECT next_set FROM collatz_flotz WHERE _id = 1777
SELECT next_set FROM collatz_flotz WHERE _id = 5332
SELECT next_set FROM collatz_flotz WHERE _id = 2666
SELECT next_set FROM collatz_flotz WHERE _id = 1333
SELECT next_set FROM collatz_flotz WHERE _id = 4000
SELECT next_set FROM collatz_flotz WHERE _id = 2000
SELECT next_set FROM collatz_flotz WHERE _id = 1000
SELECT next_set FROM collatz_flotz WHERE _id = 500
SELECT next_set FROM collatz_flotz WHERE _id = 250
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (982, [327], 491),(491, [982], 1474),(1474, [491], 737),(737, [1474], 2212),(2212, [737], 1106),(1106, [2212], 553),(553, [1106], 1660),(1660, [553], 830),(830, [1660], 415),(415, [830], 1246),(1246, [415], 623),(623, [1246], 1870),(1870, [623], 935),(935, [1870], 2806),(2806, [935], 1403),(1403, [2806], 4210),(4210, [1403], 2105),(2105, [4210], 6316),(6316, [2105], 3158),(3158, [6316], 1579),(1579, [3158], 4738),(4738, [1579], 2369),(2369, [4738], 7108),(7108, [2369], 3554),(3554, [7108], 1777),(1777, [3554], 5332),(5332, [1777], 2666),(2666, [5332], 1333),(1333, [2666], 4000),(4000, [1333], 2000),(2000, [4000], 1000),(1000, [2000], 500),(500, [1000], 250),(250, [500], 125);
SELECT next_set FROM collatz_flotz WHERE _id = 164
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (164, [328], 82);
SELECT next_set FROM collatz_flotz WHERE _id = 988
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (988, [329], 494);
SELECT next_set FROM collatz_flotz WHERE _id = 165
SELECT next_set FROM collatz_flotz WHERE _id = 496
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (165, [330], 496),(496, [165], 248);
SELECT next_set FROM collatz_flotz WHERE _id = 994
SELECT next_set FROM collatz_flotz WHERE _id = 497
SELECT next_set FROM collatz_flotz WHERE _id = 1492
SELECT next_set FROM collatz_flotz WHERE _id = 746
SELECT next_set FROM collatz_flotz WHERE _id = 373
SELECT next_set FROM collatz_flotz WHERE _id = 1120
SELECT next_set FROM collatz_flotz WHERE _id = 560
SELECT next_set FROM collatz_flotz WHERE _id = 280
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (994, [331], 497),(497, [994], 1492),(1492, [497], 746),(746, [1492], 373),(373, [746], 1120),(1120, [373], 560),(560, [1120], 280),(280, [560], 140);
SELECT next_set FROM collatz_flotz WHERE _id = 166
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (166, [332], 83);
SELECT next_set FROM collatz_flotz WHERE _id = 1000
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1000, [333], 500);
SELECT next_set FROM collatz_flotz WHERE _id = 167
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (167, [334], 502);
SELECT next_set FROM collatz_flotz WHERE _id = 1006
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1006, [335], 503);
SELECT next_set FROM collatz_flotz WHERE _id = 168
SELECT next_set FROM collatz_flotz WHERE _id = 84
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (168, [336], 84),(84, [168], 42);
SELECT next_set FROM collatz_flotz WHERE _id = 1012
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1012, [337], 506);
SELECT next_set FROM collatz_flotz WHERE _id = 169
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (169, [338], 508);
SELECT next_set FROM collatz_flotz WHERE _id = 1018
SELECT next_set FROM collatz_flotz WHERE _id = 509
SELECT next_set FROM collatz_flotz WHERE _id = 1528
SELECT next_set FROM collatz_flotz WHERE _id = 764
SELECT next_set FROM collatz_flotz WHERE _id = 382
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1018, [339], 509),(509, [1018], 1528),(1528, [509], 764),(764, [1528], 382),(382, [764], 191);
SELECT next_set FROM collatz_flotz WHERE _id = 170
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (170, [340], 85);
SELECT next_set FROM collatz_flotz WHERE _id = 1024
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1024, [341], 512);
SELECT next_set FROM collatz_flotz WHERE _id = 171
SELECT next_set FROM collatz_flotz WHERE _id = 514
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (171, [342], 514),(514, [171], 257);
SELECT next_set FROM collatz_flotz WHERE _id = 1030
SELECT next_set FROM collatz_flotz WHERE _id = 515
SELECT next_set FROM collatz_flotz WHERE _id = 1546
SELECT next_set FROM collatz_flotz WHERE _id = 773
SELECT next_set FROM collatz_flotz WHERE _id = 2320
SELECT next_set FROM collatz_flotz WHERE _id = 1160
SELECT next_set FROM collatz_flotz WHERE _id = 580
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1030, [343], 515),(515, [1030], 1546),(1546, [515], 773),(773, [1546], 2320),(2320, [773], 1160),(1160, [2320], 580),(580, [1160], 290);
SELECT next_set FROM collatz_flotz WHERE _id = 172
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (172, [344], 86);
SELECT next_set FROM collatz_flotz WHERE _id = 1036
SELECT next_set FROM collatz_flotz WHERE _id = 518
SELECT next_set FROM collatz_flotz WHERE _id = 259
SELECT next_set FROM collatz_flotz WHERE _id = 778
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1036, [345], 518),(518, [1036], 259),(259, [518], 778),(778, [259], 389);
SELECT next_set FROM collatz_flotz WHERE _id = 173
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (173, [346], 520);
SELECT next_set FROM collatz_flotz WHERE _id = 1042
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1042, [347], 521);
SELECT next_set FROM collatz_flotz WHERE _id = 174
SELECT next_set FROM collatz_flotz WHERE _id = 87
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (174, [348], 87),(87, [174], 262);
SELECT next_set FROM collatz_flotz WHERE _id = 1048
SELECT next_set FROM collatz_flotz WHERE _id = 524
SELECT next_set FROM collatz_flotz WHERE _id = 262
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1048, [349], 524),(524, [1048], 262),(262, [524], 131);
SELECT next_set FROM collatz_flotz WHERE _id = 175
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (175, [350], 526);
SELECT next_set FROM collatz_flotz WHERE _id = 1054
SELECT next_set FROM collatz_flotz WHERE _id = 527
SELECT next_set FROM collatz_flotz WHERE _id = 1582
SELECT next_set FROM collatz_flotz WHERE _id = 791
SELECT next_set FROM collatz_flotz WHERE _id = 2374
SELECT next_set FROM collatz_flotz WHERE _id = 1187
SELECT next_set FROM collatz_flotz WHERE _id = 3562
SELECT next_set FROM collatz_flotz WHERE _id = 1781
SELECT next_set FROM collatz_flotz WHERE _id = 5344
SELECT next_set FROM collatz_flotz WHERE _id = 2672
SELECT next_set FROM collatz_flotz WHERE _id = 1336
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1054, [351], 527),(527, [1054], 1582),(1582, [527], 791),(791, [1582], 2374),(2374, [791], 1187),(1187, [2374], 3562),(3562, [1187], 1781),(1781, [3562], 5344),(5344, [1781], 2672),(2672, [5344], 1336),(1336, [2672], 668);
SELECT next_set FROM collatz_flotz WHERE _id = 176
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (176, [352], 88);
SELECT next_set FROM collatz_flotz WHERE _id = 1060
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1060, [353], 530);
SELECT next_set FROM collatz_flotz WHERE _id = 177
SELECT next_set FROM collatz_flotz WHERE _id = 532
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (177, [354], 532),(532, [177], 266);
SELECT next_set FROM collatz_flotz WHERE _id = 1066
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1066, [355], 533);
SELECT next_set FROM collatz_flotz WHERE _id = 178
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (178, [356], 89);
SELECT next_set FROM collatz_flotz WHERE _id = 1072
SELECT next_set FROM collatz_flotz WHERE _id = 536
SELECT next_set FROM collatz_flotz WHERE _id = 268
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1072, [357], 536),(536, [1072], 268),(268, [536], 134);
SELECT next_set FROM collatz_flotz WHERE _id = 179
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (179, [358], 538);
SELECT next_set FROM collatz_flotz WHERE _id = 1078
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1078, [359], 539);
SELECT next_set FROM collatz_flotz WHERE _id = 180
SELECT next_set FROM collatz_flotz WHERE _id = 90
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (180, [360], 90),(90, [180], 45);
SELECT next_set FROM collatz_flotz WHERE _id = 1084
SELECT next_set FROM collatz_flotz WHERE _id = 542
SELECT next_set FROM collatz_flotz WHERE _id = 271
SELECT next_set FROM collatz_flotz WHERE _id = 814
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1084, [361], 542),(542, [1084], 271),(271, [542], 814),(814, [271], 407);
SELECT next_set FROM collatz_flotz WHERE _id = 181
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (181, [362], 544);
SELECT next_set FROM collatz_flotz WHERE _id = 1090
SELECT next_set FROM collatz_flotz WHERE _id = 545
SELECT next_set FROM collatz_flotz WHERE _id = 1636
SELECT next_set FROM collatz_flotz WHERE _id = 818
SELECT next_set FROM collatz_flotz WHERE _id = 409
SELECT next_set FROM collatz_flotz WHERE _id = 1228
SELECT next_set FROM collatz_flotz WHERE _id = 614
SELECT next_set FROM collatz_flotz WHERE _id = 307
SELECT next_set FROM collatz_flotz WHERE _id = 922
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1090, [363], 545),(545, [1090], 1636),(1636, [545], 818),(818, [1636], 409),(409, [818], 1228),(1228, [409], 614),(614, [1228], 307),(307, [614], 922),(922, [307], 461);
SELECT next_set FROM collatz_flotz WHERE _id = 182
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (182, [364], 91);
SELECT next_set FROM collatz_flotz WHERE _id = 1096
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1096, [365], 548);
SELECT next_set FROM collatz_flotz WHERE _id = 183
SELECT next_set FROM collatz_flotz WHERE _id = 550
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (183, [366], 550),(550, [183], 275);
SELECT next_set FROM collatz_flotz WHERE _id = 1102
SELECT next_set FROM collatz_flotz WHERE _id = 551
SELECT next_set FROM collatz_flotz WHERE _id = 1654
SELECT next_set FROM collatz_flotz WHERE _id = 827
SELECT next_set FROM collatz_flotz WHERE _id = 2482
SELECT next_set FROM collatz_flotz WHERE _id = 1241
SELECT next_set FROM collatz_flotz WHERE _id = 3724
SELECT next_set FROM collatz_flotz WHERE _id = 1862
SELECT next_set FROM collatz_flotz WHERE _id = 931
SELECT next_set FROM collatz_flotz WHERE _id = 2794
SELECT next_set FROM collatz_flotz WHERE _id = 1397
SELECT next_set FROM collatz_flotz WHERE _id = 4192
SELECT next_set FROM collatz_flotz WHERE _id = 2096
SELECT next_set FROM collatz_flotz WHERE _id = 1048
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1102, [367], 551),(551, [1102], 1654),(1654, [551], 827),(827, [1654], 2482),(2482, [827], 1241),(1241, [2482], 3724),(3724, [1241], 1862),(1862, [3724], 931),(931, [1862], 2794),(2794, [931], 1397),(1397, [2794], 4192),(4192, [1397], 2096),(2096, [4192], 1048),(1048, [2096], 524);
SELECT next_set FROM collatz_flotz WHERE _id = 184
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (184, [368], 92);
SELECT next_set FROM collatz_flotz WHERE _id = 1108
SELECT next_set FROM collatz_flotz WHERE _id = 554
SELECT next_set FROM collatz_flotz WHERE _id = 277
SELECT next_set FROM collatz_flotz WHERE _id = 832
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1108, [369], 554),(554, [1108], 277),(277, [554], 832),(832, [277], 416);
SELECT next_set FROM collatz_flotz WHERE _id = 185
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (185, [370], 556);
SELECT next_set FROM collatz_flotz WHERE _id = 1114
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1114, [371], 557);
SELECT next_set FROM collatz_flotz WHERE _id = 186
SELECT next_set FROM collatz_flotz WHERE _id = 93
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (186, [372], 93),(93, [186], 280);
SELECT next_set FROM collatz_flotz WHERE _id = 1120
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1120, [373], 560);
SELECT next_set FROM collatz_flotz WHERE _id = 187
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (187, [374], 562);
SELECT next_set FROM collatz_flotz WHERE _id = 1126
SELECT next_set FROM collatz_flotz WHERE _id = 563
SELECT next_set FROM collatz_flotz WHERE _id = 1690
SELECT next_set FROM collatz_flotz WHERE _id = 845
SELECT next_set FROM collatz_flotz WHERE _id = 2536
SELECT next_set FROM collatz_flotz WHERE _id = 1268
SELECT next_set FROM collatz_flotz WHERE _id = 634
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1126, [375], 563),(563, [1126], 1690),(1690, [563], 845),(845, [1690], 2536),(2536, [845], 1268),(1268, [2536], 634),(634, [1268], 317);
SELECT next_set FROM collatz_flotz WHERE _id = 188
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (188, [376], 94);
SELECT next_set FROM collatz_flotz WHERE _id = 1132
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (1132, [377], 566);
SELECT next_set FROM collatz_flotz WHERE _id = 189
SELECT next_set FROM collatz_flotz WHERE _id = 568
INSERT INTO collatz_flotz (_id, prev_set, next_set) VALUES (189, [378], 568),(568, [189], 284);
