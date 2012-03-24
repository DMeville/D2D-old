package D2D.Assets{
	import com.genome2d.textures.GTexture;
	import com.genome2d.textures.GTextureAtlas;
	import com.genome2d.textures.factories.GTextureAtlasFactory;
	import com.genome2d.textures.factories.GTextureFactory;
	
	import flash.display.Bitmap;

	public class D2DAssets{
		
		[Embed(source="particleTexture.png")] private static var particleTexturePNG:Class
		[Embed(source="steelfish.otf", embedAsCFF="false", fontFamily="defaultFont")] public static var defaultFontOTF:Class
		[Embed(source ="D2DLogo/D2DLogo.png")] private static var D2DLogoPNG:Class;
		[Embed(source ="D2DLogo/D2DLogo.xml", mimeType="application/octet-stream")] private static var D2DLogoXML:Class;
		[Embed(source="DefaultGraphics/Defaults.png")] public static var DefaultsPNG:Class;
		[Embed(source ="DefaultGraphics/Defaults.xml", mimeType="application/octet-stream")] public static var DefaultsXML:Class
		
		public static var defaultFont:String = new defaultFontOTF;
		public static var BlackTexture:GTexture;
		public static var WhiteTexture:GTexture;
		public static var ParticleTexture:GTexture;
		public static var D2DLogoAtlas:GTextureAtlas;
		public static var D2DLogoFrames:Array = new Array("Logo0001", "Logo0002","Logo0003","Logo0004","Logo0005","Logo0006","Logo0007","Logo0008","Logo0009","Logo0010")
		public static var DefaultGraphicsAtlas:GTextureAtlas;
		
		
		public static function init():void{
			trace("D2DAssets::init()");
			BlackTexture = GTextureFactory.createFromColor("blackTexture_0", 0x000000, 32,32);
			WhiteTexture = GTextureFactory.createFromColor("whiteTexture_0", 0xFFFFFF, 32,32);
			ParticleTexture = GTextureFactory.createFromBitmapData("particleTexture0", (new particleTexturePNG as Bitmap).bitmapData);
			D2DLogoAtlas = GTextureAtlasFactory.createFromBitmapDataAndXML("D2D_Logo_0", (new D2DLogoPNG as Bitmap).bitmapData, XML(new D2DLogoXML));
			DefaultGraphicsAtlas = GTextureAtlasFactory.createFromBitmapDataAndXML("DefaultGraphics_0", (new DefaultsPNG as Bitmap).bitmapData, XML(new DefaultsXML));
		}
	}
}