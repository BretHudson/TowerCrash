package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	// THE ENEMY CLASS IS A BASE CLASS FOR ENEMIES
	// YOU EXTEND THE ENEMY CLASS WHEN YOU WANT TO CREATE A TYPE OF ENEMY
	
	public class Enemy extends Entity
	{
		// Create constant variables to make code easier to understand
		private const LEFT:int = 0;
		private const UP:int = 1;
		private const RIGHT:int = 2;
		private const DOWN:int = 3;
		
		// The base speed
		public var speed:int = 1;
		private var dir:int = RIGHT;
		
		public var health:int = 0;
		
		public function Enemy(X:int, Y:int) 
		{
			super(X, Y);
			setHitbox(32, 32, 16, 16);
			type = "enemy";
			layer = -1;
		}
		
		override public function update():void
		{
			if (x > FP.width + width / 2)
			{
				HUD.violated = true;
				FP.world.remove(this);
			}
			
			switch (dir)
			{
				case LEFT:
					for (var i:int = 0; i < speed; i++)
					{
						if ((collide("left", x, y)) && (!collide("left", x - 32, y)) && (!collide("path", x - 32, y)))
						{
							dir = UP;
							break;
						}
						else if ((collide("right", x, y)) && (!collide("right", x - 32, y)) && (!collide("path", x - 32, y)))
						{
							dir = DOWN;
							break;
						}
						else
							x--;
					}
					break;
				case UP:
					for (var j:int = 0; j < speed; j++)
					{
						if ((collide("left", x, y)) && (!collide("left", x, y - 32)) && (!collide("path", x, y - 32)))
						{
							dir = LEFT;
							break;
						}
						else if ((collide("right", x, y)) && (!collide("right", x, y - 32)) && (!collide("path", x, y - 32)))
						{
							dir = RIGHT;
							break;
						}
						else
							y--;
					}
					break;
				case RIGHT:
					for (var k:int = 0; k < speed; k++)
					{
						if ((collide("left", x, y)) && (!collide("left", x + 32, y)) && (!collide("path", x + 32, y)))
						{
							dir = UP;
							break;
						}
						else if ((collide("right", x, y)) && (!collide("right", x + 32, y)) && (!collide("path", x + 32, y)))
						{
							dir = DOWN;
							break;
						}
						else
							x++;
					}
					break;
				case DOWN:
					for (var l:int = 0; l < speed; l++)
					{
						if ((collide("left", x, y)) && (!collide("left", x, y + 32)) && (!collide("path", x, y + 32)))
						{
							dir = RIGHT;
							break;
						}
						else if ((collide("right", x, y)) && (!collide("right", x, y + 32)) && (!collide("path", x, y + 32)))
						{
							dir = LEFT;
							break;
						}
						else
							y++;
					}
					break;
			}
		}
		
		public function damage():void
		{
			health--;
			if (health <= 0)
			{
				FP.world.remove(this);
			}
		}
	}
}