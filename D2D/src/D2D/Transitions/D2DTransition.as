package D2D.Transitions{
	import D2D.Components.D2DUpdate;
	
	import com.genome2d.core.GNode;

	
	public class D2DTransition extends GNode{
		
		public const TRANSITION_IN:int = 1;
		public const TRANSITION_OUT:int = 2;
		public var transition:int = 0;
		
		private var duration:Number = 0;
		private var elapsed:Number = 0;
		private var callback:Function
		
		public var TransitionDuration:Number = 1
	
		public function D2DTransition(p_id:String="")
		{
			super(p_id);
			create()
		}
		
		public function create():void{
			// To be overridden;
		}
		
		public function update(deltaTime:Number):void{
			if(duration > 0){ 
				duration -= deltaTime*0.001;
			} else {
				if(callback != null) callback();
			}
		}
		
		
		public function FadeOut(_callback:Function = null):void{
			transition = TRANSITION_OUT
			duration = TransitionDuration
			callback = _callback;
		}
		
		public function FadeIn(_callback:Function = null):void{
			transition = TRANSITION_IN
			duration = TransitionDuration
			callback = _callback;
		}
	}
}