function onEvent(name, value1, value2)
    if name == 'explosion' then
		-- debugPrint('who the fuck');
		makeAnimatedLuaSprite('explosion', 'stage/explosionfrom_edd', 200, -500);
		addAnimationByPrefix('explosion', 'boom', 'TordBotBlowingUp', 18, false);
		setProperty('explosion.angle', -90);
    	setProperty('explosion.alpha', 0);
		addLuaSprite('explosion', false);
    	scaleObject('explosion', 2, 2);

		setProperty('explosion.alpha', 1);
		objectPlayAnimation('explosion', 'boom', true);
		cameraShake('camGame', 0.02, 0.5);
	end
end
