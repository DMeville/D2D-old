package D2D.Nodes{
	import D2D.Components.D2DUpdate;
	
	import com.flashcore.g2d.core.G2DNode;
	
	public class D2DNode extends G2DNode{
		public static var count:int = 0;
		private var updater:D2DUpdate
	
		public function D2DNode(){
			super("node_"+count);
			updater = this.addComponent(D2DUpdate) as D2DUpdate
			updater.SetFunction(update);
		}
		
		public function update():void{
			
		}
		
	
	}
}