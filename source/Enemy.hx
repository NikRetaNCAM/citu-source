package;

import flixel.FlxGame;
import flixel.FlxSprite;
import openfl.display.Sprite;

enum EnemyType
{
	H_REGULAR;
	A_REGULAR;
	N_REGULAR;
	H_HEAVY;
	A_HEAVY;
	N_HEAVY;
}

class Enemy extends FlxSprite
{
	static inline var RSPEED:Float = 150;
	static inline var HSPEED:Float = 125;

	var enType:EnemyType;

	public function new(x:Float, y:Float, enType:EnemyType)
	{
		super();
		this.enType = enType;
		var graphic;
		switch (enType)
		{
			case H_REGULAR:
				graphic = AssetPaths.hregular__png;
			case A_REGULAR:
				graphic = AssetPaths.hregular__png;
			case N_REGULAR:
				graphic = AssetPaths.hregular__png;
			case H_HEAVY:
				graphic = AssetPaths.hheavy__png;
			case A_HEAVY:
				graphic = AssetPaths.hheavy__png;
			case N_HEAVY:
				graphic = AssetPaths.hheavy__png;
		}
		loadGraphic(graphic, true, 16, 16);
		setFacingFlip(LEFT, false, false);
		setFacingFlip(RIGHT, true, false);
		animation.add("d", [0, 1, 0, 2], 6, false);
		animation.add("lr", [3, 4, 3, 5], 6, false);
		animation.add("u", [6, 7, 6, 8], 6, false);
		drag.x = drag.y = 10;
		width = 8;
		height = 14;
		offset.x = 4;
		offset.y = 2;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
