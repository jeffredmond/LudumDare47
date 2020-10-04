//when this user event is called the boss health will be decreased
//and if health == 0 then the player wins the game. 
boss_health			= boss_health - 20;
var diff_increase	= false;
switch(boss_health){
	case ( 80):
		diff_increase = true;
	break;
	case ( 60):
		diff_increase = true;	
	break;	
	case ( 40):
		diff_increase = true;	
	break;
	case ( 20):
		diff_increase = true;
	break;
	case ( 0):
		instance_create_layer(0,0,"Information_Screens", obj_game_win);
	break;
}

if(diff_increase){
	with(obj_obs){
		obs_speed = obs_speed - 1;
		obs_max_number++
	}
	with(obj_player){
		floor_movement_speed++; 	
	}
	diff_increase = false; 
}