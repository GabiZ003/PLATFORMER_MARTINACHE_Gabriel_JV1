//Touches du jeu 
if (hp>0)
{
	key_left = keyboard_check(vk_left) || keyboard_check(ord("Q")); 
	key_right = keyboard_check(vk_right) ||  keyboard_check(ord("D")); 
	key_jump = keyboard_check_pressed(ord("Z")); 

	//Calcul du mouvement du joueur 
	var move = key_right - key_left;
	image_alpha += 0.01;
	
	if (Reach_Air == false) && (Touch_Floor == false) && (isfiring == false) && (isdashing == false) && (Dash == false)
	{
		hsp = move * walksp;
	}
	else if (Dash == true)
	{
		hsp = 12*image_xscale;
	}
	else
	{
		hsp = 0
	}

	vsp = vsp + grv ;

	if (place_meeting(x,y+1,O_Wall)) 
	{
		if (Air == true)
		{
			Reach_Floor = true;
			alarm_set(0, 30);
		}
		else if (key_jump == 1)
		{
			if (Reach_Air != true)
			{
				Reach_Air = true;
				alarm_set(1, 20);
			}
		}
	}	
	
	


	//Check des collisions horizontales
	if (place_meeting(x+hsp,y,O_Wall))
	{
	
		while(!place_meeting(x+sign(hsp),y,O_Wall))
		{
			x  = x + sign(hsp);
		}
		hsp = 0;		
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

	if (Air == true) and (isfiring == false) and (Dash == false) and (isdashing == false) and (Dash_finish == false)
	{
	
	
		if (Reach_Floor == true)
		{
		
			Touch_Floor = true;
			Air = false;
			alarm_set(3,15);
		
		}
		else 
		{
			if (dash_on == false) sprite_index = S_Hero_Air; else sprite_index = S_Hero_Dash_Air
			image_speed = 0;
			if (sign(vsp)>0) image_index = 1; else image_index = 0;
		}
	
	
	}
	else 
	{
		image_speed = 1;
		if (place_meeting(x,y+32,O_Wall)) Air = false ;
	
		if (Reach_Air == true)
		{
			if (dash_on == false) sprite_index = S_Hero_Jump; else sprite_index = S_Hero_Dash_Jump
		
		
		}
		else if (Touch_Floor == true)
		{ 
			if (dash_on == false) sprite_index = S_Hero_Floor; else sprite_index = S_Hero_Dash_Floor
		
		}
		else if (Dash_finish== true)
		{
			sprite_index = S_Hero_Dash_ATK_finish;
		}
		else if (Dash == true)
		{
			sprite_index = S_Hero_Dash_ATK;
		}
		else if (isdashing == true)
		{
		
			sprite_index = S_Hero_Dash_ATK_loading;
		
		}
		else if (isfiring == true)
		{
			if (dash_on == false) sprite_index = S_Hero_Fire; else sprite_index = S_Hero_Dash_Fire
			
		}
	

		else if (hsp == 0)
		{
			
			if (dash_on == false) sprite_index = S_Hero; else sprite_index = S_Hero_Dash
			
		}
		else
		{
			if (dash_on == false) sprite_index = S_Hero_Walk; else sprite_index = S_Hero_Dash_Walk
		}
		
	
	}

	if (hsp != 0) image_xscale = sign(hsp);


	//Shoot
	firingdelay -= 1;
	if keyboard_check_pressed(vk_enter) and (firingdelay < 0) and (ammo > 0) and (isfiring == false) and (Touch_Floor == false) and (Reach_Air == false)
	{ 
		isfiring = true;
	
		alarm_set(4,20);
		image_index = 0;
	}

	dashdelay -=0.1;
	if keyboard_check_pressed(vk_space) and (dash_on == true) and (dashdelay < 0) and (isdashing == false) and (isfiring == false) and (Touch_Floor == false) and (Reach_Air == false)
	{
		isdashing = true;
		alarm_set(6,20);
		image_index = 0;
	
	}


	if keyboard_check_pressed(ord("Z"))
	{
		image_index = 0;	
	}
}
else
{
	game_restart();
}

