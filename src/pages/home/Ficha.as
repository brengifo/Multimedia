package pages.home {
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Ficha extends MovieClip
	{
		public var behavior_mc:MovieClip;
		public var nombre_txt:TextField;
		public var curviness:uint;
		public function Ficha() 
		{
			
		}
		
		public function setBehavior(sBehave:String):void 
		{
			MovieClip(this).behavior_mc.gotoAndStop(sBehave);
		}
		
	}

}