var px = argument0;
var py = argument1;
var card_info = get_card_info(obj_game.game_grid[px, py]);
var card_owner = owned_by_red(obj_game.game_grid[px, py]);

var battles;
var battle_index = 1;

var card;
var e_card_info;

for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
        if (i != 0 || j != 0) {
            if (move_possible(px + i, py + j) && (card_info[5] & get_arrow(i, j))) {
                card = obj_game.game_grid[px + i, py + j];
                if (card != GRID_EMPTY && card != GRID_BLOCKED && owned_by_red(card) != card_owner) {
                    e_card_info = get_card_info(card);
                    if (e_card_info[5] & get_arrow_opposite(i, j)) {
                        battles[battle_index, 0] = i;
                        battles[battle_index, 1] = j;
                        battle_index++;
                    }
                }
            }
        }
    }
}

battles[0, 0] = battle_index - 1;
return battles;
