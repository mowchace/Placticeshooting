if(hp <= 0){
	with(instance_create_layer(x,y,layer,obj_dead)){
		direction = other.hitfrom;
		show_debug_message(direction);
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction)-3;
		if(hsp != 0)image_xscale = sign(hsp);
	}
	instance_destroy();
}