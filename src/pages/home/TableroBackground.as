package pages.home {
	import fl.containers.UILoader;
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class TableroBackground extends MovieClip
	{
		public var bg1:UILoader;
		public var bg2:UILoader;
		public var bg3:UILoader;
		public var bg4:UILoader;
		public var bg5:UILoader;
		public var bg6:UILoader;
		
		public function TableroBackground() 
		{
			bg1.source = "images/paso01.jpg";
			bg2.source = "images/paso02.jpg";
			bg3.source = "images/paso03.jpg";
			bg4.source = "images/paso04.jpg";
			bg5.source = "images/paso05.jpg";
			bg6.source = "images/paso06.jpg";
			//bg1.addEventListener
		}
		
	}

}