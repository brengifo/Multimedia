package com.theselittlepigs.game 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.theselittlepigs.frmBase;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class pb0 extends MovieClip
	{
		public var xmin:int;
		public var xmax:int;
		public var speed:int;
		
		public var xs:Number = 0;
		
		public function pb0() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			xmin = frmBase.xmin;
			xmax = frmBase.xmax;
			speed = frmBase.speed;
		}
		
	}

}