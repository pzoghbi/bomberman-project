/// @description 
var type, sock_id, ip, port;
type	=	async_load[? "type"];
sock_id =	async_load[? "id"];		// socket ID
ip		=	async_load[? "ip"];
port	=	async_load[? "port"];	// port associated with IP
/********************************************************/
if ( client==sock_id ){
	switch(type) {
		case network_type_connect:
		break;

		case network_type_data:
			/***Receive Data***/
			var t_buffer = async_load[? "buffer"];
			
			// get type of data sent from the server
			var cmd_type = buffer_read(t_buffer, buffer_u8);
	
			switch(cmd_type) {
			case CMD_SPR:
				sprite_count = buffer_read(t_buffer, buffer_f32);
				ds_list_clear(allsprites);
				for(var i = 0; i < sprite_count; i++) {
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// sprite_index
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// image_index
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// x
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// y
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// image_xscale
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// image_yscale
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// image_angle
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// image_blend
					ds_list_add(allsprites, buffer_read(t_buffer, buffer_f32));	// image_alpha
				}
				break;
			}
		break;
	}
}