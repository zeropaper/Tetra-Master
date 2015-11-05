var attacker_x = argument0;
var attacker_y = argument1;
var defender_x = argument2;
var defender_y = argument3;

var attacking_card = obj_game.game_grid[attacker_x, attacker_y];
var defending_card = obj_game.game_grid[defender_x, defender_y];
var attacker_info = get_card_info(attacking_card);
var defender_info = get_card_info(defending_card);

if (owned_by_red(attacking_card) == owned_by_red(defending_card)) {
    exit;
}

var attack_power = 0;
var defend_power = 0;

switch (attacker_info[1]) {
    case (PHYSICAL):
        attack_power = attacker_info[2];
        defend_power = defender_info[3];
    break;
    case (MAGICAL):
        attack_power = attacker_info[2];
        defend_power = defender_info[4];
    break;
    case (FLEXIBLE):
        attack_power = attacker_info[2];
        defend_power = min(defender_info[3], defender_info[4]);
    break;
    case (ASSAULT):
        attack_power = max(attacker_info[2], max(attacker_info[3], attacker_info[4]));
        defend_power = min(defender_info[2], min(defender_info[3], defender_info[4]));
    break;
}

// Attacker and defender rolls
var afr = (16 * attack_power) + irandom(15);
var asr = irandom(afr);
var dfr = (16 * defend_power) + irandom(15);
var dsr = irandom(dfr);

// You fucking cheater 
/*
if (keyboard_check(ord("W"))) {
    dfr = 1;
    dsr = 1;
}

if (keyboard_check(ord("L"))) {
    afr = 1;
    asr = 1;
}
*/


// show_debug_message("Attacking roll: " + string(afr - asr) + ", Defending Roll: " + string(dfr - dsr));

if ((afr - asr) > (dfr - dsr)) {
    // Attacker won
    obj_between.taken_x = defender_x;
    obj_between.taken_y = defender_y;
    obj_between.battle_winner = owned_by_red(attacking_card);
} else {
    // Defender won
    obj_between.taken_x = attacker_x;
    obj_between.taken_y = attacker_y;
    obj_between.battle_winner = owned_by_red(defending_card);
}

// Let's get the field cards to do animation.
// Starting with the attacker...

var battle_speed = 30 + irandom(30);

var inst_id = collision_point(gulx(attacker_x) + 2, guly(attacker_y) + 2, obj_field_card, false, true);
inst_id.card_battling = true;
inst_id.card_battling_x = sign(defender_x - attacker_x);
inst_id.card_battling_y = sign(defender_y - attacker_y);
inst_id.card_battling_f = afr;
inst_id.card_battling_s = asr;
inst_id.battle_speed = battle_speed;
inst_id.timeline_index = tl_card_battle;
inst_id.timeline_position = 0;
inst_id.timeline_running = true;

// Now the defender.
inst_id = collision_point(gulx(defender_x) + 2, guly(defender_y) + 2, obj_field_card, false, false);
inst_id.card_battling = true;
inst_id.card_battling_x = -sign(defender_x - attacker_x);
inst_id.card_battling_y = -sign(defender_y - attacker_y);
inst_id.card_battling_f = dfr;
inst_id.card_battling_s = dsr;
inst_id.battle_speed = battle_speed;
inst_id.timeline_index = tl_card_battle;
inst_id.timeline_position = 0;
inst_id.timeline_running = true;
