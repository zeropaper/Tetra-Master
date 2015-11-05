var number = floor(abs(argument0));
var draw_x = argument1;
var draw_y = argument2;

if (number == 0) {
    draw_sprite(spr_numbers_combo, 0, draw_x - 4, draw_y);
    exit;
}

var num_array = 0;
num_array[0] = 0;

var num_place = 0;
while (number) {
    number /= 10;
    num_array[num_place] = (frac(number) * 10);
    num_place++;
    number = floor(number);
}
var offset = (num_place * 9) / 2;
for (var i = num_place - 1; i >= 0; i--) {
    draw_sprite(spr_numbers_combo, num_array[i], draw_x + (num_place - 1 - i) * 8 - offset, draw_y)
}
