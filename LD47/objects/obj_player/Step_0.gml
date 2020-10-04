/// @description Insert description here
// You can write your code in this editor

key_left			= keyboard_check(vk_left);
key_right			= keyboard_check(vk_right); 
key_up				= keyboard_check_pressed(vk_up);
key_down			= keyboard_check_pressed(vk_down);
key_duck			= keyboard_check(vk_shift); 
key_unduck			= keyboard_check_released(vk_shift); 
key_jump			= keyboard_check_pressed(vk_space); 

move_LR = key_right - key_left;
move_UD = key_down - key_up;

if(colliding){
	var gitgood = true;
	gitgood = !gitgood;
	instance_create_layer(0,0,"Information_Screens", obj_game_over); 
}

// this makes the player unable to move left and right for the duration of their jump
if(jumping){	
	switch(top_lane){
		case true: 
			if(y <= top_lane_y){
				vsp += grv;
				if( y+jump_buffer > bottom_lane_y) vsp -= jump_buffer; 				
			}
			if(y >= top_lane_y){
				y = top_lane_y;
				vsp = 0; 
				jumping = false; 
				player_sprite = spr_player_test2;
			}
			break;
		case false: 
			if(y <= bottom_lane_y){
				vsp += grv;	
				if( y+jump_buffer > bottom_lane_y) vsp -= jump_buffer; 
			}
			if(y >= bottom_lane_y){
				y = bottom_lane_y;
				vsp = 0; 
				jumping = false;
				player_sprite = spr_player_test2;
			}
			break;
	}
}

//check if player pushed jump button then starts jump state
if(key_jump && !jumping) {
	jumping = true;
	player_sprite = spr_player_test_jump;
	vsp		= jump_height;
}


//logic for moving the player left and right as well and changing between the upper and lower lanes 
if(!jumping){
	switch(move_LR){
		case -1: hsp = sign(move_LR)*(base_mv + floor_movement_speed) break;
		case  0: hsp = -1*(floor_movement_speed) break;
		case  1: hsp = base_mv - floor_movement_speed break;
	}

	switch(move_UD){
		case -1:
		top_lane = true;
		// insert logic for jumping from top to bottom
		y = top_lane_y
		break;
		case  1: 
		top_lane = false; 
		// insert logic for jumping from top to bottom
		y = bottom_lane_y; 
		break; 
	}
	
	if(key_duck){
			player_sprite = spr_player_test_crouch; 
			crouch = true;
	} 
	if(key_unduck){
			player_sprite = spr_player_test2; 	
			crouch = false;
	}
}


//checking for collison detection
/* made huge oof here, need a completely diffenent collision system than ive used in the past
fuck, huuuuuuge oof
var inst = collision_rectangle(x-xradius, y-yradius, x+xradius, y+yradius, obj_obs, false,false)
if(inst != noone){
//obs_collison.map_lower_track
//obj_collison.map_upper_track
var wut = 0; 
}
*/



x = x + hsp;
y = y + vsp; 