package com.frogger.settings 
{
	import com.frogger.Turtle
	import com.frogger.settings.Constants

	public class TurtleSet2
	{
		public static var clipName:String = "turtle_2" // element in library
		public static var depth:Number = 900           // start depth
		public static var Y:Number = 181               // start y
		public static var N:Array  = [3,3,2,3]             // elements per level
		public static var V:Number = 2
		public static var I:Number = .3
		public static var D:Number = Constants.LEFT    // direction

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%TurtleSet2.N.length)
			return TurtleSet2.N[level]
		}
	}
}