var arrow_string = debug_arrow_string(argument5);
var card_string = "Name = " + argument0 + ", ";
card_string = card_string + "Attack Type = " + str_attack_type(argument1) + ", ";
card_string = card_string + "Attack Power = " + string(argument2) + ", ";
card_string = card_string + "Physical Defense = " + string(argument3) + ", ";
card_string = card_string + "Magical Defense = " + string(argument4) + ", ";
card_string = card_string + "Arrows =" + arrow_string + ", ";
card_string = card_string + "Played = " + string(argument6) + ";";
return card_string;
