package com.brengifo.animation
{
	import flash.display.MovieClip;	
	import flash.events.Event;
	import flash.events.MouseEvent;

	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class SetOver extends MovieClip 
	{
		public static function onSetOver(e:Event) 
		{
			if (e.currentTarget.bActive) 
			{
				e.currentTarget.nextFrame();
			} 
			else 
			{
				e.currentTarget.prevFrame();
			if (e.currentTarget.currentFrame == 1) 
			{
				//trace("hello");
				//bTween = false;
				e.currentTarget.removeEventListener(Event.ENTER_FRAME, onSetOver);
			}
		}
			
		}
		public static function onOver(mc:MovieClip):void
		{
			mc.bActive=true;
			mc.addEventListener(Event.ENTER_FRAME, onSetOver);		
		}
		public static function onOut(mc:MovieClip):void
		{
			if (! mc.bClicked)
			{
				mc.bActive=false;
			}
		}
	}
	
}