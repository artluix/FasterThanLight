package artluix.worlds.MainMenuWorld {
	import flash.system.System;
	
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	import artluix.worlds.MainMenuWorld.entities.BgItem;
	import artluix.worlds.MainMenuWorld.entities.MainMenuItem;
	import artluix.worlds.GameWorld.Game;
	import artluix.worlds.GameWorld.Game;
	import artluix.worlds.HighscoreWorld.Highscore;
	
	public class MainMenu extends World {
		private var bgItem : BgItem;
		private var gameItem : MainMenuItem;
		private var optionsItem : MainMenuItem;
		private var highscoreItem : MainMenuItem;
		private var aboutItem : MainMenuItem;
		private var exitItem : MainMenuItem;
		
		public function MainMenu() {
			bgItem = new BgItem();
			gameItem = new MainMenuItem('game');
			optionsItem = new MainMenuItem('options');
			highscoreItem = new MainMenuItem('highScore');
			aboutItem = new MainMenuItem('about');
			exitItem = new MainMenuItem('exit');
			
			add(bgItem);
			add(gameItem);
			add(optionsItem);
			add(highscoreItem);
			add(aboutItem);
			add(exitItem);
			
			Input.mouseCursor = 'arrow';
		}
		
		override public function update() : void {
			if (gameItem.collidePoint(gameItem.x, gameItem.y, Input.mouseX, Input.mouseY) && Input.mousePressed) {
				removeAll();
				FP.world = new Game();
			}
			else if (highscoreItem.collidePoint(highscoreItem.x, highscoreItem.y, Input.mouseX, Input.mouseY) && Input.mousePressed) {
				removeAll();
				FP.world = new Highscore();
			}
			else if ((exitItem.collidePoint(exitItem.x, exitItem.y, Input.mouseX, Input.mouseY) && Input.mousePressed) || Input.pressed(Key.X)) {
				System.exit(0);
			}
		}
		
		override public function removeAll() : void {
			super.removeAll();
			bgItem = null;
			gameItem = null;
			optionsItem = null;
			highscoreItem = null;
			aboutItem = null;
			exitItem = null;
		}
	}

}