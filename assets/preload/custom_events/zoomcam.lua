function onEvent(name, value1, value2)

    if name == 'zoomcam' then
		-- debugPrint('what the fuck');
		doTweenZoom('gamezoom', 'camGame', value1, value2, 'quadInOut');
		setProperty('defaultCamZoom', value1);
	end
end
