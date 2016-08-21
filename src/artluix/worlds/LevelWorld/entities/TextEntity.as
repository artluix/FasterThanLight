package artluix.worlds.LevelWorld.entities {
	import flash.geom.Point;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.Entity;
	
	import artluix.worlds.LevelWorld.entities.Player;
	import artluix.worlds.States;
	import artluix.Config;
	import artluix.Assets;
	
	public class TextEntity extends Entity {
		private var txtPts : Text = new Text("", 0, 0);
		private var txtLives : Text = new Text("", 0, 0);
		public function TextEntity(name : String) { //i'll make fontfamily == levelName, soo
			txtPts.font = txtLives.font = States.LEVEL;
			txtPts.color = 0xFFA500; txtLives.color = 0xFFA500;
			addGraphic(txtLives);
			addGraphic(txtPts);
		}
		
		public function upd(pts : int, lives : int, time : Number) : void {
			txtPts.text = "Pts: " + pts + "\n" + "Time: " + time.toFixed(2);
			txtLives.text = "Lives: " + lives;
			txtPts.x = world.camera.x + Config.SCREEN_WIDTH - txtPts.width;
			txtLives.x = world.camera.x;
			super.update();
		}
		
	}

}