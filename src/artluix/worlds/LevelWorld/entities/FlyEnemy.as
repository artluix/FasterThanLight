package artluix.worlds.LevelWorld.entities {
	import flash.geom.Point;
	
	import artluix.worlds.LevelWorld.entities.Enemy
	import artluix.Config;

	public class FlyEnemy extends Enemy {
		private var oldSp : Point;
		private var wave : Boolean = false;
		public function FlyEnemy(name : String, xml : XML) {
			super(name, xml);
			oldSp = new Point(sp.x, sp.y);
		}
		
		override public function update() : void {		
			//{ Choose random direction
			if (!wave) {
				var r : int = Math.round(Math.random() * 7);
				switch (r) {
					case 0:
						sp.x = -oldSp.x; sp.y = -oldSp.y;
						break;
					case 1:
						sp.x = 0; sp.y = -oldSp.y;
						break;
					case 2:
						sp.x = oldSp.x; sp.y = -oldSp.y;
						break;
					case 3:
						sp.x = -oldSp.x; sp.y = 0;
						break;
					case 4:
						sp.x = oldSp.x; sp.y = 0;
						break;
					case 5:
						sp.x = -oldSp.x; sp.y = oldSp.y;
						break;
					case 6:
						sp.x = 0; sp.y = oldSp.y;
						break;
					case 7:
						sp.x = oldSp.x; sp.y = oldSp.y;
						break;
				}
				wave = true;
			}
			//}
			//{ Check for collision
			if (sp.x > 0 && collide('solid', x + 1, y)) {
				sp.x = -sp.x;
				wave = false;
			}
			else if (sp.x < 0 && collide('solid', x - 1, y)) {
				sp.x = -sp.x;
				wave = false;
			}
			if (sp.y > 0 && (collide('solid', x, y + 1) || y > Config.SCREEN_HEIGHT - rect.width)) {
				sp.y = -sp.y;
				wave = false;
			}
			else if (sp.y < 0 && collide('solid', x, y - 1)) {
				sp.y = -sp.y;
				wave = false;
			}
			//}
			if (sp.x > 0) {
				sprmap.flipped = false;
			}
			else {
				sprmap.flipped = true;
			}
			moveBy(sp.x, sp.y);
		} 
	}

}