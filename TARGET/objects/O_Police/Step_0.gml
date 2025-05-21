if (hp>0)
{
	vsp = vsp + grv ;
	image_alpha+=0.05;
	firingdelay --;
	if (hsp==0) and (firingdelay<0) hsp= image_xscale*0.8;
	//attaque le joueur
	if  (O_Hero.y < y+16) and (O_Hero.y > y-16)
	{
		
		if (O_Hero.x < x) and (O_Hero.x > x-256) 
		{
			
			image_xscale = -1;
			if (firingdelay<0)
			{
			hsp=0;
			firingdelay = 180;
			with (instance_create_layer(x, y, "Bullets", O_Fire_Ennemies))
			{
				Direction = other.image_xscale;
				sprite = S_Fire;
			}
			}
		}
		else if (O_Hero.x > x) and (O_Hero.x < x+256)
		{
			
			image_xscale = 1;
			if (firingdelay<0)
			{
			hsp=0;
			firingdelay = 180;
			with (instance_create_layer(x, y, "Bullets", O_Fire_Ennemies))
			{
				Direction = other.image_xscale;
				sprite = S_Fire;
			}
			}
		}
		
		
	}
	 
	if (hsp != 0) image_xscale= sign(hsp);
	
	
	
	//Check des collisions horizontales
	if (place_meeting(x+hsp*12,y,O_Wall))
	{
	
		while(!place_meeting(x+hsp*12,y,O_Wall))
		{
			x  = x + sign(hsp);
		}
		hsp = -hsp;			
	}	

	x = x + hsp;
	if (place_meeting(x+hsp*12,y,O_Collision))
	{
	
		while(!place_meeting(x+hsp*12,y,O_Collision))
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
			sprite_index = S_police;
			image_speed = 0;
			if (sign(vsp)>0) image_index = 1; else image_index = 0;
	
	
	
		}
		else 
		{
			image_speed = 1;

			if (hsp == 0)
			{
			
				sprite_index = S_police;
			
			}
			else
			{
				sprite_index = S_police;
			}
		
	
		}
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

