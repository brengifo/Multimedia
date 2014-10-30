package pages.cuestionario 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextFieldAutoSize;
	import pages.cuestionario.Page2;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Pregunta extends MovieClip
	{		
		private var oPregunta:Object;
		private var aRespuestas:Array;
		
		public var preguntatxt_mc:MovieClip;
		public var respuestas_mc:MovieClip;
		
		public var nPuntos:int = 0;
		
		private var nCantidadComodin;
		public var comodin_btn:MovieClip;
		
		public var nIDPregunta:int;
		public var nRespuesta:int;
		
		public function Pregunta() 
		{
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
			//trace(MovieClip(this.parent).name);
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			nCantidadComodin = Page2.getComodinCantidad;
			
			comodin_btn.visible = false;		
			/*tiempo_mc.visible  = false;*/
			
			oPregunta = Page2.getPregunta;
			
			preguntatxt_mc.txt_mc.txt.autoSize = TextFieldAutoSize.CENTER;
			preguntatxt_mc.txt_mc.txt.htmlText = oPregunta.texto;
			preguntatxt_mc.txt_mc.txt.y = 0-(preguntatxt_mc.txt_mc.txt.height / 2);
			trace(oPregunta.texto);
			
			TweenMax.from(preguntatxt_mc, .3, {y:240, ease:Quad.easeOut, onComplete:initRespuestas});
			
			//initRespuestas();
			
		}
		
		public function initRespuestas():void 
		{
			aRespuestas = oPregunta.respuestas;
			
			//trace("aRespuestas "+aRespuestas.length);
			
			for (var i:int = 0; i < aRespuestas.length; i++) 
			{
				var mcRespuestaChild:MovieClip = new mcRespuesta();
				mcRespuestaChild.id = i;
				mcRespuestaChild.name = "r"+i;
				mcRespuestaChild.oRespuesta = aRespuestas[i];
				respuestas_mc.addChild(mcRespuestaChild);
				mcRespuestaChild.y = i * 46;
				//trace("altura "+mcRespuestaChild.height);
				//trace("antes mcRespuestaChild.y "+mcRespuestaChild.y);
				if (i > 0) 
				{
					if (respuestas_mc.getChildByName("r" + (i - 1)).height > 36) 
					{
						mcRespuestaChild.y = (respuestas_mc.getChildByName ("r" + (i - 1)).height) + (respuestas_mc.getChildByName("r" + (i)).y)-42;
					} else {
						mcRespuestaChild.y = (respuestas_mc.getChildByName ("r" + (i - 1)).height) + (respuestas_mc.getChildByName("r" + (i)).y)-37;
					}
					
					//trace("despues mcRespuestaChild.y "+mcRespuestaChild.y);
					//trace("rsrs "+getChildByName("r"+(i-1)));
				} else {
					//mcRespuestaChild.y = i * 46;
				}
				mcRespuestaChild.addEventListener('click', onClickRespuesta);
				TweenMax.from(mcRespuestaChild, .3, {y:0, ease:Quad.easeOut});
			}
			
			//initTiempo();
			initComodin();			
		}
		
		/*private function initTiempo():void 
		{
			tiempo_mc.visible  = true;
			tiempo_mc.addEventListener('tiempo', onTiempo);
			tiempo_mc.pause(false);
			
		}*/
		
		private function initComodin():void 
		{
			if (nCantidadComodin > 0) 
			{
				comodin_btn.addEventListener('click', onClickComodin);
				comodin_btn.visible = true;
			} else {
				comodin_btn.visible = false;
			}
			
		}
		
		private function onClickComodin(e:Event):void 
		{
			setComodin();			
		}
		
		private function setComodin():void 
		{
			if (Page2.getComodinCantidad > 0) 
			{
				Page2.setComodinCantidad = --nCantidadComodin;
				comodin_btn.removeEventListener('click', onClickComodin);
				comodin_btn.alpha = .5;
				
				var nBorrarOpciones:uint;
				if (aRespuestas.length < 4) 
				{
					nBorrarOpciones = 1;
				} else {
					nBorrarOpciones = 2;
				}
					
				for (var i:int = 0; i < aRespuestas.length; i++) 
				{
					if (MovieClip(respuestas_mc.getChildByName("r" + i)).oRespuesta.correcta != 1) 
					{
						if (nBorrarOpciones > 0) 
						{
							--nBorrarOpciones;					
							MovieClip(respuestas_mc.getChildByName("r" + i)).removeEventListener('click', onClickRespuesta);
							MovieClip(respuestas_mc.getChildByName("r" + i)).alpha = .5;
						}
					}
				}				
			}
		}
		
		private function onClickRespuesta(e:Event):void 
		{
			//tiempo_mc.pause(true);
			
			if (e.currentTarget.oRespuesta.correcta == 1) 
			{
				e.currentTarget.true_mc.visible = true;
				nPuntos = +10;
			} else {
				e.currentTarget.false_mc.visible = true;
			}
			//e.currentTarget.removeEventListener('click', onClickRespuesta);
			//onTiempo();
			for (var i:int = 0; i < aRespuestas.length; i++) 
			{
				if (e.currentTarget.id != i) 
				{
					respuestas_mc.getChildByName("r" + i).alpha = .5;
					
				} else {
					TweenMax.to(e.currentTarget, .5, {alpha:1, onComplete:onRespuesta});
				}
				respuestas_mc.getChildByName("r" + i).removeEventListener('click', onClickRespuesta);
			}
			MovieClip(parent.parent).aRespuestas.push(e.currentTarget.oRespuesta.correcta);			
		}
		
		private function onRespuesta(e:Event=null):void 
		{
			//tiempo_mc.removeEventListener('tiempo', onTiempo);
			MovieClip(parent.parent).doSiguientePregunta();
			//Page2.doSiguientePregunta();
		}
		
	}

}