/// @description 
draw_set_color(c_white);
draw_text(350, 50, "Server");
draw_text(350, 100, "server: " + string(server));

draw_text(350, 150, "sockets");
draw_text(350, 170, "number of clients " + 
	string(ds_list_size(sockets)));