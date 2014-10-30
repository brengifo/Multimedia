package pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	import flash.utils.getDefinitionByName;
		
	public class SorpresaPage extends AbstractPage
	{	
		public var contenido_mc:MovieClip;
		private var content_nav_mc:MovieClip;
		private var ClassReference:Class;
		
		public function SorpresaPage()
		{
			super();
			alpha = 0;
			//new Scaffold(this);
			navSelect("sorpresa.Page1");
		}
		
		public function navSelect(s:String):void
		{
			//doNavSelect(s);
			if (this.contenido_mc.numChildren>0) 
			{
				TweenMax.to(this.contenido_mc, 0.5, { alpha:0, onComplete:navSet, onCompleteParams:[s]} );
			} else {
				navSet(s);
			}			
			
		}

		
		private function navSet(s:String):void
		{
			this.contenido_mc.alpha = 0;
			if (this.contenido_mc.numChildren>0) 
			{
				for (var i:int = 0; i < this.contenido_mc.numChildren; i++) 
				{
					this.contenido_mc.removeChildAt(i);
				}
			}
			
			ClassReference = getDefinitionByName("pages."+s) as Class;
			content_nav_mc = new ClassReference();
			this.contenido_mc.addChild(content_nav_mc);
			TweenMax.to(this.contenido_mc, 0.5, { alpha:1 } );			
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			contenido_mc.x = 800;
			TweenMax.to(this, 0.3, { alpha:1, onComplete:transitionInComplete } );
			TweenMax.to(contenido_mc, .3, { x:0, ease:Quad.easeOut, delay:.3 } );
			try 
			{
				MovieClip(Gaia.api.getPage(Pages.HOME).content).sfxPlay("swap");
			} catch (e:Error) {
			
			}
			
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(contenido_mc, 0.3, { x:-800, ease:Quad.easeIn} );
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete, delay:.3});
		}
	}
}
