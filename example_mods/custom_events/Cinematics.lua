-- Created by RamenDominoes (Feel free to credit or not I don't really care)
--Not bad for my first event created... I think

start = 0

finish = 0



function onCreate()
	

	--THE TOP BAR
	makeLuaSprite('UpperBar', 'empty', 0, -120)
	makeGraphic('UpperBar', 1280, 120, '000000')
	setObjectCamera('UpperBar', 'hud')
	addLuaSprite('UpperBar', false)


	--THE BOTTOM BAR
	makeLuaSprite('LowerBar', 'empty', 0, 720)
	makeGraphic('LowerBar', 1280, 120, '000000')
	setObjectCamera('LowerBar', 'hud')
	addLuaSprite('LowerBar', false)

end


function onUpdate()

	if start == 1 then
	
	doTweenY('Cinematics1', 'UpperBar', 0, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 600, 0.5, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 120, 0.5, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 120, 0.5, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 120, 0.5, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 120, 0.5, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 120, 0.5, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 120, 0.5, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 120, 0.5, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 120, 0.5, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'winP1', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'winP2', 0, 0.25)
	doTweenAlpha('AlphaTween7', 'ratingIcon', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'missesIcon', 0, 0.25)
	doTweenAlpha('AlphaTween9', 'scoreIcon', 0, 0.25)
	doTweenAlpha('AlphaTween10', 'timeBar', 0, 0.25)
	doTweenAlpha('AlphaTween11', 'timeBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween12', 'timeTxt', 0, 0.25)
	doTweenAlpha('AlphaTween13', 'rating', 0, 0.25)
	doTweenAlpha('AlphaTween14', 'misses', 0, 0.25)
	doTweenAlpha('AlphaTween15', 'score', 0, 0.25)
	doTweenAlpha('AlphaTween16', 'songIcon', 0, 0.25)
	doTweenAlpha('AlphaTween17', 'song', 0, 0.25)


	end

	if downscroll and start == 1 then
	
	doTweenY('Cinematics1', 'UpperBar', 0, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 600, 0.5, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 480, 0.5, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 480, 0.5, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 480, 0.5, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 480, 0.5, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 480, 0.5, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 480, 0.5, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 480, 0.5, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 480, 0.5, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 0, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 0, 0.25)
	doTweenAlpha('AlphaTween6', 'ratingIcon', 0, 0.25)
	doTweenAlpha('AlphaTween7', 'missesIcon', 0, 0.25)
	doTweenAlpha('AlphaTween8', 'scoreIcon', 0, 0.25)
	doTweenAlpha('AlphaTween9', 'timeBar', 0, 0.25)
	doTweenAlpha('AlphaTween10', 'timeBarBG', 0, 0.25)
	doTweenAlpha('AlphaTween11', 'timeTxt', 0, 0.25)
	doTweenAlpha('AlphaTween12', 'rating', 0, 0.25)
	doTweenAlpha('AlphaTween13', 'misses', 0, 0.25)
	doTweenAlpha('AlphaTween14', 'score', 0, 0.25)
	doTweenAlpha('AlphaTween15', 'songIcon', 0, 0.25)
	doTweenAlpha('AlphaTween16', 'song', 0, 0.25)


	end


	if finish == 2 then
	
	doTweenY('Cinematics1', 'UpperBar', -120, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 720, 0.5, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 50, 0.5, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 50, 0.5, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 50, 0.5, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 50, 0.5, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 50, 0.5, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 50, 0.5, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 50, 0.5, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 50, 0.5, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
	doTweenAlpha('AlphaTween6', 'winP1', 1, 0.25)
	doTweenAlpha('AlphaTween7', 'winP2', 1, 0.25)
	doTweenAlpha('AlphaTween8', 'ratingIcon', 1, 0.25)
	doTweenAlpha('AlphaTween9', 'missesIcon', 1, 0.25)
	doTweenAlpha('AlphaTween10', 'scoreIcon', 1, 0.25)
	doTweenAlpha('AlphaTween11', 'timeBar', 1, 0.25)
	doTweenAlpha('AlphaTween12', 'timeBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween13', 'timeTxt', 1, 0.25)
	doTweenAlpha('AlphaTween14', 'rating', 1, 0.25)
	doTweenAlpha('AlphaTween15', 'misses', 1, 0.25)
	doTweenAlpha('AlphaTween16', 'score', 1, 0.25)
	doTweenAlpha('AlphaTween17', 'songIcon', 1, 0.25)
	doTweenAlpha('AlphaTween18', 'song', 1, 0.25)

	
	end

	if downscroll and finish == 2 then
	
	doTweenY('Cinematics1', 'UpperBar', -120, 0.5, 'Linear')
	doTweenY('Cinematics2', 'LowerBar', 720, 0.5, 'Linear')
	noteTweenY('NOTEMOVE1', 0, 570, 0.5, 'Linear')	
	noteTweenY('NOTEMOVE2', 1, 570, 0.5, 'Linear')
	noteTweenY('NOTEMOVE3', 2, 570, 0.5, 'Linear')
	noteTweenY('NOTEMOVE4', 3, 570, 0.5, 'Linear')
	noteTweenY('NOTEMOVE5', 4, 570, 0.5, 'Linear')
	noteTweenY('NOTEMOVE6', 5, 570, 0.5, 'Linear')
	noteTweenY('NOTEMOVE7', 6, 570, 0.5, 'Linear')
	noteTweenY('NOTEMOVE8', 7, 570, 0.5, 'Linear')
	doTweenAlpha('AlphaTween1', 'healthBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween2', 'healthBar', 1, 0.25)
	doTweenAlpha('AlphaTween3', 'scoreTxt', 1, 0.25)
	doTweenAlpha('AlphaTween6', 'winP1', 1, 0.25)
	doTweenAlpha('AlphaTween7', 'winP2', 1, 0.25)
	doTweenAlpha('AlphaTween8', 'ratingIcon', 1, 0.25)
	doTweenAlpha('AlphaTween9', 'missesIcon', 1, 0.25)
	doTweenAlpha('AlphaTween10', 'scoreIcon', 1, 0.25)
	doTweenAlpha('AlphaTween11', 'timeBar', 1, 0.25)
	doTweenAlpha('AlphaTween12', 'timeBarBG', 1, 0.25)
	doTweenAlpha('AlphaTween13', 'timeTxt', 1, 0.25)
	doTweenAlpha('AlphaTween14', 'rating', 1, 0.25)
	doTweenAlpha('AlphaTween15', 'misses', 1, 0.25)
	doTweenAlpha('AlphaTween16', 'score', 1, 0.25)
	doTweenAlpha('AlphaTween17', 'songIcon', 1, 0.25)
	doTweenAlpha('AlphaTween18', 'song', 1, 0.25)

	
	end
	
end

function onEvent(name,value1,value2)
	if name == 'Cinematics' then
		start = tonumber(value1)
		finish = tonumber(value2)
			end
	
		end
