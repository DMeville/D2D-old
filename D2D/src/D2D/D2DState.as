package D2D{
	import D2D.Assets.D2DAssets;
	
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;
	
	public class D2DState extends GNode{
				
		private var s:GSprite;
		
		public function D2DState(p_id:String=""){
			super(p_id);
			create();
		}
		
		public function create():void{
			//trace("-- State Created --");
		}
		
		public function update(deltaTime:Number):void{
		
		}
		
		override public function dispose():void{
			super.dispose();
			//trace("-- State Destroyed --");
		}
	}
}