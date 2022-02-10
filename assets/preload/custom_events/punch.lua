function onCreate()
	makeAnimatedLuaSprite('finalpunch', 'stage/finalpunch', 130, 180);
	addAnimationByPrefix('finalpunch', 'epic', 'EpicFinalPunch', 24, false);
	precacheImage('stage/finalpunch');
end

function onEvent(name, value1, value2)
    if name == 'punch' then
		doTweenAlpha('camhudalpha', 'camHUD', 0, 0.7, 'quadInOut');
		doTweenZoom('camzoom', 'camGame', 1.1, 0.7, 'cubeIn');
		triggerEvent('Camera Follow Pos', 991.5, 511);
		setProperty('dad.visible', false);
		setProperty('boyfriend.visible', false);
		addLuaSprite('finalpunch', true);
	end
end
