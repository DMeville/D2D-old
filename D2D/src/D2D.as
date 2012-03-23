package{
	import D2D.D2DCore;
	import D2D.Stats;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(frameRate="60", backgroundColor="#333333", width="800", height="600")]
	public class D2D extends Sprite{
	
		private var core:D2DCore;
		
		
		public function D2D() {
			if(stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		private function init(e:Event = null):void{
			if(e) removeEventListener(Event.ADDED_TO_STAGE, init);
			
			core = new D2DCore(stage, SpriteExample);
			addChild(new Stats());
		}
	}
}