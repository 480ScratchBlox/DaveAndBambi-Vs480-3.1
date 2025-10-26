-- Credits to EvelynMeen

function onCreatePost() 
    setProperty('debugKeysChart',nil) 
end
function onUpdate() 
    if keyboardJustPressed('SEVEN') and not inGameOver then setHealth(0) 
    end 
end