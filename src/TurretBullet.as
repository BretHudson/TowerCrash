package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Jiinio
	 */
	public class TurretBullet extends Entity 
	{
		[Embed(source = "images/turretbullet.png")]
		private const TURRETBULLET:Class;
		
		public var bulletDirection:String;
		
		private var speed:int = 250;
		
		public function TurretBullet (x:Number , y:Number , direction:String)
		{
			super(x, y);
			
			graphic = new Image(TURRETBULLET);
			
			bulletDirection = direction;
			
			setHitbox(5, 5);
			
			type = "turretBullet";
		}
		
		
		override public function update():void
		{	
			if (bulletDirection == "left")
			{
				x -= speed * FP.elapsed;
			}
			else if (bulletDirection == "right")
			{
				x += speed * FP.elapsed;
			}
			
			if (Input.check(Key.UP))
			{
				y -= speed * FP.elapsed;
			}
			
			if (Input.check(Key.DOWN))
			{
				y += speed * FP.elapsed;
			}
			
			if (collide("enemy" , x, y))
			{
				var enemy:Enemy = collide("enemy", x, y) as Enemy;
				enemy.damage();
			}
			
		}
		
	}
	
}