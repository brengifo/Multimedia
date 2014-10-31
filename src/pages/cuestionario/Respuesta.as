package pages.cuestionario 
{
	import com.ui.Boton;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Respuesta extends Boton
	{
		public var id:int;
		public var oRespuesta:Object = new Object();
		
		private var aLetras:Array = new Array("A", "B", "C", "D");
		
		public var letra_mc:MovieClip;
		public var txt_mc:MovieClip;
		
		public var hitArea_mc:MovieClip;		
		public var true_mc:MovieClip;
		public var false_mc:MovieClip;
		public var bg_mc:MovieClip;
		
		public function Respuesta() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);			
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			//trace("Respuesta id " + id);
			//trace("oRespuesta " + oRespuesta);
			letra_mc.gotoAndStop(id + 1);
			txt_mc.txt.autoSize = TextFieldAutoSize.LEFT;
			txt_mc.txt.text = oRespuesta.texto;
			//trace("Respuesta txt_mc.txt.height " + txt_mc.txt.height);
			
			if (this.height > 36)
			{
				txt_mc.txt.y = 0 - (txt_mc.txt.height / 2);
				/*txt_mc.width = 506.4;
				txt_mc.scaleY = txt_mc.scaleX;*/
				false_mc.slice_mc.height = true_mc.slice_mc.height = hitArea_mc.slice_mc.height = bg_mc.slice_mc.height = txt_mc.txt.height + 5;				
				txt_mc.y = (bg_mc.slice_mc.height / 2); 
			}
			true_mc.visible = false;
			false_mc.visible = false;		
			//trace("Respuesta this.height " + this.height);
			//this.y = id * 46;
			dispatchEvent(new Event('resize'));
		}
	}
}