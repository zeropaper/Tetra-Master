// Places a card on the board.
var place_x = argument0;
var place_y = argument1;
var card_index = argument2;
var owner_is_red = argument3;

if (!move_possible(place_x, place_y)) {
    show_debug_message("Impossible move attempted - x = " + string(place_x) + ", y = " + string(place_y) + ", index = " + string(card_index));
    return -1;
}

if (obj_game.game_grid[place_x, place_y])   {
    show_debug_message("Impossible move attempted - x = " + string(place_x) + ", y = " + string(place_y) + ", index = " + string(card_index));
    return -1;
}

if (owner_is_red) {
    if (obj_game.red_hand[card_index - 5, 6]) {
        show_debug_message("Attempting to play card already played.");
        return -1;
    }
} else {
    if (obj_game.blue_hand[card_index, 6]) {
        show_debug_message("Attempting to play card already played.");
        return -1;
    }
}

obj_game.game_grid[place_x, place_y] = card_index | (16 * owner_is_red);

if (owner_is_red) {
    obj_game.red_hand[card_index - 5, 6] = true;
} else {
    obj_game.blue_hand[card_index, 6] = true;
}

var view_card = instance_create(gulx(place_x), guly(place_y), obj_field_card);
view_card.place_x = place_x;
view_card.place_y = place_y;

CARDS_PLACED++;
update_scores();
obj_game.alarm[1] = 1;

return 0;
