package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	public class Bullet extends Entity
	{
		private var speed:int = 6;
		private var maxRadius:int = 96;
		private var bulletType:int = 0;
		
		public function Bullet(X:int, Y:int, bulletType:int) 
		{
			super(X, Y);
			this.bulletType = bulletType;
			if (bulletType == Tower.SPIKE)
				setHitbox(32, 32, 16, 16);
		}
		
		override public function update():void
		{
			if (bulletType == Tower.SPIKE)
			{
				for (var i:int = 0; i < speed; i++)
				{
					width++;
					height++;
				}
				
				for (var j:int = 0; j < speed / 2; j++)
				{
					originX++;
					originY++;
				}
				
				if (collide("enemy", x, y))
				{
					var enemy:Enemy = collide("enemy", x, y) as Enemy;
					enemy.damage();
				}
				
				if (width > maxRadius)
					FP.world.remove(this);
			}
		}
		
		override public function render():void
		{
			if (bulletType == Tower.SPIKE)
				Draw.circlePlus(x, y, width / 2, 0xFFFFFF, 1, false, 3);
		}
	}
}