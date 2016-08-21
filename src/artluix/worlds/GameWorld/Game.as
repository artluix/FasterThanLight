package artluix.worlds.GameWorld {
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	import artluix.worlds.GameWorld.entities.BgItem;
	import artluix.worlds.LevelWorld.Level;
	import artluix.worlds.MainMenuWorld.MainMenu;	
	import artluix.worlds.GameWorld.entities.GameItem;
	import artluix.worlds.LevelWorld.entities.Player;
	import artluix.worlds.LevelWorld.helpers.Levels;

	public class Game extends World {
		private var bgItem : BgItem;
		private var forestLevel : GameItem;
		private var winterLevel : GameItem;
		private var desertLevel : GameItem;
		
		public function Game() {
			bgItem = new BgItem();
			forestLevel = new GameItem(Levels.FOREST);
			winterLevel = new GameItem(Levels.WINTER);
			desertLevel = new GameItem(Levels.DESERT);
			
			add(bgItem);
			add(forestLevel);
			add(winterLevel);
			add(desertLevel);
		}
		
		override public function update() : void {
			if (forestLevel.collidePoint(forestLevel.x, forestLevel.y, Input.mouseX, Input.mouseY) && Input.mousePressed) {
				removeAll();
				FP.world = new Level(Levels.FOREST);
			}
			else if (winterLevel.collidePoint(winterLevel.x, winterLevel.y, Input.mouseX, Input.mouseY) && Input.mousePressed) {
				removeAll();
				FP.world = new Level(Levels.WINTER);
			}
			else if (desertLevel.collidePoint(desertLevel.x, desertLevel.y, Input.mouseX, Input.mouseY) && Input.mousePressed) {
				removeAll();
				FP.world = new Level(Levels.DESERT);
			}
			
			if (Input.pressed(Key.X)) {
				removeAll();
				FP.world = new MainMenu();
			}
		}
		
		override public function removeAll() : void {
			super.removeAll();
			bgItem = null;
			forestLevel = null;
			winterLevel = null;
			desertLevel = null;
		}
	}

}