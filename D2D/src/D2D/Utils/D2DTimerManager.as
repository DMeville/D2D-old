package D2D.Utils{
	public class D2DTimerManager{
		
		private static var timers:Vector.<D2DTimer> 
		
		public static function init():void{
			timers = new Vector.<D2DTimer>();
		}
		
		public static function add(timer:D2DTimer):void{
			timers.push(timer);
		}
		
		public static function update(deltaTime:Number):void{
			var timer:D2DTimer;
			for(var i:int = 0; i<timers.length;i++){
				timer = timers[i]
				timer.update(deltaTime);
				if(timer.done){
					timers.splice(i,1)
					timer = null
				}
			}
		}
	}
}