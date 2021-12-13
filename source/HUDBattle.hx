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
	var hpBar:FlxBar;
	var hpCount:Float = 100;
	var hpText:FlxText;

	public function new()
	{
		super();
		hpBar = new FlxBar(0, 0, LEFT_TO_RIGHT, 100, 20, hpCount, 0, 100, true);
		hpBar.screenCenter();
		hpBar.y -= 150;
		hpBar.x += 300;
		hpText = new FlxText(200, -150, 0, Std.string(hpCount), 10);
		add(hpBar);
	}
}
