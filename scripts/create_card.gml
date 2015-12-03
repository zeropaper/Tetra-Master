// Creates an obj_player_card from the card values.

var inst_id = instance_create(270, 8 + 52 * instance_number(obj_player_card), obj_player_card);
inst_id.name = argument0;
inst_id.attack_type = argument1;
inst_id.attack_power = argument2;
inst_id.physical_defense = argument3;
inst_id.magical_defense = argument4;
inst_id.arrows = argument5;
inst_id.cardNumber = instance_number(obj_player_card) - 1;
inst_id.handNumber = inst_id.cardNumber;
inst_id.hoverOver = false;
