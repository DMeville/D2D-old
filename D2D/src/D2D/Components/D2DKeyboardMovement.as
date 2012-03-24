package D2D.Components{
	import D2D.Input.D2DInput;
	
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	import flash.geom.Point;
	
	public class D2DKeyboardMovement extends GComponent{
		
		private var velocity:Point = new Point(0,0);
		public var speed:Number = 20;
	
		public function D2DKeyboardMovement(p_node:GNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			
			if((!D2DInput.Keys.A && !D2DInput.Keys.LEFT) && (!D2DInput.Keys.D && !D2DInput.Keys.RIGHT)){
				velocity.x = 0
			} else {
				if(D2DInput.Keys.LEFT || D2DInput.Keys.A){
					velocity.x -= 5*(p_deltaTime/1000)
					if(velocity.x <= -speed){
						velocity.x = -speed
					}
				} else if(D2DInput.Keys.RIGHT ||D2DInput.Keys.D){
					velocity.x += 5*(p_deltaTime/1000)
					if(velocity.x >=speed){
						velocity.x = speed;
					}
				}
			}
			
			if((!D2DInput.Keys.W && !D2DInput.Keys.UP) && (!D2DInput.Keys.S && !D2DInput.Keys.DOWN)){
				velocity.y = 0
			} else {
				if(D2DInput.Keys.UP || D2DInput.Keys.W){
					velocity.y -= 5*(p_deltaTime/1000)
					if(velocity.y <= -speed){
						velocity.y = -speed
					}
				} else if(D2DInput.Keys.DOWN ||D2DInput.Keys.S){
					velocity.y += 5*(p_deltaTime/1000)
					if(velocity.y >=speed){
						velocity.y = speed;
					}
				}
			}
			
			this.node.transform.x += this.velocity.x;
			this.node.transform.y += this.velocity.y;
		}
	}
}