package D2D.Input{
	import D2D.D2DCore;
	
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Vector3D;
	import flash.utils.Dictionary;

	public class D2DInput{
		
		
		public static var A:Boolean = false;
		public static var B:Boolean = false;
		public static var C:Boolean = false;
		public static var D:Boolean = false;
		public static var E:Boolean = false;
		public static var F:Boolean = false;
		public static var G:Boolean = false;
		public static var H:Boolean = false;
		public static var I:Boolean = false;
		public static var J:Boolean = false;
		public static var K:Boolean = false;
		public static var L:Boolean = false;
		public static var M:Boolean = false;
		public static var N:Boolean = false;
		public static var O:Boolean = false;
		public static var P:Boolean = false;
		public static var Q:Boolean = false;
		public static var R:Boolean = false;
		public static var S:Boolean = false;
		public static var T:Boolean = false;
		public static var U:Boolean = false;
		public static var V:Boolean = false;
		public static var W:Boolean = false;
		public static var X:Boolean = false;
		public static var Y:Boolean = false;
		public static var Z:Boolean = false;
		
		
		public static var LEFT:Boolean = false;
		public static var UP:Boolean = false;
		public static var RIGHT:Boolean = false;
		public static var DOWN:Boolean = false;
		
		public static var SPACE:Boolean = false;
		public static var ONE:Boolean = false;
		public static var TWO:Boolean = false;
		public static var THREE:Boolean = false;
		public static var FOUR:Boolean = false;
		public static var FIVE:Boolean = false;
		public static var SIX:Boolean = false;
		public static var SEVEN:Boolean = false;
		public static var EIGHT:Boolean = false;
		public static var NINE:Boolean = false;
		public static var ZERO:Boolean = false;
		
		//Mouse;
		public static var Mouse:D2DMouse = new D2DMouse();
		public static var Mouse3D:Vector3D = new Vector3D(0,0,0,0);
		public static var Mouse_JustClicked:Boolean = false;
		private static var _mouseClickCounter:int = 0;
		
		
	
		public static function init():void{
			D2DCore.stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			D2DCore.stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
			D2DCore.stage.addEventListener(MouseEvent.MOUSE_DOWN, HandleMouseDown);
			D2DCore.stage.addEventListener(MouseEvent.MOUSE_UP, HandleMouseUp);
			
			initializeKeys();
			
			
		}
		
		protected static function HandleMouseUp(event:MouseEvent):void{
			Mouse.handleMouseUp(event);
		}
		
		protected static function HandleMouseDown(event:MouseEvent):void{
			Mouse.handleMouseDown(event);
		}
		
		protected static function Click(event:MouseEvent):void{
			Mouse_JustClicked = true;
		}
		
		private static function initializeKeys():void{
			
		}
		
		protected static function KeyUp(event:KeyboardEvent):void{
			if(event.keyCode == 37 || event.keyCode == 38 || event.keyCode ==39 || event.keyCode == 40){
				if(event.keyCode == 37){
					D2DInput["LEFT"] = false;
				} else if(event.keyCode == 38){
					D2DInput["UP"] = false;
				} else if(event.keyCode == 39){
					D2DInput["RIGHT"] = false;
				} else if(event.keyCode == 40){
					D2DInput["DOWN"] = false;
				}
			} else if(event.keyCode == 32){
				D2DInput["SPACE"] = false;
			} else if(event.keyCode == 49 || event.keyCode == 50 || event.keyCode == 51 || event.keyCode == 52 || event.keyCode == 53 || event.keyCode == 54 || event.keyCode == 55 ||event.keyCode == 56 ||event.keyCode == 57 ||event.keyCode == 58){
				if(event.keyCode == 49){
					D2DInput["ONE"] = false;
				} else if(event.keyCode == 50){
					D2DInput["TWO"] = false;
				}else if(event.keyCode == 51){
					D2DInput["THREE"] = false;
				}else if(event.keyCode == 52){
					D2DInput["FOUR"] = false;
				}else if(event.keyCode == 53){
					D2DInput["FIVE"] = false;
				}else if(event.keyCode == 53){
					D2DInput["FIVE"] = false;
				}else if(event.keyCode == 54){
					D2DInput["SIX"] = false;
				}else if(event.keyCode == 55){
					D2DInput["SEVEN"] = false;
				}else if(event.keyCode == 56){
					D2DInput["EIGHT"] = false;
				}else if(event.keyCode == 57){
					D2DInput["NINE"] = false;
				}else if(event.keyCode == 58){
					D2DInput["ZERO"] = false;
				}
			} else {
				D2DInput[String.fromCharCode(event.keyCode)] = false
			}
		}
		
		protected static function KeyDown(event:KeyboardEvent):void{
			if(event.keyCode == 37 || event.keyCode == 38 || event.keyCode ==39 || event.keyCode == 40){
				if(event.keyCode == 37){
					D2DInput["LEFT"] = true;
				} else if(event.keyCode == 38){
					D2DInput["UP"] = true;
				} else if(event.keyCode == 39){
					D2DInput["RIGHT"] = true;
				} else if(event.keyCode == 40){
					D2DInput["DOWN"] = true;
				}
			} else if(event.keyCode == 32){
				D2DInput["SPACE"] = true;
			} else if(event.keyCode == 49 || event.keyCode == 50 || event.keyCode == 51 || event.keyCode == 52 || event.keyCode == 53 || event.keyCode == 54 || event.keyCode == 55 ||event.keyCode == 56 ||event.keyCode == 57 ||event.keyCode == 58){
				if(event.keyCode == 49){
					D2DInput["ONE"] = true;
				} else if(event.keyCode == 50){
					D2DInput["TWO"] = true;
				}else if(event.keyCode == 51){
					D2DInput["THREE"] = true;
				}else if(event.keyCode == 52){
					D2DInput["FOUR"] = true;
				}else if(event.keyCode == 53){
					D2DInput["FIVE"] = true;
				}else if(event.keyCode == 53){
					D2DInput["FIVE"] = true;
				}else if(event.keyCode == 54){
					D2DInput["SIX"] = true;
				}else if(event.keyCode == 55){
					D2DInput["SEVEN"] = true;
				}else if(event.keyCode == 56){
					D2DInput["EIGHT"] = true;
				}else if(event.keyCode == 57){
					D2DInput["NINE"] = true;
				}else if(event.keyCode == 58){
					D2DInput["ZERO"] = true;
				}
			} else {
				D2DInput[String.fromCharCode(event.keyCode)] = true
			}
		}
		
		public static function update():void{
			D2DInput.Mouse.update();
			D2DInput.Mouse.x = D2DCore.stage.mouseX + (D2DCore.g_camera.node.transform.x - D2DCore.sw/2)
			D2DInput.Mouse.y = D2DCore.stage.mouseY + (D2DCore.g_camera.node.transform.y - D2DCore.sh/2);
			D2DInput.Mouse3D.x = D2DInput.Mouse.x;
			D2DInput.Mouse3D.y = D2DInput.Mouse.y;
			//trace(D2DInput.Mouse);
			//SetAllToFalse(); //sets all the flags to false, so the keypresses only trigger whatever action once;
			
			
			
		}
		
		private static function SetAllToFalse():void{
			A = false;
			B = false;
			C = false;
			D = false;
			E = false;
			F = false;
			G = false;
			H = false;
			I = false;
			J = false;
			K = false;
			L = false;
			M = false;
			N = false;
			O = false;
			P = false;
			Q = false;
			R = false;
			S = false;
			T = false;
			U = false;
			V = false;
			W = false;
			X = false;
			Y = false;
			Z = false;
			
			/*LEFT = false;
			UP = false;
			RIGHT = false;
			DOWN = false;*/
			
			SPACE = false;
			
			ONE = false;
			TWO = false;
			THREE = false;
			FOUR = false;
			FIVE = false;
			SIX = false;
			SEVEN = false;
			EIGHT = false;
			NINE = false;
			ZERO = false;
			
			Mouse_JustClicked = false;
			
		}		
		
	}
}