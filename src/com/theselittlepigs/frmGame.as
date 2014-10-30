package com.theselittlepigs 
{
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	import com.greensock.*;
	import com.theselittlepigs.frmBase;
	import com.theselittlepigs.game.Ja;
	import com.theselittlepigs.game.pb0;
    import flash.display.*;
	import flash.events.Event;
    import flash.utils.*;
	import com.theselittlepigs.game.One;
	
	public class frmGame extends MovieClip
	{
		public var xmin:int;
		public var xmax:int;
		public var _BASE:frmBase;
        public var _ME:String;
		
		public var pb:MovieClip;
		public var drag:MovieClip;
		public var bg:MovieClip;
		public var grass:MovieClip;
		public var p0:MovieClip;
		public var jam:MovieClip;
		
		public var mcOne:MovieClip;
		
		//public static var oGameSettings:Object;
		
		public var pigTwo:MovieClip;
		
		public var bird:MovieClip;
		public var cake:MovieClip;
		public var tick:MovieClip;
		
		public var score_mc:MovieClip;
		public var icon:MovieClip;
		public var icon_mc:MovieClip;
		public var timeicon:MovieClip;
		public var time_mc:MovieClip;
		
		
		
		public function frmGame(param1:frmBase) 
		{
			var p_base:* = param1;
            _BASE = p_base;
            _ME = String(getDefinitionByName(getQualifiedClassName(this))).substr(7, String(getDefinitionByName(getQualifiedClassName(this))).length - 8);
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event= null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
		/*	duplicateMovieClip("pb0", "pb", 1000 + 16384.0);
			duplicateMovieClip("ja", "jam", 1001 + 16384.0);
			duplicateMovieClip("p00", "p0", 2 + 16384.0);
			duplicateMovieClip("gras", "grass", 1 + 16384.0);*/
			
			frmBase.xmin = 50;
			frmBase.xmax = 440;
			
			frmBase.p = 10;
			frmBase.birddelay = 300;
			frmBase.level = 800;
			frmBase.birdview = 120;			
			frmBase.time = 90;
			frmBase.jamspeed = 4;
			frmBase.bonustime = 20;
			frmBase.energy = 2;
			frmBase.speed = 5;
			frmBase.bgspeed = 4;
			frmBase.ymove = 60;
			//frmBase.grav = 110;
			frmBase.power = -220;
			frmBase.score = 0;
			frmBase.point = 10;
			frmBase.cakepoint = 100;
			frmBase.now = 0;
			frmBase.now2;
			frmBase.xspace = 25;
			frmBase.yspace = 75;
			frmBase.lname = "p0";
			frmBase.canjump = 1;
			frmBase.cakespace = 0 - 400;
			frmBase.cakefall = 0;
			frmBase.xdes = 30;
			frmBase.ydes = 16;
			//frmBase.oTarget = null;
			
			grass = new gras();
			grass.name = "grass";
			addChild(grass);
			grass.x = 249.75;
			grass.y = 472.1;
			
			//duplicateMovieClip("p00", "p0", 2 + 16384.0);
			p0 = new p00();
			p0.name = "p0";
			addChild(p0);
			p0.x = 250;
			p0.y = 475;
			
			
			frmBase.atas = p0.y - frmBase.yspace;
			frmBase.bawah = p0.y - 55;
			frmBase.kiri = p0.x - frmBase.xspace;
			frmBase.kanan = p0.x + frmBase.xspace;
			
			pb = new pb0();
			pb.name = "pb";
			addChild(pb);
			pb.y = 360;
			
			jam = new Ja();
			jam.name = "jam";
			addChild(jam);
			
			updateScore(frmBase.score);
			updateIcon(frmBase.energy);
		}
		
		public function playSound(s:String):void 
		{
			this._BASE._sndEngine.fnPlaySnd(s);
		}
		
		public function initEventListener(simpleButton:SimpleButton):void 
		{
			simpleButton.addEventListener('click', onClickBaloon);			
		}
			
		private function onClickBaloon(e:Event):void 
		{
			if (frmBase.canjump == 1) 
			{
				if (pb.x > 10 && pb.x < 440)
				{				
					frmBase.pname = "p" + frmBase.p;
					var px:Number = pb.x;
					var py:Number = pb.y;
					mcOne = new One();
					mcOne.name = frmBase.pname;
					trace("GAME oGameSettings.pname "+frmBase.pname)
					frmBase.oTarget = mcOne;
					addChild(frmBase.oTarget);
					trace("mcOne en oTarget "+frmBase.oTarget);
					//doSwap(mcOne);
					frmBase.oTarget.x = px;
					frmBase.oTarget.y = py;
					
					trace("px " + px);
					trace("py " + py);
					
					frmBase.fall = 0;	
					drag.gotoAndPlay("jump");
					frmBase.p = frmBase.p + 1;
					frmBase.canjump = 0;
					e.currentTarget.parent.parent.parent.gotoAndPlay("jump");
					_BASE._sndEngine.fnPlaySnd("jump");
					//removeChild(oGameSettings.oTarget);
				}
			}	
		}
		
		private function doSwapMcOne(e:Event):void 
		{

		}
		
		public function updateScore(n:int):void 
		{
			
			score_mc.txt.text = n;
		}
		
		public function updateIcon(n:int):void 
		{			
			icon_mc.txt.text = n;
		}
		
		public function doPig2(_x:int, _y:int, _ro:int):void 
		{
			pigTwo = new pig2();
			pigTwo.name = frmBase.pname;
			addChild(pigTwo);
			pigTwo.y = _y + 25;
			pigTwo.x = _x;
		
			pigTwo.p.rotation = _ro;
			pigTwo.p.x = -_ro / 4;
			try 
			{
				pigTwo.s.x = -_ro / 4;
			} catch (e:Error) {
				trace(e);
			}
		}
		
		public function doSwap(mc:MovieClip):void 
		{			
			var otherindex = getChildIndex(pb);
			//Behind that thing:
			setChildIndex(pigTwo, otherindex);
			setChildIndex(mc, otherindex)
		}
		
		public function cargarFin():void 
		{
		/*	trace("r pb");
			removeChild(pb);
			trace("r jam");t
			removeChild(jam);
			trace("r p0");
			removeChild(p0);
			trace("r grass");
			removeChild(grass);
			
			for (var i = 0; oGameSettings.p >= i; i = i + 1)
			{
				trace("i "+i);
				/*if (getChildByName("p"+i) != null) 
				{
					//removeChild(getChildByName("p"+i));
				}
				
			} // end of for
*/
			this._BASE.fnShow("frmEnd", this._ME);
		}
		
		
		
	}


}