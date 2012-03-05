package D2D{
	import D2D.Components.D2DCamera;
	import D2D.D2DState;
	
	import com.flashcore.g2d.components.G2DCamera;
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.components.renderables.G2DSprite;
	import com.flashcore.g2d.context.stage3d.G2DStage3DContext;
	import com.flashcore.g2d.core.G2DNode;
	import com.flashcore.g2d.core.Genome2D;
	import com.flashcore.g2d.textures.G2DTexture;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import D2D.Input.D2DInput;
	import D2D.Assets.D2DAssets;

	public class D2DCore{

		//D2D created by Dylan Meville
		//http://dylanmeville.com

		//Genome2D created by pshtif
		//http://flash-core.com
	
		private const VERSION:Number = 0.1	
		public static var stage:Stage
		public static var c_g2d:Genome2D
		
		
		private var _initState:Class
		public static var _currentState:D2DState
		public static var stateCount:int = 0;
		private static var _switchStateRequested:Boolean = false
		public static var _startedStateSwitch:Boolean = false
		private static var _requestedState:Class
		private var _fade:D2DFade
		private var _fadeCount:int = 0
		
		private var _transitionType:int = 0;
		
		private var core:G2DNode
		public static var g_container:G2DNode
		public static var g_camera:D2DCamera;
		public static var transition_container:G2DNode
		public static var sw:Number;
		public static var sh:Number;
		
		
		public function D2DCore(stage:Stage, _initState:Class){
			D2DCore.stage = stage;
			
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			
			this._initState = _initState;
			
			c_g2d = Genome2D.getInstance()
			c_g2d.onInitialized.addOnce(G2DInitialized);
			c_g2d.onFailed.addOnce(G2DFailed);
			c_g2d.init(D2DCore.stage, G2DStage3DContext);
			
			D2DCore.stage.addEventListener(Event.RESIZE, resizedStage);
			
			
		}
		
		protected function resizedStage(event:Event):void{
			D2DCore.stage.removeEventListener(Event.RESIZE, resizedStage);
			trace("D2DCore :: Stage has been resized");
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			
		}
		
		private function G2DFailed():void{
			throw new Error("!-- Genome2D failed to initialize --!");
			
		}
		
		private function G2DInitialized():void{
			D2DAssets.init();
			D2DInput.init();
			core = new G2DNode("core0");
			c_g2d.root.addChild(core);
			c_g2d.onUpdated.add(CoreUpate);
			
			g_container = new G2DNode("golbalContainer0");
			core.addChild(g_container);
			transition_container = new G2DNode("transition_container0");
			core.addChild(transition_container);
			
			g_camera = G2DComponent.createWithNode(D2DCamera, "globalCamera0") as D2DCamera;
			g_camera.node.transform.x = sw/2;
			g_camera.node.transform.y = sh/2
			core.addChild(g_camera.node);
		
			create()
			
		}
		
		private function CoreUpate(_dt:Number):void{
			D2DInput.update();
			if(_switchStateRequested){
				if(!_startedStateSwitch){
					_startedStateSwitch = true;
					if(_fade == null){
						if(_transitionType == 0){ //straight black fade;
							_fade = G2DComponent.createWithNode(D2DFade, "_fade"+ String(_fadeCount)) as D2DFade;
						} else if(_transitionType == 1){ //white
							_fade = G2DComponent.createWithNode(D2DFade, "_fade"+ String(_fadeCount)) as D2DFade;
							_fade.SetColor("WHITE");
						} 
							
						_fadeCount++
					}
					_fade.FadeOut(1, _switchState)
					transition_container.addChild(_fade.node);
				}
			}
			
		}
		
		private function create():void{
			_currentState = new _initState("initState");
			g_container.addChild(_currentState);
		}	
		
		public static function switchState(_state:Class):void{
			_switchStateRequested = true;
			_startedStateSwitch = false;
			_requestedState = _state;
		}
		
		private function _switchState():void{
			trace("D2DCore :: switchState");
			g_container.removeChild(_currentState);
			_currentState.dispose();
			_currentState = new _requestedState("state"+String(stateCount));
			g_container.addChild(_currentState);
			stateCount++;
			_switchStateRequested = false
			_fade.FadeIn(1);
		}
		
		public function SetTransitionType(type:int):void{
			if(type == 0 || type == 1){
				_transitionType = type;
			}
			
		}
		
		public static function SetBackgroundColor(color:uint):void{
			var red:Number = color >> 16 & 0xFF;
			var green:Number = color >> 8 & 0xFF;
			var blue:Number = color & 0xFF;
			
			red = Math.floor((red/255)*1000)/1000
			green = Math.floor((green/255)*1000)/1000
			blue = Math.floor((blue/255)*1000)/1000
				
			g_camera.backgroundBlue = blue;
			g_camera.backgroundRed = red;
			g_camera.backgroundGreen = green;
		}
		
		public static function SetWorldBounds(rect:Rectangle):void{
			g_camera._worldBounds = rect;		
		}
	}
}