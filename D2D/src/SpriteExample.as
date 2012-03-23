package{
	import D2D.Assets.D2DAssets;
	import D2D.Components.D2DCamera;
	import D2D.Components.D2DKeyboardMovement;
	import D2D.Components.D2DSprite;
	import D2D.D2DCore;
	import D2D.D2DState;
	import D2D.Input.D2DInput;
	import D2D.Utils.D2DTimer;
	import D2D.Utils.D2DUtils;
	
	import com.genome2d.components.renderables.GRenderable;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.context.GBlendMode;
	import com.genome2d.core.GNode;
	import com.genome2d.core.GNodeFactory;
	import com.genome2d.textures.factories.GTextureFactory;
	
	public class SpriteExample extends D2DState{
		
		private var s:GSprite;
		private var c:GSprite;
	
		public function SpriteExample(p_id:String="") {
			super(p_id);
		}
		
		override public function create():void{
			super.create();
			
			var sNode:GNode = new GNode("spriteNode120493");
			s = sNode.addComponent(GSprite) as GSprite;
			s.setTexture(D2DAssets.WhiteTexture);
			s.node.transform.x = D2DCore.sw/2;
			s.node.transform.y = D2DCore.sh/2;
			
			addChild(s.node);
			
			c = GNodeFactory.createNodeWithComponent(GSprite, "character") as GSprite;
			c.setTexture(D2DAssets.ParticleTexture);
			
			c.node.transform.x = D2DCore.sw/2;
			c.node.transform.y = D2DCore.sh/2;
			addChild(c.node)
			
			c.node.addComponent(D2DKeyboardMovement) as D2DKeyboardMovement;
			D2DCore.camera.Follow(c.node, D2DCamera.STYLE_LOCK_ON);
			
			var hud:GSprite = GNodeFactory.createNodeWithComponent(GSprite, "hud") as GSprite;
			hud.setTexture(D2DAssets.WhiteTexture);
			D2DUtils.SetColor(hud.node, 0xFF0000);
			D2DCore.camera.overlay.addChild(hud.node);
			
			
			
		}
		
		
		override public function update(deltaTime:Number):void{
			super.update(deltaTime);
			
			if(D2DInput.Keys.justPressed("P")){
				if(!D2DCore.Paused){
					D2DCore.Pause();
				} else {
					D2DCore.Unpause();
				}
			}
			
			if(D2DInput.Keys.justReleased("SPACE")){
				trace("released");
				D2DCore.switchState(SpriteExample);
			}
			
		}
		
		override public function  dispose():void{
			super.dispose();
			s = null
		}
	
		
	}
}