package com.as3birds
{
    import com.greensock.*;
    import flash.media.*;

    public class clsSndEngine extends Object
    {
        private var _musTransform:SoundTransform;
        private var _sndHeart:Sound;
        private var vPlaying:Boolean;
        private var _sndCoin:Sound;
        private var _musGame:Sound;
        private var _musChannel:SoundChannel;
        private var _sndChannel:SoundChannel;
        private var _sndClick:Sound;

        public function clsSndEngine()
        {
            this._musGame = new musGame();
            this._sndClick = new sndClick();
            this._sndHeart = new sndHeart();
            this._sndCoin = new sndCoin();
            this._musTransform = new SoundTransform(0);
            return;
        }// end function

        public function fnStopMus() : void
        {
            TweenLite.to(this._musTransform, 1, {volume:0, onUpdate:this.o_musFade, onComplete:this.o_musOut});
            return;
        }// end function

        private function o_musIn() : void
        {
            this._musTransform.volume = 1;
            this._musChannel.soundTransform = this._musTransform;
            return;
        }// end function

        public function fnMuteMus() : void
        {
            if (this.vPlaying)
            {
                this.vPlaying = false;
                this._musTransform.volume = 0.1;
                this._musChannel.soundTransform = this._musTransform;
            }
            else
            {
                this.vPlaying = true;
                this._musTransform.volume = 1;
                this._musChannel.soundTransform = this._musTransform;
            }
            return;
        }// end function

        private function o_musOut() : void
        {
            this._musTransform.volume = 0;
            this._musChannel.soundTransform = this._musTransform;
            this._musChannel.stop();
            return;
        }// end function

        public function fnStopMusNow() : void
        {
            this._musTransform.volume = 0;
            this._musChannel.soundTransform = this._musTransform;
            this._musChannel.stop();
            return;
        }// end function

        public function fnStopAll() : void
        {
            SoundMixer.stopAll();
            return;
        }// end function

        private function o_musFade() : void
        {
            this._musChannel.soundTransform = this._musTransform;
            return;
        }// end function

        public function fnPlaySnd(param1:String) : void
        {
            switch(param1)
            {
                case "click":
                {
                    this._sndClick.play();
                    break;
                }
                case "heart":
                {
                    this._sndHeart.play();
                    break;
                }
                case "coin":
                {
                    this._sndCoin.play();
                    break;
                }
                default:
                {
                    break;
                }
            }
            return;
        }// end function

        public function fnStartMus(param1:String) : void
        {
            switch(param1)
            {
                case "game":
                {
                    this._musChannel = this._musGame.play(0, int.MAX_VALUE, this._musTransform);
                    TweenLite.to(this._musTransform, 0.5, {volume:1, onUpdate:this.o_musFade, onComplete:this.o_musIn});
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
