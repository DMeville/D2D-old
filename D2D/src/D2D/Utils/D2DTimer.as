package D2D.Utils{
	public class D2DTimer{
	
		private var duration:Number;
		private var timeLeft:Number
		private var loops:int = 0;
		private var callback:Function;
		private var triggered:Boolean;
		public var done:Boolean
		
		public function D2DTimer() {
			D2DTimerManager.add(this);
		}
		
		public function start(_duration:Number, _callback:Function, _loops:int = 0):void{
			duration = _duration;
			timeLeft = duration;
			callback = _callback;
			loops = _loops 
			triggered = false;
			done = false;
			
		}
		
		public function update(deltaTime:Number):void{
			timeLeft -= deltaTime*0.001
			if(timeLeft <=0){
				if(loops == -1){
					if(callback != null) callback();
					timeLeft += duration;
				} else if(loops <= 1){
					if(!triggered){
						if(callback != null) callback();
						triggered = true;
						destroy();
					}
				} else {
					if(callback != null) callback();
					loops --;
					timeLeft += duration;
				}
			}
		}
		
		private function destroy():void{
			done = true;
		}
	}
}