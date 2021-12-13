package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class Battle extends FlxState
{
	var curOpponent:String = '';

	override public function create()
	{
		super.create();
	}

	override public function update(elapsed:Float)
	{
		switch (curOpponent)
		{
			default:
				FlxG.switchState(new PlayState());
		}
		super.update(elapsed);
	}
}
