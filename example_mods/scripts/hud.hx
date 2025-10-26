import flixel.FlxSprite;
import Main;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import haxe.ds.StringMap;
import openfl.text.TextFormat;
import flixel.FlxBasic;
import flixel.addons.display.FlxPieDial;
import flixel.addons.display.FlxPieDial.FlxPieDialShape;
import flixel.util.FlxStringUtil;

//import flixel.addons.display.FlxRadialGauge;
import Sys;
// you can configure these below

var settings:StringMap = [
	"font" => "comic.ttf", // if you want the regular vcr font, just replace "comic.ttf" with "vcr.ttf"
	"fontScale" => 1, // only use this if your font is too small
	"strumSkin" => 'noteSkins/3D Notes/NOTE_3D_strumline', //the skin you want the STRUMS to use when in 3D
	"notesSkin" => 'noteSkins/3D Notes/3D_NOTE_assets', //the skin you want the NOTES to use when in 3D
];

var credits:StringMap = [
	// add your mod songs below! It should be ("songname here" => "quote the song uses")
	"test" => "what? it's a test song",
];

var timerColors:StringMap = [ //REMEMBER TO INCLUDE THE 0xFF OTHERWISE IT'LL MAKE THE COLOR BLUE OR BLACK
	'test' => 0xFF0F5FFF,
];

var threeDeeEnabled:Bool = false;
var threeDeeSongs = []; //PUT THE NAME OF THE SONG THAT YOU WANT TO USE THE 3D SHITS IN HERE

// don't touch ANY of the shit below unless you know what you're doing

var iconProp1:FlxSprite;
var iconProp2:FlxSprite;

var kadeEngineWatermark:FlxText;
var creditsWatermark:FlxText;

var timerBG:FlxPieDial;
var timer:FlxPieDial;
var alarmClock:FlxSprite;

var accuracyText:FlxText;
var missesText:FlxText;
var scoreText:FlxText;

