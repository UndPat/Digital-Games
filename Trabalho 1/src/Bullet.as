package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Patrick Junior De Bastiani
	 */
	public class Bullet extends FlxSprite
	{
		[Embed(source = "../assets/images/bullet 10x10.png")] private var bulletPNG: Class;
		private var T_X: int = 10;
		private var T_Y: int = 10;
		public var counter: Number = 0;
		public function Bullet(theX: int, theY:int) {
			super(theX, theY);
			loadGraphic(bulletPNG, true, false, T_X, T_Y, false);
			addAnimation("idle", [0, 1, 2, 3], 30, true);
			play("idle");
			kill();
		}
		override public function update():void {
			if (!onScreen()) {
				kill();
			}
			counter += FlxG.elapsed;
			if (counter >= 2) {
				this.kill();
				counter = 0;
			}
			if (this.x <= 0) {
				this.x = FlxG.width;
			}
			if (this.x > FlxG.width) {
				this.x = 0;
			}
			if (this.y <= 0) {
				this.y = FlxG.height;
			}
			if (this.y > FlxG.height) {
				this.y = 0;
			}
			super.update();
		}
		
	}
}