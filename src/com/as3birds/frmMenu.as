package com.as3birds
{
    import flash.display.*;
    import flash.events.*;
    import flash.net.*;
    import flash.utils.*;

    public class frmMenu extends MovieClip
    {
        public var _conParc:MovieClip;
        private var _BASE:frmBase;
        private var _ME:String;
        public var btnMclelun:MovieClip;
        private var vParcMax:int = 6;

        public function frmMenu(param1:frmBase)
        {
            var _loc_3:clsFlower = null;
            addFrameScript(19, this.frame20);
            this._BASE = param1;
            this._ME = String(getDefinitionByName(getQualifiedClassName(this))).substr(7, String(getDefinitionByName(getQualifiedClassName(this))).length - 8);
            var _loc_2:int = 0;
            while (_loc_2 < this.vParcMax)
            {
                
                _loc_3 = new clsFlower();
                _loc_3.x = Math.random() * 700;
                _loc_3.y = Math.random() * -100;
                _loc_3.gotoAndPlay(Math.ceil(Math.random() * _loc_3.totalFrames));
                _loc_3._vRotationSpeed = Math.random() < 0.5 ? (-1) : (1);
                _loc_3._vYSpeed = Math.ceil(Math.random() * 5) + 1;
                this._conParc.addChild(_loc_3);
                _loc_2++;
            }
            addEventListener(MouseEvent.MOUSE_UP, this.o_mUp, false, 0, true);
            addEventListener(Event.ENTER_FRAME, this.o_enterFrame, false, 0, true);
            this._BASE.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.o_keyDown, false, 0, true);
            return;
        }// end function

        private function o_enterFrame(event:Event) : void
        {
            this.fnMoveParticle();
            return;
        }// end function

        private function fnKill() : void
        {
			try 
			{
				var _loc_1:* = this.vParcMax - 1;
				while (_loc_1 >= 0)
				{
					
					this._conParc.removeChildAt(_loc_1);
					_loc_1 = _loc_1 - 1;
				}
				removeEventListener(MouseEvent.MOUSE_UP, this.o_mUp);
				removeEventListener(Event.ENTER_FRAME, this.o_enterFrame);
				this._BASE.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.o_keyDown);
			} catch (err:Error)
			{
				
			}
            
            return;
        }// end function

        private function o_mUp(event:MouseEvent) : void
        {
            var e:* = event;
            switch(e.target.name)
            {
                case "btnMclelun":
                {
                    try
                    {
                        navigateToURL(new URLRequest("http://www.mclelun.com/"));
                    }
                    catch (e:Error)
                    {
                        trace("Error Opening Page!");
                    }
                    break;
                }
                default:
                {
                    this.fnKill();
                    this._BASE._sndEngine.fnPlaySnd("coin");
                    this._BASE.fnShow("frmGame", this._ME);
                    break;
                    break;
                }
            }
            return;
        }// end function

        function frame20()
        {
            stop();
            return;
        }// end function

        private function o_keyDown(event:KeyboardEvent) : void
        {
            this.fnKill();
            this._BASE._sndEngine.fnPlaySnd("coin");
            this._BASE.fnShow("frmGame", this._ME);
            return;
        }// end function

        private function fnMoveParticle() : void
        {
            var _loc_2:* = undefined;
            var _loc_1:int = 0;
            while (_loc_1 < this.vParcMax)
            {
                
                _loc_2 = this._conParc.getChildAt(_loc_1);
                _loc_2.y = _loc_2.y + _loc_2._vYSpeed;
                _loc_2.rotation = _loc_2.rotation + _loc_2._vRotationSpeed * 10;
                if (_loc_2.y > 700)
                {
                    _loc_2.x = Math.random() * 700;
                    _loc_2.y = Math.random() * -100;
                    _loc_2.gotoAndPlay(Math.ceil(Math.random() * _loc_2.totalFrames));
                    _loc_2._vRotationSpeed = Math.random() < 0.5 ? (-1) : (1);
                    _loc_2._vYSpeed = Math.ceil(Math.random() * 5) + 1;
                }
                _loc_1++;
            }
            return;
        }// end function

    }
}
