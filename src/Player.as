package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	// THE PLAYER CLASS IS HERE TO HANDLE INPUT THROUGH THE MOUSE
	
	public class Player extends Entity
	{	
		private var canPlace:Boolean = true;
		
		public function Player() 
		{
			// Setup collisions
			setHitbox(20, 20, 10, 10);
			type = "player";
			layer = -10;
		}
		override public function update():void
		{
			// CHange the position to the mouse position
			x = Input.mouseX;
			y = Input.mouseY;
			
			// Allow the player to place towers if not colliding with path
			canPlace = !collide("path", x, y);
			
			// Place towers
			if ((Input.mousePressed) && (canPlace))
			{
				FP.world.add(new Tower(x, y, Tower.SPIKE));
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