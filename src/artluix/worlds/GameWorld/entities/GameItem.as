package artluix.worlds.GameWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	import artluix.worlds.GameWorld.helpers.GameItems;
	import artluix.worlds.States;
	import artluix.Config;
	
	public class GameItem extends Entity {
		private var txt : Text;
		public function GameItem(levelName : String) {
			type = levelName;
			txt = new Text(levelName, 0, 0);
			txt.x = GameItems.getItemX(levelName) - (txt.width >> 1);
			txt.y = (Config.SCREEN_HEIGHT - txt.width) >> 1;
			txt.font = States.MENU;
			txt.color = 0x4C0000;
			setHitboxTo(txt);
			graphic = txt;
		}
		
	}

}