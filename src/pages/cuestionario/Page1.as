package pages.cuestionario 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import pages.Pages;
	
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Page1 extends MovieClip
	{
		public var saltar_btn:MovieClip;
		public function Page1() 
		{
			saltar_btn.addEventListener('click', onClick);
			
		}
		
		private function onClick(e:Event):void 
		{
			try
			{
					//Gaia.api.goto('index/nav/home');					
					MovieClip(parent.parent).navSelect("cuestionario.Page2");
					//MovieClip(Gaia.api.getPage(Pages.SORPRESA).content).tablero_mc.doMoverFicha(dado_mc.getNum);
				/*	var mc:MovieClip = Gaia.getPage('index/nav/home');
					mc.content.tablero_mc.doMoverFicha(dado_mc.getNum);*/
					MovieClip(Gaia.api.getPage(Pages.NAV).content).sfxPlay("click");
			}
			catch(err:Error)
			{
					trace("Gaia: " + err.message);
			}
		}
		
	}

}