var move_x = argument0;
var move_y = argument1;
var x_off = argument2;
var y_off = argument3;
var card = argument4;

var attack_type = obj_game.red_hand[card, 1];

if (!move_possible(move_x + x_off, move_y + y_off)) {
    return 0;
}

var square = obj_game.game_grid[move_x + x_off, move_y + y_off];
if (square == GRID_BLOCKED) {
    return 0;
}

var arrow_pointing = 0;
var opposite_arrow = 0;
switch (x_off) {
    case (0):
        switch (y_off) {
            case (1):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_S;
                opposite_arrow = opposite_arrow | ARROW_N;
            break;
            case (-1):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_N;
                opposite_arrow = opposite_arrow | ARROW_S;
            break;
        }
    break;
    case (1):
        switch (y_off) {
            case (1):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_SE;
                opposite_arrow = opposite_arrow | ARROW_NW;
            break;
            case (0):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_E;
                opposite_arrow = opposite_arrow | ARROW_W;
            break;
            case (-1):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_NE;
                opposite_arrow = opposite_arrow | ARROW_SW;
            break;
        }
    break;
    case (-1):
        switch (y_off) {
            case (1):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_SW;
                opposite_arrow = opposite_arrow | ARROW_NE;
            break;
            case (0):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_W;
                opposite_arrow = opposite_arrow | ARROW_E;
            break;
            case (-1):
                arrow_pointing = obj_game.red_hand[card, 5] & ARROW_NW;
                opposite_arrow = opposite_arrow | ARROW_SE;
            break;
        }
    break;
}

if (square == GRID_EMPTY) {
    if (arrow_pointing) {
        var avg_def = (obj_game.red_hand[card, 3] + obj_game.red_hand[card, 4]) / 2
        return 5 * ((avg_def + 1) / (analyze_enemy_attack() + 2));
    }
    else {
        return 0;
    }
}

if (!arrow_pointing) {
    return 0;
} else {
    
    // Card is pointing to its own color.
    // Bad because it could lead to enemy combos.
    // But if defense is high, it should matter less.
    // So take the known average of the enemy attack power.
    if ((square & 16)) {
        var avg_def = (obj_game.red_hand[card, 3] + obj_game.red_hand[card, 4]) / 2
        if (avg_def == 0) return -5;
        return -5 * (analyze_enemy_attack() / avg_def);
    } else {
        
        //show_debug_message("Pointing at enemy card: " + string(square));
    
        // Now we're pointing towards a blue card.
        var card_info = get_card_info(square);

        var enemy_atk = card_info[2];
        var enemy_pdf = card_info[3];
        var enemy_mdf = card_info[4];
        var enemy_arrows = card_info[5];
        var card_battle = enemy_arrows & opposite_arrow;
        
        if (card_battle) {
            var combo_bonus = 10 * think_check_combos(move_x + x_off, move_y + y_off, enemy_arrows);
            switch (attack_type) {
                case (PHYSICAL):
                    var attack = obj_game.red_hand[card, 2];
                    var defense = enemy_pdf;
                break;
                case (MAGICAL):
                    var attack = obj_game.red_hand[card, 2];
                    var defense = enemy_mdf;
                break;
                case (FLEXIBLE):
                    var attack = obj_game.red_hand[card, 2];
                    var defense = min(enemy_pdf, enemy_mdf);
                break;
                case (ASSAULT):
                    var attack = max(obj_game.red_hand[card, 2], max(obj_game.red_hand[card, 3], obj_game.red_hand[card, 4]));
                    var defense = min(enemy_atk, min(enemy_pdf, enemy_mdf));
                break;
            }
            
            // This should never overestimate probability of winning
            var percentage = heuristic_win_chance(attack, defense)

            //show_debug_message("Attack: " + string(attack) + " Defense: " + string(defense));
            //show_debug_message("Percentage: " + string(percentage));
            
            obj_ai.card_battles++;
            return percentage * (40 + combo_bonus);
        } else {
            // Takes a card for free
            obj_ai.free_takes++;
            return 30;
        }
    }
}
