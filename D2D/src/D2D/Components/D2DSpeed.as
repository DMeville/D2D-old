package D2D.Components {
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	import flash.geom.Point;
	
	public class D2DSpeed extends GComponent{
		
		private var Move:Boolean = true;
		
		public var velocity:Point = new Point(0,0);
		public var acceleration:Point = new Point(0,0);
	
		public function D2DSpeed(p_node:GNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			
			if(Move){
				velocity.x += acceleration.x*(p_deltaTime/1000)
				velocity.y += acceleration.y*(p_deltaTime/1000)
				
				this.node.transform.x += velocity.x;
				this.node.transform.y += velocity.y;
			}
		}
		
		public function reset():void{
			this.velocity.x = 0;
			this.velocity.y = 0;
			Move = false;
		
		}
		
		public function resume():void{
			Move = true;
		}
	}
}