/// @description 
if global.onHost < 0
global.onHost = false;


port = 6510;
url = "127.0.0.1";
client = network_create_socket(network_socket_tcp);

/* Attempt connection */
connect = network_connect(client, url, port);
while (connect < 0 && port < 65535) 
{
	port++;
	connect = network_connect(client, url, port);
}

allsprites = ds_list_create();
sprite_count = 0;

mybuffer = buffer_create(1024, buffer_grow, 2);