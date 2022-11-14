/// @description 
var type	= async_load[? "type"];
var sID		= async_load[? "id"];		// socket ID
var sock	= async_load[? "socket"];
var ip		= async_load[? "ip"];
var port	= async_load[? "port"];		// port associated with ip
/********************************************************/
if ( server==sID ){
	switch(type) {
	case network_type_connect:
		if not ds_list_find_index(sockets, sock)+1 {
			ds_list_add(sockets, sock);
		}
		var inst = ds_map_find_value(clients, sock); 
		if is_undefined(inst)
		{
			inst = instance_create_layer(x, y, "Instances", o_player);
			ds_map_add(clients, sock, inst);
		}
	break;

	case network_type_disconnect:
		if ds_list_find_index(sockets, sock)+1 {
			var index = ds_list_find_index(sockets, sock);
			ds_list_delete(sockets, index);
		}
	break;

	case network_type_data:
		var inst = ds_map_find_value(clients, sock);
		var t_buffer = async_load[? "buffer"];
		
		var cmd_type = buffer_read(t_buffer, buffer_u8);
		switch(cmd_type)
		{
			case CMD_KEY:
				inst.input_left =	buffer_read(t_buffer, buffer_u32);
				inst.input_right =	buffer_read(t_buffer, buffer_u32);
				inst.input_up =		buffer_read(t_buffer, buffer_u32);
				inst.input_down =	buffer_read(t_buffer, buffer_u32);
				inst.input_bomb =	buffer_read(t_buffer, buffer_u32);
				break;
		}
		//network_server_receive_data(buffer);
	break;
	}
}