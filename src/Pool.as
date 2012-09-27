package
{
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;

	public class Pool
	{
		private var bodies:Vector.<Body>;
		private var chars:Vector.<Char>;
		public function Pool(len:int)
		{
			//new Body(BodyType.DYNAMIC,new Vec2(Math.random()*stage.stageWidth,-60));
			var i:int=len;
			bodies = new Vector.<Body>();
			chars = new Vector.<Char>();
			while ( --i>-1 )
			{
				bodies.push(new Body(BodyType.DYNAMIC,new Vec2(Math.random()*620,-60)));
				chars.push(new Char());
			}
		}
		public function getBody():Body
		{
			return bodies.pop();
		}
		public function getChar():Char
		{
			return chars.pop();
		}
	}
}