// This script populates the hand array with a hand of blank cards.
// @argument0: the hand array to populate.

array = argument0;
for (var i = 4; i >= 0; i--) {
    for (var j = 6; j >= 0; j--) {
        if (j != 0) {
            array[@ i,j] = 0;
        } else {
            array[@ i,j] = "## NO CARD ##";
        }
    }
}
