package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.hires.debug.Stats;
	
	import starling.core.Starling;
	[SWF(width=640,height=960,frameRate=60,backgroundColor=0x000000)]
	public class RolfNapeTest extends Sprite
	{
		public function RolfNapeTest()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			addChild(new Stats());
			var sl:Starling = new Starling(Game, stage);
			sl.antiAliasing = 2;
			sl.start();
			
		}
	}
}