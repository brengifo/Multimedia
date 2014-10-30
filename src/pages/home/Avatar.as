package pages.home {
	import flash.display.MovieClip;
	import pages.NavPage;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Avatar extends MovieClip
	{
		public function Avatar() 
		{
			
		}
		
		public function setAvatar():void 
		{
			switch (NavPage.gender) 
			{
				case "m":
					stop();
				break;
				case "f":
					gotoAndStop(2);
				break;
				
			default:
				stop();
				break;
			}
		}
		
	}

}