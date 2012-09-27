package
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.phys.Material;
	import nape.shape.Polygon;
	import nape.space.Space;
	
	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		private var space:Space;
		private var pool:Pool;
		private var len:int;
		public function Game()
		{
			len = 25;
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			space = new Space(new Vec2(0,3000));
			pool = new Pool(len);	
			var walls:Body = new Body(BodyType.STATIC);
			
			var wall_left:Polygon = new Polygon(Polygon.rect(-20,0,20,stage.stageHeight));
			var wall_right:Polygon = new Polygon(Polygon.rect(stage.stageWidth,0,20,stage.stageHeight));
			var floor:Polygon = new Polygon(Polygon.rect(0,stage.stageHeight,stage.stageWidth,20));
			var roof:Polygon = new Polygon(Polygon.rect(0,-60,stage.width,20));
			
			walls.shapes.add(wall_left);
			walls.shapes.add(wall_right);
			walls.shapes.add(floor);
			walls.shapes.add(roof);
			walls.space = space;
			addEventListener(Event.ENTER_FRAME, loop);
			
			var timer:Timer = new Timer(500, len);
			timer.addEventListener(TimerEvent.TIMER, addChar);
			timer.start();
		}
		private function loop(e:Event):void
		{
			space.step(1/60);
		}
		
		private function addChar(e:TimerEvent=null):void
		{
			
			var body:Body = pool.getBody();
			var char:Char = pool.getChar();
			body.shapes.add(new Polygon(Polygon.box(50,100),new Material(20)));
			body.graphic = char;
			body.graphicUpdate = graphicUpdate;
			body.space = space;
			char.activate(body);
			addChild(char);
		}
		
		private function graphicUpdate(body:Body):void
		{
			
			var gra:DisplayObject = body.graphic as DisplayObject;
			gra.x = body.position.x;
			gra.y = body.position.y;
			gra.rotation = body.rotation;
		}
	}
}