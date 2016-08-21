package artluix.worlds.HighscoreWorld {
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	import artluix.worlds.MainMenuWorld.MainMenu;
	import artluix.worlds.HighscoreWorld.entities.Record;
	
	public class Highscore extends World {
		
		public function Highscore() {
			add(new Record());
		}
		
		override public function update() : void {
			super.update();
			if (Input.pressed(Key.X)) {
				removeAll();
				FP.world = new MainMenu();
			}
		}
		
	}

}