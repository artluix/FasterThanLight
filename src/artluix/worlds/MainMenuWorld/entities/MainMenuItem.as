package artluix.worlds.MainMenuWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	import artluix.worlds.MainMenuWorld.helpers.MainMenuItems;
	import artluix.worlds.States;
	import artluix.Config;
	
	public class MainMenuItem extends Entity {
		private var txt : Text;
		public function MainMenuItem(caption : String) {
			type = caption;
			txt = new Text(caption, 0, MainMenuItems.getItemY(caption));
			txt.x = (Config.SCREEN_WIDTH - txt.width) >> 1;
			txt.size = 20;
			txt.color = 0x4F1636;
			setHitboxTo(txt);
			txt.font = States.MENU;
			graphic = txt;
		}
	}
}