package artluix.worlds.MainMenuWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	import artluix.worlds.States;
	import artluix.Assets;
	
	public class BgItem extends Entity {
		private var bgImg : Image;
		
		public function BgItem() {
			bgImg = new Image(Assets.getWorldImage(States.MAINMENU_WORLD));
			graphic = bgImg;
		}
	}
}