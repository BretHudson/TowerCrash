package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	
	public class QuestionDisplayer extends Entity
	{
		// A variable to hold the alpha value
		public var alpha:Number = 0;
		
		public var yOffset:Number = 120;
		
		// What the current question is
		// Set to -1 if there is no question
		private var curQuestion:int = -1;
		
		// Which answer is correct
		// Set to -1 if not active
		private var curAnswer:int = -1;
		
		// Which answer is currently selected with the mouse cursor
		private var selAnswer:int = -1;
		
		// Variables to hold the text for the questions/answers
		private var question:Text = new Text("", 0, 0);
		private var answer1:Text = new Text("", 0, 0);
		private var answer2:Text = new Text("", 0, 0);
		private var answer3:Text = new Text("", 0, 0);
		private var answer4:Text = new Text("", 0, 0);
		
		// The amount of pixels on each side of the question box
		private var paddingx:int = 30;
		private var paddingy:int = 30;
		
		public function QuestionDisplayer() 
		{
			layer = -100;
			
			// Set the object's graphic to the question/answers text
			graphic = new Graphiclist(question, answer1, answer2, answer3, answer4);
			
			// Set the x/y coordinates for each Text object
			question.x = 50;
			question.y = 50;
			
			answer1.x = FP.width / 2;
			answer1.y = y + FP.height / 2 + 20;
			
			answer2.x = FP.width / 2;
			answer2.y = y + FP.height / 2 + 70;
			
			answer3.x = FP.width / 2;
			answer3.y = y + FP.height / 2 + 120;
			
			answer4.x = FP.width / 2;
			answer4.y = y + FP.height / 2 + 170;
			
			// Set up word wrap on the question text
			question.wordWrap = true;
			question.width = FP.width - paddingx * 2 - 50;			
			
			// Set the color of the question/answers text
			question.color = 0x202020;
			answer1.color = answer2.color = answer3.color = answer4.color = 0xEEEEEE;
			
			// Set the size of each Text object
			question.size = 28;
			answer1.size = answer2.size = answer3.size = answer4.size = 24;
			
			// Set the font for each Text object
			//question.font = 'Savatism';
		}
		
		override public function update():void
		{
			question.alpha = answer1.alpha = answer2.alpha = answer3.alpha = answer4.alpha = alpha;
			answer1.centerOO();
			answer2.centerOO();
			answer3.centerOO();
			answer4.centerOO();
			
			if (mouseOver(x + paddingx + 20, y + FP.height / 2, FP.width - paddingx * 2 - 40, 40))
				selAnswer = 0;
			else if (mouseOver(x + paddingx + 20, y + FP.height / 2 + 50, FP.width - paddingx * 2 - 40, 40))
				selAnswer = 1;
			else if (mouseOver(x + paddingx + 20, y + FP.height / 2 + 100, FP.width - paddingx * 2 - 40, 40))
				selAnswer = 2;
			else if (mouseOver(x + paddingx + 20, y + FP.height / 2 + 150, FP.width - paddingx * 2 - 40, 40))
				selAnswer = 3;
			else
				selAnswer = -1;
			
			if ((selAnswer > -1) && (Input.mousePressed))
				checkAnswer();
		}
		
		override public function render():void
		{
			// Draw the box
			Draw.rectPlus(x + paddingx, y + paddingy, FP.width - paddingx * 2, FP.height - paddingy * 2, 0xEEEEEE, alpha, true);
			
			// Display the answers and highlight if selected
			if (selAnswer != 0)
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2, FP.width - paddingx * 2 - 40, 40, 0x000000, alpha);
			else
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2, FP.width - paddingx * 2 - 40, 40, 0x7070EE, alpha);
			
			if (selAnswer != 1)
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2 + 50, FP.width - paddingx * 2 - 40, 40, 0x000000, alpha);
			else
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2 + 50, FP.width - paddingx * 2 - 40, 40, 0xBBBB60, alpha);
			
			if (selAnswer != 2)
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2 + 100, FP.width - paddingx * 2 - 40, 40, 0x000000, alpha);
			else
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2 + 100, FP.width - paddingx * 2 - 40, 40, 0xCC7070, alpha);
			
			if (selAnswer != 3)
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2 + 150, FP.width - paddingx * 2 - 40, 40, 0x000000, alpha);
			else
				Draw.rectPlus(x + paddingx + 20, y + FP.height / 2 + 150, FP.width - paddingx * 2 - 40, 40, 0x70AA70, alpha);
			
			// Draw the text
			super.render();
		}
		
		public function generateQuestion():void
		{
			// Reset y (for the cool slide effect)
			y = yOffset;
			
			// Select which question it is
			curQuestion = 0;
			
			// Grab the text variables from the Questions class
			question.text = Questions.questions[curQuestion];
			answer1.text = Questions.answers[curQuestion * 4 + 0];
			answer2.text = Questions.answers[curQuestion * 4 + 1];
			answer3.text = Questions.answers[curQuestion * 4 + 2];
			answer4.text = Questions.answers[curQuestion * 4 + 3];
			
			// Fade in the box
			var alphaTween:VarTween = new VarTween();
			alphaTween.tween(this, "alpha", 1, 0.6, Ease.backOut);
			addTween(alphaTween, true);
			
			// Slide the box up
			var yTween:VarTween = new VarTween();
			yTween.tween(this, "y", 0, 0.7, Ease.backOut);
			addTween(yTween, true);
		}
		
		public function checkAnswer():void
		{
			var alphaTween:VarTween = new VarTween();
			alphaTween.tween(this, "alpha", 0, 0.6, Ease.backIn);
			addTween(alphaTween, true);
			
			// Slide the box up
			var yTween:VarTween = new VarTween();
			yTween.tween(this, "y", yOffset, 0.7, Ease.backIn);
			addTween(yTween, true);
		}
		
		// Checks to see if the mouse is within a certain area of the screen
		private function mouseOver(X:int, Y:int, width:int, height:int):Boolean
		{
			return ((Input.mouseX >= X) && (Input.mouseX <= X + width) && (Input.mouseY >= Y) && (Input.mouseY <= Y + height));
		}
	}
}