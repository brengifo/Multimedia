package com.frogger 
{

	import com.frogger.Game
	import com.frogger.Car
	import com.frogger.Frog
	import com.frogger.settings.Constants
	import flash.display.MovieClip;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	import com.demonsters.debugger.MonsterDebugger;
	
	public class Turtle extends Car 
	{
		private var _canhide:Boolean
		private var _hideID:Number
		private var _hideTime:Number = 800
		private var stopped:Boolean
		public var boundsRegion:MovieClip;

	   function Turtle()
		{
			super();
			stop();
		}

		public function set submarine(value:Boolean)
		{
			
			_canhide = value
			if(value)
			{
				_hideID = setTimeout(this.GotoNextFrame, _hideTime, this)
			} else {
				clearTimeout(_hideID);
			}
		}

		private function GotoNextFrame(self:Turtle):void
		{
			if(self.currentFrame == self.totalFrames)
			{
				self.gotoAndStop(1)
			} else {				
				self.gotoAndStop(self.currentFrame+1)
			}
			if(!self.stopped)
			{
				self._hideID = setTimeout(self.GotoNextFrame, self._hideTime, self)
			}
		}
		
		override public function Stop():void
		{
			clearTimeout(id);
			clearTimeout(_hideID);
		}


		function DoAfterGo(movement:Number):void
		{
			var frog:Frog = Game.getInstance().GetFrog();
			//MonsterDebugger.initialize(this);
			//trace("this.bounds "+this.bounds);
			if(this.bounds.hitTestObject(frog.bounds) && frog.GetIsMoving() == false)
			{
				frog.SetIsMoved(true)
				if(this.currentFrame == Constants.TURTLE_DYING_FRAME)
				{
					frog.Die(0);
				} else {
					frog.x += movement
				}
			}
		}

		private function play_all()
		{
			//super.play_all();
			if(_canhide)
			{				
				_hideID = setTimeout(GotoNextFrame, _hideTime, this)
			}
		}

		//public function Start()
		//function Go(self:MovieClip):Void
		//private function getStartPosition():Number
		//public function SetStartPosition(x:Number):Void
		//private function stop_all():Void


	}	
}