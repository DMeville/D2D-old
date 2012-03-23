package D2D.Transitions{
	import D2D.Utils.D2DUtils;

	public class D2DFadeTransitionBlack extends D2DFadeTransition{
	
		public function D2DFadeTransitionBlack(p_id:String=""){
			super(p_id);
			D2DUtils.SetColor(this.graphic.node, 0x000000);
		}
	}
}