package com.frogger
{
	import com.frogger.Frog
	import com.frogger.Game
	import com.frogger.settings.Constants
	import flash.display.MovieClip;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	public class Car extends MovieClip
	{
		var direction:Number
		var velocity:Number
		var position:Number
		var id:Number
		var rightBorder:Number

		public var boundsRegion1:MovieClip
		private var stopped:Boolean

		public function Car()
		{
			//Game.getInstance().addListener(this)
			stopped = false
		}

		public function Start()
		{
			//id = _global.setTimeout(Go, 10, this)
			id = setTimeout(Go, 10, this)
		}

		function Go(self:MovieClip):void
		{
			if(self.stopped)
			{
				return
			}
			self.x += self.direction*self.velocity

			// left border
			//if(self.x+self._width < 0 && self.direction == Constants.LEFT)
			if(self.x+self.width < 0 && self.direction == -1)
			{
				self.x = self.getStartPosition()
			// right border
			//} else if(self.x-(self._width/2) > this.rightBorder && self.direction == Constants.RIGHT)
			} else if(self.x-(self.width/2) > this.rightBorder && self.direction == 1)
			{
				self.x = self.getStartPosition()
			}
			self.DoAfterGo(self.direction*self.velocity)
		}

		private function DoAfterGo(movement:Number):void
		{
			var frog:Frog = Game.getInstance().GetFrog();
			//trace("this.boundsRegion1 "+this.boundsRegion1);
			try 
			{
				if(this.boundsRegion1.hitTestObject(frog.bounds))
				{
					frog.Die(0)
				}
			}catch (e:Error) {
				
			}
			
		}

		private function getStartPosition():Number
		{
			return position
		}

		public function SetStartPosition(x:Number):void
		{
			position = x
		}

		/** called from Game StopAll **/
		private function stop_all():void
		{
			this.stopped = true
			this.Stop();
		}

		private function play_all():void
		{
			this.stopped = false
		}

		public function Stop():void
		{
			clearTimeout(this.id);
		}

		public function get bounds():MovieClip
		{
			return boundsRegion1;
		}
	}
}