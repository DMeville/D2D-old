package D2D{
	import D2D.Input.D2DInput;
	
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.components.renderables.G2DSprite;
	import com.flashcore.g2d.core.G2DNode;
	import com.flashcore.g2d.textures.G2DTexture;
	
	import flash.display.BitmapData;
	
	public class D2DFade extends G2DComponent{
		
		public static const FADE_IN:int = 0;
		public static const FADE_OUT:int = 1
		
		private var texture:G2DTexture;
		private var _fade:G2DSprite;
		public static var __fades:int = 0
		private var _fadeTime:Number = 1
		private var _fadeType:int = 0;
		private var _fading:Boolean = false;
		private var callback:Function
	
		public function D2DFade(p_node:G2DNode)
		{
			super(p_node);
			__fades++
			_fade = this.node.addComponent(G2DSprite) as G2DSprite;
			_fade.setTexture(G2DTexture.createFromBitmapData("_fade"+String(__fades), new BitmapData(D2DCore.sw, D2DCore.sh, false, 0xFFFFFF)));
			_fade.node.transform.x = 0;
			_fade.node.transform.y = 0
			SetColor("BLACK");
		}
		
		public function SetColor(color:String = "WHITE"):void{
			switch(color){
				case "WHITE":
					_fade.node.transform.red = 1
					_fade.node.transform.green = 1
					_fade.node.transform.blue = 1
					break;
				case "BLACK":
					_fade.node.transform.red = 0
					_fade.node.transform.green = 0
					_fade.node.transform.blue = 0
					break;
				case "RED":
					_fade.node.transform.red = 1
					_fade.node.transform.green = 0
					_fade.node.transform.blue = 0
					break;
				case "GREEN":
					_fade.node.transform.red = 0
					_fade.node.transform.green = 1
					_fade.node.transform.blue = 0
					break;
				case "BLUE":
					_fade.node.transform.red = 0
					_fade.node.transform.green = 0
					_fade.node.transform.blue = 1
					break;
					
			}
		}
		
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			super.update(p_deltaTime, p_parentTransformUpdate, p_parentColorUpdate);
			if(_fading){
				if(_fadeType == D2DFade.FADE_OUT){
					DisableButtons();
					_fade.node.transform.alpha += _fadeTime
					if(_fade.node.transform.alpha >=1){
						_fade.node.transform.alpha = 1;
						_fading = false;
						if(callback != null) callback();
					}
				} else if(_fadeType == D2DFade.FADE_IN){
					DisableButtons();
					_fade.node.transform.alpha -= _fadeTime
					if(_fade.node.transform.alpha <=0){
						_fade.node.transform.alpha = 0;
						_fading = false;
						if(callback != null) callback();
					}
				}
			}
			
			
		}
		
		private function DisableButtons():void{
			D2DInput.Mouse.reset();
			D2DInput.Touch.reset();
		}		
		
		public function FadeIn(fadeTime:Number, completeCallback:Function = null):void{
			callback = completeCallback;
			_fading = true;
			_fadeTime = fadeTime/60
			_fadeType = D2DFade.FADE_IN
			_fade.node.transform.alpha = 1
			
		}
		
		public function FadeOut(fadeTime:Number, completeCallback:Function = null):void{
			callback = completeCallback;
			_fading = true;
			_fadeTime = fadeTime/60
			_fadeType = D2DFade.FADE_OUT
			_fade.node.transform.alpha = 0
		}
		
		
	}
}