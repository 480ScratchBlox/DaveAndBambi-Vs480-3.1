myNuts = 'Splitathon by Moldy_GH'
local font = 'vcr.ttf' -- put your font name (what its named as a file, not the actual name) and then add .ttf after it

function onCreate()
    makeLuaText('creditText', myNuts, -600, -1000, 200)
    setTextSize('creditText', 26)
    setTextColor('creditText', 'FFFFFF')
    setTextFont('creditText', font)
    addLuaText('creditText')
    setObjectCamera('creditText', 'hud')
end

function onSongStart()
    doTweenX('textIn', 'creditText', 50, 0.6, 'backInOut') 
end


function onUpdate()
    if curBeat == 6 then
    doTweenX('textOut', 'creditText', -500, 0.7, 'backInOut')
    end
end

-- sorry that its so  scuffed i suck at lua coding
