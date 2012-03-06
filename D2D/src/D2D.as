package{
	import D2D.D2DCore;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(frameRate ="60", width="1024", height="764")]
	public class D2D extends Sprite{
	
		private var core:D2DCore;
		public function D2D(){
			if(stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void{
			if(e) removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			core = new D2DCore(stage, Game);
			//Game is the classname of the starting state.
			//Game needs to extend D2DState.
			//Inside you can override the update function and go from there.
			//You can also call D2DCore.switchState(SomeOtherState), to switch to a different state
			
		}
	}
}