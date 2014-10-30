package com.frogger 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;

	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class TimePanel extends MovieClip 
	{
		public var sText:String;
		public var txt:TextField;
		
		public function TimePanel() 
		{
			super();
			
		}
		
		public function setText() {
			txt.autoSize = TextFieldAutoSize.CENTER;
			txt.text = sText;
			
		}
		
	}

}