package pages.home {
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import com.greensock.TimelineMax;
	import com.greensock.easing.*;
	import com.greensock.TweenAlign;
	import pages.NavPage;
	import pages.Pages;
	
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class LanzaMoneda extends MovieClip
	{
		public var lanzarmoneda_btn:MovieClip;
		public var moneda_mc:MovieClip;
		
		public var tmMaster:TimelineMax;
		
		public function LanzaMoneda() 
		{
			//activarBoton();
			
			tmMaster = new TimelineMax( { repeat: -1 } );
			
			var tm1:TimelineMax = new TimelineMax();
			tm1.appendMultiple([ 
				TweenMax.to(lanzarmoneda_btn, 1, {scaleX:1.05, scaleY:1.05 , yoyo:true, ease:Quad.easeInOut, repeat:-1}), 
				], 1, TweenAlign.SEQUENCE, .3
			);
			
			tmMaster.append(tm1);
			desactivarBoton();
		}	
		
		public function activarBoton():void 
		{
			tmMaster.play();
			lanzarmoneda_btn.addEventListener('click', onClick);	
			lanzarmoneda_btn.buttonMode = true;
		}
		
		private function onClick(e:Event):void 
		{
			if (MovieClip(parent).isZoomed) 
			{
				//MovieClip(parent).increaseSize();
			}
			moneda_mc.nRandom = setRandom(1, 3);
			moneda_mc.gotoAndPlay(2);
			NavPage.moneda = moneda_mc.nRandom;
			trace("moneda_mc.nRandom " + moneda_mc.nRandom);
			desactivarBoton();
			MovieClip(parent).restarTurno();			
			MovieClip(Gaia.api.getPage(Pages.NAV).content).sfxPlay("coin");
			
			
		}
		
		public function desactivarBoton():void 
		{
			tmMaster.pause();
			lanzarmoneda_btn.removeEventListener('click', onClick);
			lanzarmoneda_btn.buttonMode = false;
		}
		
		
		
		public function setRandom(min:int, max:int):int
		{
			return min + (max - min) * Math.random();
		}
	}
}