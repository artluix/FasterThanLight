package artluix.worlds.LevelWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	import artluix.Assets;
	
	public class EndPoint extends Entity {
		private var img : Image;
		
		public function EndPoint(levelName : String, xml : XML) {
			type = 'endPoint';
			img = new Image(Assets.getLevelImage(levelName, xml.name()));
			img.x = xml.@x; img.y = xml.@y;
			setHitboxTo(img);
			graphic = img;
		}
	}

}