var ogIconSize:Array<Array<Int>> = [];
function onCreatePost() {
	game.setOnHScript("dnbFont", settings.get("font"));

	if (settings.get("font") == "comic.ttf")
		Main.fpsVar.defaultTextFormat = new TextFormat(Paths.font('comic.ttf'), 15, 0xFFFFFF, true);
	else
		Main.fpsVar.defaultTextFormat = new TextFormat("_sans", 12, 0xFFFFFF, false);
	
	game.showCombo = true;

	iconProp1 = new FlxSprite().makeGraphic(game.iconP1._frame.frame.width, game.iconP1._frame.frame.height, 0xFF000000);
	ogIconSize.push([game.iconP1._frame.frame.width, game.iconP1._frame.frame.height]);
	iconProp2 = new FlxSprite().makeGraphic(game.iconP2._frame.frame.width, game.iconP2._frame.frame.height, 0xFF000000);
	ogIconSize.push([game.iconP2._frame.frame.width, game.iconP2._frame.frame.height]);

	game.timeBar.kill();

	var bars:Array<Dynamic> = [game.healthBar];
	for (i in bars) {
		i.set_barWidth(i.bg.width - 8);
		i.set_barHeight(i.bg.height - 8);
		i.barOffset.set(4, 4);
		i.screenCenter(1);
	}
	game.healthBar.y = (ClientPrefs.data.downScroll ? 50 : FlxG.height * 0.9);
	game.iconP1.y = game.healthBar.y - (game.iconP1.height / 2);
	game.iconP2.y = game.healthBar.y - (game.iconP2.height / 2);
	game.timeBar.y = (ClientPrefs.data.downScroll ? (FlxG.height * 0.9) + 20 : 30);

	var xValues = getMinAndMax(game.timeTxt.width, game.timeBar.width);
	var yValues = getMinAndMax(game.timeTxt.height, game.timeBar.height);
	game.timeTxt.setFormat(Paths.font(settings.get("font")), 32 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
	game.timeTxt.x = game.timeBar.x - ((xValues[0] - xValues[1]) / 2);
	game.timeTxt.borderSize = 2.5 * settings.get("fontScale");

	game.scoreTxt.y = game.healthBar.y + 40;
	game.scoreTxt.setFormat(Paths.font(settings.get("font")), 20 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
	game.scoreTxt.borderSize = 1.5 * settings.get("fontScale");
	game.scoreTxt.visible = false;

	game.botplayTxt.y = game.healthBar.bg.y + (ClientPrefs.data.downScroll ? 100 : -100);
	game.botplayTxt.setFormat(Paths.font(settings.get("font")), 42 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
	game.botplayTxt.borderSize = 2.5 * settings.get("fontScale");

	var songName = PlayState.SONG.song;
	kadeEngineWatermark = new FlxText(4, game.healthBar.bg.y + (credits.get(songName) != null ? 30 : 50), 0, songName);
	kadeEngineWatermark.setFormat(Paths.font(settings.get("font")), 16 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
	kadeEngineWatermark.borderSize = 1.25 * settings.get("fontScale");
	kadeEngineWatermark.camera = game.camHUD;
	uiGroup.add(kadeEngineWatermark);

	if (credits.get(songName) != null) {
		creditsWatermark = new FlxText(4, game.healthBar.bg.y + 50, 0, credits.get(songName));
		creditsWatermark.setFormat(Paths.font(settings.get("font")), 16 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
		creditsWatermark.borderSize = 1.25 * settings.get("fontScale");
		creditsWatermark.camera = game.camHUD;
		uiGroup.add(creditsWatermark);
	}

	timerBG = new FlxPieDial(0, timeBar.y - 90, 50, FlxColor.TRANSPARENT, 360, FlxPieDialShape.CIRCLE, false, 0);
	timerBG.amount = 1;
	timerBG.replaceColor(FlxColor.BLACK, FlxColor.TRANSPARENT);
	timerBG.camera = camHUD;
	timerBG.color = FlxColor.GRAY;
	timerBG.screenCenter(1);
	uiGroup.add(timerBG);

	timer = new FlxPieDial(0, timeBar.y - 90, 50, FlxColor.TRANSPARENT, 1000, FlxPieDialShape.CIRCLE, false, 0);
	timer.amount = 0;
	timer.replaceColor(FlxColor.BLACK, FlxColor.TRANSPARENT);
	timer.camera = camHUD;
	timer.screenCenter(1);
	uiGroup.add(timer);

	alarmClock = new FlxSprite(0, timeBar.y - 115);
	if (threeDeeSongs.contains(songName)) {
		alarmClock.loadGraphic(Paths.image('timer-3d'));
		alarmClock.y -= 20;
		timer.y -= 20;
		timerBG.y -= 20;
	} else alarmClock.loadGraphic(Paths.image('timer'));
	alarmClock.camera = game.camHUD;
	alarmClock.screenCenter(1);
	uiGroup.add(alarmClock);

	timerBG.alpha = 0.0001;
	timer.alpha = 0.0001;
	alarmClock.alpha = 0.0001;

	if (timerColors.get(songName) != null) timer.color = timerColors.get(songName);
	else timer.color = 0xFFFFFFFF;

	accuracyText = new FlxText(0, 0, FlxG.width - 350, '0');
	accuracyText.setFormat(Paths.font(settings.get("font")), 20 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
	accuracyText.borderSize = 1.5 * settings.get("fontScale");
	accuracyText.camera = camHUD;
	accuracyText.y = scoreTxt.y;
	uiGroup.add(accuracyText);

	var accuracyImage = new FlxSprite(accuracyText.x + 400, scoreTxt.y - 25).loadGraphic(Paths.image('accuracy'));
	accuracyImage.camera = camHUD;
	accuracyImage.scale.set(0.5, 0.5);
	uiGroup.add(accuracyImage);

	missesText = new FlxText(0, 0, FlxG.width, '0');
	missesText.setFormat(Paths.font(settings.get("font")), 20 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
	missesText.borderSize = 1.5 * settings.get("fontScale");
	missesText.camera = camHUD;
	missesText.y = scoreTxt.y;
	uiGroup.add(missesText);

	var missesImage = new FlxSprite(missesText.x + 550, scoreTxt.y - 20).loadGraphic(Paths.image('misses'));
	missesImage.camera = camHUD;
	missesImage.scale.set(0.5, 0.5);
	uiGroup.add(missesImage);

	scoreText = new FlxText(0, 0, FlxG.width + 350, '0');
	scoreText.setFormat(Paths.font(settings.get("font")), 20 * settings.get("fontScale"), 0xFFFFFFFF, "center", FlxTextBorderStyle.OUTLINE, 0xFF000000);
	scoreText.borderSize = 1.5 * settings.get("fontScale");
	scoreText.camera = camHUD;
	scoreText.y = scoreTxt.y;
	uiGroup.add(scoreText);

	var scoreImage = new FlxSprite(scoreText.x + 700, scoreTxt.y - 25).loadGraphic(Paths.image('score'));
	scoreImage.camera = camHUD;
	scoreImage.scale.set(0.5, 0.5);
	uiGroup.add(scoreImage);

	setObjectOrder(game.scoreTxt, game.members.indexOf(game.iconP1) - 1);
	game.grpNoteSplashes.visible = false;

	if (threeDeeSongs.contains(songName)) {
		threeDeeEnabled = true;
		doNoteShits();
	}

	return;
}

function doNoteShits() {
	for (note in unspawnNotes) {
		if ((note.noteType != '3d_notes' && !note.mustPress) || (note.noteType != '3d_notes' && note.mustPress && FlxG.random.int(0,2) == 1)) {
			note.texture = settings.get('notesSkin');
			note.rgbShader.enabled = false;
		}
	}
}

function onCountdownStarted() {
	for (i in game.strumLineNotes) {
		i.x += 5.5;
		if (ClientPrefs.data.downScroll)
			i.y -= 15;
	}
	for (j in 0...game.playerStrums.length) {
		game.setOnScripts('defaultPlayerStrumX' + j, game.playerStrums.members[j].x);
		game.setOnScripts('defaultPlayerStrumY' + j, game.playerStrums.members[j].y);
	}
	for (j in 0...game.opponentStrums.length) {
		game.setOnScripts('defaultOpponentStrumX' + j, game.opponentStrums.members[j].x);
		game.setOnScripts('defaultOpponentStrumY' + j, game.opponentStrums.members[j].y);
	}
	if (threeDeeSongs.contains(PlayState.SONG.song)) {
		for (strum in opponentStrums.members) {
			strum.texture = settings.get('strumSkin');
			strum.useRGBShader = false;
		}
	}
}

function onSpawnNote(note) {
	if (note.isSustainNote) note.noAnimation = true;
}

function goodNoteHitPre(note) {
	if (threeDeeEnabled) {
		if (note.noteType == '3d_notes' || note.texture == 'noteSkins/3D Notes/3D_NOTE_assets') PlayState.stageUI = '3D';
		else PlayState.stageUI = '';
	}
}

function goodNoteHit(note) {
	game.comboGroup.camera = game.camGame;
	if (note.isSustainNote) boyfriend.holdTimer = 0;
}

function opponentNoteHit(note) {
	if (note.isSustainNote) dad.holdTimer = 0;
}

function onSongStart() {
	for (timers in [timerBG, timer, alarmClock]) {
		FlxTween.tween(timers, {alpha: 1}, 0.5 / playbackRate, {ease: FlxEase.circOut});
	}
}

function onUpdatePost() {
	timer.amount = Math.min(1, Math.max(0, songPercent));

	var thingy = 0.88;
	var healthFlip = game.healthBar.leftToRight;
	iconProp1.setGraphicSize(Std.int(FlxMath.lerp(ogIconSize[0][0], iconProp1.width, thingy)), Std.int(FlxMath.lerp(ogIconSize[0][1], iconProp1.height, thingy)));
	iconProp1.updateHitbox();
	iconProp2.setGraphicSize(Std.int(FlxMath.lerp(ogIconSize[1][0], iconProp2.width, thingy)), Std.int(FlxMath.lerp(ogIconSize[1][1], iconProp2.height, thingy)));
	iconProp2.updateHitbox();

	game.iconP1.scale.set(iconProp1.width / 150, iconProp1.height / 150);
	game.iconP2.scale.set(iconProp2.width / 150, iconProp2.height / 150);

	var iconOffset = 26;
	if (healthFlip) {
		game.iconP2.flipX = true;
		game.iconP1.flipX = true;
		var bfArray = game.boyfriend.healthColorArray;
		var dadArray = game.dad.healthColorArray;
		game.healthBar.leftBar.color = FlxColor.fromRGB(bfArray[0], bfArray[1], bfArray[2]);
		game.healthBar.rightBar.color = FlxColor.fromRGB(dadArray[0], dadArray[1], dadArray[2]);
		game.iconP2.x = game.healthBar.x + (game.healthBar.width * (FlxMath.remapToRange(100 - game.healthBar.percent, 0, 100, 100, 0) * 0.01) - iconOffset);
		game.iconP1.x = game.healthBar.x + (game.healthBar.width * (FlxMath.remapToRange(100 - game.healthBar.percent, 0, 100, 100, 0) * 0.01)) - (game.iconP1.width - iconOffset);
	} else {
		game.iconP1.x = game.healthBar.x + (game.healthBar.width * (FlxMath.remapToRange(game.healthBar.percent, 0, 100, 100, 0) * 0.01) - iconOffset);
		game.iconP2.x = game.healthBar.x + (game.healthBar.width * (FlxMath.remapToRange(game.healthBar.percent, 0, 100, 100, 0) * 0.01)) - (game.iconP2.width - iconOffset);
	}

	game.iconP1.origin.set(0, 0);
	game.iconP2.origin.set(0, 0);

	switch (PlayState.SONG.song.toLowerCase())
	{
		default: 
			//game.scoreTxt.text = 'Score: ' + game.songScore + ' | Misses: ' + game.songMisses + ' | Accuracy: ' + truncateFloat(game.ratingPercent * 100, 2) + '%';
			missesText.text = songMisses;
			scoreText.text = FlxStringUtil.formatMoney(songScore, false);
			accuracyText.text = truncateFloat(ratingPercent * 100, 2) + '%';
	}

	if (game.camZooming) {
		game.camGame.zoom = FlxMath.lerp(game.defaultCamZoom, game.camGame.zoom, 0.95);
		game.camHUD.zoom = FlxMath.lerp(1, game.camHUD.zoom, 0.95);
	}
}

function onBeatHit() {
	var funny = Math.max(Math.min(game.health, 1.9), 0.1);
	iconProp1.setGraphicSize(Std.int(iconProp1.width + (50 * (funny + 0.1))), Std.int(iconProp1.height - (25 * funny)));
	iconProp1.updateHitbox();
	iconProp2.setGraphicSize(Std.int(iconProp2.width + (50 * ((2 - funny) + 0.1))), Std.int(iconProp2.height - (25 * (2 - funny))));
	iconProp2.updateHitbox();
}

function onEvent(n:String, v1:String) {
	if (n == 'Change Character')
		reloadIcons(v1);
}

function onDestroy() {Main.fpsVar.defaultTextFormat = new TextFormat("_sans", 14, 0xFFFFFF, false);}

// functions

function truncateFloat(number:Float, precision:Int):Float {
	var num = number;
	num = num * Math.pow(10, precision);
	num = Math.round(num) / Math.pow(10, precision);
	return num;
}

function reloadIcons(char:String) {
	if (char.toLowerCase() == 'dad' || char.toLowerCase() == 'opponent' || char == '0') {
		ogIconSize.shift();
		ogIconSize.insert(0, [game.iconP2._frame.frame.width, game.iconP2._frame.frame.height]);
	} else {
		ogIconSize.pop();
		ogIconSize.push([game.iconP1._frame.frame.width, game.iconP1._frame.frame.height]);
	}
}

function setObjectOrder(obj:FlxBasic, position:Int) {
	remove(obj);
	insert(position, obj);
}

function getMinAndMax(value1:Float, value2:Float):Array<Float>
{
	var minAndMaxs:Array<Float> = [];

	var min = Math.min(value1, value2);
	var max = Math.max(value1, value2);

	minAndMaxs.push(min);
	minAndMaxs.push(max);

	return minAndMaxs;
}