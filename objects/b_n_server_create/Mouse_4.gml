/// @description 
var object = n_server;
if instance_exists(object) { return; }
instance_create_layer(x, y, layer, object);
show_server = true;