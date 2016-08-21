package artluix.worlds.LevelWorld.helpers {
	public final class Levels {
		//{ Names
		public static const FOREST : String = 'forest';
		public static const WINTER : String = 'winter';
		public static const DESERT : String = 'desert';
		
		public static const COUNT : int = 3;
		//}
		
		public static function getNextLevel(name : String) : String {
			switch(name) {
				case FOREST:
					return WINTER;
					break;
				case WINTER:
					return DESERT;
					break;
				default:
					return null;
			}
		}
	}
}