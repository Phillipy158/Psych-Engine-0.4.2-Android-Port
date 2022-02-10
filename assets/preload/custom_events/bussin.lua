function onEvent(name, value1, value2)

    if name == 'bussin' then
		-- debugPrint('who the fuck');

		triggerEvent('picoshoot', 3, 0);
		doTweenX('comicx', 'comic', -200, 0.2, 'cubeOut');
		doTweenY('comicy', 'comic', -110, 0.2, 'cubeOut');
		objectPlayAnimation('comic', 'anim', true);
		setProperty('bussin.x', -3500);
	end
end

function onTweenCompleted(tag)
	if tag == 'comicx' then
		doTweenX('waste time', 'comic', -200, 0.4, 'cubeOut');
		setProperty('bussin.x', -2850);
    	setProperty('bussin.y', -400);
	end
	if tag == 'waste time' then
		characterPlayAnim('dad', 'oop', true);
		doTweenX('comicx2', 'comic', -570, 0.4, 'quadIn');
		doTweenY('comicy', 'comic', -480, 0.4, 'quadIn');
		setProperty('bussin.x', -3500);
    	setProperty('bussin.y', -20);
	end
	if tag == 'comicx2' then
		runTimer('buswait', 0.75, 1);
	end
	if tag == 'busmove' then
		setProperty('bussin.alpha', 0);
	end
	if tag == 'picododgin1' then
		runTimer('picododgewait', 0.6);
	end
	if tag == 'picododgin2' then
		setProperty('picododge.alpha', 0);
		setProperty('boyfriend.alpha', 1);
	end
end

function onTimerCompleted(tag)
	if tag == 'hituberkid' then
		setProperty('dad.idleSuffix', '-alt');
		setProperty('dad.alpha', 0);
		setProperty('boyfriend.alpha', 0);
		objectPlayAnimation('bussin', 'nissub', true);
		doTweenY('picododgin1', 'picododge', 675, 0.3, 'quadOut');
		setProperty('picododge.alpha', 1);
		playSound('uberkidbus', 0.85);
	end
	if tag == 'picododgewait' then
		doTweenY('picododgin2', 'picododge', 500, 0.5, 'quadIn');
	end
	if tag == 'buswait' then
		setProperty('bussin.alpha', 1);
		doTweenX('busmove', 'bussin', 2500, 1, 'linear');
		runTimer('hituberkid', 0.15, 1);
	end
end
