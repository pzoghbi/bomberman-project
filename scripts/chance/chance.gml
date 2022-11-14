/// Get a chance
///@arg percent chance
var percent = argument0;
var number = irandom(100);
var exec = false;

if (number <= percent) {
	exec = true;
} else {
	exec = false;
}

return exec;