/// @description Find number of entries with the value of X inside a Y list
/// @arg list
/// @arg value
var list = argument0;
var value = argument1;
var count = 0;
for(var i = 0; i < ds_list_size(list); i++)
{
	if (ds_list_find_value(list, i) == value){
		count++;
	}
}
return count;