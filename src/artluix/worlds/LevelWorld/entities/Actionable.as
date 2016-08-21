package artluix.worlds.LevelWorld.entities {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;

	import artluix.worlds.LevelWorld.helpers.Actionables;
	
	public class Actionable extends Entity {		
		protected var sprmap : Spritemap;
		protected var rect : Rectangle;
		protected var sp : Point;
		
		public function Actionable(name : String, xml : XML = null) {
			this.name = name;
			var speed : Point = Actionables.getSpeed(name);
			if (speed) sp = new Point(speed.x, speed.y);
			rect = Actionables.getRect(name);
			setHitboxTo(rect);
			if (xml) {
				x = xml.@x; y =  xml.@y;
			}
			loadSpritemap();
			graphic = sprmap;
		}
		protected function loadSpritemap() : void {}
	}

}