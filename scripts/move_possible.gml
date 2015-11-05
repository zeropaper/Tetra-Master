var x_move = argument0;
var y_move = argument1;

if (x_move > 3 
    || x_move < 0 
    || y_move > 3 
    || y_move < 0) {
    return 0;
}

return 1;
