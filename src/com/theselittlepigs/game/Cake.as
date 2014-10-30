package com.theselittlepigs.game 
{
	import com.theselittlepigs.frmBase;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Cake extends MovieClip
	{
		public var b:MovieClip;
		public var yn:Number;
		public var n:Number = 0;
		public var d:Number;
		public function Cake() 
		{
			
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
			
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			addFrameScript(0, doFrame1);
			addFrameScript(1, doFrame2);
			addFrameScript(2, doFrame3);
			addFrameScript(19, doFrame20);
			addFrameScript(20, doFrame21);
			addFrameScript(23, doFrame24);
			addFrameScript(27, doFrame28);
			addFrameScript(28, doFrame29);
		}
		
		public function doFrame1():void 
		{
				frmBase.cakefall = 0;				
				yn = frmBase.cakespace + (Math.random() * 50);
				trace("yn " + yn);
				n = n + 1;	
		}
		
		public function doFrame2():void	
		{
			y = yn;
			trace("y "+y);
			if (n/2 == int(n/2)) 
			{
				if ((Math.random()*100) > 50) 
				{
					x = 250 + (Math.random() * 50);
				}
				else 
				{
					x = 250 - (Math.random() * 50);
				}
			}
			else if (Math.random() * 100 > 50) {
				x = 150 + (Math.random() * 100);
			}
			else {
				x = 350 - (Math.random() * 100);
			}
			scaleX = 1;
			scaleY = 1;
			b.b.b.gotoAndStop(1);
			MovieClip(MovieClip(parent).getChildByName("tick")).gotoAndPlay("loop");
			//this("b").getChildByName("b
			//gotoAndPlay("fall");
			//gotoAndPlay("kena");
			stop();
		}
		
		public function doFrame3():void 
		{
			b.b.b.gotoAndStop(2);
			d = 25;
		}
		
		public function doFrame20():void 
		{
			x = frmBase.xdes - (frmBase.xdes - x / 1.2);
			//trace("cake linea 63 x "+x);
			y = frmBase.ydes - (frmBase.ydes  - y / 1.2);
			d = d - 1;									
			this.scaleX = (1 + x * 0.01) - 0.3;
			this.scaleY = (1 + x * 0.01 )- 0.3;
		}
		
		public function doFrame21():void 
		{
			if (d > 0)
			{
				gotoAndPlay(currentFrame - 1);
			}
			else
			{
				// /:score = eval("/:score") + eval("/:cakepoint");
				frmBase.score = frmBase.score + frmBase.cakepoint;
				MovieClip(parent).updateScore(frmBase.score);
				gotoAndPlay(1);
			} // end else if
		}
		
		public function doFrame24():void 
		{
			b.b.b.gotoAndStop(2);
			d = 20;		
		}
		public function doFrame28():void 
		{
			y = 550 - (550 - y) / 1.2;
			trace("fall y "+y);
			this.scaleX = (1 + scaleX * 0.01) - 0.3;
			this.scaleY = (1 + scaleY * 0.01) - 0.3;
			d = d - 1;			
		}
		
		public function doFrame29():void 
		{
			if (d > 0)
			{
				gotoAndPlay(currentFrame - 1);
			}
			else
			{
				y = 180;
				x = 1000;				
				gotoAndPlay(1);
				
			} 
		}
	}

}