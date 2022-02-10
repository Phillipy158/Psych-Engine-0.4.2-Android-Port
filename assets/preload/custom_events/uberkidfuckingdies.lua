local shootOffsetX = 0;
local shootOffsetY = 0;
local shootin = false;

function onEvent(name, value1, value2)

    if name == "uberkidfuckingdies" then
		cancelTimer('pull');
		cancelTween('uberdadpull');
		setProperty('dad.alpha', 0);
		setProperty('daduberkiddies.x', -510);
		setProperty('daduberkiddies.alpha', 1);

		if value2 ~= 'true' then
			cameraShake('camGame', 0.015, 0.15);
			triggerEvent('picoshoot', 0, 0);
		end

		setProperty('dadmic.alpha', 1);
		setProperty('dadmic.y', 625);
		objectPlayAnimation('daduberkiddies', 'oof', true);
		runTimer('pull', 1, 4);
		if value1 == 'true' then
			doTweenY('micup', 'dadmic', 100, 2 * (1 / (getPropertyFromClass('Conductor', 'bpm') / 60)), 'cubeOut');
			runTimer('wait', 2 * (1 / (getPropertyFromClass('Conductor', 'bpm') / 60)), 1);
			if value2 == 'true' then
				triggerEvent('theyaredeadmancalmdown', 0, 0);
				setProperty('dadmic.alpha', 0);
				setProperty('daduberkiddies.alpha', 0);
				runTimer('removefrontkids', 1, 1);
			end
		else
			doTweenY('micbye', 'dadmic', -100, 2 * (1 / (getPropertyFromClass('Conductor', 'bpm') / 60)), 'quadOut');
		end
	end

	if name == 'picoshoot' then
		-- debugPrint('working?');
		shootin = true;
		objectPlayAnimation('picoshootin', 'shoot' .. value1, true);

		if getProperty('picoshootin.animation.curAnim.name') == 'shoot0' then
			shootOffsetX = 399;
			shootOffsetY = 80;
		end
		if getProperty('picoshootin.animation.curAnim.name') == 'shoot1' then
			shootOffsetX = 205;
			shootOffsetY = 75;
		end
		if getProperty('picoshootin.animation.curAnim.name') == 'shoot2' then
			shootOffsetX = 9;
			shootOffsetY = 90;
		end
		if getProperty('picoshootin.animation.curAnim.name') == 'shoot3' then
			shootOffsetX = 450;
			shootOffsetY = 100;
		end

		setProperty('picoshootin.x', defaultBoyfriendX - shootOffsetX)
		setProperty('picoshootin.y', defaultBoyfriendY + (shootOffsetY + 140)) -- fuckin stupid offsets arent the same fsr so + 140

		setProperty('picoshootin.alpha', 1);
		setProperty('boyfriend.alpha', 0);
		
	end
end

function onTimerCompleted(tag)
	if tag == 'wait' then
		setProperty('daduberkidreturns.x', -575);
		setProperty('daduberkidreturns.alpha', 1);
		doTweenX('uberdadrun', 'daduberkidreturns', 125, 2 * (1 / (getPropertyFromClass('Conductor', 'bpm') / 60)), 'linear');
	end
	if tag == 'pull' then
		doTweenX('uberdadpull', 'daduberkiddies', getProperty('daduberkiddies.x') - 175, 0.75, 'cubeOut');
	end
	if tag == 'removefrontkids' then
		for i = 1,5,1 do
			removeLuaSprite('frontbouncerdie' .. i, true);
			removeLuaSprite('uberjumpin' .. i, true);
		end
	end
end

function onTweenCompleted(tag)
	if tag == 'uberdadrun' then
		setProperty('daduberkidreturns.alpha', 0);
		setProperty('dad.alpha', 1);
	end
	if tag == 'micup' then
		doTweenY('micdown', 'dadmic', 625, 2 * (1 / (getPropertyFromClass('Conductor', 'bpm') / 60)), 'cubeIn');
	end
	if tag == 'micdown' or tag == 'micbye' then
		setProperty('dadmic.alpha', 0);
	end
end

function onUpdate()
	-- debugPrint(getProperty('picoshootin.animation.curAnim.finished'))
	
	if getProperty('picoshootin.animation.curAnim.finished') and shootin then
        setProperty('boyfriend.alpha', 1);
		setProperty('picoshootin.alpha', 0);
		shootin = false;
    end
end		