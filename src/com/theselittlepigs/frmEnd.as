package com.theselittlepigs 
{
    import flash.display.*;
	import flash.events.Event;
	import flash.text.TextField;
    import flash.utils.*;
	import pages.HomePage;
	import pages.Pages;
	
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	
	import com.greensock.*;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	
	 
	public class frmEnd extends MovieClip 
	{
		private var _BASE:frmBase;
        private var _ME:String;
		
		public var p:MovieClip;
		public var score_txt:TextField;
		public var yes_btn:SimpleButton;
		public var no_btn:SimpleButton;
		
		public function frmEnd(param1:frmBase) 
		{
			super();
			var p_base:* = param1;
            this._BASE = p_base;
            this._ME = String(getDefinitionByName(getQualifiedClassName(this))).substr(7, String(getDefinitionByName(getQualifiedClassName(this))).length - 8);
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			score_txt.text = String(frmBase.score);			
			yes_btn.addEventListener('click', onClickYes);			
			no_btn.addEventListener('click', onClickNo);
			yes_btn.visible = false;
			no_btn.visible = false;
			
			if (frmBase.score > 0) 
			{
				
				trace("HomePage.puntos "+HomePage.puntos);
				trace("///////////////");
				trace("frmBase.score " + frmBase.score);
				trace("HomePage.puntos "+HomePage.puntos);
				HomePage.puntos = HomePage.puntos + frmBase.score;
				trace("///////////////");
				trace("HomePage.puntos " + HomePage.puntos)
				
				TweenLite.delayedCall(3, function ():void {
						Gaia.api.goto('index/nav/home/fin_turno');
					return;
				}// end function
            );
				
			} else {
				Gaia.api.goto('index/nav/home');
				MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.doMoverFicha(0-MovieClip(Gaia.api.getPage(Pages.HOME).content).lanzamoneda_mc.moneda_mc.nRandom);
				MovieClip(Gaia.api.getPage(Pages.HOME).content).sfxPlay("loose");
			}
			
			
			
			
			
		}
		
		private function onClickYes(e:Event):void 
		{
			this._BASE.fnShow("frmGame", this._ME);
		}
		
		private function onClickNo(e:Event):void 
		{
			this._BASE.fnShow("frmCreditos", this._ME);
		}
	}
}