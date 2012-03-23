package D2D.Components{
	import D2D.Assets.D2DAssets;
	import D2D.D2DCore;
	
	import com.genome2d.components.GComponent;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.core.GNode;
	import com.genome2d.textures.GTexture;
	import com.genome2d.textures.GTextureAtlas;
	
	import flash.geom.Rectangle;
	
	public class D2DTilemap extends GComponent{
		
		private var rows:Array; //x
		private var cols:Array; //y;
		public static var heightInTiles:int = 0;
		public static var widthInTiles:int = 0;
		
		public static var TileWidth:int = 0;
		public static var TileHeight:int = 0;
		public static var _data:Array;
		public var tiles:int = 0
		private var texture:GTextureAtlas
	
		public function D2DTilemap(p_node:GNode)
		{
			super(p_node);
			rows = new Array();
			cols = new Array();	
		}
		
		public function LoadMap(MapData:String, _TileWidth:int, _TileHeight:int, _tiles:GTextureAtlas):void{
			TileWidth = _TileWidth;
			TileHeight = _TileHeight;
			texture = _tiles;
			var columns:Array;
			var rows:Array = MapData.split("\n");
			heightInTiles = rows.length;
			_data = new Array();
			var row:uint = 0;
			var column:uint;
			while(row < heightInTiles)
			{
				columns = rows[row++].split(","); 
				if(columns.length <= 1)
				{
					heightInTiles = heightInTiles - 1;
					continue;
				}
				if(widthInTiles == 0)
					widthInTiles = columns.length;
				column = 0;
				while(column < widthInTiles)
					_data.push(int(columns[column++]));
			}
			
			D2DCore.camera._worldBounds = new Rectangle(0,0, widthInTiles*TileWidth, heightInTiles*TileHeight);
			trace(D2DCore.camera._worldBounds);
			Draw()
			trace(tiles);
			
		}
		override public function update(p_deltaTime:Number, p_parentTransformUpdate:Boolean, p_parentColorUpdate:Boolean):void{
			
		}
		
		
		private function Draw():void{
			var s:GSprite;
			var tile:int 
			var t:GTexture
			for(var i:int = 0; i< widthInTiles;i++){
				for(var j:int = 0; j<heightInTiles;j++){
					tile = getTile(i,j);
					if(tile >0){
						this.tiles++
						//D2DCore.c_g2d.blit(TileWidth/2 +i*TileWidth, TileHeight/2 +i*TileHeight, D2DAssets.WhiteTexture);
						var sN:GNode = new GNode("tile_"+i+"_"+j);
						s = sN.addComponent(GSprite) as GSprite;
						
			
						
						if(tile+1 < 10){
							t = texture.getTexture("tile000"+(tile+1));
						} else {
							t = texture.getTexture("tile00"+(tile+1));
						}
						
						s.setTexture(t);
						s.node.transform.x = TileWidth/2 + i*TileWidth;
						s.node.transform.y = TileHeight/2 + j*TileHeight
						this.node.addChild(s.node);
						
					}
					
					
				}
			}
			
		}
		
		public static function getTile(X:int,Y:int):int {
			return _data[Y * widthInTiles + X] as int;
		}
	}
}