package com.frogger.settings {
	import com.frogger.Turtle
	import com.frogger.settings.Constants

	public class TreeSet2
	{
		public static var clipName:String = "tree_2"
		public static var depth:Number = 800
		public static var Y:Number = 221
		public static var N:Array  = [3,4,3,4]
		public static var V:Number = 3.2
		public static var I:Number = .05
		public static var D:Number = Constants.RIGHT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%TreeSet2.N.length)
			return TreeSet2.N[level]
		}
	}	
}
