local picogoinhard = 0;

function onEvent(name, value1, value2)

    if name == 'picogoeshard' then
		-- debugPrint('what the fuck');
		picogoinhard = 1;
		setProperty('boyfriend.visible', false);
		setProperty('picobreakdance.alpha', 1);
		setProperty('picobreakdance.visible', true);
		setProperty('picobreakdanceshootin.visible', true);
		objectPlayAnimation('picobreakdance', "go_off", true);
		objectPlayAnimation('picobreakdanceshootin', "go_off", true);
		setProperty('picoshootin.visible', false);
	end
	if name == 'theyaredeadmancalmdown' then
		picogoinhard = 0;
	end
end

function onBeatHit()
	if picogoinhard == 1 then
		triggerEvent('Add Camera Zoom', 0.06, 0.06)
	end
end
