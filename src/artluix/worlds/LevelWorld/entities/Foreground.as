package artluix.worlds.LevelWorld.entities {	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	import artluix.Assets;
	
	public class Foreground extends Entity {
		private var images : Array = new Array();
		public function Foreground(levelName : String, xml : XML) {
			for each (var xml : XML in xml.foreground.children()) {
				var img : Image = new Image(Assets.getLevelImage(levelName, xml.name()));
				img.x = xml.@x; img.y = xml.@y;
				//images.push(img);
				addGraphic(img);
			}
		}
		
	}

}