package artluix.worlds.LevelWorld.entities {
	import artluix.worlds.LevelWorld.entities.Enemy;
	
	public class GroundEnemy extends Enemy {
		
		public function GroundEnemy(name : String, xml : XML) {
			super(name, xml);
		}
		
		override public function update() : void {
			if (sp.x > 0) {
				sprmap.flipped = false;
				if (collide('solid', x + 1, y) || !collide('solid', x + 1 + rect.width, y + 1)) {
					sp.x = -sp.x;
				}
			}
			else {
				sprmap.flipped = true;
				if (collide('solid', x - 1, y) || !collide('solid', x - 1 - rect.width, y + 1)) {
					sp.x = -sp.x;
				}
			}
			moveBy(sp.x, sp.y);
		}
	}

}