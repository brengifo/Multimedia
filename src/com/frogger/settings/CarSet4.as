package com.frogger.settings {
	import com.frogger.Car
	import com.frogger.settings.Constants

	public class CarSet4
	{
		public static var clipName:String = "car_4"
		public static var depth:Number = 400
		public static var Y:Number = 421
		public static var N:Array  = [2,3,4,5]
		public static var V:Number = 2
		public static var I:Number = .2
		public static var D:Number = Constants.RIGHT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%CarSet4.N.length)
			return CarSet4.N[level]
		}
	}
}