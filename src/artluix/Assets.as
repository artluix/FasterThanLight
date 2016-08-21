package artluix {
	//import artluix.worlds.MainMenuWorld.helpers.MainMenuItems;
	import artluix.worlds.LevelWorld.helpers.Levels;
	import artluix.worlds.LevelWorld.helpers.Actionables;
	import artluix.worlds.States;
	
	public final class Assets {
		//{ Tilesets
		[Embed(source = '../assets/tilesets/forest.png')] private static const FOREST_TILESET : Class;
		[Embed(source = '../assets/tilesets/winter.png')] private static const WINTER_TILESET : Class;
		[Embed(source = '../assets/tilesets/desert.png')] private static const DESERT_TILESET : Class;
		
		public static function getTileset(level : String) : Class {
			switch (level) {
				case Levels.FOREST:
					return FOREST_TILESET;
					break;
				case Levels.WINTER:
					return WINTER_TILESET;
					break;
				case Levels.DESERT:
					return DESERT_TILESET;
					break;
				default:
					return null;
			}
		}
		//} 
		//{ Levels
		[Embed(source = '../assets/ogmoLevels/forest.oel', mimeType = 'application/octet-stream')] private static const FOREST_LEVEL : Class;
		[Embed(source = '../assets/ogmoLevels/winter.oel', mimeType = 'application/octet-stream')] private static const WINTER_LEVEL : Class;
		[Embed(source = '../assets/ogmoLevels/desert.oel', mimeType = 'application/octet-stream')] private static const DESERT_LEVEL : Class;
		
		public static function getLevel(level : String) : Class {
			switch (level) {
				case Levels.FOREST:
					return FOREST_LEVEL;
					break;
				case Levels.WINTER:
					return WINTER_LEVEL;
					break;
				case Levels.DESERT:
					return DESERT_LEVEL;
					break;
				default:
					return null;
			}
		}
		//} 
		//{ Spritemaps
		[Embed(source = '../assets/spritemaps/player.png')] private static const PLAYER_SPRITEMAP : Class;
		[Embed(source = '../assets/spritemaps/pidor.png')] private static const PIDOR_SPRITEMAP : Class;
		[Embed(source = '../assets/spritemaps/groot.png')] private static const GROOT_SPRITEMAP : Class;
		[Embed(source = '../assets/spritemaps/dragon.png')] private static const DRAGON_SPRITEMAP : Class;
		[Embed(source = '../assets/spritemaps/ring.png')] private static const RING_SPRITEMAP : Class;
		
		public static function getSpritemap(actionable : String) : Class {
			switch (actionable) {
				case Actionables.PLAYER:
					return PLAYER_SPRITEMAP;
					break;
				case Actionables.PIDOR:
					return PIDOR_SPRITEMAP;
					break;
				case Actionables.GROOT:
					return GROOT_SPRITEMAP;
					break;
				case Actionables.DRAGON:
					return DRAGON_SPRITEMAP;
					break;
				case Actionables.RING:
					return RING_SPRITEMAP;
					break;
				default:
					return null;
			}
		}
		//}
		//{ Images
		//forest
		[Embed(source = '../assets/images/forest/bush_1.png')] private static const FOREST_BUSH_1 : Class;
		[Embed(source = '../assets/images/forest/bush_2.png')] private static const FOREST_BUSH_2 : Class;
		[Embed(source = '../assets/images/forest/bush_3.png')] private static const FOREST_BUSH_3 : Class;
		[Embed(source = '../assets/images/forest/bush_4.png')] private static const FOREST_BUSH_4 : Class;
		[Embed(source = '../assets/images/forest/crate.png')] private static const FOREST_CRATE : Class;
		[Embed(source = '../assets/images/forest/mushroom_1.png')] private static const FOREST_MUSHROOM_1 : Class;
		[Embed(source = '../assets/images/forest/mushroom_2.png')] private static const FOREST_MUSHROOM_2 : Class;
		[Embed(source = '../assets/images/forest/sign_1.png')] private static const FOREST_SIGN_1 : Class;
		[Embed(source = '../assets/images/forest/sign_2.png')] private static const FOREST_SIGN_2 : Class;
		[Embed(source = '../assets/images/forest/stone.png')] private static const FOREST_STONE : Class;
		[Embed(source = '../assets/images/forest/tree_1.png')] private static const FOREST_TREE_1 : Class;
		[Embed(source = '../assets/images/forest/tree_2.png')] private static const FOREST_TREE_2 : Class;
		[Embed(source = '../assets/images/forest/tree_3.png')] private static const FOREST_TREE_3 : Class;
		
		[Embed(source = '../assets/images/forest/door.png')] private static const FOREST_FINISH : Class;
		
		public static function getLevelImage(level : String, name : String) : Class {
			switch (level) {
				case Levels.FOREST:
					switch (name) {
						case 'bush_1':
							return FOREST_BUSH_1;
							break;
						case 'bush_2':
							return FOREST_BUSH_2;
							break;
						case 'bush_3':
							return FOREST_BUSH_3;
							break;
						case 'bush_4':
							return FOREST_BUSH_4;
							break;
						case 'crate':
							return FOREST_CRATE;
							break;
						case 'mushroom_1':
							return FOREST_MUSHROOM_1;
							break;
						case 'mushroom_2':
							return FOREST_MUSHROOM_2;
							break;
						case 'sign_1':
							return FOREST_SIGN_1;
							break;
						case 'sign_2':
							return FOREST_SIGN_2;
							break;
						case 'stone':
							return FOREST_STONE;
							break;
						case 'tree_1':
							return FOREST_TREE_1;
							break;
						case 'tree_2':
							return FOREST_TREE_2;
							break;
						case 'tree_3':
							return FOREST_TREE_3;
							break;
						case 'finish':
							return FOREST_FINISH;
							break;
						default:
							return null;
					}
				default:
					return null;
			}
		}
		
		[Embed(source = '../assets/images/forest/bg.png')] private static const FOREST_BG : Class;		
		[Embed(source = '../assets/images/winter/bg.png')] private static const WINTER_BG : Class;		
		[Embed(source = '../assets/images/desert/bg.png')] private static const DESERT_BG : Class;		
		[Embed(source = '../assets/images/mainmenu/bg.jpg')] private static const MAINMENU_BG : Class;
		[Embed(source = '../assets/images/game/bg.png')] private static const GAME_BG : Class;
		
		public static function getWorldImage(worldName : String) : Class {
			switch(worldName) {
				case States.FOREST_WORLD:
					return FOREST_BG;
					break;
				case States.WINTER_WORLD:
					return WINTER_BG;
					break;
				case States.DESERT_WORLD:
					return DESERT_BG;
					break;
				case States.MAINMENU_WORLD:
					return MAINMENU_BG;
					break;
				case States.GAME_WORLD:
					return GAME_BG;
					break;
				default:
					return null;
			}
		}
		//}
		//{ Fonts
		[Embed(source = '../assets/fonts/digital.ttf', embedAsCFF = 'false', fontFamily = States.LEVEL)] private static const FOREST_FONT : Class;
		[Embed(source = '../assets/fonts/highscores.otf', embedAsCFF = 'false', fontFamily = States.MENU)] private static const HIGHSCORES_FONT : Class; 
		//}
	}
}