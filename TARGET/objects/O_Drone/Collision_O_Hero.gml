if (hp>0)
{
	with (other)
	{
			if (isinvincible == false) and (Dash == false)
			{
			hp--;
			image_alpha = 0.7;
			isinvincible = true;
			alarm_set(9,150);
			}
	}
}