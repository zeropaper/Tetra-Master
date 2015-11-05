//

array = argument0;

var blue_power = 0;

// First, lets take the power of the blue hand.
for (var i = 0; i < 5; i++) {
    blue_power += ((obj_game.blue_hand[i, 2] + obj_game.blue_hand[i, 3] + obj_game.blue_hand[i, 4]) / 3);
}
blue_power /= 5; // Average power of the Blue hand
blue_power += .5; // If we don't add, the player can't ever grow.

var cards_picked = 0;
var j = 0;
var offset = .25;
var enhanced = false;
var card_en = false;

var numList = ds_list_create();
for (var i = 0; i < 100; i++) {
    ds_list_add(numList, i);
}
ds_list_shuffle(numList);

while (cards_picked != 5) {
    if (irandom(5) == 0 && !enhanced && !card_en) {
        blue_power += 1; // Make a "Rare" card
        enhanced = true;
    }
    var num = ds_list_find_value(numList, j);
    var max_power = get_card_max_stats(num);
    var avg_power = (max_power[2] + max_power[3] + max_power[4]) / 3;
    // show_debug_message("Considering " + get_card_name_from_index(num) + "... " + string(blue_power - avg_power));
    if (abs(blue_power - avg_power) < (offset)) {
        var card = generate_new_card(num);
        for (var q = 0; q < 6; q++) {
            array[@ cards_picked,q] = card[q];
            if (irandom(128) == 0) {
                array[@ cards_picked,1] = FLEXIBLE;
            }
            if (irandom(256) == 0) {
                array[@ cards_picked,1] = ASSAULT;
            }
        }
        array[@ cards_picked,6] = false;
        cards_picked++;
        if (enhanced == true && card_en == false) {
            card_en = true;
            blue_power -= 2;
        }
    }
    j++;
    if (j >= 100) {
        j %= 100;
        offset+=.25;
    }
}

ds_list_destroy(numList);
