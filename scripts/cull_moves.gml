// Culls impossible moves in the AI routine.

var possible_moves = argument0;
var new_moves = ds_list_create();

if !ds_list_empty(possible_moves) {
    for (var i = 0; i < ds_list_size(possible_moves); i++) {
        var move_number = possible_moves[| i];
        var card_number = floor(move_number / 100);
        var card_x = (move_number % 100) % 4;
        var card_y = floor((move_number % 100) / 4);
        if (!obj_game.red_hand[card_number, 6] && obj_game.game_grid[card_x, card_y] == GRID_EMPTY) {
            ds_list_add(new_moves, move_number);
            //show_debug_message("Possible move: " + string(move_number));
        }
    }
}

ds_list_destroy(possible_moves);
return new_moves;
