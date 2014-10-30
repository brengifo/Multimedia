package com.frogger.settings {
	import com.frogger.Turtle
	import com.frogger.settings.AlligatorSet1
	import com.frogger.settings.Constants

	public class TreeSet3
	{
		public static var clipName:String = "tree_3"
		public static var depth:Number = 1000
		public static var Y:Number = 141
		public static var N:Array  = [3,3,2]
		public static var V:Number = 1.9
		public static var I:Number = .2
		public static var ALT:Object = AlligatorSet1
		public static var D:Number = Constants.RIGHT

		public static function GetCarsNumber(level:Number):Number
		{
			level = level-1
			level = (level%TreeSet3.N.length)
			return TreeSet3.N[level]
		}
	}
}