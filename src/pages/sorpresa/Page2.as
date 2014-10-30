package pages.sorpresa 
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.events.*;
	import flash.display.MovieClip;
	import pages.Pages;
	
	import com.greensock.TweenMax;
	import com.greensock.TimelineMax;
	import com.greensock.easing.*;
	import com.greensock.TweenAlign;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Page2 extends MovieClip
	{
		public var sorpresa_mc:MovieClip;
		public var lanzar_btn:MovieClip;
		public var dado_mc:MovieClip;
		public var tmMaster:TimelineMax;
		
		public function Page2() 
		{
			tmMaster = new TimelineMax( { repeat: -1 } );
			var tm1:TimelineMax = new TimelineMax();
			tm1.appendMultiple([ 
				TweenMax.to(lanzar_btn, 1, {scaleX:1.05, scaleY:1.05 , yoyo:true, ease:Quad.easeInOut, repeat:-1}), 
				], 1, TweenAlign.SEQUENCE, .3
			);
			tmMaster.play();
			tmMaster.append(tm1);
			
			lanzar_btn.addEventListener('click', onClick);
		}
		
		private function onClick(e:Event):void 
		{
			
			dado_mc.lanzarDado();
			lanzar_btn.removeEventListener('click', onClick);			
			dado_mc.addEventListener("moverFicha", doMoverFicha);
			tmMaster.pause();
		}
		private function doMoverFicha(e:Event):void 
		{
			try
			{
					Gaia.api.goto('index/nav/home/');
					MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.doMoverFicha(dado_mc.getNum);
				/*	var mc:MovieClip = Gaia.getPage('index/nav/home');
					mc.content.tablero_mc.doMoverFicha(dado_mc.getNum);*/
			}
			catch(err:Error)
			{
					trace("Gaia: " + err.message);
			}
		
		}
	}

}