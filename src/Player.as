package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	// THE PLAYER CLASS IS HERE TO HANDLE INPUT THROUGH THE MOUSE
	
	public class Player extends Entity
	{
		// Y distance from bottom for placement
		private var ydist:int = 195;
		
		[Embed(source = "images/tower1radius.png")]
		private const TOWER1RADIUS:Class;
		
		[Embed(source = "images/tower2radius.png")]
		private const TOWER2RADIUS:Class;
		
		[Embed(source = "images/tower3radius.png")]
		private const TOWER3RADIUS:Class;
		
		private const tower1radius:Image = new Image(TOWER1RADIUS);
		private const tower2radius:Image = new Image(TOWER2RADIUS);
		private const tower3radius:Image = new Image(TOWER3RADIUS);
		
		public function Player() 
		{
			// Setup collisions
			setHitbox(24, 24, 12, 12);
			type = "player";
			name = "player";
			layer = -10;
			
			tower1radius.centerOO();
			tower2radius.centerOO();
			tower3radius.centerOO();
			
			graphic = new Graphiclist(tower1radius , tower2radius, tower3radius);
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
				HUD.pressedSelection = 0;
			}
			
			tower1radius.visible = false;
			tower2radius.visible = false;
			
			switch (HUD.pressedSelection)
			{
				case 1:
					tower1radius.visible = true;
					break;
				case 2:
					tower2radius.visible = true;
					break;
				case 3:
					tower3radius.visible = true;
					break;
			}
		}
		
		override public function render():void
		{
			// Change the position to the mouse position
			x = Input.mouseX;
			y = Input.mouseY;
			
			// Draw graphic
			super.render();
			
			// Change the color based off of if the player can place towers or not
			if (HUD.pressedSelection > 0)
			{
				if ((canPlace) && (y <= FP.height - ydist))
					Draw.circlePlus(x, y, 16, 0x78FF33, 0.5);
				else
					Draw.circlePlus(x, y, 16, 0xFF0000, 0.5);
			}
			else
				Draw.circlePlus(x, y, 16, 0xFFFFFF, 0.5);
		}
	}
}