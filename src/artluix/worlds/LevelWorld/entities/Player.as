package artluix.worlds.LevelWorld.entities {
	import Math;	
	import flash.geom.Point;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	import artluix.worlds.LevelWorld.Level;
	import artluix.Assets;
	import artluix.worlds.LevelWorld.helpers.Actionables;
	import artluix.Config;
	import artluix.worlds.MainMenuWorld.MainMenu;
	
	public class Player extends Actionable {
		private var lives : int = 4;
		private var pts : int = 0;
		
		private var startPos : Point;
		
		private const grv : Number = 0.4375;
		private const acc : Number = 0.1875;
		private const dec : Number = 1.0;
		private const frc : Number = 0.09375;
		private const topS : Point = new Point(12, 32);
		private const jmpS : Number = -18.0;
		private const jmpEnd : Number = -6.0;
		
		public function Player(xml : XML) {
			super(Actionables.PLAYER, xml);
			startPos = new Point(x, y);
		}
		
		override public function update() : void {		
			//{ Input processing
			if (Input.check(Key.LEFT)) {
				sprmap.flipped = true;
				sp.x -= (sp.x > 0) ? dec : acc;
				if (sp.x < -topS.x) {
					sp.x = -topS.x;
				}
			}
			else if (Input.check(Key.RIGHT)) {
				sprmap.flipped = false;
				sp.x += (sp.x < 0) ? dec : acc;
				if (sp.x > topS.x) {
					sp.x = topS.x;
				}
			}
			else sp.x -= Math.min(Math.abs(sp.x), frc) * sign(sp.x);
			if (Input.released(Key.SPACE)) {
				if (sp.y < jmpEnd) {
					sp.y = jmpEnd;
				}
			}
			if (collide('solid', x, y + 1)) {
				sp.y = 0;
				if (Input.pressed(Key.SPACE)) {
   					sp.y = jmpS;
				}
			}
			else sp.y += grv;
			if (sp.y > topS.y) {
					sp.y = topS.y;
				}
			
			if ((collide('solid', x + 1, y) && sp.x > 0) || (collide('solid', x - 1, y) && sp.x < 0)) {
 				sp.x = 0;
			}
			//}
			//{ Points
			var ringCollide : Entity = collide('bonus', x, y);
			if (ringCollide) {
				pts += Actionables.getPoints(Actionables.RING);
				world.remove(ringCollide);
			}
			var enemyCollide : Entity = collide('enemy', x, y);
			if (enemyCollide) {
				if (sp.y != 0) {
					pts += Actionables.getPoints(enemyCollide.name);
					world.remove(enemyCollide);
				}
				else die();
			}
			if (y > (world as Level).height - rect.height) {
				die();
			}
			//}
			//{ Animations
			if (sp.y == 0) {
				if (sp.x == 0) {
					sprmap.play('stay');
				}
				else if (Math.abs(sp.x) < topS.x ) {
					sprmap.play('walking');
				}
				else sprmap.play('run');
			}
			else {
				sprmap.play('jump');
			}
			//}
			
			moveBy(sp.x, sp.y, 'solid', true);
		}
		
		override protected function loadSpritemap() : void { 
			sprmap = new Spritemap(Assets.getSpritemap(Actionables.PLAYER), rect.width, rect.height);
			sprmap.add('stay', [0], 0, false);
			sprmap.add('walking', [1, 2, 3, 4, 5, 6, 7, 8, 9], 10, true);
			sprmap.add('run', [10, 11, 12, 13], 4, true);
			sprmap.add('jump', [14, 15, 16, 17, 18, 19, 20, 21, 22], 9, true);
		}
		
		private function die() : void {
				lives--;
				if (lives > 0) {
					x = startPos.x;	y = startPos.y;
					sp.x = 0; sp.y = 0;
				}
				else { 
					world.removeAll();
					FP.world = new MainMenu();
				}
				
		}
		//I can't find this function even in C++
		private function sign(x : Number) : int {
			return x > 0 ? 1 : (x < 0 ? -1 : 0);
		}
		
		public function getPts() : int {
			return pts;
		}
		public function getLives() : int {
			return lives;
		}
		
	}

}