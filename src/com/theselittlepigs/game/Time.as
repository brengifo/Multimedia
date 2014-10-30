package com.theselittlepigs.game 
{
	import com.theselittlepigs.frmBase;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Time extends MovieClip
	{
		public var d:int;
		public var j:MovieClip;
		
		public function Time() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			addFrameScript(0, doFrame1);
			addFrameScript(1, doFrame2);
			addFrameScript(2, doFrame3);
			addFrameScript(4, doFrame5);
			addFrameScript(5, doFrame6);
			addFrameScript(6, doFrame7);
			
		}
		
		private function doFrame1():void 
		{
			d = 25;
		}
		
		private function doFrame2():void 
		{
			d = d - 1;
		}
		
		private function doFrame3():void 
		{
			if(d > 0)
			{
			   gotoAndPlay(currentFrame - 1);
			}
			else {
				frmBase.time = frmBase.time - 1;
				MovieClip(parent)["time_mc"].txt.text = frmBase.time;
				trace("frmBase.time " + frmBase.time);
				
				if (frmBase.time <= 9) 
				{
					// sonido MovieClip(parent)["sclock"].gotoAndPlay(2);
					trace("sonido");
				}
				if (frmBase.time <= 0) 
				{
					trace("fin!!!");
					frmBase.why = "time";
					MovieClip(parent).cargarFin();
					stop();
				}
				else 
				{
					trace("j.currentFrame "+j.currentFrame);
					if (j.currentFrame < j.totalFrames - 1) 
					{
						j.gotoAndStop(j.currentFrame + 1);
					}
					else
					{
						trace("wtf");
						j.gotoAndStop(1);
					}
					trace("g1");
					gotoAndPlay(1);
				}
			}			
		}
		
		private function doFrame5():void 
		{
			d = 30;
		}
		
		private function doFrame6():void 
		{
			d = d - 1;
			if (visible)
			{
				visible = false;
			}
			else
			{
				visible = true;
			} // end else if

		}
		
		private function doFrame7():void 
		{
			if (d > 0)
			{
				gotoAndPlay(currentFrame - 1);
			}
			else
			{
				visible = true;
				///:time = eval("/:time") + eval("/:bonustime");
				frmBase.time = frmBase.time + frmBase.bonustime;
				gotoAndPlay(1);
			} // end else if
		}
		
	}

}