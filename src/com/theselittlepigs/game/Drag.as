package com.theselittlepigs.game 
{
	import com.theselittlepigs.frmBase;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Drag extends MovieClip
	{
		public var vy:Number;
		public var target:MovieClip;
		
		public var n:Number;
		public var counter:Number;
		public var input:Number;
		public var output:Number;
		public var kidx:Number;
		public var kidy:Number;
		//public var hadap:int;
		public var newx:Number;
		public var ro:Number;
		public var pigTwo:MovieClip;
		
		public function Drag() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			addFrameScript(0, doFrame1);
			addFrameScript(3, doFrame4);
			addFrameScript(4, doFrame5);
			addFrameScript(5, doFrame6);
			addFrameScript(9, doFrame10);
		}
		
		public function doFrame1():void 
		{
			stop();
		}
		
		public function doFrame4():void 
		{
			vy = frmBase.power;
			target = frmBase.oTarget;
		}
		
		public function doFrame5():void 
		{
			vy = vy + frmBase.grav / 10;
			if (vy > 0 && frmBase.fall == 0) {
				//trace("vy > 0");
				frmBase.fall = 1;
				target.p.gotoAndPlay("fall");
			}
			y = target.y + vy / 10;
			target.y = y;
			if (y > 580) {
				
				frmBase.canjump = 1;	
				var clip:MovieClip = MovieClip(frmBase.oTarget);
				try 
				{
					
					
					clip.parent.removeChild(clip);
					MovieClip(parent)["icon"].gotoAndPlay(2);
				} catch (e:Error) {
					
				}
				
				//frmGame.oTarget = null;
			} else {
				target.y = y;	
				kidx = target.x;
				
				/*if (hadap == 2) {
					if (kidx < frmGame.xmax) {
						newx = kidx + frmGame.speed;
						target.x = kidx + frmGame.speed;
					}
				} else if (frmGame.xmin < kidx){
					newx = kidx + frmGame.speed;
					//target.x = kidx + frmGame.speed;
				}*/
				//trace("DRAG frmBase.pname "+frmBase.pname);
				
				/*if (MovieClip(parent).getChildByName(frmBase.pname)!= null) 
				{
					kidy =  MovieClip(parent).getChildByName(frmBase.pname).y;
				} else {
					kidy =  MovieClip(parent).getChildByName(frmBase.lname).y - 55;
				}*/
				kidy =  MovieClip(parent).getChildByName(frmBase.pname).y;
				if (frmBase.fall == 1 && kidy < 540) {		
					
					frmBase.atas = MovieClip(parent).getChildByName(frmBase.lname).y - frmBase.yspace;
					frmBase.bawah = MovieClip(parent).getChildByName(frmBase.lname).y - 55;
					frmBase.kiri = MovieClip(parent).getChildByName(frmBase.lname).x - frmBase.xspace;
					frmBase.kanan = MovieClip(parent).getChildByName(frmBase.lname).x + frmBase.xspace;

					if (frmBase.kiri < kidx && kidx < frmBase.kanan && frmBase.atas < y && y < frmBase.bawah) {
						
						frmBase.score = frmBase.score + frmBase.point;
						
						MovieClip(parent).updateScore(frmBase.score);
						
						ro = kidx - (frmBase.kiri + frmBase.kanan) / 2;
						//trace("MovieClip(parent) "+MovieClip(parent));
						MovieClip(parent).doPig2(target.x, target.y, ro);
						//pigTwo = new pig2();
						//pigTwo.name = frmGame.pname;
						//addChild(pigTwo);
						//pigTwo.x = -48;
						//pigTwo.y = 185.5;
						//pigTwo.x = kidx;
						kidy = MovieClip(parent).getChildByName(frmBase.lname).y - 45;
						
						target.y = kidy;
						target.p.rotation = ro;
						target.p.x = -ro / 4;
						try 
						{
							target.s.x = -ro / 4;
						} catch (e:Error) {
							trace("linea 131 "+e);
						}
						target.visible = false;
						frmBase.lname = frmBase.pname;
						frmBase.canjump = 1;
						//var n:Number = frmGame.atas -  MovieClip(parent).getChildByName(frmGame.pname).y;
						//trace("atas - pname.y " + n + " < -150");
						//trace("atas " + frmGame.atas + " - ");
						//trace("pb.y " + MovieClip(parent).getChildByName("pb").y);
						
						var n1:Number = frmBase.atas;
						var n2:Number = MovieClip(parent).getChildByName("pb").y;

						var n3:Number = n1 - n2;
						
						//trace(n3);
						if (n3 < -150) 
						{
							frmBase.now = frmBase.now + frmBase.ymove;
							//trace("frmGame.now "+frmGame.now);
						}
						
						MovieClip(parent).doSwap(this);
						
						if (MovieClip(parent)["cake"].visible == true && frmBase.cakefall == 0) 
						{
							if (MovieClip(parent)["cake"].y - kidy > 65) 
							{
								frmBase.cakefall = 1;
								MovieClip(parent)["cake"].gotoAndPlay("fall");
								
							} else {
								input = (kidx - MovieClip(parent)["cake"].x ) * (kidx - MovieClip(parent)["cake"].x) + (kidy - MovieClip(parent)["cake"].y) * (kidy - MovieClip(parent)["cake"].y);
								doFrame10();
								if (output < 65) 
								{
									frmBase.cakefall = 1;
									MovieClip(parent)["cake"].gotoAndPlay("kena");									
									MovieClip(parent).playSound("got");
								}
								
							}
						}
						MovieClip(parent).playSound("bum");
						gotoAndPlay(1);
					}					
				}
			}
		}
		
		public function doFrame6():void 
		{
			gotoAndPlay(currentFrame - 1);

		}
		
		public function doFrame10():void 
		{
			trace("sprite 94");
			n = 1;
			for (counter = 0; counter < 11; counter = counter + 1)
			{
				n = n - (n * n - input) / (2 * n);
			} // end of for
			output = n;

			trace("output "+output);

		}
		
		public function doDrag() {
			
		}
	}

}