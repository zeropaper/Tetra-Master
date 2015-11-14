var num_strings = argument0 - 1;
var chat_list = argument1;
var str = "";

for (var num = min(ds_list_size(chat_list)-1, num_strings); num >= 0; num--) {
    str += ds_list_find_value(chat_list, num) + "#";
}

return str;
