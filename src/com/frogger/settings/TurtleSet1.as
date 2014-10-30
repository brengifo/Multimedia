package com.frogger.settings 
{
	import com.frogger.Turtle
	import com.frogger.settings.Constants
	
	public class TurtleSet1
	{
		public static var clipName:String = "turtle_1" // element in library
		public static var depth:Number = 600           // start depth
		public static var Y:Number = 301               // start y
		public static var N:Array  = [3,2,3,4]               // elements per level
		public static var V:Number = 1.8
		public static var I:Number = .2
		public static var D:Number = Constants.LEFT    // direction

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%TurtleSet1.N.length)
			return TurtleSet1.N[level]
		}
		
		public function TurtleSet1():void 
		{
			trace("TurtleSet1");
		}
	}
}