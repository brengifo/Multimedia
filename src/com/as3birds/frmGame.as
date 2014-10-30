package com.as3birds
{
    import com.greensock.*;
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.text.*;
    import flash.utils.*;	
	import pages.NavPage;
	//import pages.NavPage;
	import pages.Pages;
    //import com.as3birds.frmGame.*;
	import com.demonsters.debugger.MonsterDebugger;
	
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	

    public class frmGame extends MovieClip
    {
        private var vPipeMax:int = 3;
        protected const vMapH:int = 400;
        public var _conPlayer:MovieClip;
        private var vBusy:Boolean = false;
        private var vIsPause:Boolean = false;
        protected const vMapW:int = 700;
        public var _conMap:MovieClip;
        private var f_txt_outline:GlowFilter;
        private var vTalkList:Array;
        private var _BASE:frmBase;
        public var txtScores:TextField;
        private var vTick:int = 0;
        public var txtScoresBest:TextField;
        private var _ME:String;
        private var tTick:Timer;
        private var vScoresBest:int = 0;
        private var vScores:int = 0;
        private var vCombo:int = 0;
        public var _conParc:MovieClip;
        private var vXSpeed:int = 10;
        private var _P:clsBird;
        private var vParcMax:int = 2;
        private var vIsFlap:Boolean = false;
        public var _FADE:MovieClip;
        public var btnReplay:MovieClip;
        public var _BG:MovieClip;
        private var vYSpeed:Number = 0;
		public var txtCredits:TextField; 
		
		private var oLifes = 2;
		private var nStars:int;

        public function frmGame(param1:frmBase)
        {
            //this.vTalkList = ["e=mc2", "Mírame!", "¡Estoy volando!", "JAJA!", "BANANA", "PAPAYA", "CHEESE BURGER", "WeeeeEE!", "Back flip!", "Woooo00!", "kkkkk", "Huhuhuhu", "Wkwkwkwk", "555555", "tanikudikla", "¡Soy PRO!", "¡Soy hermoso!", "¡Soy taaan lindo!", "Yeaaaaaa!", "¡AYUDA!", "TOLONG!", "WTF?!", "OH YEAH :D", "360 spin", "¡Esto es un triste clon!", "¡Escucha la musica!", "¡Se compra algo en este juego?", "Oi!"];
			this.vTalkList = ["e=mc2", "Mírame!", "¡Estoy volando!", "JAJA!", "BANANA", "PAPAYA", "¡Soy PRO!", "¡Soy hermoso!", "¡Soy taaan lindo!", "¡AYUDA!", "¡Escucha la musica!", "¡Se compra algo en este juego?", "Oi!"];
            this._BASE = param1;
            this._ME = String(getDefinitionByName(getQualifiedClassName(this))).substr(7, String(getDefinitionByName(getQualifiedClassName(this))).length - 8);
            this.fnGameStart();
            return;
        }// end function

        private function o_mUp(event:MouseEvent) : void
        {
            if (this.vIsPause)
            {
                if (!this.vBusy)
                {
                    this.fnGameRestart();
                }
            }
            else
            {
                this.vIsFlap = true;
            }
            return;
        }// end function

        private function fnGameStart() : void
        {
            var _loc_2:clsPipe = null;
            var _loc_3:clsFeather = null;
            this._P = new clsBird();
            this._P.x = this.vMapW / 4;
            this._P.y = this.vMapH / 3;
            this._conPlayer.addChild(this._P);
            this.f_txt_outline = new GlowFilter(1852251, 1, 2, 2, 10, 2, false);
            this._P.txtTalk.filters = [this.f_txt_outline];
            var _loc_1:int = 0;
            while (_loc_1 < this.vPipeMax)
            {
                
                _loc_2 = new clsPipe();
                _loc_2.x = _loc_1 * 350 + 1050;
                _loc_2.y = Math.random() * 250;
                this._conMap.addChild(_loc_2);
                _loc_1++;
            }
            this._FADE.visible = false;
            this.btnReplay.visible = false;
            addEventListener(MouseEvent.MOUSE_UP, this.o_mUp, false, 0, true);
            addEventListener(Event.ENTER_FRAME, this.o_enterFrame, false, 0, true);
            this._BASE.stage.addEventListener(KeyboardEvent.KEY_DOWN, this.o_keyDown, false, 0, true);
            this.tTick = new Timer(1000);
            this.tTick.addEventListener(TimerEvent.TIMER, this.o_timeTick, false, 0, true);
            this.tTick.start();
            _loc_1 = 0;
            while (_loc_1 < this.vParcMax)
            {
                
                _loc_3 = new clsFeather();
                _loc_3.x = this._P.x;
                _loc_3.y = this._P.y;
                _loc_3._vRotationSpeed = Math.random() < 0.5 ? ((Math.ceil(Math.random() * 5) + 1) * -1) : ((Math.ceil(Math.random() * 5) + 1));
                _loc_3._vYSpeed = Math.ceil(Math.random() * 10) + 1;
                _loc_3._vXSpeed = Math.ceil(Math.random() * 10) + 1;
                this._conParc.addChild(_loc_3);
                _loc_1++;
            }
            return;
        }// end function

        private function fnKill() : void
        {
			try 
			{
				removeEventListener(TimerEvent.TIMER, this.o_timeTick);
				removeEventListener(MouseEvent.MOUSE_UP, this.o_mUp);
				removeEventListener(Event.ENTER_FRAME, this.o_enterFrame);
            this._BASE.stage.removeEventListener(KeyboardEvent.KEY_DOWN, this.o_keyDown);
			} catch (e:Error) {
			}
            
            return;
        }// end function

        private function fnGameOver() : void
        {
            this.vBusy = true;
            this._FADE.visible = true;
            this._FADE.alpha = 1;
            TweenLite.to(this._FADE, 0.5, {alpha:0, onComplete:function () : void
            {
                _FADE.visible = false;
                vBusy = false;
                return;
            }// end function
            });
            this._P.gotoAndStop(1);
            this._BG.gotoAndStop(1);
            this._BASE._sndEngine.fnPlaySnd("heart");
            this._P.txtTalk.text = "NOOOO!";
            this.vIsPause = true;
            this.tTick.stop();
            //this.btnReplay.visible = true;
			--oLifes;
			if (oLifes > 0) 
			{
				this.btnReplay.visible = true;
			} else {
				trace("cargar fin");
				removeEventListener(MouseEvent.MOUSE_UP, this.o_mUp);
				
				if (this.vScores > this.vScoresBest)
				{
					this.vScoresBest = this.vScores;
				} 
				
				trace("this.vScores " + this.vScores);
				trace("this.vScoresBest " + this.vScoresBest);
				
				if (this.vScoresBest > 0) 
				{					
					
					
					// activar flag de que ganó
					//MovieClip(Gaia.api.getPage(Pages.NAV).content).bWin = true;
					//MovieClip(Gaia.api.getPage(Pages.NAV).content).puntosGame = vScoresBest;
					trace("win");
					NavPage.bWin = true;
					NavPage.puntosGame = vScoresBest;
					setStars(vScoresBest);
					NavPage.nStars = nStars;
					
					MovieClip(Gaia.api.getPage(Pages.NAV).content).sumarPuntos(vScoresBest);
					
					//MovieClip(parent.parent).sumarPuntos(this.vScoresBest);					  
					//MovieClip(Gaia.api.getPage(Pages.HOME).content).sumarPuntos(vScoresBest);
					Gaia.api.goto('index/nav/home/fin_turno');
					return;
				/*TweenLite.delayedCall(.5, function ():void {
						Gaia.api.goto('index/nav/home/fin_turno');
						//Gaia.api.getPage(Pages.HOME).content.playLoop();
						return;
						}// end function
					);*/
					
				} else {
					trace("loose");
					Gaia.api.goto('index/nav/home');
					// activar flag de que perdió
					NavPage.bWin = false;
					//MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.doMoverFicha(0 - MovieClip(Gaia.api.getPage(Pages.HOME).content).lanzamoneda_mc.moneda_mc.nRandom);
					MovieClip(Gaia.api.getPage(Pages.NAV).content).sfxPlay("loose");					
					// Gaia.api.getPage(Pages.HOME).content.playLoop();
					
				}
			}		
			
            return;
        }// end function
		
		private function setStars(nPuntosTotal:int):void 
		{
			if (nPuntosTotal > 0 && nPuntosTotal < 30) 
			{
				nStars = 1;
			} else if (nPuntosTotal > 30 && nPuntosTotal < 50) {
				nStars = 2;
			} else if (nPuntosTotal > 50) {
				nStars = 3;
			}			
		}

        private function o_enterFrame(event:Event) : void
        {
            if (!this.vIsPause)
            {
                this.fnMovePlayer();
                this.fnMoveParticle();
                this.fnMoveMap();
            }
            return;
        }// end function

        private function o_keyDown(event:KeyboardEvent) : void
        {
            if (this.vIsPause)
            {
                if (!this.vBusy)
                {
                    this.fnGameRestart();
                }
            }
            else
            {
                this.vIsFlap = true;
            }
            return;
        }// end function
		
		private function o_timeTick(param1:TimerEvent) : void
		 {
			 this.vTick++;
			 if(this.vTick == 3)
			 {
				if(this._P.txtTalk.text != "")
				{
				   this._P.txtTalk.text = "";
				}
				else
				{
				   this._P.txtTalk.text = this.vTalkList[Math.floor(Math.random() * this.vTalkList.length)];
				}
				this.vTick = 0;
			 }
		 }

        private function fnGameRestart() : void
        {
            var _loc_2:* = undefined;
          //  this._BASE._sndEngine.fnPlaySnd("coin");
            this.vCombo = 0;
            this._P.txtTalk.text = "";
            this.vTick = 0;
            this.tTick.start();
            this.vIsPause = false;
            this.vYSpeed = 0;
			this.vXSpeed = 10;
            this.btnReplay.visible = false;
            if (this.vScores > this.vScoresBest)
            {
                this.vScoresBest = this.vScores;
            }
            this.txtScoresBest.text = this.vScoresBest.toString();
            this.vScores = 0;
            this.txtScores.text = this.vScores.toString();
			
			this.txtCredits.text = oLifes.toString();
			
            this._P.x = this.vMapW / 4;
            this._P.y = this.vMapH / 3;
            var _loc_1:int = 0;
            while (_loc_1 < this.vPipeMax)
            {
                
                _loc_2 = this._conMap.getChildAt(_loc_1);
                _loc_2.x = _loc_1 * 350 + 1050;
                _loc_2.y = Math.random() * 250;
                _loc_1++;
            }
            return;
        }// end function

        private function fnMoveParticle() : void
        {
            var _loc_2:* = undefined;
            var _loc_1:int = 0;
            while (_loc_1 < this.vParcMax)
            {
                
                _loc_2 = this._conParc.getChildAt(_loc_1);
                _loc_2.x = _loc_2.x - _loc_2._vXSpeed;
                _loc_2.y = _loc_2.y + _loc_2._vYSpeed;
                _loc_2.rotation = _loc_2.rotation + _loc_2._vRotationSpeed * 10;
                if (_loc_2.y > 1000 || _loc_2.x < -100)
                {
                    _loc_2.x = this._P.x;
                    _loc_2.y = this._P.y;
                    _loc_2._vRotationSpeed = Math.random() < 0.5 ? ((Math.ceil(Math.random() * 5) + 1) * -1) : ((Math.ceil(Math.random() * 5) + 1));
                    _loc_2._vYSpeed = Math.ceil(Math.random() * 10) + 1;
                    _loc_2._vXSpeed = Math.ceil(Math.random() * 10) + 1;
                }
                _loc_1++;
            }
            return;
        }// end function
		
		private function fnMoveMap() : void
      {
         var tmpPipe:* = undefined;
         var tmpChange:int = 0;
         var i:int = 0;
		 
		
		 
         while(i < this.vPipeMax)
         {
            tmpPipe = this._conMap.getChildAt(i);
            if(tmpPipe._HIT.hitTestPoint(this._P.x+MovieClip(parent).x ,this._P.y+MovieClip(parent).y,true))
            {
				this.fnGameOver();
            }
            else if(tmpPipe.x < 0)
            {
               tmpPipe.x = 1050 - this.vXSpeed;
               tmpPipe.y = Math.random() * 250;
               this.vScores++;
               this.vCombo++;
               this.txtScores.text = this.vScores.toString();
			   
			   if (vScores == 0 || vScores < 10) 
			   {
				   vXSpeed = 10;
			   } else if (vScores < 20) 
			   {
				   vXSpeed = 12;
			   } else if (vScores < 30) 
			   {
				   vXSpeed = 14;
			   } else if (vScores < 40) 
			   {
				   vXSpeed = 16;
			   } else if (vScores < 50) 
			   {
				   vXSpeed = 18;
			   }
			   
               if(this.vCombo > 4)
               {
                  this.vCombo = 0;
                  this._FADE.visible = true;
                  this._FADE.alpha = 1;
                  TweenLite.to(this._FADE,0.5,{
                     "alpha":0,
                     "onComplete":function():void
                     {
                        _FADE.visible = false;
                     }
                  });
                  this._BASE._sndEngine.fnPlaySnd("heart");
                  tmpChange = Math.ceil(Math.random() * this._P.totalFrames);
                  this._P.gotoAndStop(tmpChange);
                  this._BG.gotoAndStop(2);
               }
            }
            else
            {
               tmpPipe.x = tmpPipe.x - this.vXSpeed;
            }
            
            i++;
         }
      }

        private function fnMovePlayer() : void
        {
            if (this._P.y < this.vMapH + this._P.height && this._P.y > -this._P.height)
            {
                if (!this.vIsFlap)
                {
                    this.vYSpeed = this.vYSpeed + 1.3;
                }
                else
                {
                    this._P._ART.play();
                    this.vYSpeed = -13;
                    this.vIsFlap = false;
                }
                this._P.y = this._P.y + this.vYSpeed;
                /*if (this._P.currentFrame >= 25)
                {
                    this._P._ART.rotation = 0;
                }
                else
                {
                    this._P._ART.rotation = this._P.y * 2;
                }*/
				this._P._ART.rotation = this._P.y * 2;
            }
            else
            {
                this.fnGameOver();
            }
            return;
        }// end function

    }
}
