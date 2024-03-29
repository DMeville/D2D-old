package D2D.Components{
	import D2D.D2DCore;
	
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;
	
	import flash.geom.Rectangle;
	
	public class D2DStayInBounds extends GComponent{
	
		public function D2DStayInBounds(p_node:GNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			var _worldBounds:Rectangle = D2DCore.camera._worldBounds;
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
	}
}