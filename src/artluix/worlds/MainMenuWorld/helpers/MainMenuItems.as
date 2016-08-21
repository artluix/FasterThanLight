package artluix.worlds.MainMenuWorld.helpers {
	public final class MainMenuItems {
		
		public static const GAME : String = 'game';
		public static const OPTIONS : String = 'options';
		public static const HIGHSCORES : String = 'highScore';
		public static const ABOUT : String = 'about';
		public static const EXIT : String = 'exit';
		
		public static function getItemY(name : String) : int {
			switch (name) {
				case GAME:
					return 300;
					break;   //+30
				case OPTIONS:
					return 340;
					break;
				case HIGHSCORES:
					return 380;
					break;
				case ABOUT:
					return 420;
					break;
				case EXIT:
					return 460;
					break;
				default: 
					return 768;
			}
		}
	}

}