var attack = argument0
var defense = argument1

if (attack >= defense) {
    return 1 - ((1 + (((defense+1) * 16) / 2))  / (2* (((attack+1) * 16) / 2.2)))
} else {
    return 1 - (1 - ((1 + (((attack+1) * 16) / 2.2))  / (2* (((defense+1) * 16) / 2))));
}
