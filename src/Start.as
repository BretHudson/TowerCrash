package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	
	public class Start extends Entity
	{
		public function Start(X:int, Y:int)
		{
			super(X, Y);
			setHitbox(32, 32);
			type = "start";
		}
		
		private var counter:Number = 0;
		private var create:Boolean = true;
		private var start:uint = 0;
		
		override public function update():void
		{
			GenerateEnemies(2,5);
		}
		
		override public function render():void
		{
			Draw.rect(x, y, 32, 32, 0x111111);
		}
		
		private function GenerateEnemies(timeElapsed:uint , numberOfEnemy1:uint):void 
		{
			//Set counter to elapsed time
			counter += FP.elapsed;
			
			//Check if create is true
			if (create)
			{
				//Check for each assigned seconds of elapsed time
				if (counter > timeElapsed)
				{
					//If start number is greater than enemy numbers we need then stop
					if (start >= numberOfEnemy1)
					{
						create = false;
					}
					//Else just add a new enemy and increase the start counter to avoid infinite enemies
					else if (numberOfEnemy1 > 0)
					{
						FP.world.add(new Enemy1(-30, y));
						start++;
						counter = 0;
					}
				}	
			}
		}
	}
}