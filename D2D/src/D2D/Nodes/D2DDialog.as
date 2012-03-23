package D2D.Nodes{
	import D2D.Assets.D2DAssets;
	
	import com.flashcore.g2d.components.G2DComponent;
	import com.flashcore.g2d.components.renderables.G2DNativeText;
	import com.flashcore.g2d.components.renderables.G2DSprite;
	import com.flashcore.g2d.core.G2DNode;
	
	import flash.text.TextFormat;
	
	public class D2DDialog extends G2DNode{
		public static var count:int = 0;
		
		private var graphic:G2DSprite;
		private var titleText:G2DNativeText;
		private var contentText:G2DNativeText;
		private var tf:TextFormat 
		
		public function D2DDialog(_x:Number, _y:Number, title:String, content:String){
			count ++
			super("Dialog_"+count);
			
			this.transform.x = _x;
			this.transform.y = _y;
			
			graphic = G2DComponent.createWithNode(G2DSprite, "dialogGraphic_"+count) as G2DSprite;
			graphic.setTexture(D2DAssets.DefaultGraphicsAtlas.getTexture("DefaultWindow"));
			this.addChild(graphic.node);
			
			tf = new TextFormat(D2DAssets.defaultFont,36, 0xFFFFFF, true);
			
			titleText = G2DComponent.createWithNode(G2DNativeText, "titleText_"+count) as G2DNativeText;
			titleText.text = title
			titleText.width = 500;
			titleText.transparent = true;
			titleText.textFormat = tf
			titleText.node.transform.x = 125
			titleText.node.transform.y = -60
			this.addChild(titleText.node);
			
			
			tf = new TextFormat(D2DAssets.defaultFont, 25, 0xFFFFFF, null, null, null, null, null, "center");
			contentText = G2DComponent.createWithNode(G2DNativeText, "contentText_"+count) as G2DNativeText;
			contentText.wordWrap = true;
			contentText.width = 500
			contentText.transparent = true;
			contentText.textFormat = tf;
			contentText.node.transform.x = 0
			contentText.node.transform.y = 50
			contentText.height = 150;
			contentText.text = content
			this.addChild(contentText.node);
			
			
		}
	}
}