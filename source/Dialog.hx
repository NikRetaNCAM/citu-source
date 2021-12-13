package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import openfl.display.Sprite;

class Dialog extends FlxSprite
{
	var dText:FlxText;

	public function create() {}

	public function startDialog(dString:String = '')
	{
		dText = new FlxText(0, 0, 0, dString, 12);
	}
}
