package D2D.Components{
	import com.genome2d.components.renderables.GMovieClip;
	import com.genome2d.core.GNode;
	
	public class D2DMovieClip extends GMovieClip{
	
		private var State:String = "STOPPED"
		public var frames:Vector.<String>;
		public var currentFrame:int = 0;
		private var elapsed:Number = 0;
		private var frameRate:Number;
		private var autoDestroy:Boolean = false;
		
		public var width:Number;
		public var height:Number;
		
		public function D2DMovieClip(p_node:GNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			if(State == "PLAY"){
				elapsed += p_deltaTime;
				if(elapsed >= 1/30){
					NextFrame();
					elapsed -= 1/30
				}
			}
		}
		
		private function NextFrame():void{
			currentFrame++
			if(currentFrame >= frames.length){
				if(this.repeatable){
					currentFrame = 0;
				} else {
					currentFrame = frames.length -1
				}
				if(autoDestroy){
					Destroy();
				}
			}
		}
		
		public function setSize(width:Number, height:Number):void{
			this.width = width;
			this.height = height;
		}
		
		override public function setFrameRate(p_frameRate:int):void{
			super.setFrameRate(p_frameRate);	
			frameRate = p_frameRate;
		}
		override public function setFrames(p_atlasIds:Vector.<String>):void{
			super.setFrames(p_atlasIds);
			frames = p_atlasIds
			State = "PLAY"
		}
		
		override public function stop():void{
			super.play();
			State = "STOPPED"
		}
		override public function play():void{
			super.play();
			State = "PLAY";
		}
		
		override public function gotoFrame(p_frame:int):void{
			super.gotoFrame(p_frame);
			currentFrame = p_frame;
		}
		
		public function AutoDestroy():void{
			autoDestroy = true;
		}
		public function Destroy():void{
			this.node.parent.removeChild(this.node);
			this.node.dispose();
			this.dispose()
		}
	}
}