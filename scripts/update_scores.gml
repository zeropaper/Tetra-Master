BLUE_SCORE = 0;
RED_SCORE = 0;
for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
        var grid = obj_game.game_grid[i, j];
        if (grid != GRID_EMPTY && grid != GRID_BLOCKED) {
            if (owned_by_red(grid)) {
                RED_SCORE++;
            } else {
                BLUE_SCORE++;
            }
        }
    }
}
