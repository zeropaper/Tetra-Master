if (obj_network.server != noone) {
    network_destroy(obj_network.server);
}

if (obj_network.socket != noone) {
    network_destroy(obj_network.socket);
}

obj_network.connect_status = connstatus.none;

obj_network.server = noone;
obj_network.socket = noone;
obj_network.port = 6510;

obj_network.typing_ip = false;
obj_network.alarm[3] = -1;

ds_list_clear(obj_network.chat_list);
