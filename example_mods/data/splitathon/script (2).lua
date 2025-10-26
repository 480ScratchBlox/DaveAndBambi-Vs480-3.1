-- Script made by Catbrother Everything with help by NardBruh. Credit is not needed but would be nice! :)

function onCreate()
	makeAnimatedLuaSprite('Dad2', 'characters/SplitathonCCatral2011Duo', -220, 570); -- Change to characters idle in XML
	addAnimationByPrefix('Dad2', 'idle', 'Idle', 24, false); -- Change to characters idle in XML
    addAnimationByPrefix('Dad2', '0', 'Left', 24, false); -- Change to characters leftnote in XML
    addAnimationByPrefix('Dad2', '1', 'Down', 24, false); -- Change to characters downnote in XML
    addAnimationByPrefix('Dad2', '2', 'Up', 24, false); -- Change to characters upnote in XML
    addAnimationByPrefix('Dad2', '3', 'Right', 24, false); -- Change to characters rightnote in XML
    scaleObject('Dad2', 1.6, 1.6);
	objectPlayAnimation('Dad2', 'idle'); 
end
function onBeatHit()
		objectPlayAnimation('Dad2', 'idle');
	end

function onStepHit()
 if curBeat > 1731 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/70)
	addLuaSprite('Dad2', true)
    doTweenColor('exampleColorTween20', 'Dad2', '0xff878787', 0.01, 'quadInOut')
    end

 if curBeat > 1860 then
      songPos = getSongPosition()
      local currentBeat = (songPos/1000)*(bpm/70)
	removeLuaSprite('Dad2', true)
end
    end

lastNote = {0, ""}

function opponentNoteHit(id,d,t,s)

    lastNote[1] = d
    lastNote[2] = t
    
    if lastNote[2] == "No Animation" then -- Change "No Animation" to be your note type, usually you can just keep it as no anim assuming you arent using it elsewhere
	objectPlayAnimation('Dad2', lastNote[1]);
    end
end