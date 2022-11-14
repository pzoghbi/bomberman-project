/// @description Delete duplicated values
/// @arg list
/// @arg Associative map
// remove duplicated IDs from gamepads_using list
var list = argument0;
var map = ds_map_create();
for(var i = 0; i < ds_list_size(list); i++){
	var index = ds_list_find_value(list, i);
	if (map[? index]==true){
		ds_list_set(list, i, -1);
	} else {
		map[? index]=true;
	}
}
	
for(var i = 0; i < ds_list_size(list); i++){
	if (ds_list_find_value(list, i)<0){
		ds_list_delete(list, i);
		i = 0;
	}
}