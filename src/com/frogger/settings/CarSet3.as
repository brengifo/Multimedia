package com.frogger.settings {
	
	import com.frogger.Car
	import com.frogger.settings.Constants

	public class CarSet3
	{
		public static var clipName:String = "car_3"
		public static var depth:Number = 300
		public static var Y:Number = 461
		public static var N:Array  = [2,4,3,4]
		public static var V:Number = 1
		public static var I:Number = .4
		public static var D:Number = Constants.LEFT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%CarSet3.N.length)
			return CarSet3.N[level]
		}
	}	
}
