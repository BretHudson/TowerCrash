package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Draw;
	
	public class Tower extends Entity
	{
		[Embed(source = "images/tower1.png")]
		private const TOWER1:Class;
		
		private var tower1Image:Image = new Image(TOWER1);
		
		// TODO: Change these
		public static const SPIKE:int = 1;
		public static const TYPE2:int = 2;
		public static const TYPE3:int = 3;
		
		// Type of tower
		private var towerType:int = 0;
		
		public function Tower(X:int, Y:int, towerType:int) 
		{
			super(X, Y);
			
			type = "tower";
			
			if (towerType == 1)
				HUD.money -= HUD.tower1price;
			else if (towerType == 2)
				HUD.money -= HUD.tower2price;
			else if (towerType == 3)
				HUD.money -= HUD.tower3price;
			
			// Set the type of the tower here
			// Instead of having classes for each type, there is one class,
			// and we just have a variable that changes what this object does
			this.towerType = towerType;
			
			layer = -2;
			
			tower1Image.centerOO();
			
			graphic = new Graphiclist(tower1Image);
		}
		
		override public function added():void
		{
			FP.world.add(new TowerBase(this.x , this.y));
		}
		
		override public function update():void
		{
			// Decide which function to call based on what type of tower it is
			switch (towerType)
			{
				case SPIKE:
					spike();
					break;
				case TYPE2:
					// Do type 2 stuff
					break;
				case TYPE3:
					// Do type 3 stuff
					break;
			}
		}
		
		override public function render():void
		{
			super.render();
			
			switch (towerType)
			{
				case SPIKE:
					//Draw.circlePlus(x, y, 16, 0xFFFFFF);
					break;
				case TYPE2:
					Draw.circlePlus(x, y, 16, 0xFF831A);
					break;
				case TYPE3:
					Draw.circlePlus(x, y, 16, 0xFF240C);
					break;
			}
		}
		
		private function spike():void
		{
			// Perform the spike update
			setHitbox(32, 32, 16, 16);
			
			tower1Image.visible = true;
			//tower2Image.visible = false;
			//tower3Image.visible = false;
		}
		
		public function shoot():void
		{
			FP.world.add(new Bullet(this.x , this.y, towerType));
		}
	}
}