/// @description 
clients = ds_map_create();
sockets = ds_list_create();

client_buffer = buffer_create(65535, buffer_grow, 4);
port = 6510;
server_max_players = 5;

server = network_create_server(network_socket_tcp, port, server_max_players);
while (server < 0 && port < 65535) {
	port++;
	server = network_create_server(
		network_socket_tcp, 
		port, 
		server_max_players
	);
}

if ( server >= 0 ) {
	global.onHost = true;
} 