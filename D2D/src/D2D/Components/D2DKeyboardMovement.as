package D2D.Components{
	import D2D.Input.D2DInput;
	
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.core.G2DNode;
	
	import flash.geom.Point;
	
	public class D2DKeyboardMovement extends G2DComponent{
		
		private var velocity:Point = new Point(0,0);
	
		public function D2DKeyboardMovement(p_node:G2DNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			
			if((!D2DInput.A && !D2DInput.LEFT) && (!D2DInput.D && !D2DInput.RIGHT)){
				velocity.x = 0
			} else {
				if(D2DInput.LEFT || D2DInput.A){
					velocity.x -= 0.7;
					if(velocity.x <= -20){
						velocity.x = -20
					}
				} else if(D2DInput.RIGHT ||D2DInput.D){
					velocity.x += 0.7;
					if(velocity.x >=20){
						velocity.x = 20;
					}
				}
			}
			
			if((!D2DInput.W && !D2DInput.UP) && (!D2DInput.S && !D2DInput.DOWN)){
				velocity.y = 0
			} else {
				if(D2DInput.UP || D2DInput.W){
					velocity.y -= 0.7;
					if(velocity.y <= -20){
						velocity.y = -20
					}
				} else if(D2DInput.DOWN ||D2DInput.S){
					velocity.y += 0.7;
					if(velocity.y >=20){
						velocity.y = 20;
					}
				}
			}
			
			this.node.transform.x += this.velocity.x;
			this.node.transform.y += this.velocity.y;
		}
	}
}