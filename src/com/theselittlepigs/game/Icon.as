package com.theselittlepigs.game 
{
	import com.theselittlepigs.frmBase;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Icon extends MovieClip
	{
		
		public function Icon() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			addFrameScript(0, doFrame1);
			addFrameScript(1, doFrame2);
			addFrameScript(19, doFrame20);
			addFrameScript(29, doFrame30);
		}
		
		private function doFrame1():void 
		{
			stop();
		}
		
		private function doFrame2():void 
		{
			// sonido miss
			MovieClip(parent).playSound("miss");
			//trace("sonido2");
		}
		
		private function doFrame20():void 
		{	
			trace("frame 20");
			frmBase.energy = frmBase.energy - 1;
			MovieClip(parent).updateIcon(frmBase.energy);
		}
		
		private function doFrame30():void 
		{
			if (frmBase.energy <= 0) 
			{
				// cargar el fin
				trace("cargar el fin");
				if (MovieClip(parent)!=null) 
				{
					MovieClip(parent).cargarFin();
					stop();
				}
				
			} else {
				gotoAndStop(1);
			}
		}
		
	}

}
