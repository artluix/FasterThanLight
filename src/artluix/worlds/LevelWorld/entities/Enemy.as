package artluix.worlds.LevelWorld.entities {
	import flash.geom.Point;
	
	import net.flashpunk.graphics.Spritemap;
	
	import artluix.worlds.LevelWorld.entities.Actionable;
	import artluix.worlds.LevelWorld.entities.Bonus;
	import artluix.worlds.LevelWorld.helpers.Actionables;
	import artluix.Assets;
	
	public class Enemy extends Actionable {
		
		public function Enemy(name : String, xml : XML) {
			super(name, xml);
			type = 'enemy';
		}
		
		override protected function loadSpritemap() : void {
			sprmap = new Spritemap(Assets.getSpritemap(name), rect.width, rect.height);
			sprmap.add('walking', [0, 1, 2], 3, true);
			sprmap.play('walking');
		}
		
		override public function removed() : void {
			var killBonus : Bonus = new Bonus('ring');
			//smth notreasonables constants in code 16 = coord for bonus, coz we need, that it stay at centre of killed enemy
			killBonus.setTimeoutPos(new Point(x + 16, y + 16));
			world.add(killBonus);
		}
		
	}

}