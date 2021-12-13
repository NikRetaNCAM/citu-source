package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	var playButton:FlxButton;
	var daName:FlxText;

	override public function create()
	{
		daName = new FlxText(0, 0, 0, "C.I.T.U", 16);
		daName.screenCenter();
		daName.y -= 30;
		add(daName);
		playButton = new FlxButton(0, 0, "Play", clickPlay);
		add(playButton);
		playButton.screenCenter();
		playButton.y += 30;
		super.create();
		if (FlxG.sound.music == null)
		{
			FlxG.sound.playMusic(AssetPaths.rkade__ogg, 1, true);
		}
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function clickPlay()
	{
		// var dialog:Dialog = new Dialog();
		// dialog.startDialog();
		FlxG.switchState(new PlayState());
	}
}
