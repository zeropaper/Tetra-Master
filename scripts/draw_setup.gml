var every_ten = !(alarm[0] % 10);   // This is true every ten frames of the setup.

if (alarm[0] != -1) {

    // Between frames 180 and 120 left on the alarm,
    // set up the enemy cards and place stones.
    if (alarm[0] >= 120 && alarm[0] < 180) {
        if (every_ten) {
            if (instance_number(obj_enemy_card) < 5) {
                instance_create(16, 240, obj_enemy_card);
            }
            create_block()
        }
    }
    
    
    // Draw the coin after all the stones have been placed.
    if (alarm[0] < 115 && alarm[0] > 60) {
        draw_sprite(spr_coin, -1, 160, 110);
    } else if (alarm[0] <= 60 && alarm[0] > 30) {
        draw_sprite(spr_coin, current_player_turn * 4, 160, 110);
    } else if (alarm[0] <= 30) {
        var dir;
        switch (current_player_turn) {
            case (BLUE_TURN):
                dir = 1;
                break;
            case (RED_TURN):
                dir = -1;
                break;
        }
        // -65y in ten frames 125x in ten frames
        draw_sprite_ext(spr_coin, current_player_turn * 4, (dir * 125 * ((10-(alarm[0]- 20)) / 10) + 160), (110 - 65 * ((10-(alarm[0]-20)) / 10)), 1, 1, 0, c_white, (alarm[0]-20)/10);
    }
    
    // Play sounds for the coin.
    if (alarm[0] == 115) {
        audio_play_sound(snd_coin, 0, true);
    }
    if (alarm[0] == 60) {
        audio_stop_sound(snd_coin);
    }
    
}
