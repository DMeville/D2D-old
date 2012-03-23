package D2D.Input{
	import D2D.D2DCore;
	
	import flash.events.TouchEvent;
	import flash.geom.Point;

	public class D2DTouch extends Point{
	
		private var _current:int;
		private var _last:int
		
		public function D2DTouch(){
			super(0,0);
			
			_current = 0;
			_last = 0;
		}
		
		public function handleTouchEnd(event:TouchEvent):void{
			trace("END");
			if(_current > 0) _current = -1;
			else _current = 0;
		}
		
		public function hanleTouchBegin(event:TouchEvent):void{
			trace("BEGIN");
			if(_current > 0) _current = 1;
			else _current = 2;
		}
		
		public function update():void{
			if((_last == -1) && (_current == -1))
				_current = 0;
			else if((_last == 2) && (_current == 2))
				_current = 1;
			_last = _current;
			
			if(pressed()){
				x = D2DCore.stage.mouseX + (D2DCore.camera.node.transform.x - D2DCore.sw/2);
				y = D2DCore.stage.mouseY + (D2DCore.camera.node.transform.y - D2DCore.sh/2);
			}
			
		}
		
		public function reset():void
		{
			_current = 0;
			_last = 0;
		}
		
		
		public function pressed():Boolean { return _current > 0; }
		
		public function justPressed():Boolean { return _current == 2;}
		
		public function justReleased():Boolean { return _current == -1;}
		
		
	}
}