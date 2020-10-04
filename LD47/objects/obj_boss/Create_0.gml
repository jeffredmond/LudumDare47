/// @description Insert description here
// You can write your code in this editor

//x y location
screen_width_boss				= camera_get_view_width(view_camera[0]); 
screen_heigth_boss				= camera_get_view_height(view_camera[0]);
screen_center_x_boss			= screen_width_boss*0.5; 
screen_center_y_boss			= screen_heigth_boss*0.5;

//health
draw_set_font(font_boss_name);
boss_name					= "Rather Large fleshed Skeleton"
boss_name_y_buffer			= 16; 
boss_name_x					= screen_center_x_boss
boss_name_text_size			= string_height(boss_name);
boss_name_y					= boss_name_y_buffer


boss_health					= 100;
boss_health_max				= 100; 
boss_health_y_buffer		= 16; 
boss_health_bar_width		= 32
boss_health_bar_x1			= screen_center_x_boss - (screen_center_x_boss*.5)
boss_health_bar_y1			= boss_name_y + boss_name_text_size + boss_health_y_buffer; 
boss_health_bar_x2			= screen_center_x_boss + (screen_center_x_boss*.5)
boss_health_bar_y2			= boss_health_bar_y1*1.5	
boss_health_bar_length		= boss_health_bar_x2-boss_health_bar_x1;
boss_health_bar_outline		= 1; 


//sprite animations
boss_sprite = spr_boss_test;
//any attacks?
//