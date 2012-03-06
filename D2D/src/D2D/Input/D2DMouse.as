package D2D.Input{
	import flash.events.MouseEvent;
	import flash.geom.Point;

	public class D2DMouse extends Point{
	
		private var _current:int;
		private var _last:int
		private var _lastPressed:Boolean = false;
		public var start:Point = new Point(0,0);
		public var end:Point = new Point(0,0);
		
		//Courtesy of Flixel
		public function D2DMouse(){
			super(0,0);
			
			_current = 0;
			_last = 0;
		}
		public function update():void{
			if((_last == -1) && (_current == -1))
				_current = 0;
			else if((_last == 2) && (_current == 2))
				_current = 1;
			_last = _current;
			
			
			
			if(pressed() && !_lastPressed){
				start.x = this.x;
				start.y = this.y;
				end.x = 0;
				end.y = 0;
			} else if(!pressed() && _lastPressed){
				end.x = this.x;
				end.y = this.y;
			}
			//trace(start, end);
			_lastPressed = pressed();
			
		}
		
		public function reset():void
		{
			_current = 0;
			_last = 0;
			start.x = start.y = 0;
			end.x = end.y = 0;
		}
		
		
		public function pressed():Boolean { return _current > 0; }
	
		public function justPressed():Boolean { return _current == 2; }
	
		public function justReleased():Boolean { return _current == -1; }
		
		public function handleMouseDown(FlashEvent:MouseEvent):void
		{
			if(_current > 0) _current = 1;
			else _current = 2;
		}
		
		public function handleMouseUp(FlashEvent:MouseEvent):void
		{
			if(_current > 0) _current = -1;
			else _current = 0;
		}
					
	}
}