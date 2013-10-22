package
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	
	public class QuestionChooser extends Entity 
	{
		public var alpha:Number = 0;
		public var yOffset:Number = 120;
		
		// The amount of pixels on each side of the question box
		private var paddingx:int = 30;
		private var paddingy:int = 30;
		
		private var selQuestion:int = -1;
		
		private var choosing:Boolean = true;
		
		public function QuestionChooser() 
		{
			layer = -100;
			y = yOffset;
			type = "chooser";
			HUD.violated = false;
		}
		
		override public function added():void
		{
			fadeIn();
		}
		
		override public function update():void
		{
			if (choosing)
			{
				selQuestion = -1;
				
				// Column 1
				if (mouseOver(x + 45, y + 136, 96, 50))
					selQuestion = 0;
				if (mouseOver(x + 45, y + 136 + 58, 96, 50))
					selQuestion = 1;
				if (mouseOver(x + 45, y + 136 + 58 * 2, 96, 50))
					selQuestion = 2;
				if (mouseOver(x + 45, y + 136 + 58 * 3, 96, 50))
					selQuestion = 3;
				if (mouseOver(x + 45, y + 136 + 58 * 4, 96, 50))
					selQuestion = 4;
				
				// Column 2
				if (mouseOver(x + 45 + 144, y + 136, 96, 50))
					selQuestion = 5;
				if (mouseOver(x + 45 + 144, y + 136 + 58, 96, 50))
					selQuestion = 6;
				if (mouseOver(x + 45 + 144, y + 136 + 58 * 2, 96, 50))
					selQuestion = 7;
				if (mouseOver(x + 45 + 144, y + 136 + 58 * 3, 96, 50))
					selQuestion = 8;
				if (mouseOver(x + 45 + 144, y + 136 + 58 * 4, 96, 50))
					selQuestion = 9;
				
				// Column 3
				if (mouseOver(x + 45 + 114 * 2, y + 136, 96, 50))
					selQuestion = 10;
				if (mouseOver(x + 45 + 114 * 2, y + 136 + 58, 96, 50))
					selQuestion = 11;
				if (mouseOver(x + 45 + 114 * 2, y + 136 + 58 * 2, 96, 50))
					selQuestion = 12;
				if (mouseOver(x + 45 + 114 * 2, y + 136 + 58 * 3, 96, 50))
					selQuestion = 13;
				if (mouseOver(x + 45 + 114 * 2, y + 136 + 58 * 4, 96, 50))
					selQuestion = 14;
				
				// Column 4
				if (mouseOver(x + 45 + 114 * 3, y + 136, 96, 50))
					selQuestion = 15;
				if (mouseOver(x + 45 + 114 * 3, y + 136 + 58, 96, 50))
					selQuestion = 16;
				if (mouseOver(x + 45 + 114 * 3, y + 136 + 58 * 2, 96, 50))
					selQuestion = 17;
				if (mouseOver(x + 45 + 114 * 3, y + 136 + 58 * 3, 96, 50))
					selQuestion = 18;
				if (mouseOver(x + 45 + 114 * 3, y + 136 + 58 * 4, 96, 50))
					selQuestion = 19;
				
				// Column 5
				if (mouseOver(x + 45 + 114 * 4, y + 136, 96, 50))
					selQuestion = 20;
				if (mouseOver(x + 45 + 114 * 4, y + 136 + 58, 96, 50))
					selQuestion = 21;
				if (mouseOver(x + 45 + 114 * 4, y + 136 + 58 * 2, 96, 50))
					selQuestion = 22;
				if (mouseOver(x + 45 + 114 * 4, y + 136 + 58 * 3, 96, 50))
					selQuestion = 23;
				if (mouseOver(x + 45 + 114 * 4, y + 136 + 58 * 4, 96, 50))
					selQuestion = 24;
			}
			
			if ((Input.mousePressed) && (selQuestion >= 0))
			{
				choosing = false;
				fadeOut();
			}
		}
		
		override public function render():void
		{
			Draw.rectPlus(x + paddingx, y + paddingy, FP.width - paddingx * 2, FP.height - paddingy * 2, 0xEEEEEE, alpha, true);
			
			// Column 1
			if (Questions.selected[0] == 0) Draw.rect(x + 45, y + 148, 96, 50, (selQuestion == 0) ? 0x66FFFF : 0x33CCFF, alpha, false);
			if (Questions.selected[1] == 0) Draw.rect(x + 45, y + 148 + 58, 96, 50, (selQuestion == 1) ? 0x66FFFF : 0x33CCFF, alpha, false);
			if (Questions.selected[2] == 0) Draw.rect(x + 45, y + 148 + 58 * 2, 96, 50, (selQuestion == 2) ? 0x66FFFF : 0x33CCFF, alpha, false);
			if (Questions.selected[3] == 0) Draw.rect(x + 45, y + 148 + 58 * 3, 96, 50, (selQuestion == 3) ? 0x66FFFF : 0x33CCFF, alpha, false);
			if (Questions.selected[4] == 0) Draw.rect(x + 45, y + 148 + 58 * 4, 96, 50, (selQuestion == 4) ? 0x66FFFF : 0x33CCFF, alpha, false);
			
			
			// Column 2
			if (Questions.selected[5] == 0) Draw.rect(x + 45 + 114, y + 148, 96, 50, (selQuestion == 5) ? 0x66FF66 : 0x33CC33, alpha, false);
			if (Questions.selected[6] == 0) Draw.rect(x + 45 + 114, y + 148 + 58, 96, 50, (selQuestion == 6) ? 0x66FF66 : 0x33CC33, alpha, false);
			if (Questions.selected[7] == 0) Draw.rect(x + 45 + 114, y + 148 + 58 * 2, 96, 50, (selQuestion == 7) ? 0x66FF66 : 0x33CC33, alpha, false);
			if (Questions.selected[8] == 0) Draw.rect(x + 45 + 114, y + 148 + 58 * 3, 96, 50, (selQuestion == 8) ? 0x66FF66 : 0x33CC33, alpha, false);
			if (Questions.selected[9] == 0) Draw.rect(x + 45 + 114, y + 148 + 58 * 4, 96, 50, (selQuestion == 9) ? 0x66FF66 : 0x33CC33, alpha, false);
			
			
			// Column 3
			if (Questions.selected[10] == 0) Draw.rect(x + 45 + 114 * 2, y + 148, 96, 50, (selQuestion == 10) ? 0xFFFF33 : 0xFFCC00, alpha, false);
			if (Questions.selected[11] == 0) Draw.rect(x + 45 + 114 * 2, y + 148 + 58, 96, 50, (selQuestion == 11) ? 0xFFFF33 : 0xFFCC00, alpha, false);
			if (Questions.selected[12] == 0) Draw.rect(x + 45 + 114 * 2, y + 148 + 58 * 2, 96, 50, (selQuestion == 12) ? 0xFFFF33 : 0xFFCC00, alpha, false);
			if (Questions.selected[13] == 0) Draw.rect(x + 45 + 114 * 2, y + 148 + 58 * 3, 96, 50, (selQuestion == 13) ? 0xFFFF33 : 0xFFCC00, alpha, false);
			if (Questions.selected[14] == 0) Draw.rect(x + 45 + 114 * 2, y + 148 + 58 * 4, 96, 50, (selQuestion == 14) ? 0xFFFF33 : 0xFFCC00, alpha, false);
			
			
			// Column 4
			if (Questions.selected[15] == 0) Draw.rect(x + 45 + 114 * 3, y + 148, 96, 50, (selQuestion == 15) ? 0xFF9933 : 0xFF6600, alpha, false);
			if (Questions.selected[16] == 0) Draw.rect(x + 45 + 114 * 3, y + 148 + 58, 96, 50, (selQuestion == 16) ? 0xFF9933 : 0xFF6600, alpha, false);
			if (Questions.selected[17] == 0) Draw.rect(x + 45 + 114 * 3, y + 148 + 58 * 2, 96, 50, (selQuestion == 17) ? 0xFF9933 : 0xFF6600, alpha, false);
			if (Questions.selected[18] == 0) Draw.rect(x + 45 + 114 * 3, y + 148 + 58 * 3, 96, 50, (selQuestion == 18) ? 0xFF9933 : 0xFF6600, alpha, false);
			if (Questions.selected[19] == 0) Draw.rect(x + 45 + 114 * 3, y + 148 + 58 * 4, 96, 50, (selQuestion == 19) ? 0xFF9933 : 0xFF6600, alpha, false);
			
			
			// Column 5
			if (Questions.selected[20] == 0) Draw.rect(x + 45 + 114 * 4, y + 148, 96, 50, (selQuestion == 20) ? 0xFF3399 : 0xFF0066, alpha, false);
			if (Questions.selected[21] == 0) Draw.rect(x + 45 + 114 * 4, y + 148 + 58, 96, 50, (selQuestion == 21) ? 0xFF3399 : 0xFF0066, alpha, false);
			if (Questions.selected[22] == 0) Draw.rect(x + 45 + 114 * 4, y + 148 + 58 * 2, 96, 50, (selQuestion == 22) ? 0xFF3399 : 0xFF0066, alpha, false);
			if (Questions.selected[23] == 0) Draw.rect(x + 45 + 114 * 4, y + 148 + 58 * 3, 96, 50, (selQuestion == 23) ? 0xFF3399 : 0xFF0066, alpha, false);
			if (Questions.selected[24] == 0) Draw.rect(x + 45 + 114 * 4, y + 148 + 58 * 4, 96, 50, (selQuestion == 24) ? 0xFF3399 : 0xFF0066, alpha, false);
		}
		
		public function fadeIn():void
		{
			// Fade in the box
			var alphaTween:VarTween = new VarTween();
			alphaTween.tween(this, "alpha", 1, 0.6, Ease.backOut);
			addTween(alphaTween, true);
			
			// Slide the box up
			var yTween:VarTween = new VarTween();
			yTween.tween(this, "y", 0, 0.7, Ease.backOut);
			addTween(yTween, true);
		}
		
		public function fadeOut():void
		{
			if (Questions.selected[selQuestion] == 0)
			{
				// Fade out the box
				var alphaTween:VarTween = new VarTween();
				alphaTween.tween(this, "alpha", 0, 0.6, Ease.backIn);
				addTween(alphaTween, true);
				
				// Slide the box down
				var yTween:VarTween = new VarTween();
				yTween.tween(this, "y", yOffset, 0.7, Ease.backIn);
				yTween.complete = destroy;
				addTween(yTween, true);
			}
			else
				choosing = true;
		}
		
		public function destroy():void
		{
			// TODO: Add question selection
			FP.world.add(new QuestionDisplayer(selQuestion));
			Questions.selected[selQuestion] = 1;
			FP.world.remove(this);
		}
		
		// Checks to see if the mouse is within a certain area of the screen
		private function mouseOver(X:int, Y:int, width:int, height:int):Boolean
		{
			return ((Input.mouseX >= X) && (Input.mouseX <= X + width) && (Input.mouseY >= Y) && (Input.mouseY <= Y + height));
		}
	}
}