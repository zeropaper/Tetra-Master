// Prints the hand.

array = argument0;
show_debug_message("Printing hand:")
for (var i = 0; i < 5; i++) {
    show_debug_message("Card " + string(i + 1) + ": " + debug_card_string(array[@ i,0], array[@ i,1], array[@ i,2], array[@ i,3], array[@ i,4], array[@ i,5], array[@ i,6]));
}
