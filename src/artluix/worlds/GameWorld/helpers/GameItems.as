package artluix.worlds.GameWorld.helpers {
	import artluix.worlds.LevelWorld.helpers.Levels;
	
	public final class GameItems {
		
		public static function getItemX(name : String) : int {
			switch(name) {
				case Levels.FOREST:
					return 228;
					break;
				case Levels.WINTER:
					return 683;
					break;
				case Levels.DESERT:
					return 1139;
					break;
				default:
					return 1366;
			}
		}
		
	}

}