package artluix.worlds.LevelWorld.entities {
	import artluix.worlds.LevelWorld.Level;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	
	import net.flashpunk.graphics.Spritemap;
	
	import artluix.worlds.LevelWorld.entities.Actionable;
	import artluix.worlds.LevelWorld.helpers.Actionables;
	import artluix.Assets;
	
	public class Bonus extends Actionable {
		
		public function Bonus(name : String, xml : XML = null) {
			super(name, xml);
			type = 'bonus';;
		}
		//AS3 haven't multiple constructors support OMG:(
		
		public function setPos(pos : Point) : void {
			x = pos.x + 16; y = pos.y + 16; //thanks to ogmoEditor for this constants((
			visible = true;
		}
		public function setTimeoutPos(pos : Point) : void {
			var delay : Number = 1499;
			visible = false
			setTimeout(setPos, delay, pos);
		}
		
		override protected function loadSpritemap() : void {
			sprmap = new Spritemap(Assets.getSpritemap(name), rect.width, rect.height);
		}
		
	}

}