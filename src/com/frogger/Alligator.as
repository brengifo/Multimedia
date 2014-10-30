package com.frogger {
	import com.frogger.Game
	import com.frogger.Frog
	import com.frogger.Turtle
	import com.frogger.settings.Constants
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	public class Alligator extends Turtle
	{
		private var _canhide:Boolean
		private var _hideID:Number
		private var _hideTime:Number = 1000
		private var stopped:Boolean

		public function Alligator()
		{
			super();
			stop();
		}

		override public function set submarine(value:Boolean)
		{
			_canhide = value;
			if(value)
			{
				//_hideID = setTimeout(this.GotoNextFrame, _hideTime+Math.random()*1000, this)
			} else {
				clearTimeout(_hideID);
			}
		}
	}
}