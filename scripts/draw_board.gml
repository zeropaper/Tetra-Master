if (!instance_exists(obj_network)) {
    if (timeline_running) {
        draw_background_ext(bg_tetraboard, 0, 0, 1, 1, 0, c_white, min(1, timeline_position / 40));
    } else if (GAME_STARTED && !ending) {
        draw_background(bg_tetraboard, 0, 0);
    }
}
else {
    if (timeline_running) {
        draw_background_ext(bg_tetraboard_online, 0, 0, 1, 1, 0, c_white, min(1, timeline_position / 40));
    } else if (GAME_STARTED && !ending) {
        draw_background(bg_tetraboard_online, 0, 0);
    }
}
