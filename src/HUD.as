package  
{
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	public class HUD
	{
		// Stats
		public static var tower1price:int = 200;
		public static var tower2price:int = 400;
		public static var tower3price:int = 800;
		
		public static var money:int = 200;
		
		public static var round:int = 0;
		public static var violated:Boolean = true;
		
		// HUD Info
		public static var x:Number = 0;
		public static var y:Number = 0;
		
		public static var selection:int = 0;
		public static var pressedSelection:int = 0;
		
		// TODO: Add max-y value for player cursor
		public static var maxY:int = FP.height - 175;
		
		public static var shootTimer:Number = 0;
		public static var shootTimeout:Number = 3.0;
		public static var towers:Array = new Array();
		
		public static var moneyText:Text = new Text("", 470, FP.height - 175 + 45);
		
		public static var point1:Point = new Point(0, 0);
		public static var point2:Point = new Point(0, 0);
		
		[Embed(source = "images/tower1.png")]
		public static const TOWER1:Class;
		public static var tower1:Image = new Image(TOWER1);
		public static var tower1priceText:Text = new Text(String(tower1price), 87.5, FP.height - 175 + 110);
		
		[Embed(source = "images/tower2.png")]
		public static const TOWER2:Class;
		public static var tower2:Image = new Image(TOWER2);
		public static var tower2priceText:Text = new Text(String(tower2price), 87.5 + 150, FP.height - 175 + 110);
		
		[Embed(source = "images/tower3.png")]
		public static const TOWER3:Class;
		public static var tower3:Image = new Image(TOWER3);
		public static var tower3priceText:Text = new Text(String(tower3price), 87.5 + 300, FP.height - 175 + 110);
		
		public static function update():void
		{
			selection = 0;
			if ((mouseOver(25, FP.height - 175 + 25, 125, 125)) && (money >= tower1price))
				selection = 1;
			else if ((mouseOver(175, FP.height - 175 + 25, 125, 125)) && (money >= tower2price))
				selection = 2;
			else if ((mouseOver(325, FP.height - 175 + 25, 125, 125)) && (money >= tower3price))
				selection = 3;
			if ((Input.mousePressed) && (selection > 0))
				pressedSelection = selection;
			
			// Set up shoot timer
			shootTimer += FP.elapsed;
			
			if (shootTimer > shootTimeout)
			{
				FP.world.getType("tower", towers);
				for (var i:int = 0; i < towers.length; i++)
				{
					towers[i].shoot();
				}
				shootTimer = 0;
			}
			
			moneyText.size = 32;
			moneyText.text = "MONEY:\n" + String(money);
			moneyText.font = "Savatism";
			
			tower1.centerOO();
			tower1.x = x + 87.5;
			tower1.y = y + FP.height - 175 + 70;
			tower1priceText.font = "Savatism";
			tower1priceText.size = 24;
			tower1priceText.color = 0x000000;
			tower1priceText.centerOO();
			
			tower2.centerOO();
			tower2.x = x + 87.5 + 150;
			tower2.y = y + FP.height - 175 + 70;
			tower2priceText.font = "Savatism";
			tower2priceText.size = 24;
			tower2priceText.color = 0x000000;
			tower2priceText.centerOO();
			
			tower3.centerOO();
			tower3.x = x + 87.5 + 300;
			tower3.y = y + FP.height - 175 + 70;
			tower3priceText.font = "Savatism";
			tower3priceText.size = 24;
			tower3priceText.color = 0x000000;
			tower3priceText.centerOO();
		}
		
		public static function render():void
		{
			// Draw the rectangle background for the HUD
			// TODO: Make the background red if an enemy gets through
			Draw.rect(x, y + FP.height - 175, FP.width, 175, (violated) ? 0xCC3030 : 0x3030CC);
			
			
			if (pressedSelection == 1)
				Draw.rect(x + 25, y + FP.height - 175 + 25, 125, 125, 0xFFFFFF);
			else if (selection == 1)
				Draw.rect(x + 25, y + FP.height - 175 + 25, 125, 125, 0xBBBBBB);
			else if (money >= tower1price)
				Draw.rect(x + 25, y + FP.height - 175 + 25, 125, 125, 0x888888);
			else
				Draw.rect(x + 25, y + FP.height - 175 + 25, 125, 125, 0x333333);
			tower1.render(FP.buffer, point1, point2);
			tower1priceText.render(FP.buffer, point1, point2);
				
			
			if (pressedSelection == 2)
				Draw.rect(x + 175, y + FP.height - 175 + 25, 125, 125, 0xFFFFFF);
			else if (selection == 2)
				Draw.rect(x + 175, y + FP.height - 175 + 25, 125, 125, 0xBBBBBB);
			else if (money >= tower2price)
				Draw.rect(x + 175, y + FP.height - 175 + 25, 125, 125, 0x888888);
			else
				Draw.rect(x + 175, y + FP.height - 175 + 25, 125, 125, 0x333333);
			tower2.render(FP.buffer, point1, point2);
			tower2priceText.render(FP.buffer, point1, point2);
				
				
			if (pressedSelection == 3)
				Draw.rect(x + 325, y + FP.height - 175 + 25, 125, 125, 0xFFFFFF);
			else if (selection == 3)
				Draw.rect(x + 325, y + FP.height - 175 + 25, 125, 125, 0xBBBBBB);
			else if (money >= tower3price)
				Draw.rect(x + 325, y + FP.height - 175 + 25, 125, 125, 0x888888);
			else
				Draw.rect(x + 325, y + FP.height - 175 + 25, 125, 125, 0x333333);
			tower3.render(FP.buffer, point1, point2);
			tower3priceText.render(FP.buffer, point1, point2);
			
				
			moneyText.render(FP.buffer, point1, point2);
		}
		
		// Checks to see if the mouse is within a certain area of the screen
		public static function mouseOver(X:int, Y:int, width:int, height:int):Boolean
		{
			return ((Input.mouseX >= X) && (Input.mouseX <= X + width) && (Input.mouseY >= Y) && (Input.mouseY <= Y + height));
		}
	}
}