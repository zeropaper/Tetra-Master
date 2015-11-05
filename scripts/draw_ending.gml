var win_state = argument0;
var alpha = argument1;
alpha = clamp(alpha, 0, .85);

switch (win_state) {
    case (BLUE_PERFECT):
        draw_sprite_ext(spr_perfect, 0, 160, 110, 1.25, 1.25, 0, c_white, alpha);
    break;
    
    case (BLUE_WIN):
        draw_sprite_ext(spr_win, 0, 160, 110, 1.25, 1.25, 0, c_white, alpha);
    
    break;
    
    case (TIE):
        draw_sprite_ext(spr_draw, 0, 160, 110, 1.25, 1.25, 0, c_white, alpha);
    break;
    
    default:
        draw_sprite_ext(spr_lose, 0, 160, 110, 1.25, 1.25, 0, c_white, alpha);
    break;
}
