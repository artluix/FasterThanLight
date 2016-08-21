package artluix {
	import net.flashpunk.Engine;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	import artluix.worlds.MainMenuWorld.MainMenu;
	
	public class Main extends Engine {
		public function Main()  {
			super(Config.SCREEN_WIDTH, Config.SCREEN_HEIGHT, Config.SCREEN_FPS, false);
			FP.world = new MainMenu();
			FP.console.enable();
		}
		
		override public function setStageProperties() : void {
			super.setStageProperties();
			stage.displayState = Config.SCREEN_MODE;
		}
		
		override public function update() : void {
			super.update();
			if (Input.pressed(Key.T)) {
				FP.console.visible = FP.console.visible ? false : true;
			}
		}
	}
	
}