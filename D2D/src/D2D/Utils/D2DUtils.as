package D2D.Utils{
	import D2D.Components.D2DSprite;
	
	import com.genome2d.components.renderables.GRenderable;
	import com.genome2d.core.GNode;

	public class D2DUtils{
		/** Creates an Array to make the animation frame assignment process quicker
		 *  GetFrameSequence("a_", 1, 4) //outputs ["a_1", "a_2", "a_3", "a_4"]
		 *  
		 * @param prefix  The animation prefix name (as outlined in the textures XML file)
		 * @param start   The start frame (inclusive)
		 * @param end     The end frame (inclusive);
		 * @return   	  An Array of the animation sequence
		 * 
		 */		
		public static function GetFrameSequence(prefix:String, start:int, end:int):Array{
			var sequence:Array = new Array();
			for(var i:int = start; i<=end;i++){
				if(i < 10){
					sequence.push(String(prefix+"000"+i));
				} else if (i>=10 && i<100){
					sequence.push(String(prefix+"00"+i));
				} else if(i >=100 && i<1000){
					sequence.push(String(prefix+"0"+i));
				} else {
					sequence.push(String(prefix+i));
				}
			}
			
			return sequence;
		}
		public static function SetColor(obj:GNode = null, color:uint = 0xFFFFFF):void{
			if(obj){
				var red:Number = color >> 16 & 0xFF;
				var green:Number = color >> 8 & 0xFF;
				var blue:Number = color & 0xFF;
				
				red = Math.floor((red/255)*1000)/1000
				green = Math.floor((green/255)*1000)/1000
				blue = Math.floor((blue/255)*1000)/1000
				
				obj.transform.red = red;
				obj.transform.blue = blue;
				obj.transform.green = green;
				
			}
		}
		
		public static function Seperate(a:GRenderable, b:GRenderable):void{
			SeperateX(a,b);
			SeperateY(a,b);
			
		}
		
		public static function SeperateY(a:GRenderable, b:GRenderable):void{
			//a is ninja
			//b is floor;
			var c:D2DSprite = (a as D2DSprite)
			var d:D2DSprite = (b as D2DSprite);
			if(d.node.transform.y > c.node.transform.y){	
				c.node.transform.y = d.node.transform.y - d.height/2 - c.height/2
			} else {
				c.node.transform.y = d.node.transform.y + d.height/2 + c.height/2
			}
			
		}
		
		public static function SeperateX(a:GRenderable, b:GRenderable):void{
			//a is ninja
			//b is floor;
			var c:D2DSprite = (a as D2DSprite)
			var d:D2DSprite = (b as D2DSprite);
			if(d.node.transform.x < c.node.transform.x){
				c.node.transform.x = d.node.transform.x + d.width/2 + c.width/2
			} else {
				c.node.transform.x = d.node.transform.x - d.width/2 - c.width/2
			}
			
				
		}		
		
		/**Converts a number to a different unit. 
		 * Can go both up and down units. (Days->Seconds and Seconds->Days)
		 * Use the unit constants in the D2DUnits class
		 * 
		 * <code> Convert(1, D2DUnits.DAYS, D2D.HOURS); //returns 24 </code>
		 * 
		 * @param a				The number you want to convert
		 * @param a_unit		The base of the number you want to conver
		 * @param to_unit		The unit you want to conver to
		 * @return 				a converted to unit to_unit
		 * 
		 */		
	
		public static function Convert(a:Number, a_unit:int, to_unit:int):Number{
			switch(a_unit){
				case D2DUnits.MILLISECONDS:
					switch(to_unit){
						case D2DUnits.MILLISECONDS: return a; break;
						case D2DUnits.SECONDS: return MillisecondsToSeconds(a); break;
						case D2DUnits.MINUTES: return SecondsToMinutes(MillisecondsToSeconds(a)); break;
						case D2DUnits.HOURS: return MinutesToHours(SecondsToMinutes(MillisecondsToSeconds(a))); break;
						case D2DUnits.DAYS: return HoursToDays(MinutesToHours(SecondsToMinutes(MillisecondsToSeconds(a)))); break;
					}
				break;
				case D2DUnits.SECONDS:
					switch(to_unit){
						case D2DUnits.MILLISECONDS: return SecondsToMilliseconds(a) ; break;
						case D2DUnits.SECONDS: return a; break;
						case D2DUnits.MINUTES: return SecondsToMinutes(a); break;
						case D2DUnits.HOURS: return MinutesToHours(SecondsToMinutes(a)); break;
						case D2DUnits.DAYS: return HoursToDays(MinutesToHours(SecondsToMinutes(a))); break;
					}
				break;
				case D2DUnits.MINUTES:
					switch(to_unit){
						case D2DUnits.MILLISECONDS: return SecondsToMilliseconds(MinutesToSeconds(a)); break;
						case D2DUnits.SECONDS: return MinutesToSeconds(a); break;
						case D2DUnits.MINUTES: return a; break;
						case D2DUnits.HOURS: return MinutesToHours(a); break;
						case D2DUnits.DAYS: return HoursToDays(MinutesToHours(a)); break;
					}
				break;
				case D2DUnits.HOURS:
					switch(to_unit){
						case D2DUnits.MILLISECONDS: return SecondsToMilliseconds(MinutesToSeconds(HoursToMinutes(a))); break;
						case D2DUnits.SECONDS: return MinutesToSeconds(HoursToMinutes(a)); break;
						case D2DUnits.MINUTES: return HoursToMinutes(a); break;
						case D2DUnits.HOURS: return a; break;
						case D2DUnits.DAYS: return HoursToDays(a); break;
					}
				break;
				case D2DUnits.DAYS:
					switch(to_unit){
						case D2DUnits.MILLISECONDS: return SecondsToMilliseconds(MinutesToSeconds(HoursToMinutes(DaysToHours(a)))); break;
						case D2DUnits.SECONDS: return MinutesToSeconds(HoursToMinutes(DaysToHours(a))); break;
						case D2DUnits.MINUTES: return HoursToMinutes(DaysToHours(a)); break;
						case D2DUnits.HOURS: return DaysToHours(a); break;
						case D2DUnits.DAYS: return a; break;
					}
				break;
			}
			return a;
		}
		
		public static function CurrentDate():Date{
			return new Date();
		}
		
		public static function TimeBetweenDates(_start:Date, _end:Date):Number{
			return (_end.getTime() - _start.getTime());
		}
		
		
		//Conversions;
		
		public static function MillisecondsToSeconds(ms:Number):Number{return ms/1000;}
		public static function SecondsToMilliseconds(sec:Number):Number{return sec*1000;}
		public static function MinutesToSeconds(min:Number):Number{return min*60;}
		public static function SecondsToMinutes(sec:Number):Number{return sec/60;}
		public static function HoursToMinutes(hours:Number):Number{return hours*60}
		public static function MinutesToHours(min:Number):Number{return min/60;}
		public static function DaysToHours(days:Number):Number{return days*24;}
		public static function HoursToDays(hours:Number):Number{return hours/24;}
		
		
		/** Formats the number to a nice readable string.  "# Days, # Hours, # Minutes, # Seconds"
		 * 
		 * @param a			The number you wish to format
		 * @param unit		The unit of the number (Seconds, Minutes, etc)  Use the constants from the D2DUnits class
		 * @return 			A formatted string of the time: "# Days, # Hours, # Minutes, # Seconds".  It will only show the necessary units.
		 * 
		 */		
		public static function Format(a:Number, unit:int):String{
			var	time:Number = Convert(a, unit, D2DUnits.DAYS);
			
			var days:Number = time
			var hours:Number = Convert(days, D2DUnits.DAYS, D2DUnits.HOURS)%24
			var minutes:Number = Convert(hours, D2DUnits.HOURS, D2DUnits.MINUTES)%60
			var seconds:Number = Convert(minutes, D2DUnits.MINUTES, D2DUnits.SECONDS)%60
			
			var s:String
			if(days >=1){
				s = Math.floor(days) + " days, " + Math.floor(hours) + " hours, " + Math.floor(minutes) + " minutes and " + Math.floor(seconds) + " seconds"
			} else if(hours >=1){
				s = Math.floor(hours) + " hours, " + Math.floor(minutes) + " minutes and " + Math.floor(seconds) + " seconds"
			} else if(minutes >=1){
				s =+ Math.floor(minutes) + " minutes and " + Math.floor(seconds) + " seconds"
			} else {
				s =  Math.floor(seconds) + " seconds"
			}
			return s
		}
		

		public static function MatchPosition(object:GNode, target:GNode):void{
			object.transform.x = target.transform.x;
			object.transform.y = target.transform.y;
		}
	}
}