// Gets card info from the proper hands.
var card_identity = argument0;
if (card_identity >= 16) card_identity -= 16;

var returned;

if (card_identity < 5) {
    for (var i = 0; i < 6; i++) {
        returned[i] = obj_game.blue_hand[card_identity, i];    
    }
} else {
    card_identity -= 5;
    for (var i = 0; i < 6; i++) {
        returned[i] = obj_game.red_hand[card_identity, i];    
    }
}

return returned;
