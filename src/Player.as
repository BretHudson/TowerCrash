package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	// THE PLAYER CLASS IS HERE TO HANDLE INPUT THROUGH THE MOUSE
	
	public class Player extends Entity
	{
		// TODO: Add max-y value for player cursor
		
		public function Player() 
		{
			// Setup collisions
			setHitbox(24, 24, 12, 12);
			type = "player";
			name = "player";
			layer = -10;
		}
		
		//Tower vars to handle placement
		private var tower:Tower;
		private var canPlace:Boolean = true;
		
		// If the question forum is up on the screen
		public var questionUp:Boolean = true;
		
		override public function update():void
		{
			// Change the position to the mouse position
			x = Input.mouseX;
			y = Input.mouseY;
			
			// Allow the player to place towers if not colliding with path or a tower
			canPlace = !collide("path", x, y) && !collide("base", x, y);
			
			// Place towers
			if ((Input.mousePressed) && (canPlace) && (!questionUp) && (HUD.pressedSelection > 0) && (Input.mouseY < HUD.maxY))
			{
				tower = new Tower(x, y, HUD.pressedSelection);
				FP.world.add(tower);
			}
		}
		
		override public function render():void
		{
			// Change the color based off of if the player can place towers or not
			if (canPlace)
				Draw.circlePlus(x, y, 16, 0x78FF33);
			else
				Draw.circlePlus(x, y, 16, 0xFF0000);
		}
	}
}