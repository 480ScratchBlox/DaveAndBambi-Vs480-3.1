function opponentNoteHit(id, noteData, noteType, isSustainNote)
    if noteType == 'Phone Note Alt' then
		if noteData == 0 then
			characterPlayAnim('dad', 'singLEFT-alt', true);
		elseif noteData == 1 then
			characterPlayAnim('dad', 'singDOWN-alt', true);
		elseif noteData == 2 then
			characterPlayAnim('dad', 'singUP-alt', true);
		elseif noteData == 3 then
			characterPlayAnim('dad', 'singRIGHT-alt', true);
		end
    end
end
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Blammed Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Phone Note Alt' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'phone_notes'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
	--debugPrint('Script started!')
end