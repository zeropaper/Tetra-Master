quickplay_generate_hand(blue_hand);
show_debug_message("PRINTING GENNED HAND:")
debug_print_hand(blue_hand);

BLUE_SCORE = 0;
RED_SCORE = 0;
TURN = NO_TURN;
GAME_STARTED = false;
SELECTED_CARD = NO_CARD;
CARDS_PLACED = 0;

if (obj_network.connect_status == connstatus.host) {
    // Set up the blocks.
    repeat (6) {
        if (irandom(1)) {
            var randX = irandom(3);
            var randY = irandom(3);
            if (obj_game.game_grid[randX, randY] == GRID_EMPTY) {
                obj_game.game_grid[randX, randY] = GRID_BLOCKED;
            }
        }
    }
    
    // Send the blocks.
    var buffer = buffer_create(256, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, EVENT_SEND_GRID)
    for (var i = 0; i < 4; i++) {
        for (var j = 0; j < 4; j++) {
            buffer_write(buffer, buffer_s8, obj_game.game_grid[i, j]);
        }
    }
    if (0 > network_send_packet(obj_network.socket, buffer, buffer_tell(buffer))) {
        net_panic();
    }
    buffer_delete(buffer);
    obj_game.network_recieved_grid = true;

    // Select who goes first.
    switch (irandom(1)) {
        case (0):
            obj_game.network_first_turn = BLUE_TURN;
            break;
        
        case (1):
            obj_game.network_first_turn = RED_TURN;
            break;
    }
    
    // Send the first turn and the seed.
    obj_game.seed = irandom(INT_MAX_32S);
    
    var buffer = buffer_create(16, buffer_grow, 1);
    buffer_seek(buffer, buffer_seek_start, 0);
    buffer_write(buffer, buffer_u8, EVENT_SEND_TURN)
    if (obj_game.network_first_turn == BLUE_TURN) {
        buffer_write(buffer, buffer_u8, RED_TURN);
    } else {
        buffer_write(buffer, buffer_u8, BLUE_TURN);
    }
    buffer_write(buffer, buffer_u64, obj_game.seed);
    if (0 > network_send_packet(obj_network.socket, buffer, buffer_tell(buffer))) {
        net_panic();
    }
    buffer_delete(buffer);
}

// Send the cards.
var buffer = buffer_create(256, buffer_grow, 1);
buffer_seek(buffer, buffer_seek_start, 0);
buffer_write(buffer, buffer_u8, EVENT_SEND_HAND);
for (var i = 0; i < 5; i++) {
    for (var j = 0; j < 7; j++) {
        if (j == 0)
            buffer_write(buffer, buffer_string, blue_hand[i, j])
        else if (j == 6)
            buffer_write(buffer, buffer_bool, blue_hand[i, j])
        else
            buffer_write(buffer, buffer_u64, blue_hand[i, j])
    }
}
if (0 > network_send_packet(obj_network.socket, buffer, buffer_tell(buffer))) {
    net_panic();
};
buffer_delete(buffer);
