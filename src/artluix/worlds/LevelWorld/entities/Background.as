package artluix.worlds.LevelWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	
	import artluix.Assets;
	import artluix.Config;
	
	public class Background extends Entity {	
		private var bgImgs : Array = new Array();
		private var tilemap : Tilemap;
		private var grid : Grid;
		
		public function Background(levelName : String, xml : XML) {
			type = 'solid';
			tilemap = new Tilemap(Assets.getTileset(levelName), xml.@width, xml.@height, xml.@tileW, xml.@tileH);
			mask = grid = new Grid(xml.@width, xml.@height, xml.@tileW, xml.@tileH);	
			for each (var tile : XML in xml.background.tile) {
				tilemap.setTile(tile.@x, tile.@y, tilemap.getIndex(tile.@tx, tile.@ty));
				grid.setTile(tile.@x, tile.@y);
			}
			
			for (var i : int = 0; i < Math.ceil(xml.@width / Config.SCREEN_WIDTH); i++) {
				var img : Image = new Image(Assets.getWorldImage(levelName));
				img.x = i * Config.SCREEN_WIDTH;
				addGraphic(img);
			}
			addGraphic(tilemap);
		}
		
	}
}