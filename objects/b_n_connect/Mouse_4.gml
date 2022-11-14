/// @description 
var object = n_client;
if instance_exists(object) { return; }
instance_create_layer(x, y, layer, object);
room_goto_next();