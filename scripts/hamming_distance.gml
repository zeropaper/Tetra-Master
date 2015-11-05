// http://en.wikipedia.org/wiki/Hamming_distance

var dist = 0;
var val = abs(argument0) ^ abs(argument1);

while (val != 0)
{
    dist++;
    val &= val - 1;
}

return dist;
