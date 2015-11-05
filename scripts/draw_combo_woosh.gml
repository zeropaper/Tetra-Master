draw_x = argument0;
draw_y = argument1;
origin_x = argument2;
origin_y = argument3;
time = clamp((50 - argument4) / 25, 0, 1);

draw_set_alpha(sin(7.2 * (50-argument4) * pi/180));
draw_set_color(c_white);
switch(origin_x) {
    case (-1):
        switch(origin_y){
            case (-1):
               draw_line_width(draw_x - 2 + sprite_width * (time), draw_y, draw_x - 2 + sprite_width * (time), draw_y + sprite_height * time, 4);
               draw_line_width(draw_x, draw_y + sprite_height * time, draw_x + sprite_width * (time), draw_y + sprite_height * time, 4);
            break;
            case (0):
                draw_line_width(draw_x - 2 + sprite_width * (time), draw_y, draw_x - 2 + sprite_width * (time), draw_y + sprite_height, 4);
            break;
            case (1):
               draw_line_width(draw_x - 2 + sprite_width * (time), draw_y + sprite_height, draw_x - 2 + sprite_width * (time), draw_y + sprite_height * (1-time), 4);
               draw_line_width(draw_x, draw_y + sprite_height * (1-time), draw_x + sprite_width * (time), draw_y + sprite_height * (1-time), 4);
            break;
        }
    break;
    case (0):
        switch(origin_y){
            case (-1):
                draw_line_width(draw_x, draw_y + sprite_height * time, draw_x + sprite_width, draw_y + sprite_height * time, 4);
            break;
            case (1):
                draw_line_width(draw_x, draw_y + sprite_height * (1-time), draw_x + sprite_width, draw_y + sprite_height * (1-time), 4);
            break;
        }
    break;
    case (1):
        switch(origin_y){
            case (-1):
                draw_line_width(draw_x - 2 + sprite_width * (1-time), draw_y, draw_x - 2 + sprite_width * (1-time), draw_y + sprite_height * time, 4);
                draw_line_width(draw_x + sprite_width, draw_y + sprite_height * time, draw_x + sprite_width * (1-time), draw_y + sprite_height * time, 4);
            break;
            case (0):
                draw_line_width(draw_x + - 2 + sprite_width * (1-time), draw_y, draw_x - 2+ sprite_width * (1-time), draw_y + sprite_height, 4);
            break;
            case (1):
                draw_line_width(draw_x - 2 + sprite_width * (1-time), draw_y + sprite_height, draw_x - 2 + sprite_width * (1-time), draw_y + sprite_height * (1-time), 4);
                draw_line_width(draw_x + sprite_width, draw_y + sprite_height * (1-time), draw_x + sprite_width * (1-time), draw_y + sprite_height * (1-time), 4);
            break;
        }
    break;

}
draw_set_alpha(1);
draw_set_color(c_black);
