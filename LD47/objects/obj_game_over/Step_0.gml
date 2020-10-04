/// @description Insert description here
game_over_screen_duration--;
if(game_over_screen_duration == 0){
	room_restart();
	instance_destroy(self); 
}