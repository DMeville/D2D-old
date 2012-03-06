package D2D.Components{
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.core.G2DNode;
	
	import flash.geom.Point;
	
	public class D2DVelocity extends G2DComponent{
		
		public var velocity:Point = new Point(0,0);
	
		public function D2DVelocity(p_node:G2DNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			
			this.node.transform.x += velocity.x;
			this.node.transform.y += velocity.y;
		}
		
		public function reset():void{
			this.velocity.x = 0;
			this.velocity.y = 0;
		}
	}
}