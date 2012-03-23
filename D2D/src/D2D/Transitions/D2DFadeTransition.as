package D2D.Transitions{
	import D2D.Assets.D2DAssets;
	import D2D.D2DCore;
	
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;

	public class D2DFadeTransition extends D2DTransition{
	
		public var graphic:GSprite;
		
		public function D2DFadeTransition(p_id:String="") {
			super(p_id);
			
			this.TransitionDuration = 2;
			var gnode:GNode = new GNode(p_id+"graphicNode");
			graphic = gnode.addComponent(GSprite) as GSprite;
			graphic.setTexture(D2DAssets.WhiteTexture);
			graphic.node.transform.scaleX = D2DCore.sw/graphic.getTexture().width;
			graphic.node.transform.scaleY = D2DCore.sh/graphic.getTexture().height;
			graphic.node.transform.alpha = 0;
			addChild(graphic.node);
		}
		
		override public function update(deltaTime:Number):void{
			super.update(deltaTime);
			if(this.transition == this.TRANSITION_IN){
				graphic.node.transform.alpha -= (deltaTime*0.001)/this.TransitionDuration
			} else if(this.transition == this.TRANSITION_OUT){
				graphic.node.transform.alpha +=	(deltaTime*0.001)/this.TransitionDuration
			}
		}
		
		override public function FadeIn(_callback:Function=null):void{
			super.FadeIn(_callback);
			graphic.node.transform.alpha = 1;
		}
		override public function FadeOut(_callback:Function=null):void{
			super.FadeOut(_callback);
			graphic.node.transform.alpha = 0;
		}
		
	}
}