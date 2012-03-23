package D2D.Transitions{
	import D2D.Assets.D2DAssets;
	import D2D.D2DCore;
	import D2D.Utils.D2DUtils;
	
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;

	public class D2DSlamTransition extends D2DTransition{
	
		private var leftGraphic:GSprite;
		private var rightGraphic:GSprite;
		
		public function D2DSlamTransition(p_id:String="") {
			super(p_id);
			this.TransitionDuration = 1.4
			
			var ln:GNode = new GNode(p_id+"l_slam");
			var rn:GNode = new GNode(p_id+"r_slam");
			
			leftGraphic = ln.addComponent(GSprite) as GSprite;
			rightGraphic = rn.addComponent(GSprite) as GSprite
			
			leftGraphic.setTexture(D2DAssets.WhiteTexture);
			rightGraphic.setTexture(D2DAssets.WhiteTexture);
			
			leftGraphic.node.transform.scaleX = (D2DCore.sw/2)/leftGraphic.getTexture().width
			rightGraphic.node.transform.scaleX = (D2DCore.sw/2)/rightGraphic.getTexture().width
			leftGraphic.node.transform.scaleY = (D2DCore.sh)/leftGraphic.getTexture().height
			rightGraphic.node.transform.scaleY = (D2DCore.sh)/rightGraphic.getTexture().height
			
			leftGraphic.node.transform.x -= (D2DCore.sw/2 + D2DCore.sw/4);
			rightGraphic.node.transform.x += (D2DCore.sw/2 +D2DCore.sw/4);				
			
			addChild(leftGraphic.node);
			addChild(rightGraphic.node);	
		}
		
		override public function update(deltaTime:Number):void{
			super.update(deltaTime);
			if(this.transition == this.TRANSITION_OUT){
				leftGraphic.node.transform.x +=	(deltaTime*0.001)*((D2DCore.sw/2)/(this.TransitionDuration-1))
				if(leftGraphic.node.transform.x > -D2DCore.sw/4){
					leftGraphic.node.transform.x = -D2DCore.sw/4
				}
				rightGraphic.node.transform.x -= (deltaTime*0.001)*((D2DCore.sw/2)/(this.TransitionDuration-1))
				if(rightGraphic.node.transform.x < D2DCore.sw/4){
					rightGraphic.node.transform.x = D2DCore.sw/4
				}
				
				
			} else if(this.transition == this.TRANSITION_IN){
				leftGraphic.node.transform.x -=	(deltaTime*0.001)*((D2DCore.sw/2)/(this.TransitionDuration-1))
				if(leftGraphic.node.transform.x < -(D2DCore.sw/2 + D2DCore.sw/4)){
					leftGraphic.node.transform.x = -(D2DCore.sw/2 + D2DCore.sw/4)
				}
					
				rightGraphic.node.transform.x +=(deltaTime*0.001)*((D2DCore.sw/2)/(this.TransitionDuration-1))
				if(rightGraphic.node.transform.x > (D2DCore.sw/2 + D2DCore.sw/4)){
					rightGraphic.node.transform.x = (D2DCore.sw/2 + D2DCore.sw/4)
				}
			}
			
		}
		
	}
}