package artluix.worlds.LevelWorld {
	import flash.utils.ByteArray;
	
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Data;
	
	import artluix.worlds.LevelWorld.entities.Player;
	import artluix.worlds.LevelWorld.entities.Actionable;
	import artluix.worlds.LevelWorld.entities.Background;
	import artluix.worlds.LevelWorld.entities.Foreground;
	import artluix.worlds.LevelWorld.entities.EndPoint;
	import artluix.worlds.LevelWorld.entities.GroundEnemy;
	import artluix.worlds.LevelWorld.entities.FlyEnemy;
	import artluix.worlds.LevelWorld.entities.TextEntity;
	import artluix.worlds.LevelWorld.entities.EndLevelScreen;
	import artluix.worlds.MainMenuWorld.MainMenu;
	import artluix.Assets;
	import artluix.worlds.LevelWorld.helpers.Actionables;
	import artluix.Config;
	import artluix.worlds.LevelWorld.helpers.Levels;
	import artluix.worlds.LevelWorld.entities.Bonus;
	
	public class Level extends World {
		private var name : String;		
		
		private var pts : int = 0;
		private var time : Number = 0;
		
		private var txt : TextEntity;
		private var background : Background;	
		private var foreground : Foreground;
		private var player : Player;
		private var bonuses : Array = new Array();
		private var enemies : Array = new Array();
		private var endPoint : EndPoint;
		private var endLvlScr : EndLevelScreen;
		
		public var width : int;
		public var height : int;
		
		public function Level(name : String) {
			this.name = name;
			
			loadLevel();
			loadText();
			
			Input.mouseCursor = 'hide';
		}
		
		override public function update() : void  {
			if (Input.pressed(Key.X)) {
				removeAll();
				FP.world = new MainMenu();
			}
				
			
			super.update();		
			camera_update();
			if (txt) {
				txt.upd(player.getPts(), player.getLives(), time += FP.elapsed);	
			}
			
			if (!endLvlScr && player && player.collideWith(endPoint, player.x, player.y)) {
				pts = player.getPts();
				endLvlScr = new EndLevelScreen(pts, time);
				removeAll();
				add(endLvlScr);
			}
			
			if (endLvlScr) {
				if (Input.pressed(Key.ENTER)) {
					Data.load('highscores');
					var levelString : Array = Data.readString('Level' + name, '').split(' ');			
					if (levelString[0] == '') {
						Data.writeString('Level' + name, endLvlScr.getUsrName() + ' ' + pts + ' ' + time.toFixed(2));
					}
					else {	
						var oldPts : int = int(levelString[1]);
						var oldTime : Number = Number(levelString[2]);
						if (pts > oldPts) {
							Data.writeString('Level' + name, endLvlScr.getUsrName() + ' ' + pts + ' ' + time.toFixed(2));
						}
						else if (pts == oldPts) {
							if (time < oldTime) {
								Data.writeString('Level' + name, endLvlScr.getUsrName() + ' ' + pts + ' ' + time.toFixed(2));
							}
						}
					}
					Data.save('highscores');
					removeAll();
					FP.world = new MainMenu();
				}
			}
		}
		
		private function loadLevel() : void {
			var rawData : ByteArray = new (Assets.getLevel(name));
			var dataString : String = rawData.readUTFBytes(rawData.length);
			var xml : XML = new XML(dataString);
			
			width = xml.@width;
			height = xml.@height;
			
			background = new Background(name, xml);
			add(background);
			foreground = new Foreground(name, xml);
			add(foreground);
			endPoint = new EndPoint(name, XML(xml.endLevel.finish));
			add(endPoint);
			
			for each(var xmlEl : XML in xml.entity.pidor) {
			 	 var groundEnemy : GroundEnemy = new GroundEnemy(Actionables.PIDOR, xmlEl);
				 enemies.push(groundEnemy);
				 add(groundEnemy);
			}
			for each(xmlEl in xml.entity.groot) {
			 	 groundEnemy = new GroundEnemy(Actionables.GROOT, xmlEl);
				 enemies.push(groundEnemy);
				 add(groundEnemy);
			}
			for each(xmlEl in xml.entity.dragon) {
			 	 var flyEnemy : FlyEnemy = new FlyEnemy(Actionables.DRAGON, xmlEl);
				 enemies.push(flyEnemy);
				 add(flyEnemy);
			}
			for each(xmlEl in xml.entity.ring) {
			 	 var bonus : Bonus = new Bonus(Actionables.RING, xmlEl);
				 bonuses.push(bonus);
				 add(bonus);
			}
			player = new Player(XML(xml.entity.player)); //we have only 1 player, so
 	   	  	add(player); 
		}
		
		private function loadText() : void {
			txt = new TextEntity(name);
			add(txt);
		}
		
		private function camera_update() : void {
			if (player) {
				if (player.x < (Config.SCREEN_WIDTH >> 1)) {
					camera.x = 0;
				}
				else if (player.x > width - (Config.SCREEN_WIDTH >> 1)) {
					camera.x = width - Config.SCREEN_WIDTH;
				}
				else camera.x = player.x - (Config.SCREEN_WIDTH >> 1);
				//i use always height = config.screen_height, but this maybe useful
				if (player.y < (Config.SCREEN_HEIGHT >> 1)) {
					camera.y = 0;
				}
				else if (player.y > height - (Config.SCREEN_HEIGHT >> 1)) {
					camera.y = height - Config.SCREEN_HEIGHT;
				} 
				else camera.y = player.y - (Config.SCREEN_HEIGHT >> 1);
			}
			else  {
				camera.x = 0; camera.y = 0;
			}
		}
		
		override public function removeAll() : void {
			super.removeAll();
			player = null;
			background = null;
			foreground = null;
			endPoint = null;
			enemies = null;
			bonuses = null;
			txt = null;
		}
	}
}