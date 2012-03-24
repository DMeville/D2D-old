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
	
	import com.genome2d.components.renderables.GMovieClip;
	import com.genome2d.components.renderables.GRenderable;
	import com.genome2d.components.renderables.GSprite;
	import com.genome2d.context.GBlendMode;
	import com.genome2d.core.GNode;
	import com.genome2d.core.GNodeFactory;
	import com.genome2d.textures.factories.GTextureFactory;
	
	public class SpriteExample extends D2DState{
		
		private var s:GSprite;
		private var c:GSprite;
		private var mc:GMovieClip
		private var mc2:GMovieClip
	
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
			hud.node.transform.x -= 150;
			D2DUtils.SetColor(hud.node, 0xFF0000);
			D2DCore.camera.overlay.addChild(hud.node);
			
			mc = GNodeFactory.createNodeWithComponent(GMovieClip, "mc") as GMovieClip;
			mc.setTextureAtlas(D2DAssets.D2DLogoAtlas);
			mc.frameRate = 24;
			mc.frames = D2DAssets.D2DLogoFrames
			mc.node.transform.x = 400;
			mc.node.transform.y = 400;
			addChild(mc.node);
			
			mc2 = GNodeFactory.createNodeWithComponent(GMovieClip, "mc2") as GMovieClip;
			mc2.setTextureAtlas(D2DAssets.D2DLogoAtlas);
			mc2.frameRate = 24;
			mc2.frames = D2DAssets.D2DLogoFrames
			mc2.node.transform.x = 432;
			mc2.node.transform.y = 432;
			addChild(mc2.node);
			
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
			if(mc.hitTestPoint(D2DInput.Mouse3D)){
				mc.node.transform.alpha = 0.5;
			} else {
				mc.node.transform.alpha = 1;
			}
			if(mc2.hitTestPoint(D2DInput.Mouse3D)){
				mc2.node.transform.alpha = 0.5;
			} else {
				mc2.node.transform.alpha = 1;
			}
			
		}
		
		override public function  dispose():void{
			super.dispose();
			s = null
		}
	
		
	}
}