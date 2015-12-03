// Plays the sound effect, making sure only one instance
// of it is playing at any given time.
// @argument0: the sound effect to play

var sfx = argument0;
audio_stop_sound(sfx);
audio_play_sound(sfx, 0, false);
