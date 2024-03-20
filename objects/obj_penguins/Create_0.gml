/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// Set movement type to dash towards near the center of the screen
movement_type = 2;

offset = 300;

x_destination = irandom_range((room_width / 2) - offset, (room_width / 2) + offset);
y_destination = irandom_range((room_height / 2) - offset, (room_height / 2) + offset);
//show_debug_message(x_destination);
//show_debug_message(y_destination);

explosion_frames = 30;
explosion_counter = explosion_frames;
explosion_phase = 0;