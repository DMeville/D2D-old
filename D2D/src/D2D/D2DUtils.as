package D2D{
	import com.flashcore.g2d.core.G2DNode;

	public class D2DUtils{
	
		public static function SetColor(obj:G2DNode = null, color:uint = 0xFFFFFF):void{
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
	}
}