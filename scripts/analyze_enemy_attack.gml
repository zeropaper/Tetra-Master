var sum = 0;
var num = 0;

for (var i = 0; i < 5; i++) {
    if (obj_game.blue_hand[i, 6]) {
        sum += obj_game.blue_hand[i, 2];
        num++;    
    }
}

if (num != 0)
    return round(sum / num);
else
    return 0;
