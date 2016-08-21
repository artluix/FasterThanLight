package artluix.worlds.LevelWorld.helpers {
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public final class Actionables {
		//{ Names
		public static const PLAYER : String = 'player';
		public static const PIDOR : String = 'pidor';
		public static const GROOT : String = 'groot';
		public static const DRAGON : String = 'dragon';
		public static const RING : String = 'ring';
		
		public static const COUNT : int = 5;
		//}
		//{ Rects
		private static const PLAYER_RECT : Rectangle = new Rectangle(0, 0, 56, 64);
		private static const PIDOR_RECT : Rectangle = new Rectangle(0, 0, 58, 64);
		private static const GROOT_RECT : Rectangle = new Rectangle(0, 0, 64, 64);
		private static const DRAGON_RECT : Rectangle = new Rectangle(0, 0, 64, 64);
		private static const RING_RECT : Rectangle = new Rectangle(16, 16, 32, 32);
		
		public static function getRect(name : String) : Rectangle {
			switch (name) {
				case PLAYER:
					return PLAYER_RECT;
					break;
				case PIDOR:
					return PIDOR_RECT;
					break;
				case GROOT:
					return GROOT_RECT;
					break;
				case DRAGON:
					return DRAGON_RECT;
					break;
				case RING:
					return RING_RECT;
					break;
				default:
					return null;
			}
		}
		//}
		//{ Speeds
		private static const PLAYER_SPEED : Point = new Point(0, 0);
		private static const PIDOR_SPEED : Point = new Point(3, 0);
		private static const GROOT_SPEED : Point = new Point(2, 0);
		private static const DRAGON_SPEED : Point = new Point(4, 3);
		
		public static function getSpeed(name : String) : Point {
			switch (name) {
				case PLAYER:
					return PLAYER_SPEED;
					break;
				case PIDOR:
					return PIDOR_SPEED;
					break;
				case GROOT:
					return GROOT_SPEED;
					break;
				case DRAGON:
					return DRAGON_SPEED;
					break;
				default:
					return null;
			}
		}
		//}
		//{ Points
		private static const PIDOR_PTS : int = 99;
		private static const GROOT_PTS : int = -40;
		private static const DRAGON_PTS : int = 33;
		private static const RING_PTS : int = 22;
		
		public static function getPoints(name : String) : int {
			switch(name) {
				case PIDOR:
					return PIDOR_PTS;
					break;
				case GROOT:
					return GROOT_PTS;
					break;
				case DRAGON:
					return DRAGON_PTS;
					break;
				case RING:
					return RING_PTS;
					break;
				default:
					return 0;
			}
		}
		//}
	}
}