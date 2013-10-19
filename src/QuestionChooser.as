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
		
		public function QuestionChooser() 
		{
			layer = -100;
			y = yOffset;
		}
		
		override public function added():void
		{
			fadeIn();
		}
		
		override public function update():void
		{
			if (Input.mousePressed)
			{
				fadeOut();
			}
		}
		
		override public function render():void
		{
			Draw.rectPlus(x + paddingx, y + paddingy, FP.width - paddingx * 2, FP.height - paddingy * 2, 0xEEEEEE, alpha, true);
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
			// Fade out the box
			var alphaTween:VarTween = new VarTween();
			alphaTween.tween(this, "alpha", 0, 0.6, Ease.backOut);
			addTween(alphaTween, true);
			
			// Slide the box down
			var yTween:VarTween = new VarTween();
			yTween.tween(this, "y", yOffset, 0.7, Ease.backOut);
			yTween.complete = destroy;
			addTween(yTween, true);
		}
		
		public function destroy():void
		{
			FP.world.remove(this);
			// TODO: Add question selection
			FP.world.add(new QuestionDisplayer(2));
		}
	}
}