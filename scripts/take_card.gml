var taken_x = argument0;
var taken_y = argument1;
var take_combo = argument2;
var take_color = argument3;

if (!move_possible(taken_x, taken_y)) {
    exit;
}

var square = obj_game.game_grid[taken_x, taken_y];
if (square == GRID_EMPTY || square == GRID_BLOCKED || owned_by_red(square) == take_color) {
    exit;
}

if (take_combo) {
    if (take_color == RED) {
        obj_game.game_grid[taken_x, taken_y] = square | 16;
    }
    else {
        obj_game.game_grid[taken_x, taken_y] = square - 16;
    }
    
    var inst_id = collision_point(gulx(taken_x) + 2, guly(taken_y) + 2, obj_field_card, false, true);
    inst_id.flipping = true;
    inst_id.flip_cb = true;
    inst_id.alarm[0] = 30;
    play_sfx(snd_flip_card);
    var orig_id = inst_id;
    var req_arrow = 0;
    
    update_scores();
    with (obj_game) {
        event_perform(ev_alarm, 1);
    }
    
    var combos = 0;
    var card_info = get_card_info(square);
    
    // Take all cards pointing to it
    for (var i = -1; i <= 1; i++) {
        for (var j = -1; j <= 1; j++) {
            if (i != 0 || j != 0) {
                if (move_possible(taken_x + i, taken_y + j) && (card_info[5] & get_arrow(i, j))) {
                    var combo_card = obj_game.game_grid[taken_x + i, taken_y + j];
                    if (combo_card != GRID_EMPTY && combo_card != GRID_BLOCKED &&
                    owned_by_red(combo_card) != take_color) {
                            if (take_color == RED) {
                                obj_game.game_grid[taken_x + i, taken_y + j] = combo_card | 16;
                            }
                            else {
                                obj_game.game_grid[taken_x + i, taken_y + j] = combo_card - 16;
                            }
                            
                            var inst_id = collision_point(gulx(taken_x + i) + 2, guly(taken_y + j) + 2, obj_field_card, false, true);
                            inst_id.flipping = true;
                            inst_id.flip_combo = true;
                            inst_id.alarm[4] = 50;
                            inst_id.alarm[0] = 100;
                            inst_id.origin_x = -i;
                            inst_id.origin_y = -j;
                            combos++;
                            req_arrow = req_arrow | get_arrow(i, j);
                    }
                }
            }
        }
    }
    
    obj_game.alarm[1] = 40;
    orig_id.req_arrow = req_arrow;
    orig_id.combos = combos;
    if (combos) {
        obj_between.alarm[1] = 80;
    }

} else {
    if (take_color == RED) {
        obj_game.game_grid[taken_x, taken_y] = square | 16;
    }
    else {
        obj_game.game_grid[taken_x, taken_y] = square - 16;
    }
    var inst_id = collision_point(gulx(taken_x) + 2, guly(taken_y) + 2, obj_field_card, false, true);
    inst_id.flipping = true;
    inst_id.alarm[0] = 60;
    play_sfx(snd_flip_card);
}
