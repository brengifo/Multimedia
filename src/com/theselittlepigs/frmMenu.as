package com.theselittlepigs 
{
	import com.greensock.*;
    import flash.display.*;
	import flash.events.Event;
    import flash.utils.*;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class frmMenu extends MovieClip
	{
		private var _BASE:frmBase;
        private var _ME:String;
	
		public var b:MovieClip;
		
		public var continue_btn:SimpleButton;
		
		public function frmMenu(param1:frmBase) 
		{
			this._BASE = param1;
            this._ME = String(getDefinitionByName(getQualifiedClassName(this))).substr(7, String(getDefinitionByName(getQualifiedClassName(this))).length - 8);
            continue_btn.addEventListener('click', onClickSiguiente);
		}
		
		private function onClickSiguiente(e:Event):void 
		{
			gotoAndStop(2);
			continue_btn.removeEventListener('click', onClickSiguiente);
			continue_btn.addEventListener('click', onClickGame);
		}
		
		private function onClickGame(e:Event):void 
		{
			_BASE.fnShow("frmGame", _ME);
		}
		
	}

}