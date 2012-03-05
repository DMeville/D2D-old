package D2D.Components{
	import D2D.Assets.D2DAssets;
	import D2D.Input.D2DInput;
	
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.components.renderables.G2DNativeObject;
	import com.flashcore.g2d.components.renderables.G2DNativeText;
	import com.flashcore.g2d.components.renderables.G2DSprite;
	import com.flashcore.g2d.core.G2DNode;
	import com.flashcore.g2d.textures.G2DTexture;
	
	import flash.text.TextFormat;
	
	public class D2DButton extends G2DComponent{
		
		
		private var clickedCallback:Function
		private var lowerNode:G2DNode;
		private var upperNode:G2DNode;
		private var graphics:G2DSprite;
		private var textfield:G2DNativeText
		
	
		public function D2DButton(p_node:G2DNode)
		{
			super(p_node);
			lowerNode = new G2DNode("lower_"+p_node.id);
			upperNode = new G2DNode("upper_"+p_node.id);
			
			this.node.addChild(lowerNode);
			this.node.addChild(upperNode);
		}
		/**
		 *  
		 * @param _x 				The x position of the button
		 * @param _y				The y position of the button
		 * @param _width			The height of the button label
		 * @param _height			The width of the button label
		 * @param _fontSize			The fontsize
		 * @param _label			The text to appear on the label
		 * @param _clickedCallback	The function to be called when the button is clicked
		 * @param _graphicScale		Whether or not the button graphic should scale to match the label's width
		 * @param _graphicWidth     The width of the unstretched graphic (32x32?)
		 * @param _graphic			The texture to use as a graphic
		 * 
		 */		
		public function Setup(_x:Number, _y:Number, _width:Number, _height:Number, _fontSize:int, _label:String, _clickedCallback:Function, _graphicScale:Boolean = false, _graphicWidth:Number = 0, _graphic:G2DTexture = null):void{
			this.node.transform.x = _x;
			this.node.transform.y = _y;
			
			clickedCallback = _clickedCallback;
			
			if(_graphic != null){
				graphics = lowerNode.addComponent(G2DSprite) as G2DSprite;
				graphics.setTexture(_graphic);
				if(_graphicScale){
					graphics.node.transform.scaleX = Math.abs(((_graphicWidth) - (_width))/_graphicWidth)*2 
				}
				
			}
			
			
			
			textfield = upperNode.addComponent(G2DNativeText) as G2DNativeText;
			textfield.textFormat = new TextFormat(D2DAssets.defaultFont, _fontSize, 0x000000, true, null,null,null,null,"center", null, null, null, null);
			textfield.height = _height;
			textfield.width = _width;
			textfield.text = _label;
			textfield.transparent = true
			
			
			
			
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			if(textfield.hitTestPoint(D2DInput.Mouse3D) || (graphics != null && graphics.hitTestPoint(D2DInput.Mouse3D))){
				if(graphics != null){
					graphics.node.transform.alpha = 0.5
				}
				textfield.node.transform.alpha = 0.5;
				if(D2DInput.Mouse.justPressed()){
					D2DInput.Mouse.reset();
					if(clickedCallback != null){
						clickedCallback();
					}
				}
			} else {
				textfield.node.transform.alpha = 1;
				graphics.node.transform.alpha = 1;
				
			}
		}
		override public function dispose():void{
			super.dispose();
			lowerNode.dispose();
			upperNode.dispose();
		}
	}
}