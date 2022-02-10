function onEvent(name, value1, value2)

    if name == 'jumpinfront' then
		if value1 ~= '3' then
			objectPlayAnimation('uberjumpin' .. value1, 'charge', true);
			setProperty('uberjumpin' .. value1 .. '.alpha', 1);
			triggerEvent('cantthinkrightnow', value1, 0);
		else
			triggerEvent('cantthinkrightnow', 2, 0);
			objectPlayAnimation('uberjumpin1', 'charge', true);
			objectPlayAnimation('uberjumpin2', 'charge', true);
		end
		
	end
end
