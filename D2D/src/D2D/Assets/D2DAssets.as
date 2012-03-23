package D2D.Assets{
	import com.genome2d.textures.GTexture;
	import com.genome2d.textures.factories.GTextureFactory;
	
	import flash.display.Bitmap;

	public class D2DAssets{
		
		[Embed(source="particleTexture.png")] private static var particleTexturePNG:Class
		[Embed(source="steelfish.otf", embedAsCFF="false", fontFamily="defaultFont")] public static var defaultFontOTF:Class
		
		public static var defaultFont:String = new defaultFontOTF;
		public static var BlackTexture:GTexture;
		public static var WhiteTexture:GTexture;
		public static var ParticleTexture:GTexture;
		
		
		public static function init():void{
			BlackTexture = GTextureFactory.createFromColor("blackTexture_0", 0x000000, 32,32);
			WhiteTexture = GTextureFactory.createFromColor("whiteTexture_0", 0xFFFFFF, 32,32);
			ParticleTexture = GTextureFactory.createFromBitmapData("particleTexture0", (new particleTexturePNG as Bitmap).bitmapData);
		}
	}
}