

if(instance_exists(follow)){
	xTo = follow.x
	yTo = follow.y
}

x = xTo;
y = yTo;

camera_set_view_pos(cam, x-view_w_half, y-view_h_half)
