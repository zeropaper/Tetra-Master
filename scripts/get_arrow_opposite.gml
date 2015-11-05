var arrow_x = argument0;
var arrow_y = argument1;

switch (arrow_x) {
    case (0):
        switch (arrow_y) {
            case (1):
                return ARROW_N;
            break;
            case (-1):
                return ARROW_S;
            break;
        }
    break;
    case (1):
        switch (arrow_y) {
            case (1):
                return ARROW_NW;
            break;
            case (0):
                return ARROW_W;
            break;
            case (-1):
                return ARROW_SW;
            break;
        }
    break;
    case (-1):
        switch (arrow_y) {
            case (1):
                return ARROW_NE;
            break;
            case (0):
                return ARROW_E;
            break;
            case (-1):
                return ARROW_SE;
            break;
        }
    break;
}
