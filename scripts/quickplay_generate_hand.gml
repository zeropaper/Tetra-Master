array = argument0;
var picked_cards = 0;

// First we need to find out what cards are available, and the power
// of the player's deck.
var deck_power = 0;
var num_cards = 0;
for (var i = 0; i < 100; i++) {
        if (!ds_list_empty(global.card_deck[i])) {
            num_cards++;
            deck_power += get_card_avg_power(i);
        }
}

// Average power of the deck.
deck_power /= max(num_cards / 2, 1);
show_debug_message("Deck Power: " + string(deck_power));

var card_choice = ds_priority_create();
for (var i = 0; i < 100; i++) {
        if (!ds_list_empty(global.card_deck[i])) {
            for (var j = 0; j < ds_list_size(global.card_deck[i]); j++) {
                ds_priority_add( card_choice, global.card_deck[i], abs(deck_power - get_card_avg_power(i)) + random(.33 * (j + 1) * deck_power) )
            }
        }
}

for (var i = 0; i < 5; i++) {
    var deck = ds_priority_delete_min(card_choice);
    ds_list_shuffle(deck);
    var card = ds_list_find_value(deck, 0);
    show_debug_message("Picked: " + debug_card_string(card[0], card[1], card[2], card[3], card[4], card[5], true));
    for (var q = 0; q < 6; q++) {
        array[@ picked_cards,q] = card[q];
    }
    array[@ picked_cards,6] = false;
    picked_cards++;
    ds_list_delete(deck, 0);
}

for (var i = 0; i <= 4; i++) {
    create_card(array[@ i,0], array[@ i,1], array[@ i,2], array[@ i,3], array[@ i,4], array[@ i,5]);
}

ds_priority_destroy(card_choice);
