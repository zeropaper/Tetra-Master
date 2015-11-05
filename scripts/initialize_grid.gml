// This script empties the game's grid.

// Sets the array to be completely empty.
array = argument0;
for (var i = 3; i >= 0; i--) {
    for (var j = 3; j >= 0; j--) {
        array[@ i, j] = GRID_EMPTY;
    }
}

with (obj_stone) {
    instance_destroy();
}

with (obj_enemy_card) {
    instance_destroy();
}

with (obj_player_card) {
    instance_destroy();
}
