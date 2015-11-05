var move_x = argument0;
var move_y = argument1;
var enemy_arrows = argument2;
var num_combos = 0;

for (var i = -1; i <= 1; i++) {
    for (var j = -1; j <= 1; j++) {
        if (i != 0 || j != 0) {
            if (move_possible(move_x + i, move_y + j)) {
                var t_card = obj_game.game_grid[move_x + i, move_y + j];
                if (t_card < 5 && t_card >= 0 && (enemy_arrows & get_arrow(i, j))) {
                    num_combos++;
                }
            }
        }
    }
}

return num_combos;
