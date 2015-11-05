if ((timeline_running && timeline_position > 40) || game_start && !ending) {
    draw_sprite(spr_score_delim, 0,  15, 172);
    blue_score = argument0;
    red_score = argument1;
    
    if (blue_score != 10){
        draw_sprite(spr_numbers_blue, blue_score, 40, 190);
    } else {
        draw_sprite(spr_numbers_blue, 1, 38, 190);
        draw_sprite(spr_numbers_blue, 0, 50, 190)
    } 
    
    if (red_score != 10){
        draw_sprite(spr_numbers_red, red_score, 25, 150);
    } else {
        draw_sprite(spr_numbers_red, 1, 3, 150);
        draw_sprite(spr_numbers_red, 0, 15, 150)
    } 
}
