package D2D.Nodes{
	import com.flashcore.g2d.core.G2DNode;
	
	public class D2DWindow extends G2DNode{
		public static var count:int = 0;
		
		private var dialog:D2DDialog
		private var button:D2DButton;
		private var clickedCallback:Function
		
		/** D2DWindow acts as a quick way to prompt the user with a notification box with a close button.
		 * Later this will be extended to work with multiple buttons etc or something
		 * 
		 * @param _x
		 * @param _y
		 * @param title
		 * @param content
		 * @param buttonText
		 * @param buttonCallback
		 * 
		 */		
		public function D2DWindow(_x:Number, _y:Number, title:String, content:String, buttonText:String, buttonCallback:Function) {
			count++
			super("D2DWindow_"+count);
			
			this.transform.x = _x;
			this.transform.y = _y;
			
			dialog = new D2DDialog(0,0,title, content);
			this.addChild(dialog);
			
			
			clickedCallback = buttonCallback
			button = new D2DButton(0,200, buttonText, clickedCallback)
			this.addChild(button);
			trace("BUTTON POS:"+ button.transform.x, button.transform.x + this.transform.x);
					
		}
	}
}