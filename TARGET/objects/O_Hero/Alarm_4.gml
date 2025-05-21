firingdelay = 5;
	with (instance_create_layer(x, y-4, "Bullets", O_Fire))
	{
		
		Direction = other.image_xscale;
		if (other.dash_on==false) sprite = S_Fire; else sprite = S_Fire_Dash;
	}
alarm_set(5,20);