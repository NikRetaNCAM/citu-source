package;

import PlayState;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import openfl.display.Sprite;

class Player extends FlxSprite
{
	static inline var SPEED:Float = 100;

	var playstate:PlayState = new PlayState();

	public var canMove:Bool = true;

	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		loadGraphic(AssetPaths.player__png, true, 16, 16);
		setFacingFlip(LEFT, false, false);
		setFacingFlip(RIGHT, true, false);
		animation.add("lr", [3, 4, 3, 5], 6, false);
		animation.add("u", [6, 7, 6, 8], 6, false);
		animation.add("d", [0, 1, 0, 2], 6, false);
		drag.x = 0;
		drag.y = 1600;
		setSize(8, 8);
		offset.set(4, 4);
	}

	function updateMovement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var right:Bool = false;
		var left:Bool = false;
		var isPressing:Bool = false;
		isPressing = FlxG.keys.anyPressed([UP, W, DOWN, S, RIGHT, D, LEFT, A]);
		if (FlxG.keys.anyJustReleased([UP, W, DOWN, S, RIGHT, D, LEFT, A]))
		{
			isPressing = false;
		}
		up = FlxG.keys.anyPressed([UP, W]);
		down = FlxG.keys.anyPressed([DOWN, S]);
		right = FlxG.keys.anyPressed([RIGHT, D]);
		left = FlxG.keys.anyPressed([LEFT, A]);
		if (up && down)
			up = down = false;
		if (right && left)
			right = left = false;
		var newAngle:Float = 0;
		if (up)
		{
			newAngle = -90;
			if (left)
				newAngle -= 45;
			else if (right)
				newAngle += 45;
			facing = UP;
		}
		else if (down)
		{
			newAngle = 90;
			if (left)
				newAngle += 45;
			else if (right)
				newAngle -= 45;
			facing = DOWN;
		}
		else if (left)
		{
			newAngle = 180;
			facing = LEFT;
		}
		else if (right)
		{
			newAngle = 0;
			facing = RIGHT;
		}

		// determine our velocity based on angle and speed
		if (isPressing)
		{
			velocity.set(SPEED, 0);
			velocity.rotate(FlxPoint.weak(0, 0), newAngle);
		}
		if (!isPressing)
		{
			velocity.set(0, 0);
		}

		// if the player is moving (velocity is not 0 for either axis), we need to change the animation to match their facing
		if ((velocity.x != 0 || velocity.y != 0) && touching == NONE)
		{
			switch (facing)
			{
				case LEFT, RIGHT:
					animation.play("lr");
				case UP:
					animation.play("u");
				case DOWN:
					animation.play("d");
				case _:
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (canMove)
		{
			updateMovement();
		}
		super.update(elapsed);
	}
}
