package  
{
	import flash.display.GraphicsPath;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	
	public class Level extends World
	{
		// The array of objects to create the room
		private var room:Array = new Array(
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 3, 1, 1, 1, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 3, 1, 1, 1, 3, 0, 0, 
				0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 
			   -1, 1, 1, 1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 2, 1, 4, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 1, 1, 2, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
				0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
		
		// A variable to hold the Player object
		private var p:Player;
		
		// A variable to hold the QuestionDisplayer object
		private var q:QuestionDisplayer;
		
		public function Level()
		{
			// Create and add the Player to the room
			add(p = new Player());
			
			add(q = new QuestionDisplayer());
		}
		
		override public function begin():void
		{
			// Create the room, iterating through the array
			for (var i:int = 0; i < room.length; i++)
			{
				// Check which object is at that location and then place them into the room
				switch (room[i])
				{
					case -1:
						add(new Start(int(i % 20) * 32, int(i / 20) * 32));
						add(new Path(int(i % 20) * 32, int(i / 20) * 32));
						//add(new Enemy(int(i % 20) * 32, int(i / 20) * 32));
						break;
					case 1:
						add(new Path(int(i % 20) * 32, int(i / 20) * 32));
						break;
					case 2:
						add(new Left(int(i % 20) * 32, int(i / 20) * 32));
						add(new Path(int(i % 20) * 32, int(i / 20) * 32));
						break;
					case 3:
						add(new Right(int(i % 20) * 32, int(i / 20) * 32));
						add(new Path(int(i % 20) * 32, int(i / 20) * 32));
						break;
					case 4:
						add(new End(int(i % 20) * 32, int(i / 20) * 32));
						add(new Path(int(i % 20) * 32, int(i / 20) * 32));
						break;
				}
			}
			
			// Generate the first question
			q.generateQuestion();
		}
		
		override public function update():void
		{
			super.update();
			HUD.update();
		}
		
		override public function render():void
		{
			HUD.render();
			super.render();
		}
	}
}