package D2D.Assets{
	import com.flashcore.g2d.textures.G2DTexture;
	
	import flash.display.Bitmap;

	public class D2DAssets{
		
		[Embed(source="particleTexture.png")] private static var particleTexturePNG:Class
		[Embed(source="steelfish.otf", embedAsCFF="false", fontFamily="defaultFont")] public static var defaultFontOTF:Class
		
		public static var defaultFont:String = new defaultFontOTF;
		public static var BlackTexture:G2DTexture;
		public static var WhiteTexture:G2DTexture;
		public static var ParticleTexture:G2DTexture;
		
		
		public static function init():void{
			BlackTexture = G2DTexture.createFromColor("blackTexture_0", 0x000000, 32,32);
			WhiteTexture = G2DTexture.createFromColor("whiteTexture_0", 0xFFFFFF, 32,32);
			ParticleTexture = G2DTexture.createFromBitmapData("particleTexture0", (new particleTexturePNG as Bitmap).bitmapData);
			
			
			
		}
	}
}