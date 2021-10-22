x = obj_player.x;
y = obj_player.y+5;
if(obj_player.controller == 0){
	image_angle = point_direction(x,y,mouse_x,mouse_y);
}else{
	var _controllerrh = gamepad_axis_value(4,gp_axisrh);
	var _controllerrv = gamepad_axis_value(4,gp_axisrv);
	if(abs(_controllerrh) > 0.2 || abs(_controllerrv) > 0.2){
		controllerangle = point_direction(0,0,_controllerrh,_controllerrv);
	}
	image_angle = controllerangle;
}

firingdelay -= 1;
recoil = max(0,recoil-1);
if((mouse_check_button(mb_left) || gamepad_button_check(4,gp_shoulderrb)) && firingdelay < 0){
	recoil = 4;
	firingdelay = 5;
	with(instance_create_layer(x,y,"Bullets",obj_bullet)){
		speed = 25;
		direction = other.image_angle + random_range(-3,3);
		image_angle = direction;
	}
}

x -=lengthdir_x(recoil,image_angle);
y -=lengthdir_y(recoil,image_angle);

//Change sprite yscale
if(image_angle > 90 && image_angle < 270){
	image_yscale = -1;
}else{
	image_yscale = 1;
}