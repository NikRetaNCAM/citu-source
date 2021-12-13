package;

import flixel.FlxBasic;
import flixel.FlxG;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmo3Loader;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var worldPlayer:Player;
	var map:FlxOgmo3Loader;
	var walls:FlxTilemap;
	var progress:Float = 0;
	var hud:HUD;

	override public function create()
	{
		switch (progress)
		{
			case 0:
				map = new FlxOgmo3Loader(AssetPaths.mapThingy__ogmo, AssetPaths.room_001__json);
				walls = map.loadTilemap(AssetPaths.tiles__png, "walls");
				walls.follow();
				walls.setTileProperties(1, NONE);
				walls.setTileProperties(2, ANY);
				add(walls);
				worldPlayer = new Player();
				map.loadEntities(placeEntities, "entities");
				add(worldPlayer);
				camera.follow(worldPlayer, TOPDOWN, 1);
		}
		hud = new HUD();
		add(hud);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(worldPlayer, walls);
		// FlxG.overlap(worldPlayer, trigger);
	}

	function placeEntities(entity:EntityData)
	{
		if (entity.name == "player")
		{
			worldPlayer.setPosition(entity.x, entity.y);
		}
	}
}
