package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Draw;
	
	/**
	 * ...
	 * @author Jiinio
	 */
	public class TowerBase extends Entity 
	{
		public function TowerBase(x:int , y:int)
		{
			super(x, y);
			
			layer = -2;
			type = "base";
			setHitbox(4, 4);
		}
		
		override public function render() : void
		{
			Draw.circlePlus(x, y, 8 , 0x000000);
		}
	}
	
}