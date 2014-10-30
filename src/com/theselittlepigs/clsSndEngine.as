package com.theselittlepigs
{
    import com.greensock.*;
    import flash.media.*;

    public class clsSndEngine extends Object
    {
        private var _musTransformPigs:SoundTransform;
        private var vPlaying:Boolean;
		
		private var _sndBum:Sound;
        private var _sndGot:Sound;
		private var _sndMiss:Sound;
		private var _sndJump:Sound;
        private var _sndClick:Sound;
		
		private var _musGame:Sound;
        private var _musChannel:SoundChannel;
		
        private var _sndChannel:SoundChannel;
        
        public function clsSndEngine()
        {
            //this._musGame = new musGamePigs();
            this._sndClick = new sndClick();
            this._sndBum = new sndBum();
            this._sndGot = new sndGot();
			this._sndMiss = new sndMiss();
			this._sndJump = new sndJump();
			
            this._musTransformPigs = new SoundTransform(0);
            return;
        }// end function

        public function fnStopMus() : void
        {
            TweenLite.to(this._musTransformPigs, 1, {volume:0, onUpdate:this.o_musFade, onComplete:this.o_musOut});
            return;
        }// end function

        private function o_musIn() : void
        {
            this._musTransformPigs.volume = 1;
            this._musChannel.soundTransform = this._musTransformPigs;
            return;
        }// end function

        public function fnMuteMus() : void
        {
            if (this.vPlaying)
            {
                this.vPlaying = false;
                this._musTransformPigs.volume = 0.1;
                this._musChannel.soundTransform = this._musTransformPigs;
            }
            else
            {
                this.vPlaying = true;
                this._musTransformPigs.volume = 1;
                this._musChannel.soundTransform = this._musTransformPigs;
            }
            return;
        }// end function

        private function o_musOut() : void
        {
            this._musTransformPigs.volume = 0;
            this._musChannel.soundTransform = this._musTransformPigs;
            this._musChannel.stop();
            return;
        }// end function

        public function fnStopMusNow() : void
        {
            this._musTransformPigs.volume = 0;
            this._musChannel.soundTransform = this._musTransformPigs;
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
            this._musChannel.soundTransform = this._musTransformPigs;
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
                case "jump":
                {
                    this._sndJump.play();
                    break;
                }
                case "bum":
                {
                    this._sndBum.play();
                    break;
                }
				case "miss":
                {
                    this._sndMiss.play();
                    break;
                }
				
				case "got":
                {
                    this._sndGot.play();
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
					trace("fnstartmus ");
                    //this._musChannel = this._musGame.play(0, int.MAX_VALUE, this._musTransformPigs);
                    //TweenLite.to(this._musTransformPigs, 0.5, {volume:1, onUpdate:this.o_musFade, onComplete:this.o_musIn});
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
