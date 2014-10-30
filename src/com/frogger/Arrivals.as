package com.frogger 
{
	import flash.display.MovieClip;	
	import com.frogger.Game;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Arrivals extends MovieClip
	{
		
		static var NORMAL:Number  = 0
		static var BONUS:Number   = 1
		static var NOBONUS:Number = 2
		static var END:Number     = 3

		public var status:Number
		private var id:uint;
		private var stopped:Boolean
		
		public var boundsRegion1:MovieClip;
		
		public function Arrivals() 
		{
			status = Arrivals.NORMAL
		}
		
		public function touch()
		{
			this.gotoAndStop("end");
			status = Arrivals.END;
			clear_timer();
		}

		public function reset()
		{
			this.gotoAndStop(1);
			status = Arrivals.NORMAL;
		}


		public function init()
		{
			//Game.getInstance().addListener(this);
			//Game.getInstance().addEventListener(
			init_timer();
		}

		private function init_timer()
		{
			clear_timer();
			//id = _global.setTimeout(change, 3000+random(1000), this);
			
			id = setTimeout(change, 3000+(Math.random()*1000), this);
			//trace("id "+id);
		}

		private function clear_timer()
		{
			//_global.clearTimeout(id)
			clearTimeout(id);
		}
 
		public function setRandom(min:int, max:int):int
		{
			return min + (max - min) * Math.random();
		}
		
		private function change(obj:Arrivals):void
		{
			//trace("change");
			var n:Number = setRandom(0,4);
				
			//trace("obj.status " + obj.status);
			trace("arr "+name);
			trace("n "+n);
			if(obj.status == Arrivals.NOBONUS || obj.status == Arrivals.BONUS)
			{
				n = 2
			}
			
			switch(n)
			{
				case 0:
					obj.gotoAndStop("bonus");
					obj.status = Arrivals.BONUS
					break;
				case 1:
					obj.gotoAndStop("nobonus");
					obj.status = Arrivals.NOBONUS
					break;
				default:
					obj.gotoAndStop(1);
					obj.status = Arrivals.NORMAL
					break;

			}
			if(obj.status != Arrivals.END && !obj.stopped)
			{
				obj.id = setTimeout(obj.change, 3000+(Math.random()*1500), obj);
			}
		}

		private function stop_all()
		{
			stopped = true
			clear_timer();
		}

		private function play_all()
		{
			stopped = false
			if(status != Arrivals.END && currentFrame != totalFrames)
			{
				init_timer();
			}
		}
		
	}

}