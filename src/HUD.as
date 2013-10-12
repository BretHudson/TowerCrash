package  
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	public class HUD
	{
		public static var x:Number = 0;
		public static var y:Number = 0;
		
		// TODO: Add max-y value for player cursor
		
		public static function update():void
		{
			// TODO: Add HUD input
		}
		
		public static function render():void
		{
			// Draw the rectangle background for the HUD
			Draw.rect(x, y + FP.height - 175, FP.width, 175, 0x3030CC);
		}
	}
}