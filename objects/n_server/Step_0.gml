/// @description 
var client_number = ds_list_size(sockets);
if ( client_number>0 ) {
	global.client_buffer = client_buffer;
	
	buffer_seek(client_buffer, buffer_seek_start, 0);
	buffer_write(client_buffer, buffer_u8, CMD_SPR);
	
	var sprite_count = global.player_count + global.solid_count 
		+ global.bomb_count + global.explosion_count + global.item_count;
	buffer_write(client_buffer, buffer_f32, sprite_count);
	
	with (n_object) {
		buffer_write_sprite(global.client_buffer);
	}
	
	/* send all sprites to all clients */
	for (var i = 0; i < client_number; i++) {
		var myclient = ds_list_find_value(sockets, i);
		network_send_packet(myclient, client_buffer, buffer_tell(client_buffer));
	}
}
