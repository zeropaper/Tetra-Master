// This script takes a value and returns a string for the attack type.

switch(argument0) {
    case (PHYSICAL):
        return "Physical";
        break;
        
    case (MAGICAL):
        return "Magical";
        break;
    
    case (FLEXIBLE):
        return "Flexible";
        break;
        
    case (ASSAULT):
        return "Assault";
        break;
}

return "Invalid";
