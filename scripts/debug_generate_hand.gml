array = argument0;
is_red = argument1;
for (var i = 0; i <= 4; i++) {
    switch (irandom(3)) {  
        case (0):
            array[@ i,0] = "Goblin";
            break;
        case (1):
            array[@ i,0] = "Fang";
            break;
        case (2):
            array[@ i,0] = "Skeleton";
            break;
        case (3):
            array[@ i,0] = "Flan";
            break;
    }
    array[@ i,1] = PHYSICAL;
    array[@ i,2] = irandom(1);
    array[@ i,3] = irandom(1);
    array[@ i,4] = irandom(1);
    array[@ i,5] = 0;
    repeat (8) {
        var num = irandom(10);
        switch (num) {
            case (0):
                array[@ i,5] = array[@ i,5] | (ARROW_N);
                break;
            case (1):
                array[@ i,5] = array[@ i,5] | (ARROW_NE);
                break;
            case (2):
                array[@ i,5] = array[@ i,5] | (ARROW_E);
                break;
            case (3):
                array[@ i,5] = array[@ i,5] | (ARROW_SE);
                break;
            case (4):
                array[@ i,5] = array[@ i,5] | (ARROW_S);
                break;
            case (5):
                array[@ i,5] = array[@ i,5] | (ARROW_SW);
                break;
            case (6):
                array[@ i,5] = array[@ i,5] | (ARROW_W);
                break;
            case (7):
                array[@ i,5] = array[@ i,5] | (ARROW_NW);
                break;
        }
    }
    
    array[@ i,6] = false;
    if (!is_red)
        create_card(array[@ i,0], array[@ i,1], array[@ i,2], array[@ i,3], array[@ i,4], array[@ i,5]);
}
