// Sets and creates a particle effect for the coin based on
// which player is moving first.

switch (current_player_turn) {
    case (BLUE_TURN):
        part_type_sprite(global.p_coin_pick, spr_blue_pick, false, false, false);
        part_type_sprite(global.p_coin_move, spr_blue_pick, false, false, false);
        part_type_direction(global.p_coin_move, 27.5, 27.5, 0, 0)
    break;
    case (RED_TURN):
        part_type_sprite(global.p_coin_pick, spr_red_pick, false, false, false);
        part_type_sprite(global.p_coin_move, spr_red_pick, false, false, false);
        part_type_direction(global.p_coin_move, 180 - 27.5, 180 - 27.5, 0, 0)    
    break;
}

part_particles_create(global.particles, 160, 110, global.p_coin_flip, 1);
