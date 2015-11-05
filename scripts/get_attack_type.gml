// This script takes a value and returns the corresponding "spr_number"
// image index for the attack type.

switch(argument0) {
    case (PHYSICAL):
        return 16;
        break;
        
    case (MAGICAL):
        return 17;
        break;
    
    case (FLEXIBLE):
        return 18;
        break;
        
    case (ASSAULT):
        return 10;
        break;
}

return "Invalid";
