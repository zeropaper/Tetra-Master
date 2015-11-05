var sum = 0;
for (var i = 0; i < 100; i++) {
    sum += ds_list_size(global.card_deck[i]);
}
return sum;
