package pages.sorpresa 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Dado extends MovieClip
	{
		public var dado_mc:MovieClip;
		public var oDado:Object = new Object();
		public var aLados:Array = new Array([ -3, -1, -2], [-2, -1, 3], [-1, -3, 2], [1, -2, +3], [2, 3, -1], [3, -1, -2]);
		//public var aLados:Array = new Array([ -3, -1, -2], [-2, -1, 3], [-1, -3, 2], [-1, -2, +3], [-2, 3, -1], [-3, -1, -2]);
		
		
		public function Dado() 
		{
			initDado();
		}
		
		public function initDado():void 
		{	
			//var nRandom:int = ;
			setDado(setRandom(0, 6));
			dado_mc.addEventListener("doNum", doNum);
		}
		
		public function get getNum():int
		{
			return oDado.num;
		}
		
		public function setDado(n:int):void 
		{
			dado_mc.t_mc.txt.text = aLados[n][0];
			dado_mc.l_mc.txt.text = aLados[n][1];
			dado_mc.r_mc.txt.text = aLados[n][2];
		}
		
		public function lanzarDado():void 
		{
			gotoAndPlay("animacion");
			//var nRandom:int = setRandom( 0, 6);
			var nRandom:int;
			for (var i:int = 0; i < 20; i++) 
			{
				nRandom = setRandom( 0, 6);
				
			}
			//trace("nRandom "+nRandom);
			oDado.num = aLados[nRandom][0];
			trace("oDado.num " + oDado.num);
			setDado(nRandom);
			
		}
		
		public function doNum():void 
		{
			dispatchEvent(new Event("moverFicha"));
		}

		public function setRandom(min:int, max:int):int
		{
			return min + (max - min) * Math.random();
		}
	}

}