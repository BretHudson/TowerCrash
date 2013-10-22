package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	
	public class StartButton extends Entity
	{
		public var clicked:Boolean = true;
		private var startText:Text = new Text("Start", 64, 24);
		public var roundGoing = false;
		
		public function StartButton() 
		{
			super(490, 10);
			type = name = "startbutton";
			setHitbox(128, 48);
			startText.size = 24;
			startText.centerOO();
			startText.color = 0x000000;
			graphic = startText;
		}
		
		override public function update():void
		{		
			if ((mouseOver(x, y, width, height)) && (Input.mousePressed))
			{
				clicked = true;
				FP.world.add(new Start(0, 192));
				HUD.round++;
				roundGoing = true;
			}
			
			if ((!roundGoing) && (FP.world.typeCount("start") <= 0) && (FP.world.typeCount("enemy") <= 0) && (FP.world.typeCount("chooser") <= 0) && (FP.world.typeCount("displayer") <= 0) && (clicked))
			{
				FP.world.add(new QuestionChooser());
				roundGoing = true;
			}
		}
		
		override public function render():void
		{
			if (!clicked)
			{
				Draw.rectPlus(x, y, width, height, (mouseOver(x, y, width, height)) ? 0xFFFF00 : 0xBBBB00, 1, true);
				startText.alpha = 1;
			}
			else
			{
				Draw.rectPlus(x, y, width, height, 0x000000, 0.4);
				startText.alpha = 0.4;
			}
			
			super.render();
		}
		
		// Checks to see if the mouse is within a certain area of the screen
		private function mouseOver(X:int, Y:int, width:int, height:int):Boolean
		{
			return ((Input.mouseX >= X) && (Input.mouseX <= X + width) && (Input.mouseY >= Y) && (Input.mouseY <= Y + height));
		}
	}
}