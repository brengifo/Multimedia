package com.theselittlepigs {
	import flash.display.MovieClip;
	import flash.events.Event;

	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class frmBase extends MovieClip
	{
		public var _frmSplash:frmSplash;
		public var _frmMenu:frmMenu;
		public var _frmGame:frmGame;
		public var _frmEnd:frmEnd;
		public var _frmCreditos:frmCreditos;
		
		public static var oGameSettings:Object = new Object();
		
		public var _sndEngine:clsSndEngine;
		
		public function frmBase() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);			
		}
		
		public static function get xmin():int
		{
			return oGameSettings.xmin;
		}
		
		public static function set xmin(n:int):void
		{
			oGameSettings.xmin = n;
		}
		
		public static function get xmax():int
		{
			return oGameSettings.xmax;
		}
		
		public static function set xmax(n:int):void
		{
			oGameSettings.xmax = n;
		}
		
		public static function get speed():int
		{
			return oGameSettings.speed;
		}
		
		public static function set speed(n:int):void
		{
			oGameSettings.speed = n;
		}
		
		public static function set power(n:int):void
		{
			oGameSettings.power = n;
		}
		
		public static function get power():int
		{
			return oGameSettings.power;
		}
		
		public static function get grav():int
		{
			return oGameSettings.grav;
		}
		
		public static function set grav(n:int):void
		{
			oGameSettings.grav = int;
		}
		
		
		
		public static function get fall():int
		{
			return oGameSettings.fall;
		}
		
		public static function set fall(n:int):void
		{
			oGameSettings.fall = n;
			//return oGameSettings.fall;
		}
		
		public static function set canjump(n:int):void
		{
			oGameSettings.canjump = n;		
		}
		
		public static function get canjump():int
		{
			return oGameSettings.canjump;
		}
		
		public static function get oTarget():MovieClip
		{
			return oGameSettings.oTarget;
		}
		
		public static function set oTarget(mc:MovieClip):void
		{
			oGameSettings.oTarget = mc;
		}
		
		public static function get atas():Number
		{
			return oGameSettings.atas;
		}
		
		public static function set atas(n:Number):void
		{
			oGameSettings.atas = n;
		}
		
		public static function get bawah():Number
		{
			return oGameSettings.bawah;
		}
		
		public static function set bawah(n:Number):void
		{
			oGameSettings.bawah = n;
		}
		
		public static function get kiri():Number
		{
			return oGameSettings.kiri;
		}
		
		public static function set kiri(n:Number):void
		{
			oGameSettings.kiri = n;
		}
		
		public static function get kanan():Number
		{
			return oGameSettings.kanan;
		}
		
		public static function set kanan(n:Number):void
		{
			oGameSettings.kanan = n;
		}
		
		public static function get lname():String
		{
			return oGameSettings.lname;
		}
		
		public static function set lname(s:String):void
		{
			oGameSettings.lname = s;
		}
		
		public static function get pname():String
		{
			return oGameSettings.pname;
		}
		
		public static function set pname(s:String):void
		{
			oGameSettings.pname = s;
		}
		
		public static function get yspace():int
		{
			return oGameSettings.yspace;
		}
		
		public static function set yspace(n:int)
		{
			oGameSettings.yspace = n;
		}
		
		public static function get xspace():int
		{
			return oGameSettings.xspace;
		}
		public static function set xspace(n:int):void
		{
			oGameSettings.xspace = n;
		}
		
		public static function get score():int
		{
			return oGameSettings.score;
		}
		
		public static function set score(n:int):void
		{
			oGameSettings.score = n;
		}
		
		public static function get point():int
		{
			return oGameSettings.point;
		}
		
		public static function set point(n:int)
		{
			oGameSettings.point = n;
		}
		
		public static function get bonustime():int
		{
			return oGameSettings.point;
		}
		
		public static function set bonustime(n:int)
		{
			oGameSettings.bonustime = n;
		}
		
		public static function get now():int
		{
			return oGameSettings.now;
		}
		
		public static function set now(n:int):void
		{
			oGameSettings.now = n;
		}
		
		public static function get ymove():int
		{
			return oGameSettings.ymove;
		}
		public static function set ymove(n:int):void
		{
			oGameSettings.ymove = n;
		}
		public static function get bgspeed():int
		{
			return oGameSettings.bgspeed;
		}
		
		public static function set bgspeed(n:int)
		{
			oGameSettings.bgspeed = n;
		}
			
		public static function get p():int
		{
			return oGameSettings.p;
		}
		public static function set p(n:int):void
		{
			oGameSettings.p = n;
		}
		public static function get jamspeed():Number
		{
			return oGameSettings.jamspeed;
		}
		public static function set jamspeed(n:Number):void
		{
			oGameSettings.jamspeed = n;
		}
		public static function get birddelay():int
		{
			return oGameSettings.birddelay;
		}
		
		public static function set birddelay(n:int):void
		{
			oGameSettings.birddelay = n;
		}
		
		public static function get birdview():int
		{
			return oGameSettings.birdview;
		}
		
		public static function set birdview(n:int):void
		{
			oGameSettings.birdview = n;
		}
		
		public static function get time():Number
		{
			return oGameSettings.time;
		}
		
		public static function set time(n:Number):void
		{
			oGameSettings.time = n;
		}
		
		
		public static function get cakefall():int
		{
			return oGameSettings.cakefall;
		}
		public static function set cakefall(n:int):void
		{
			oGameSettings.cakefall = n;
		}
		public static function get cakespace():int
		{
			return oGameSettings.cakespace;
		}
		public static function set cakespace(n:int):void
		{
			oGameSettings.cakespace = n;
		}
		public static function get cakepoint():int
		{
			return oGameSettings.cakepoint;
		}
		public static function set cakepoint(n:int):void
		{
			oGameSettings.cakepoint = n;
		}
		
		public static function get now2():int
		{
			return oGameSettings.now2;
		}
		public static function set now2(n:int):void
		{
			oGameSettings.now2 = n;
		}
		
		
		
		public static function get xdes():int
		{
			return oGameSettings.xdes;
		}
		public static function set xdes(n:int):void
		{
			oGameSettings.xdes = n;
		}
		public static function get ydes():int
		{
			return oGameSettings.ydes;
		}
		public static function set ydes(n:int):void
		{
			oGameSettings.ydes = n;
		}
		
		public static function get energy():int
		{
			return oGameSettings.energy;
		}
		public static function set energy(n:int):void
		{
			oGameSettings.energy = n;
		}
		
		public static function get level():int
		{
			return oGameSettings.level;
		}
		public static function set level(n:int):void
		{
			oGameSettings.level = n;
		}
		
		public static function get why():String
		{
			return oGameSettings.why;
		}
		public static function set why(s:String):void
		{
			oGameSettings.why = s;
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			oGameSettings.xmin = 50;
			oGameSettings.xmax = 440;
			
			oGameSettings.p = 10;
			oGameSettings.birddelay = 300;
			oGameSettings.level = 800;
			oGameSettings.birdview = 120;			
			oGameSettings.time = 90;
			oGameSettings.jamspeed = 4;
			oGameSettings.bonustime = 20;
			oGameSettings.energy = 7;
			oGameSettings.speed = 5;
			oGameSettings.bgspeed = 4;
			oGameSettings.ymove = 60;
			oGameSettings.grav = 110;
			oGameSettings.power = -220;
			oGameSettings.score = 0;
			oGameSettings.point = 10;
			oGameSettings.cakepoint = 500;
			oGameSettings.now = 0;
			oGameSettings.now2;
			oGameSettings.xspace = 25;
			oGameSettings.yspace = 75;
			oGameSettings.lname = "p0";
			oGameSettings.canjump = 1;
			oGameSettings.cakespace = 0 - 400;
			oGameSettings.cakefall = 0;
			oGameSettings.xdes = 30;
			oGameSettings.ydes = 16;
			oGameSettings.oTarget = null
			
			//stage.quality = "LOW";
			this._frmSplash = new frmSplash(this);
			addChildAt(this._frmSplash, 0);		
		/*	this._frmGame = new frmGame(this);
			addChildAt(this._frmGame, 0);	*/
			return;		
		}
		
		
		public function fnShow(param1:String, param2:String)
        {
            switch(param2)
            {
				case "frmPreload":
                {
                   /* this._sndEngine = new clsSndEngine();
                    this._sndEngine.fnStartMus("game");
                    removeChild(this._frmPreload);
                    this._frmPreload = null;
                    break;*/
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
				case "frmEnd":
                {
					removeChild(this._frmEnd);
                    this._frmEnd = null;
                    break;
                }
				case "frmCreditos":
                {
					removeChild(this._frmCreditos);
                    this._frmCreditos = null;
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
                   /* this._frmPreload = new frmPreload(this);
                    addChildAt(this._frmPreload, 0);
                    break;*/
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
					this._sndEngine = new clsSndEngine();
                    this._sndEngine.fnStartMus("game");
					this._frmGame = new frmGame(this);
                    addChildAt(this._frmGame, 0);
                    break;
                }
				case "frmEnd":
                {
					this._frmEnd = new frmEnd(this);
                    addChildAt(this._frmEnd, 0);
                    break;
                }
				case "frmCreditos":
                {
					this._frmCreditos = new frmCreditos(this);
                    addChildAt(this._frmCreditos, 0);
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