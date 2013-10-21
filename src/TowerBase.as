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
			setHitbox(12, 12, 6, 6);
		}
	}
	
}