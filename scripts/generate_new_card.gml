var num = argument0;
var card_stats = get_card_max_stats(num);
card_stats[2] = max(card_stats[2] - irandom(2), 0);
card_stats[3] = max(card_stats[3] - irandom(2), 0);
card_stats[4] = max(card_stats[4] - irandom(2), 0);
card_stats[5] = 0;
repeat (8) {
    if (irandom(2))
        card_stats[5] = card_stats[5] | (1 << (4 * irandom(7)));
}
return card_stats;
