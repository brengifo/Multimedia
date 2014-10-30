package com.theselittlepigs.game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Tick extends MovieClip
	{
		
		public function Tick() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event=null):void 
		{
			//trace("tick");
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			addFrameScript(3, doFrame4);
			addFrameScript(4, doFrame5);
			addFrameScript(5, doFrame6);
		}

		public function doFrame4():void 
		{
			x = MovieClip(parent).getChildByName("cake").x;
		}
		
		public function doFrame5():void 
		{
			if (y - MovieClip(parent).getChildByName("cake").y < 30) 
			{
				visible = false;
			}
			else {
				visible = true;
			}
		}
		
		public function doFrame6():void 
		{
			gotoAndPlay(currentFrame - 1);

		}
		
	}
	

}