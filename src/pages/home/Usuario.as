package pages.home {
	import flash.display.MovieClip;
	import flash.text.TextFieldAutoSize;	
	import pages.NavPage;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Usuario extends MovieClip
	{
		
		public var nombre_mc:MovieClip;
		public var detalle_mc:MovieClip;
		
		public function Usuario() 
		{
		
		}
		
		public function setUsuario():void 
		{
			var aPrimerNombre:Array = NavPage.name.split(" ");
			var s:String = aPrimerNombre[0];	
			//ficha_mc.nombre_txt.htmlText = "<b>" + s + "</b>";
			
			nombre_mc.txt.htmlText = "¡Hola<br>" + s +"!";
			nombre_mc.txt.autoSize = TextFieldAutoSize.LEFT;
		}
		
		public function setDetalle():void 
		{
			var sCasilla:String;
			
			if (NavPage.casillaActual == 0) 
			{
				sCasilla = "inicial";
			} else if (NavPage.casillaActual == 41) 
			{
				sCasilla = "final";
			}
			
			else {
				sCasilla = String(NavPage.casillaActual);
			} 
			
			if (NavPage.turnos == 1) 
			{
				detalle_mc.txt.htmlText = "Lanza la moneda para jugar, tienes <b>una oportunidad</b><br><b>¡Suerte!</b>"
			} else {
				detalle_mc.txt.htmlText = "Lanza la moneda para jugar, tienes <b>" + NavPage.turnos + " oportunidades</b>. <br><b>¡Suerte!</b>"
			}
			
			
			
			detalle_mc.txt.autoSize = TextFieldAutoSize.LEFT;
		}
	}
}