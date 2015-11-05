for (var i = 0; i < 4; i++) {
    for (var j = 0; j < 4; j++) {
        if (game_grid[i, j] == 10 && !collision_point(93 + 43 * i, 33 + 52 * j, obj_stone, true, true)) {
            instance_create(93 + 43 * i, 33 + 52 * j, obj_stone);
            exit;
        }
    }
}
