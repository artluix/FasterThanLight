package artluix.worlds.HighscoreWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Data;
	
	import artluix.Config;
	import artluix.worlds.States;
	import artluix.worlds.LevelWorld.helpers.Levels;
	
	public class Record extends Entity {
		private var txt : Text;
		public function Record() {
			txt = new Text('', 0, 0);
			Data.load('highscores');
			var forestString : Array = Data.readString('Levelforest', '').split(' ');	
			var winterString : Array = Data.readString('Levelwinter', '').split(' ');	
			var desertString : Array = Data.readString('Leveldesert', '').split(' ');	
			
			txt.text += 'LevelName: ' + 'forest' + '\n' + 'Name: ' + forestString[0] + '\n' + 'Points: ' + forestString[1] + '\n' + 'Time: ' + forestString[2] + '\n\n';
			txt.text += 'LevelName: ' + 'winter' + '\n' + 'Name: ' + winterString[0] + '\n' + 'Points: ' + winterString[1] + '\n' + 'Time: ' + winterString[2] + '\n\n';
			txt.text += 'LevelName: ' + 'desert' + '\n' + 'Name: ' + desertString[0] + '\n' + 'Points: ' + desertString[1] + '\n' + 'Time: ' + desertString[2] + '\n\n';
			Data.save('highscores');
			txt.font = States.MENU;
			txt.x = (Config.SCREEN_WIDTH - txt.width) >> 1; txt.y = (Config.SCREEN_HEIGHT - txt.height) >> 1;
			graphic = txt;
		}
		
	}

}