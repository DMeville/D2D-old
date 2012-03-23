package D2D.Nodes{
	import D2D.Assets.D2DAssets;
	import D2D.Components.D2DUpdate;
	import D2D.Input.D2DInput;
	import D2D.Utils.D2DUtils;
	
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.components.renderables.G2DNativeText;
	import com.flashcore.g2d.components.renderables.G2DSprite;
	import com.flashcore.g2d.core.G2DNode;
	
	import flash.text.TextFormat;
	
	public class D2DButton extends G2DNode{
		public static var count:int = 0;
		private var buttonCallback:Function
		
		private var graphic:G2DSprite;
		private var label:G2DNativeText;
		private var updater:D2DUpdate
		
		private var enabled:Boolean = true;
		
		
		public function D2DButton(_x:Number, _y:Number, buttonText:String, buttonCallback:Function){
			count++
			super("D2DButton_"+count);
			
			this.transform.x = _x;
			this.transform.y = _y;
			
			this.buttonCallback = buttonCallback
			
			graphic = G2DComponent.createWithNode(G2DSprite, "D2DButtonGraphic_"+count) as G2DSprite;
			graphic.setTexture(D2DAssets.DefaultGraphicsAtlas.getTexture("DefaultButton"));
			this.addChild(graphic.node);
			
			
			var tf:TextFormat = new TextFormat(D2DAssets.defaultFont, 50, 0xFFFFFF,true,null,null,null,null, "center");
			label = G2DComponent.createWithNode(G2DNativeText, "D2DButtonText_"+count) as G2DNativeText;
			
			label.transparent = true;
			label.textFormat = tf;
			label.text = buttonText;
			
			label.width = 400
			label.node.transform.y = 10;
			this.addChild(label.node);
			
			//have to do something like this because there is no G2DNode::update function to override
			updater = this.addComponent(D2DUpdate) as D2DUpdate;
			updater.SetFunction(update);
			
		}
		
		private function update():void{
			if(enabled){
				if(this.graphic.hitTestPoint(D2DInput.Mouse3D) || this.label.hitTestPoint(D2DInput.Mouse3D)||this.graphic.hitTestPoint(D2DInput.Touch3D) || this.label.hitTestPoint(D2DInput.Touch3D)){
					this.graphic.node.transform.alpha = 0.8
					if(D2DInput.Mouse.justReleased() || D2DInput.Touch.justReleased()){
						D2DInput.Mouse.reset();
						if(buttonCallback != null) buttonCallback()
						//click
					}
				} else {
					this.graphic.node.transform.alpha = 1
				}
			}
		}
	}
}