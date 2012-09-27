package
{
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
		private var count:int;
		public function Game()
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init(e:Event):void
		{
			space = new Space(new Vec2(0,3000));
			
			var walls:Body = new Body(BodyType.STATIC);
			
			var wall_left:Polygon = new Polygon(Polygon.rect(-20,0,20,stage.stageHeight));
			var wall_right:Polygon = new Polygon(Polygon.rect(stage.stageWidth,0,20,stage.stageHeight));
			var floor:Polygon = new Polygon(Polygon.rect(0,stage.stageHeight,stage.stageWidth,20));
			
			walls.shapes.add(wall_left);
			walls.shapes.add(wall_right);
			walls.shapes.add(floor);
			
			walls.space = space;
			count = 0;
			addEventListener(Event.ENTER_FRAME, loop);
		}
		private function loop(e:Event):void
		{
			if ( Math.random()<0.03 && count < 50)
			{
				count++;
				addChar();
			}
			space.step(1/60);
		}
		
		private function addChar():void
		{
			
			var body:Body = new Body(BodyType.DYNAMIC,new Vec2(Math.random()*stage.stageWidth,-200));
			body.shapes.add(new Polygon(Polygon.box(50,100),new Material(20)));
			body.graphic = new Char(body);
			body.graphicUpdate = graphicUpdate;
			body.space = space;
			addChild(body.graphic);
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