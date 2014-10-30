package com.as3birds
{
    import flash.display.*;
    import flash.events.*;
    import flash.utils.*;

    public class frmPreload extends MovieClip
    {
        private var _BASE:frmBase;
        public var mcLoader:MovieClip;
        private var vPerc:Number;
        private var _ME:String;

        public function frmPreload(param1:frmBase)
        {
            this._BASE = param1;
            this._ME = String(getDefinitionByName(getQualifiedClassName(this))).substr(7, String(getDefinitionByName(getQualifiedClassName(this))).length - 8);
            addEventListener(Event.ENTER_FRAME, this.o_enterFrame, false, 0, true);
            return;
        }// end function

        private function o_enterFrame(event:Event) : void
        {
            this.vPerc = Math.round(this._BASE.loaderInfo.bytesLoaded / this._BASE.loaderInfo.bytesTotal * 100);
            this.mcLoader.gotoAndStop(this.vPerc);
            this.mcLoader.txtStatus.text = "CARGANDO   [ " + this.vPerc.toString() + "% ]";
            if (root.loaderInfo.bytesLoaded == root.loaderInfo.bytesTotal)
            {
                removeEventListener(Event.ENTER_FRAME, this.o_enterFrame);
                this._BASE.gotoAndStop(3);
                this._BASE.fnShow("frmSplash", this._ME);
            }
            return;
        }// end function

    }
}
