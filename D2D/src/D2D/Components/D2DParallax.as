package D2D.Components{
	import D2D.D2DCore;
	
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	import flash.geom.Point;
	
	public class D2DParallax extends GComponent{
		
		private var parallaxFactor:Point = new Point(1.0,1.0);
		private var _realPoint:Point 
	
		public function D2DParallax(p_node:GNode)
		{
			super(p_node);
			
		}
		
		public function SetRealPosition():void{
			_realPoint = new Point(0,0);
			_realPoint.x = this.node.transform.x;
			_realPoint.y = this.node.transform.y;
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			//trace(_realPoint);
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			this.node.transform.x = _realPoint.x + (D2DCore.camera.node.transform.x - D2DCore.sw/2)*parallaxFactor.x;
			this.node.transform.y = _realPoint.y + (D2DCore.camera.node.transform.y - D2DCore.sh/2)*parallaxFactor.y;
						
		}
		public function SetParallaxFactor(x:Number, y:Number):void{
			if(!_realPoint){
				SetRealPosition();
			}
			this.parallaxFactor.x = x;
			this.parallaxFactor.y = y;
		}
	}
}