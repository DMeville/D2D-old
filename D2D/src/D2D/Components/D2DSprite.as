package D2D.Components{
	import com.genome2d.core.GNode;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.textures.GTexture;
	
	import flash.geom.Point;
	
	public class D2DSprite extends GSprite{
		
		public var width:Number = 0;
		public var height:Number = 0;
		public var immovable:Boolean = false
		
		public function D2DSprite(p_node:GNode){
			super(p_node);
		}
		
		
		public function setTextureWithSize(p_texture:GTexture, width:Number = 0, height:Number = 0):void{
			setTexture(p_texture)
			this.width = width;
			this.height = height
		}
		public function SetSize(width:Number, height:Number = 0):void{
			this.width = width;
			this.height = height;
		}
	}
}