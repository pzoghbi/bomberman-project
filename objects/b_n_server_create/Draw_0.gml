/// @description 
if (show_server) {
	draw_set_color(c_lime);
	draw_text(10, room_height-60, "Server started.");
	draw_set_color(c_white);
} else {
	draw_self();
}