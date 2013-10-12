package
{
	import flash.display.BlendMode;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;

	public class Main extends Engine
	{
		// The font used throughout the game
		// http://www.fontspace.com/nal/savantism
		[Embed(source = "Savantism.otf", embedAsCFF = "false", fontFamily = 'Savatism')]
		public static const SAVANTISM:Class;
		
		// Create the gradient
		[Embed(source = 'gradient.png')]
		public static const GRADIENT:Class;
		
		public static var sizerect:Rectangle = new Rectangle(0, 0, 640, 480);
		public static var gradient:Image = new Image(GRADIENT, sizerect);
		
		// Points to help with rendering the gradient (without these weird results occur)
		public static var point1:Point = new Point();
		public static var point2:Point = new Point();
		
		public function Main():void
		{
			// Initialize the game
			super(640, 480);
			
			// Set the background color to a moderate grey
			FP.screen.color = 0x888888;
			
			// Change the world to the game world
			FP.world = new Level();
			
			// Enable the debug console
			//FP.console.enable();	
			
			// Double the scale of the gradient (to make it fill the screen)
			gradient.scale = 2;
			
			// Change how the gradient renders, blending it better with the screen
			gradient.blend = BlendMode.MULTIPLY;
		}
		
		override public function render():void
		{
			super.render();
			gradient.render(FP.buffer, point1, point2);
		}
	}
}