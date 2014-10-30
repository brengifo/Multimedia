package pages.home {
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	
	public class Target extends MovieClip
	{
		public var num_txt:TextField;
		public var icon_mc:MovieClip;
		public var stars_mc:MovieClip;

		public var oTarget:Object = new Object();
		
		public function Target() 
		{
			stars_mc.s1.visible = false;
			stars_mc.s2.visible = false;
			stars_mc.s3.visible = false;
			num_txt.htmlText = this.name.substr(1);		
			//trace("this.name.substr(1); "+this.name.substr(1));
		}
		
		public function set  setTipo(nTipo:uint):void {
			icon_mc.gotoAndStop(nTipo);
			oTarget.tipo = nTipo;
			//trace(MovieClip(this).name);
			//trace("oTarget.tipo = "+oTarget.tipo);
		}
		
		public function get getTipo():uint {
			return oTarget.tipo;
		}
		
		public function set setStars(nStars:uint):void {
			//trace("setStars " + nStars);
			oTarget.stars = nStars;
			switch (nStars) 
			{
				case 1:
					stars_mc.s1.visible = true;
				break;
				case 2:
					stars_mc.s1.visible = true;
					stars_mc.s2.visible = true;
				break;
				case 3:
					stars_mc.s1.visible = true;
					stars_mc.s2.visible = true;
					stars_mc.s3.visible = true;
				break;
				default:
			}
		}
		
	}
}