package D2D.Components{
	import D2D.D2DCore;
	import D2D.Utils.D2DUtils;
	
	import com.genome2d.components.GCamera;
	import com.genome2d.core.GNode;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class D2DCamera extends GCamera{
		
		public static const STYLE_LOCK_ON:int = 0;
		public static const STYLE_LOCK_ON_X:int = 1; //doesn't move in the y direction;
		public static const STYLE_LOCK_ON_Y:int = 2 //doesn't move in the x direction
		public static const STYLE_DELAY_FOLLOW:int = 3; //springy like following;
		public static const STYLE_DELAY_FOLLOW_X:int = 4;
		public static const STYLE_DELAY_FOLLOW_Y:int = 5;
			
		private var _target:GNode;
		private var _style:int
	
		public var _worldBounds:Rectangle;
		private var _targetPoint:Point = new Point(-1,-1);
		
		public var overlay:GNode;
		public var transitionContainer:GNode;
		
		
		public function D2DCamera(p_node:GNode) {
			super(p_node);
			overlay = new GNode("camera_overlay");
			this.node.addChild(overlay);
			transitionContainer = new GNode("transition_container");
			this.node.addChild(transitionContainer);
		}
		
		public function Follow(obj:GNode, style:int):void{
			if(obj){
				_target = obj;
				_style = style;
			} else {
				throw new Error("D2DCamera :: Can not follow null node");
			}
		}
		public function SetTarget(obj:GNode):void{
			if(obj){
				_target = obj;
			}
		}
		
		public function LookAt(_x:Number, _y:Number):void{
			//focuses the camera on a specific point instantly.
			StopFollowing();
			_style = D2DCamera.STYLE_LOCK_ON;
			this.node.transform.x = _x - this.normalizedViewWidth/2
			this.node.transform.y = _y - this.normalizedViewHeight/2
			
		}
		
		public function MoveTo(_x:Number, _y:Number):void {
			if(_style != D2DCamera.STYLE_DELAY_FOLLOW || _style != D2DCamera.STYLE_DELAY_FOLLOW_X || _style != D2DCamera.STYLE_DELAY_FOLLOW_Y){
				_style = D2DCamera.STYLE_DELAY_FOLLOW;
			}
			_targetPoint.x = _x;
			_targetPoint.y = _y
			StopFollowing();
		}
		
		public function StopFollowing():void{
			_target = null;
		}
		
		public function Shake(intensity:Number = 1, duration:Number = 1):void{
			trace("D2DCamera :: Shake | Needs to me coded");
		}
		
		public function SetStyle(style:int = 0):void{
			_style = style;
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			if(_target){
				if(withinBounds()){
					switch(_style){
						case STYLE_LOCK_ON:
							this.node.transform.x = _target.transform.x 
							this.node.transform.y = _target.transform.y 
							break;
						case STYLE_LOCK_ON_X:
							this.node.transform.x = _target.transform.x 
							break;
						case STYLE_LOCK_ON_Y:
							this.node.transform.y = _target.transform.y
							break;
						case STYLE_DELAY_FOLLOW:
							this.node.transform.x -= (this.node.transform.x - _target.transform.x)*0.1
							this.node.transform.y -= (this.node.transform.y - _target.transform.y)*0.1
							break;
						case STYLE_DELAY_FOLLOW_X:
							this.node.transform.x -= (this.node.transform.x - _target.transform.x)*0.1
							break;
						case STYLE_DELAY_FOLLOW_Y:
							this.node.transform.y -= (this.node.transform.y - _target.transform.y)*0.1
							break;
					} // end style
					CheckEdges();
				} else {
					
				}
			} else {
				if(_targetPoint.x != -1 && _targetPoint.y != -1){
					
					this.node.transform.x -= (this.node.transform.x - _targetPoint.x)*0.05
					this.node.transform.y -= (this.node.transform.y - _targetPoint.y)*0.05
				}
				CheckEdges();
			}
			this.node.transform.x = Math.round(this.node.transform.x);
			this.node.transform.y = Math.round(this.node.transform.y);
			
		}
		
		
		
		private function CheckEdges():void{
			//Needs to lock the camera to not go past bounds.
			//x-axis
			if(_worldBounds){
				if(this.node.transform.x < D2DCore.sw/2){
					this.node.transform.x = D2DCore.sw/2
				} else if(this.node.transform.x > _worldBounds.width - D2DCore.sw/2){
					this.node.transform.x = _worldBounds.width - D2DCore.sw/2
				}
				//y-axis
				if(this.node.transform.y < D2DCore.sh/2){
					this.node.transform.y = D2DCore.sh/2;
				} else if(this.node.transform.y > _worldBounds.height - D2DCore.sh/2){
					this.node.transform.y = _worldBounds.height - D2DCore.sh/2;
				}
			}
		}
		
		
		private function withinBounds():Boolean{
			if(_worldBounds){
				if(this.node.transform.x >= D2DCore.sw/2 && this.node.transform.y >=D2DCore.sh/2 && this.node.transform.x <= _worldBounds.width - D2DCore.sw/2 && this.node.transform.y <= _worldBounds.height - D2DCore.sh/2){
					return true;
				} else { 
					return false;
				}
			} else {
				//if a world bounds rect hasn't been created, the camera is "bound-less", and just follow/moves without restraint.
				return true;
			}
			
		}		
		
		
		public function Reset():void{
			StopFollowing();
			for(var i:int = 0; i< overlay.numChildren; i++){
				overlay.removeChild(overlay.getChildAt(i));
			}
		}
	} //end
}