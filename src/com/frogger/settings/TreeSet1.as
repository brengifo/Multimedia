package com.frogger.settings {
	import com.frogger.Turtle
	import com.frogger.settings.Constants

	public class TreeSet1
	{
		public static var clipName:String = "tree_1"
		public static var depth:Number = 700
		public static var Y:Number = 261
		public static var N:Array  = [3,4,3,4]
		public static var V:Number = .8
		public static var I:Number = .5
		public static var D:Number = Constants.RIGHT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%TreeSet1.N.length)
			return TreeSet1.N[level]
		}
	}
}
