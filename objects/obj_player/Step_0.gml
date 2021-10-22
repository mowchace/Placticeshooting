// Get player input 
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check(vk_space);

if(key_left || key_right || key_jump){
	controller = 0;
}
//gamepad_move
if(abs(gamepad_axis_value(devicenum,gp_axislh)) > 0.2){
	key_left = abs(min(gamepad_axis_value(devicenum,gp_axislh),0));
	key_right = max(gamepad_axis_value(devicenum,gp_axislh),0);
	controller = 1;
}
//gamepad_jump
if(gamepad_button_check_pressed(devicenum,gp_face2)){
	key_jump = 1;
	controller = 1;
};


//Calculate movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;
if(place_meeting(x,y+1,obj_wall) && key_jump){
	vsp = -7;
}

//Horizontal Collision
if(place_meeting(x+hsp,y,obj_wall)){
	while(!place_meeting(x+sign(hsp),y,obj_wall)){
		x = x+sign(hsp);
	}
	hsp = 0;
}
x += hsp;
//Vertical Collision
if(place_meeting(x,y+vsp,obj_wall)){
	while(!place_meeting(x,y+sign(vsp),obj_wall)){
		y = y+sign(vsp);
	}
	vsp = 0;
}
y += vsp;

//Animetion 
if(!place_meeting(x,y+1,obj_wall)){
	sprite_index = spr_Player_jump;
	image_speed = 0;
	if(sign(vsp) > 0){
		image_index = 1;
	}else{
		image_index = 0;
	}
}else{
	image_speed = 1;
	if(hsp == 0){
		sprite_index = spr_player_idle;
	} else {
		sprite_index = spr_Player_move;
	}
}

if(hsp != 0) image_xscale = sign(hsp);