package com.frogger.settings {
	import com.frogger.Car
	import com.frogger.settings.Constants

	public class SnakeSet1
	{
		public static var clipName:String = "snake_1"
		public static var depth:Number = 550
		public static var Y:Number = 341
		public static var N:Array  = [0,1,1,1,1]
		public static var V:Number = 2.5
		public static var I:Number = 0
		public static var D:Number = Constants.LEFT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%SnakeSet1.N.length)
			return SnakeSet1.N[level]
		}
	}
}