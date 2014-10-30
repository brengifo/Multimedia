package com.as3birds
{
    import flash.display.*;
	import com.greensock.TweenLite;
	import flash.events.Event;
	

    public class frmBase extends MovieClip
    {
        public var _frmMenu:frmMenu;
        public var _frmGame:frmGame;
        public var _frmPreload:frmPreload;
        public var _frmSplash:frmSplash;
        public var _sndEngine:clsSndEngine;
		
        public function frmBase()
        {
            stop();
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
            return;
        }// end function
		
		private function doInit(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			//stage.quality = "LOW";
            this._frmPreload = new frmPreload(this);
            addChildAt(this._frmPreload, 0);
			trace(this);
		}

        public function fnShow(param1:String, param2:String)
        {
            switch(param2)
            {
                case "frmPreload":
                {
                    this._sndEngine = new clsSndEngine();
                    this._sndEngine.fnStartMus("game");
                    removeChild(this._frmPreload);
                    this._frmPreload = null;
                    break;
                }
                case "frmSplash":
                {
                    removeChild(this._frmSplash);
                    this._frmSplash = null;
                    break;
                }
                case "frmMenu":
                {
                    removeChild(this._frmMenu);
                    this._frmMenu = null;
                    break;
                }
                case "frmGame":
                {
                    removeChild(this._frmGame);
                    this._frmGame = null;
                    break;
                }
                default:
                {
                    break;
                }
            }
            switch(param1)
            {
                case "frmPreload":
                {
                    this._frmPreload = new frmPreload(this);
                    addChildAt(this._frmPreload, 0);
                    break;
                }
                case "frmSplash":
                {
                    this._frmSplash = new frmSplash(this);
                    addChildAt(this._frmSplash, 0);
                    break;
                }
                case "frmMenu":
                {
                    this._frmMenu = new frmMenu(this);
                    addChildAt(this._frmMenu, 0);
                    break;
                }
                case "frmGame":
                {
                    this._frmGame = new frmGame(this);
                    addChildAt(this._frmGame, 0);
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

	
		
    }
}
