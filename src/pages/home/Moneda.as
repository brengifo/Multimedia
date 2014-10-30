package pages.home {
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Moneda extends MovieClip
	{
		public var nRandom:int;
		
		public function Moneda() 
		{
			
		}
		
		public function checkPoint(n:int):void 
		{
				if (nRandom == n) 
				{
					stop();
					//trace("nRandom " + nRandom);
					MovieClip(parent.parent).tablero_mc.doMoverFicha(nRandom);
				} 
		}
	}
}