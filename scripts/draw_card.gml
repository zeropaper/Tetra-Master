// Draws a card and its attributes.

var card_x = argument0;
var card_y = argument1;
var card_nam = get_card_index_from_name(argument2);
var card_typ = get_attack_type(argument3);
var card_att = argument4;
var card_pdf = argument5;
var card_mdf = argument6;
var card_arr = argument7;
var draw_small = argument8;
var draw_red = argument9;

if (draw_red) {
    var spr_card = spr_card_red;
} else {
    var spr_card = spr_card_blue;
}

if (draw_small) {
    draw_sprite_ext(spr_card, draw_red, card_x,     card_y,     .8, .8, 0, c_white, 1);
    draw_sprite_ext(spr_cards, card_nam, card_x + 2, card_y + 2, .82, .82, 0, c_white, 1);
    
    if (card_arr & ARROW_N)  draw_sprite(spr_arrow, 0, card_x + 13, card_y + 0);
    if (card_arr & ARROW_NE) draw_sprite(spr_arrow, 1, card_x + 27, card_y + 1);
    if (card_arr & ARROW_E)  draw_sprite(spr_arrow, 2, card_x + 29, card_y + 17);
    if (card_arr & ARROW_SE) draw_sprite(spr_arrow, 3, card_x + 27, card_y + 34);
    if (card_arr & ARROW_S)  draw_sprite(spr_arrow, 4, card_x + 13, card_y + 36);
    if (card_arr & ARROW_SW) draw_sprite(spr_arrow, 5, card_x +  1, card_y + 34);
    if (card_arr & ARROW_W)  draw_sprite(spr_arrow, 6, card_x +  0, card_y + 17);
    if (card_arr & ARROW_NW) draw_sprite(spr_arrow, 7, card_x +  1, card_y + 1);
    draw_sprite(spr_number, card_att, card_x + 4,  card_y + 27);
    draw_sprite(spr_number, card_pdf, card_x + 16, card_y + 27);
    draw_sprite(spr_number, card_mdf, card_x + 22, card_y + 27);
    draw_sprite(spr_number, card_typ, card_x + 10, card_y + 27);
} else {
    draw_sprite(spr_card, draw_red, card_x,     card_y   );
    draw_sprite(spr_cards, card_nam, card_x + 2, card_y + 2)
    draw_arrows(card_x, card_y, card_arr)
    draw_sprite(spr_number, card_att, card_x +  9, card_y + 38);
    draw_sprite(spr_number, card_pdf, card_x + 21, card_y + 38);
    draw_sprite(spr_number, card_mdf, card_x + 27, card_y + 38);
    draw_sprite(spr_number, card_typ, card_x + 15, card_y + 38);
}
