if (hp <= 0)
{
	if (dead==false)
	{
		sprite_index = S_dog_Dead;
		alarm_set(0,15);
		dead= true;
	}
}