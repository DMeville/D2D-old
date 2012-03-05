package D2D.Components{
	import com.flashcore.g2d.components.renderables.G2DSprite;
	import com.flashcore.g2d.core.G2DNode;
	
	import flash.geom.Point;
	
	public class D2DSprite extends G2DSprite{
		
		public function scrollFactor:Point = new Point(1,1);
	
		public function D2DSprite(p_node:G2DNode)
		{
			super(p_node);
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			
		}
	}
}