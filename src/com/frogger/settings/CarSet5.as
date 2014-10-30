package com.frogger.settings {
	import com.frogger.Car
	import com.frogger.settings.Constants

	public class CarSet5
	{
		public static var clipName:String = "car_5"
		public static var depth:Number = 500
		public static var Y:Number = 381
		public static var N:Array  = [2,2,3,2]
		public static var V:Number = 1.5
		public static var I:Number = .4
		public static var D:Number = Constants.LEFT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%CarSet5.N.length)
			return CarSet5.N[level]
		}
	}
}