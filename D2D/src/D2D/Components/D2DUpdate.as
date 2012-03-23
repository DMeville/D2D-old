package D2D.Components{
	import com.genome2d.components.GComponent;
	import com.genome2d.core.GNode;

	
	public class D2DUpdate extends GComponent{
		
		private var func:Function
	
		public function D2DUpdate(p_node:GNode){
			super(p_node);
		}
		
		public function SetFunction(f:Function):void{
			func = f;
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			if(func != null){
				func();
			}
		}
	}
}