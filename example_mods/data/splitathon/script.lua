function onStepHit()
    if curStep >= 4030 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    addLuaSprite('1bgdave', false);
end

    if curStep >= 5120 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    removeLuaSprite('1bgdave', false);
	addLuaSprite('2bgdave', false);
end

    if curStep >= 6288 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    removeLuaSprite('2bgdave', false);
	addLuaSprite('2Splitathon_Bambi', false);
end

    if curStep >= 6931 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    removeLuaSprite('2Splitathon_Bambi', false);
end

    if curStep >= 7440 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
	addLuaSprite('Splitathon_Bambi', false);
end
end

function onCreatePost()
   if curStep >= 0 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    setLuaSpriteScrollFactor('sky2', 0.8, 0.8);
    scaleObject('sky2', 1, 1);
    setObjectOrder('sky', 1)
    setObjectOrder('sky2', 2)
    setObjectOrder('flatgrass', 3)
    setObjectOrder('orangehills', 4)
    setObjectOrder('farmhouse', 5)
    setObjectOrder('path', 6)
    setObjectOrder('cornL', 7)
    setObjectOrder('cornR', 8)
    setObjectOrder('sign', 9)
    setObjectOrder('cornbag', 10)

    doTweenAlpha('funnynight1', 'sky2', 0, 0.0001, 'linear');

    addLuaSprite('sky2', false);


    doTweenAlpha('funnynight2', 'sky2', 1, 0.01, 'linear');

--dad gf and bf
    doTweenColor('boyfriendColorTween', 'boyfriend', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('dadColorTween', 'dad', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('gfColorTween', 'gf','0xff878787', 0.01, 'quadInOut')
--bg
    doTweenColor('exampleColorTween', 'flatgrass', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween2', 'orangehills', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween3', 'farmhouse', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween4', 'path', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween5', 'cornL', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween6', 'cornR', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween7', 'sign', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween8', 'cornbag', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween9', '1bgdave', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween11', '2Splitathon_Bambi', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween12', '2bgdave', '0xff878787', 0.01, 'quadInOut')
    doTweenColor('exampleColorTween13', 'Splitathon_Bambi', '0xff878787', 0.01, 'quadInOut')
    end

   if curStep >= 4030 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    setObjectOrder('1bgdave', 11)
    doTweenColor('exampleColorTween10', '1bgdave', '0xff878787', 0.01, 'quadInOut')
end

   if curStep >= 5120 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    setObjectOrder('2bgdave', 13)
    doTweenColor('exampleColorTween12', '2bgdave', '0xff878787', 0.01, 'quadInOut')
end

if curStep >= 6288 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    setObjectOrder('2Splitathon_Bambi', 12)
    doTweenColor('exampleColorTween11', '2Splitathon_Bambi', '0xff878787', 0.01, 'quadInOut')
end

if curStep >= 7440 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/200)
    setObjectOrder('Splitathon_Bambi', 14)
    doTweenColor('exampleColorTween13', 'Splitathon_Bambi', '0xff878787', 0.01, 'quadInOut')
end

    makeLuaText("message", "", 500, 30, 50)
    setTextAlignment("message", "left")
    addLuaText("message")

    makeLuaText("engineText", "", 500, 30, 30)
    setTextAlignment("engineText", "left")
    addLuaText("engineText")

    if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('message.y', 660)
        setProperty('engineText.y', 680)
    end
end