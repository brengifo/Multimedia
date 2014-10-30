package pages.home {
	import flash.display.MovieClip;
	import flash.text.TextField;
	import com.greensock.TweenNano;
	 import com.demonsters.debugger.MonsterDebugger;
	 import pages.NavPage;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Puntaje extends MovieClip
	{
		public var txt:TextField;
		public var obj:Object = new Object();
		
		public function Puntaje() 
		{
			//setPuntaje();
		}
		
		public function setPuntaje():void 
		{			
			obj.startNumber = uint(txt.text);
			var targetNumber:uint = NavPage.puntos;
			TweenNano.to(obj, 2, { startNumber: targetNumber, onUpdate:updateHandler});
		}
		
		private function updateHandler():void {
			//MonsterDebugger.initialize(obj););
			txt.htmlText = uint(obj.startNumber).toString();
		}
	}

}