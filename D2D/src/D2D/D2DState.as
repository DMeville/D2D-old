package D2D{
	import com.flashcore.g2d.core.G2DNode;
	import com.flashcore.g2d.core.Genome2D;
	
	public class D2DState extends G2DNode{
		
		private var G2Di:Genome2D;
		
		
		public function D2DState(p_id:String=""){
			super(p_id);
			create();
			
		}
		
		public function create():void{
			G2Di = Genome2D.getInstance()
			G2Di.onUpdated.add(update);
		}
		
		public function update(_dt:Number):void{
			
		}
		
		override public function dispose():void{
			G2Di.onUpdated.remove(update);
			super.dispose();
		
		}
		
	}
}