package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	public class Path extends Entity
	{
		public function Path(X:int, Y:int)
		{
			super(X, Y);
			setHitbox(32, 32);
			type = "path";
		}
		
		override public function render():void
		{
			Draw.rect(x, y, 32, 32, 0x111111);
		}
	}
}