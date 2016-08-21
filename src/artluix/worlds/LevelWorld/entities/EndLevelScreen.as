package artluix.worlds.LevelWorld.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;

	import artluix.Config;
	import artluix.worlds.States;
	import artluix.worlds.LevelWorld.helpers.Levels;
	
	public class EndLevelScreen extends Entity {	
		private var lblUsrName : Text;
		private var txtUsrName : Text;
		private var txtUsrScore : Text;
		public function EndLevelScreen(pts : int, time : Number) {
			txtUsrScore = new Text('Your time is ' + time.toFixed(2) + '. Your score is ' + pts, 0, 0);
			txtUsrScore.x = (Config.SCREEN_WIDTH - txtUsrScore.width) >> 1; txtUsrScore.y = (Config.SCREEN_HEIGHT >> 1) - txtUsrScore.height;
			lblUsrName = new Text('Input your name', 0, 0);
			lblUsrName.x = (Config.SCREEN_WIDTH - lblUsrName.width) >> 1; lblUsrName.y = txtUsrScore.y + txtUsrScore.height;
			txtUsrName = new Text('', 0, 0);
			txtUsrName.y = lblUsrName.y + lblUsrName.height;
			txtUsrName.font = lblUsrName.font = txtUsrScore.font = States.MENU;
			addGraphic(txtUsrScore);
			addGraphic(lblUsrName);
			addGraphic(txtUsrName);
			Input.keyString = '';
		}
		
		public function getUsrName() : String {
			return txtUsrName.text;
		}
		
		override public function update() : void {
			super.update();
			txtUsrName.text = Input.keyString;
			txtUsrName.x = (Config.SCREEN_WIDTH - txtUsrName.width) >> 1;
		}
	}

}