card_x = argument0;
card_y = argument1;
card_arr = argument2;

if (card_arr & ARROW_N)   draw_sprite(spr_arrow, 0, card_x + 17, card_y + 0);
if (card_arr & ARROW_NE)  draw_sprite(spr_arrow, 1, card_x + 35, card_y + 1);
if (card_arr & ARROW_E)   draw_sprite(spr_arrow, 2, card_x + 37, card_y + 21);
if (card_arr & ARROW_SE)  draw_sprite(spr_arrow, 3, card_x + 35, card_y + 44);
if (card_arr & ARROW_S)   draw_sprite(spr_arrow, 4, card_x + 17, card_y + 46);
if (card_arr & ARROW_SW)  draw_sprite(spr_arrow, 5, card_x + 1, card_y + 44);
if (card_arr & ARROW_W)   draw_sprite(spr_arrow, 6, card_x + 0, card_y + 21);
if (card_arr & ARROW_NW)  draw_sprite(spr_arrow, 7, card_x + 1, card_y + 1);
