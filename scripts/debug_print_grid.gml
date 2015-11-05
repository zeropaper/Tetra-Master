exit;
for (var i = 0; i < 4; i++) {
    var row_string = "";
    for (var j = 0; j < 4; j++) {
       row_string += string(obj_game.game_grid[j, i]) + "  ";
    }
     show_debug_message(row_string);

}
