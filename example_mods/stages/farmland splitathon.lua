function onCreate()
	-- background shit

makeAnimatedLuaSprite('1bgdave', '1bgdave', -340, 270)
luaSpriteAddAnimationByPrefix('1bgdave', 'bruh.xml', 'bruh', 12, true);
	setLuaSpriteScrollFactor('1bgdave', 1, 1);
scaleObject('1bgdave', 1.6, 1.6);

makeAnimatedLuaSprite('2bgdave', '1bgdave', -340, 270)
luaSpriteAddAnimationByPrefix('2bgdave', 'happy.xml', 'happy', 12, true);
	setLuaSpriteScrollFactor('2bgdave', 1, 1);
scaleObject('2bgdave', 1.6, 1.6);

makeAnimatedLuaSprite('Splitathon_Bambi', 'Splitathon_Bambi', -340, 340)
luaSpriteAddAnimationByPrefix('Splitathon_Bambi', 'corn.xml', 'corn', 24, true);
	setLuaSpriteScrollFactor('Splitathon_Bambi', 1, 1);
scaleObject('Splitathon_Bambi', 1.6, 1.6);

makeAnimatedLuaSprite('2Splitathon_Bambi', 'Splitathon_Bambi', -340, 340)
luaSpriteAddAnimationByPrefix('2Splitathon_Bambi', 'confused.xml', 'confused', 24, true);
	setLuaSpriteScrollFactor('2Splitathon_Bambi', 1, 1);
scaleObject('2Splitathon_Bambi', 1.6, 1.6);

makeLuaSprite('white', 'house-night', -700, -208.2)
setLuaSpriteScrollFactor('white', 1, 1);
scaleObject('white', 2, 2);

    

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	addLuaSprite('white', false);
	end


	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end