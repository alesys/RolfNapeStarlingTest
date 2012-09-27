package
{
	import nape.geom.Vec2;
	import nape.phys.Body;
	
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Char extends Sprite
	{
		private var body:Body;
		public function Char(body:Body)
		{
			super();
			this.body = body;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			addChild(new MovieClip(Assets.getTexture((Math.random()>0.5)?Assets.SPRITE_FLAVIA:Assets.SPRITE_MARIANA)));
			pivotX = width>>1;
			pivotY = height>>1;
			
			addEventListener(TouchEvent.TOUCH, handle_touch);
		}
		private function handle_touch(te:TouchEvent):void
		{
			if ( te.getTouch(this,TouchPhase.BEGAN))
			{
				body.velocity = new Vec2(Math.random()*1000-500,-2000);
			}
		}
	}
}