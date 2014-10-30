package com.frogger.settings {
	import com.frogger.Car
	import com.frogger.settings.Constants

	public class CarSet1
	{
		public static var clipName:String = "car_1"
		public static var depth:Number = 100
		public static var Y:Number = 541
		public static var N:Array  = [3,3,4,5]
		public static var V:Number = .5
		public static var I:Number = .4
		public static var D:Number = Constants.LEFT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%CarSet1.N.length)
			return CarSet1.N[level]
		}
	}
}