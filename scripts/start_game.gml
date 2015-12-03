// Starts the game.

// Randomize the game so we get a new seed on load.
randomize();

// Initialize the grid by clearing it.
initialize_grid(game_grid);

if (global.quickplay) {
    quickplay_generate_hand(blue_hand);
} else {
    // The Hand has been generated before.
}

// Generate the enemy's hand.
generate_enemy_hand(red_hand);

// Initialize game variables.
BLUE_SCORE = 0;
RED_SCORE = 0;
TURN = NO_TURN;
GAME_STARTED = false;
SELECTED_CARD = NO_CARD;
CARDS_PLACED = 0;

// Start the timeline.
timeline_index = tl_game_setup;
timeline_position = 0;
timeline_running = true;
obj_game.alarm[1] = 5;

// Set up the blocks.
repeat (6) {
    if (irandom(1)) {
        var randX = irandom(3);
        var randY = irandom(3);
        if (game_grid[randX, randY] == GRID_EMPTY) {
            game_grid[randX, randY] = GRID_BLOCKED;
        }
    }
}

// Select who goes first.
switch (irandom(1)) {
    case (0):
        TURN = BLUE_TURN;
        break;
    
    case (1):
        TURN = RED_TURN;
        break;
}
