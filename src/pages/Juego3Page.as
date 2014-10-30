package pages
{
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	
	
	public class Juego3Page extends AbstractPage
	{	
		private var nStars:int;
		public var gana_btn:SimpleButton;
		public var pierde_btn:SimpleButton;
		public var contenido_mc:MovieClip;
		public var id:Number;
		
		public function Juego3Page()
		{
			super();
			alpha = 0;
			//new Scaffold(this);
			gana_btn.addEventListener('click', onClickGana);
			pierde_btn.addEventListener('click', onClickPierde);
		}
		private function onClickPierde(e:Event):void 
		{
			Gaia.api.goto('index/nav/home');
			MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.doMoverFicha(0-MovieClip(Gaia.api.getPage(Pages.HOME).content).lanzamoneda_mc.moneda_mc.nRandom);
			trace("click pierde 0-"+MovieClip(Gaia.api.getPage(Pages.HOME).content).lanzamoneda_mc.moneda_mc.nRandom);
		}
		
		public function onClickGana(e:Event=null):void 
		{
			Gaia.api.goto('index/nav/home/fin_turno');
			//trace("verificar cantidad de movimientos");	
		}
		
		public function  sumarPuntos(n:int):void 
		{
			if (n>0) 
			{
				trace("win");
				NavPage.bWin = true;
				NavPage.puntosGame = n;
				setStars(n);				
				NavPage.nStars = nStars;				
				MovieClip(Gaia.api.getPage(Pages.NAV).content).sumarPuntos(n);
					//MovieClip(parent.parent).sumarPuntos(this.vScoresBest);					  
					//MovieClip(Gaia.api.getPage(Pages.HOME).content).sumarPuntos(vScoresBest);
				Gaia.api.goto('index/nav/home/fin_turno');
			} else {
				trace("loose");
				// activar flag de que perdió
				NavPage.bWin = false;
				Gaia.api.goto('index/nav/home');
				//MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.doMoverFicha(0 - MovieClip(Gaia.api.getPage(Pages.HOME).content).lanzamoneda_mc.moneda_mc.nRandom);
				MovieClip(Gaia.api.getPage(Pages.NAV).content).sfxPlay("loose");					
			}
		}
		
		private function setStars(nPuntosTotal:int):void 
		{
			if (nPuntosTotal > 0 && nPuntosTotal < 30) 
			{
				nStars = 1;
			} else if (nPuntosTotal > 30 && nPuntosTotal < 50) {
				nStars = 2;
			} else if (nPuntosTotal > 50) {
				nStars = 3;
			}			
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 0.3, { alpha:1, onComplete:transitionInComplete } );
			Gaia.api.getPage(Pages.NAV).content.fadeOutLoop();
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
		
		
		
	}
}
