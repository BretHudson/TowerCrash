package  
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	
	public class Enemy1 extends Enemy
	{
		[Embed(source = "images/bluetri.png")]
		private const BLUETRI:Class;
		[Embed(source = "images/orangetri.png")]
		private const ORANGETRI:Class;
		
		private var bluetri:Image = new Image(BLUETRI);
		private var orangetri:Image = new Image(ORANGETRI);
		
		public function Enemy1(X:int, Y:int) 
		{
			super(X + 16, Y + 16);
			speed = 2;
			health = 1;
			bluetri.centerOO();
			orangetri.centerOO();
			graphic = new Graphiclist(orangetri, bluetri);
		}
		
		override public function update():void
		{
			super.update();
			bluetri.angle += 2;
			orangetri.angle -= 1;
		}
	}
}