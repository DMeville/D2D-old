package D2D.Components{
	import D2D.D2DCore;
	import D2D.Input.D2DInput;
	
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.core.G2DNode;
	
	import flash.geom.Point;
	
	public class D2DSwipeMovement extends G2DComponent{
		
		private var velocity:Point = new Point(0,0);
	
		public function D2DSwipeMovement(p_node:G2DNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			
			if(D2DInput.Mouse.start.x != 0 && D2DInput.Mouse.start.y != 0 && D2DInput.Mouse.end.x != 0 && D2DInput.Mouse.end.y != 0){
				D2DCore.g_camera.SetTarget(this.node);
				this.velocity.x = (D2DInput.Mouse.start.x - D2DInput.Mouse.end.x)/5
				this.velocity.y = (D2DInput.Mouse.start.y - D2DInput.Mouse.end.y)/5
				
				D2DInput.Mouse.reset();
			}
			
			
			velocity.x *= 0.9;
			velocity.y *= 0.9;
			
			this.node.transform.x += velocity.x;
			this.node.transform.y += velocity.y;
		}
	}
}