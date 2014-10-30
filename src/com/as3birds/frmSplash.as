package com.as3birds
{
    import com.greensock.*;
    import flash.display.*;
    import flash.utils.*;

    public class frmSplash extends MovieClip
    {
        private var _BASE:frmBase;
        private var _ME:String;
        private var vCount:int = 0;

        public function frmSplash(param1:frmBase)
        {
            var p_base:* = param1;
            this._BASE = p_base;
            this._ME = String(getDefinitionByName(getQualifiedClassName(this))).substr(7, String(getDefinitionByName(getQualifiedClassName(this))).length - 8);
            TweenLite.delayedCall(0.2, function () : void
            {
                _BASE.fnShow("frmMenu", _ME);
                return;
            }// end function
            );
            return;
        }// end function

    }
}
