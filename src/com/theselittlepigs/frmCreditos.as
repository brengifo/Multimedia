package com.theselittlepigs 
{
	import flash.display.MovieClip;
	import flash.events.Event;
    import flash.utils.*;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class frmCreditos extends MovieClip 
	{
		
		private var _BASE:frmBase;
        private var _ME:String;
		
		public var b:MovieClip;
		
		public function frmCreditos(param1:frmBase) 
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
		
		}
	}

}