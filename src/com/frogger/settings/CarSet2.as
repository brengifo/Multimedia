package com.frogger.settings {
	
	import com.frogger.Car
	import com.frogger.settings.Constants

	public class CarSet2
	{
		public static var clipName:String = "car_2"
		public static var depth:Number = 200
		public static var Y:Number = 501
		public static var N:Array  = [3,4,5,4,4]
		public static var V:Number = 1
		public static var I:Number = .3
		public static var D:Number = Constants.RIGHT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%CarSet2.N.length)
			return CarSet2.N[level]
		}
	}
}