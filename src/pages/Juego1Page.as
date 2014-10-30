package pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import com.greensock.TweenLite;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	public class Juego1Page extends AbstractPage
	{	
		public var gana_btn:SimpleButton;
		public var pierde_btn:SimpleButton;
		public var mask_mc:MovieClip;
		public var contenido_mc:MovieClip;
		
		public function Juego1Page()
		{
			super();
			alpha = 0;
			//new Scaffold(this);
			gana_btn.addEventListener('click', onClickGana);
			pierde_btn.addEventListener('click', onClickPierde);			
		}
		
		public function onClickPierde(e:Event = null):void 
		{
			Gaia.api.goto('index/nav/home');
			//MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.doMoverFicha(0-MovieClip(Gaia.api.getPage(Pages.HOME).content).lanzamoneda_mc.moneda_mc.nRandom);
			//trace("click pierde 0-" + MovieClip(Gaia.api.getPage(Pages.HOME).content).lanzamoneda_mc.moneda_mc.nRandom);			
		}
		
		private function onClickGana(e:Event = null):void 
		{
			Gaia.api.goto('index/nav/home/fin_turno');
			//trace("verificar cantidad de movimientos");
		}
		
		public function sumarPuntos(n:int):void 
		{
			
			/*trace("HomePage.puntos "+HomePage.puntos);
			trace("///////////////");
			trace("this.vScoresBest" +n);
			trace("HomePage.puntos "+HomePage.puntos);
			HomePage.puntos = HomePage.puntos + n;
			trace("///////////////");
			trace("HomePage.puntos " + HomePage.puntos);
			*/
			//trace("sumar puntos!!!! ");
			
			//HomePage.puntos = HomePage.puntos + n;
			
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			//SoundASMixer.stopAll();
			Gaia.api.getPage(Pages.NAV).content.fadeOutLoop();
			
			TweenMax.from(contenido_mc, 1, { x:800, ease:Quad.easeOut, delay:.3 } );
			//stage.quality = "LOW";
			TweenMax.to(this, 0.3, {alpha:1, onComplete:transitionInComplete});
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			//stage.quality = "HIGH";
			TweenMax.to(this, 0.3, { alpha:0, onComplete:transitionOutComplete } );
			//Gaia.api.getPage(Pages.HOME).content.playLoop();

		}
	}
}
