package D2D{
	import D2D.Assets.D2DAssets;
	import D2D.Components.D2DCamera;
	import D2D.Input.D2DInput;
	import D2D.Transitions.*;
	import D2D.Utils.D2DTimerManager;
	
	import com.genome2d.components.GCamera;
	import com.genome2d.components.GComponent;
	import com.genome2d.components.renderables.GMovieClip;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.context.GBlendMode;
	import com.genome2d.context.GContextConfig;
	import com.genome2d.core.GNode;
	import com.genome2d.core.GNodeFactory;
	import com.genome2d.core.GNodePool;
	import com.genome2d.core.Genome2D;
	import com.genome2d.physics.GPhysics;
	import com.genome2d.textures.factories.GTextureFactory;
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.utils.getTimer;

	public class D2DCore{
	
		private const VERSION:Number = 0.5;
		public static var stage:Stage;
		public static var GCore:Genome2D;
		public static var sw:int;
		public static var sh:int;
		public static var prevTime:Number = 0
		
		private static var _currentState:D2DState;
		private var _initState:Class;
		private static var _switchStateRequested:Boolean;
		private static var _requestedState:Class;
		private static var _startedStateSwitch:Boolean;
		private static var _transition:D2DTransition;
		private static var _transitionCount:int = 0;
		private static var _transitionClass:Class = D2DSlamTransition
		
		private var core:GNode
		private static var container:GNode;
		public static var camera:D2DCamera
		
		public static var Paused:Boolean;
		private static var stateCount:int = 0
		
		public function D2DCore(stage:Stage, _initState:Class) {
			D2DCore.stage = stage;
			this._initState = _initState;
			sw = stage.stageWidth;
			sh = stage.stageHeight;
			
			GCore = Genome2D.getInstance();
			GCore.onInitialized.addOnce(GInitialized);
			GCore.onFailed.addOnce(GFailed);
			GCore.init(D2DCore.stage, new GContextConfig);
		
			
			D2DCore.stage.addEventListener(Event.RESIZE, ResizedStage);
			//needs Event.EXITING, Event.ACTIVATE, Event.DEACTIVATE listeners, but I can't add them 
			//because this is a web app?
		}
		
		public static function Pause():void{
			if(!Paused){
				Paused = true;
				GCore.paused = true;
			}
		}
		public static function Unpause():void{
			if(Paused){
				Paused = false;
				GCore.paused = false;
			}
		}
		
		
		protected function ResizedStage(event:Event):void{
			trace("D2DCore :: Stage has been resized to (w="+stage.fullScreenWidth+", h="+stage.fullScreenHeight+")");
			D2DCore.stage.removeEventListener(Event.RESIZE, ResizedStage);
			sw = stage.fullScreenWidth
			sh = stage.fullScreenWidth;
		}
		
		private function GFailed():void{
			throw new Error("!-- Genome2D failed to initialize --! - Check the wmode!");
		}
		
		private function GInitialized():void{
			trace("-- D2DCore & Genome2D initialized! -- ")
			core = new GNode("core0");
			GCore.root.addChild(core);
			D2DCore.stage.addEventListener(Event.ENTER_FRAME, CoreUpdate);
			GCore.autoUpdate = false;
			
			container = new GNode("container0");
			core.addChild(container);
			
			camera = GNodeFactory.createNodeWithComponent(D2DCamera, "camera0") as D2DCamera;
			camera.node.transform.x = stage.stageWidth/2;
			camera.node.transform.y = stage.stageHeight/2;
			core.addChild(camera.node);
			
			D2DAssets.init();
			D2DInput.init()
			D2DTimerManager.init();
			
			create();
		}
		
		private function create():void{
			//trace("-- D2DCore::Create() -- ");
			_currentState = new _initState("initState");
			container.addChild(_currentState);
		}
		
		private function CoreUpdate(e:Event):void{
			var currentTime:Number = getTimer();
			var deltaTime:int = currentTime - prevTime;
			prevTime = currentTime;
			
			if(Paused) deltaTime = 0
			D2DInput.update();
			D2DTimerManager.update(deltaTime);
			_currentState.update(deltaTime);
			if(_switchStateRequested && _transition == null){ //this null check makes it so you cant switch states
				if(!_startedStateSwitch){						// while a switch is already in progress
					_startedStateSwitch = true;
					if(_transition == null){
						_transitionCount++;
						_transition = new _transitionClass("_transition_"+_transitionCount);
						camera.transitionContainer.addChild(_transition);
						_transition.FadeOut(_switchState);
					}
				}
			}
			if(_transition != null) _transition.update(deltaTime);
			
			
			GCore.update();
			GCore.beginRender();
			GCore.render();
			GCore.endRender();
		}
		
		public static function switchState(_state:Class):void{
			//trace(" -- D2DCore::SwitchState requested.  Will change on next update");
			if(!_switchStateRequested){
				_switchStateRequested = true;
				_startedStateSwitch = false;
				_requestedState = _state;
			}
		}
		
		public static function _switchState():void{
			//trace(" ------- D2DCore :: Actually calling the switchState");
			container.removeChild(_currentState);
			camera.Reset();
			_currentState.dispose();
			_currentState = null
			_currentState = new _requestedState("state"+String(stateCount));
			container.addChild(_currentState);
			stateCount++;
			_switchStateRequested = false
			_transition.FadeIn(_transitionFinished);
		}
		
		private static function _transitionFinished():void{
			camera.transitionContainer.removeChild(_transition);
			_transition = null;
	
		}	
		
		public static function SetTransition(transition:Class):void{
			_transitionClass = transition;
		}
		
		public static function SetWorldBounds(rect:Rectangle):void{
			camera._worldBounds = rect;		
		}
	}
}