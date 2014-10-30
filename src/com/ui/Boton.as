package com.ui 
{
	import com.brengifo.animation.SetOver;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author BenJah
	 */
	public class Boton extends MovieClip
	{
		public var bActive:Boolean;
		public var bClicked:Boolean;
		
		public function Boton() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(e:Event=null):void
		{			
			this.buttonMode = true;
			addEventListener('rollOver', onOver);
			addEventListener('rollOut', onOut);
			this.stop();
		}
		
		private function onOut(e:Event):void 
		{
			rollOut();
		}
		
		private function onOver(e:Event):void 
		{
			rollOver();
		}
			
		
		public function rollOut():void
		{			
			SetOver.onOut(this as MovieClip);			
		}
		
		public function rollOver():void
		{
			SetOver.onOver(this as MovieClip);
		}
		
		
	}

}