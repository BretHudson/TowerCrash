package  
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	public class Enemy1 extends Enemy
	{
		public function Enemy1(X:int, Y:int) 
		{
			super(X, Y);
			speed = 2;
			health = 1;
		}
		
		override public function render():void
		{
			Draw.rect(x, y, 32, 32, 0x00FFFF);
		}
	}
}