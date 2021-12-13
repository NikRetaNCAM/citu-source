package;

import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.ui.FlxButton;
import openfl.display.Sprite;

class HUD extends FlxTypedGroup<FlxSprite>
{
	var statButt:FlxButton;
	var invButt:FlxButton;
	var hpCount:Float = 5;
	var hpText:FlxText;

	public function new()
	{
		super();
		hpText = new FlxText(200, -150, 0, Std.string(hpCount), 10);
		add(hpText);
		invButt = new FlxButton(0, 0, 'Inventory', invClick);
		invButt.screenCenter();
		invButt.x -= 100;
		invButt.y += 100;
		invButt.scale.x = 0.7;
		invButt.scale.y = 0.6;
		invButt.label.size = 7;
		add(invButt);
		statButt = new FlxButton(0, 0, 'Stats', statClick);
	}

	function statClick()
	{
		trace('statButt clicked');
	}

	function invClick()
	{
		trace('invButt clicked');
	}
}
