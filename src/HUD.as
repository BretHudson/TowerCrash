package  
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	public class HUD
	{
		public static var x:Number = 0;
		public static var y:Number = 0;
		
		public static var selection:int = 0;
		public static var pressedSelection:int = 0;
		
		// TODO: Add max-y value for player cursor
		public static var maxY:int = FP.height - 175;
		
		public static var shootTimer:Number = 0;
		public static var shootTimeout:Number = 3.0;
		public static var towers:Array = new Array();
		
		public static function update():void
		{
			selection = 0;
			if (mouseOver(25, FP.height - 175 + 25, 125, 125))
				selection = 1;
			else if (mouseOver(175, FP.height - 175 + 25, 125, 125))
				selection = 2;
			else if (mouseOver(325, FP.height - 175 + 25, 125, 125))
				selection = 3;
			if ((Input.mousePressed) && (selection > 0))
				pressedSelection = selection;
			
			// Set up shoot timer
			shootTimer += FP.elapsed;
			
			if (shootTimer > shootTimeout)
			{
				FP.world.getType("tower", towers);
				for (var i:int = 0; i < towers.length; i++)
				{
					towers[i].shoot();
				}
				shootTimer = 0;
			}
		}
		
		public static function render():void
		{
			// Draw the rectangle background for the HUD
			// TODO: Make the background red if an enemy gets through
			Draw.rect(x, y + FP.height - 175, FP.width, 175, 0x3030CC);
			if (pressedSelection == 1)
				Draw.rect(x + 25, y + FP.height - 175 + 25, 125, 125, 0xFFFFFF);
			else if (selection == 1)
				Draw.rect(x + 25, y + FP.height - 175 + 25, 125, 125, 0xBBBBBB);
			else
				Draw.rect(x + 25, y + FP.height - 175 + 25, 125, 125, 0x888888);
			if (pressedSelection == 2)
				Draw.rect(x + 175, y + FP.height - 175 + 25, 125, 125, 0xFFFFFF);
			else if (selection == 2)
				Draw.rect(x + 175, y + FP.height - 175 + 25, 125, 125, 0xBBBBBB);
			else
				Draw.rect(x + 175, y + FP.height - 175 + 25, 125, 125, 0x888888);
			if (pressedSelection == 3)
				Draw.rect(x + 325, y + FP.height - 175 + 25, 125, 125, 0xFFFFFF);
			else if (selection == 3)
				Draw.rect(x + 325, y + FP.height - 175 + 25, 125, 125, 0xBBBBBB);
			else
				Draw.rect(x + 325, y + FP.height - 175 + 25, 125, 125, 0x888888);
		}
		
		// Checks to see if the mouse is within a certain area of the screen
		public static function mouseOver(X:int, Y:int, width:int, height:int):Boolean
		{
			return ((Input.mouseX >= X) && (Input.mouseX <= X + width) && (Input.mouseY >= Y) && (Input.mouseY <= Y + height));
		}
	}
}