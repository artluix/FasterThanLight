package artluix.worlds.GameWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	import artluix.worlds.States;
	import artluix.Assets;
	
	public class BgItem extends Entity {
		private var bgImg : Image;
		
		public function BgItem() {
			bgImg = new Image(Assets.getWorldImage(States.GAME_WORLD));
			graphic = bgImg;
		}
		
	}

}