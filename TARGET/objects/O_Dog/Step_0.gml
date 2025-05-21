if (hp>0)
{
	vsp = vsp + grv ;
	image_alpha+=0.05;

	//Check des collisions horizontales
	if (place_meeting(x+hsp,y,O_Wall)) //or (place_meeting(x+hsp,y,O_Collision))
	{
	
		while(!place_meeting(x+sign(hsp),y,O_Wall)) //or (!place_meeting(x+hsp,y,O_Collision))
		{
			x  = x + sign(hsp);
		}
		hsp = -hsp;		
	}	

	x = x + hsp;
	
	if (place_meeting(x+hsp*10,y,O_Collision))
	{
	
		while(!place_meeting(x+hsp*10,y,O_Collision))
		{
			x  = x + sign(hsp);
		}
		hsp = -hsp;		
	}	

	x = x + hsp;


	//Check des collisions verticales
	if (place_meeting(x,y+vsp,O_Wall))
	{
	
		while(!place_meeting(x,y+sign(vsp),O_Wall))
		{
			y  = y + sign(vsp);
		}
		vsp = 0;		
	}	

	y = y + vsp;


	//Animation
	if (!place_meeting(x,y+1,O_Wall))
	{
		sprite_index = S_dog;
		image_speed = 0;
		if (sign(vsp)>0) image_index = 1; else image_index = 0;
	
	
	
	}
	else 
	{
		image_speed = 1;

		if (hsp == 0)
		{
			
			sprite_index = S_dog;
			
		}
		else
		{
			sprite_index = S_dog;
		}
		
	
	}

	if (hsp != 0) image_xscale = sign(hsp);

}
//Shoot
//firingdelay -= 1;
//if keyboard_check_pressed(vk_enter) and (firingdelay < 0) and (ammo > 0) and (isfiring == false) and (Air==false) && (Reach_Air == false) && (Touch_Floor == false)
//{ 
	
//	image_index = 0;
//}

//if keyboard_check_pressed(vk_space)
//{
//	image_index = 0;	
//}

