package pages.cuestionario 
{
	import com.adobe.serialization.json.JSON;
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.utils.getDefinitionByName;
	import pages.HomePage;
	import pages.NavPage;
	import pages.Pages;
	
	import com.demonsters.debugger.MonsterDebugger;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	
	public class Page2 extends MovieClip
	{
		public var contenido_mc:MovieClip;
		private var content_nav_mc:MovieClip;
		private var ClassReference:Class;
		
		//public var gana_btn:SimpleButton;
		
		public var jsonPath:String;
		public var aPreguntas:Array;
		
		public static var oPregunta:Object = new Object();
		
		private var nPreguntaTotal:int;
		private var nPreguntaActual:int;
		private var nStars:int;
		
		public static var oComodin:Object = new Object();
		public var nPuntosTotal:int = 0;
		
		public var tiempo_mc:MovieClip;
		
		public var aIDPreguntas:Array = new Array();
		public var aRespuestas:Array = new Array();
		public static var oData:Object = new Object();
		
		
		//private var nCantidadComodin;
		
		public function Page2() 
		{
			//comodin_btn.visible = false;		
			tiempo_mc.visible  = false;
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
			
			
			
			//gana_btn.addEventListener('click', onClickGana);
			
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			var sURL:String = "";
			
			try 
			{
				if ( this.stage.loaderInfo.parameters.baseUrl != null) 
				{
					sURL = this.stage.loaderInfo.parameters.baseUrl as String;
				}
				
			} catch (err:Error)
			{
				//MonsterDebugger.trace(err, this);
			}			
			
			//MonsterDebugger.trace(sURL, this);
			
			if (sURL.length < 1) 
			{				
				//sURL = "https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/";
				sURL = "http://www.web-applabs.com/clientes/interbank/interbank-juego/public";
				//MonsterDebugger.trace(sURL, this);
			}
			
			oData.sURL = sURL;						
			cargarJSON();			
		}
		
		public function cargarJSON():void 
		{
			// cargar preguntas
			//jsonPath = "preguntas.json";
			//jsonPath = "https://www.web-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/obtener-preguntas";
			jsonPath =oData.sURL+"/usuarios/juego/obtener-preguntas";
			
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			request.url = jsonPath;
			loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			loader.load(request);
		}
		
		private function onLoaderComplete(e:Event):void
		{
			var loader:URLLoader = URLLoader(e.target);			
			//trace("loader data"+loader.data);
			var jsonObject:Object = JSON.decode(loader.data);			
			initPreguntas(jsonObject.preguntas);
			
			
		}
		
		private function initTiempo():void 
		{
			tiempo_mc.visible  = true;
			tiempo_mc.addEventListener('tiempo', onTiempo);
			tiempo_mc.pause(false);			
		}
		
		private function onTiempo(e:Event):void 
		{
			tiempo_mc.removeEventListener('tiempo', onTiempo);
			tiempo_mc.pause(true);			
			//trace("se acabó el tiempo");
			doFinTiempo();
			
		}
		
		public function initPreguntas(jsonArray:Array):void 
		{
			aPreguntas = jsonArray;
			
			if (aPreguntas.length > 0) 
			{
				oComodin.cantidad = 2;
				setPreguntas();
				
			} else {
				trace("no hay preguntas");
			}
		}
		
		private function setPreguntas():void 
		{
			//trace("configurando preguntas");			
			nPreguntaTotal = aPreguntas.length;
			nPreguntaActual = 0;
			setPregunta(nPreguntaActual);
			initTiempo();
		}
		
		private function setPregunta(n:int):void 
		{
			//trace(aPreguntas[n]);
			//MonsterDebugger.initialize(aPreguntas[n]);
			oPregunta.pregunta = aPreguntas[n];			
			navSelect("cuestionario.Pregunta");
			aIDPreguntas.push(oPregunta.pregunta.id);
		}
		
		private function onClickGana(e:Event=null):void 
		{
			grabarRespuestas();
		}
		
		private function grabarRespuestas():void 
		{
			trace("aIDPreguntas "+ aIDPreguntas);
			trace("aRespuestas " + aRespuestas);			
			
			var nBonus:int = 0;
				
			var nTiempo:int = tiempo_mc.nTiempo;
			if (nTiempo <= 5) 
			{
				nBonus = 10;
			} else if (nTiempo > 5 && nTiempo <= 10) 
			{
				nBonus = 5;
			}
			else if (nTiempo > 10 && nTiempo <= 15) 
			{
				nBonus = 2;
			}				
			if (oComodin.cantidad == 2) 
			{
				nBonus = nBonus + 20;
			} else if (oComodin.cantidad == 1) 
			{
				nBonus = nBonus + 10;
			}				
			//trace("NavPage.puntos "+NavPage.puntos);
			//trace("///////////////");
			//trace("nPuntosTotal " + nPuntosTotal + nBonus);				
			//NavPage.puntos = NavPage.puntos + nPuntosTotal + nBonus;
			nPuntosTotal = nPuntosTotal + nBonus;
			setStars();
			//trace("///////////////");
			//trace("NavPage.puntos " + NavPage.puntos);
				
			
			//var uploadPath:String = "https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/guardar-respuesta";
			var uploadPath:String = oData.sURL+"/usuarios/juego/guardar-respuesta";
			var urlRequest:URLRequest = new URLRequest();
			var urlVars:URLVariables = new URLVariables();
			urlRequest = new URLRequest();
			urlRequest.url = uploadPath;
			
			//https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/guardar-respuesta?idp
			
			urlVars.idp = aIDPreguntas.join("-");
			urlVars.idr = aRespuestas.join("-");
			//urlVars.tiempo = tiempo_mc.seconds;
			
			//urlVars.comodin = Number(2 - oComodin.cantidad);
			//urlVars.puntos = nPuntosTotal;
			
			urlRequest.data = urlVars;
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, completeHandler);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			urlLoader.addEventListener(Event.OPEN, openHandler);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			urlLoader.load(urlRequest);
			trace(urlRequest.url +"?"+urlRequest.data);
	
		}
		
		private function completeHandler(e:Event):void 
		{
			//bypass
			trace("completeHandler "+e.currentTarget.data);
			try 
			{				
				// grabar puntos		
				// tiempo menos de 10 seg 100 bonus
				// tiempo menos de 20 seg 50 bonus
				// tiempo menos de 30 seg 25 bonus				
				
				NavPage.puntosGame = nPuntosTotal;
				NavPage.puntos = NavPage.puntos + NavPage.puntosGame;
				NavPage.nStars = nStars;
				
				NavPage.nTiempo = uint(tiempo_mc.seconds);			
				NavPage.nComodin = uint(2 - oComodin.cantidad);
				
				//oComodin.cantidad;
				
				//despues grabar puntaje				
				//MovieClip(Gaia.api.getPage('index/nav').content).grabarPuntos(NavPage.puntosGame);				
				Gaia.api.goto('index/nav/home/fin_turno');
				
			}
			catch(error:Error){
				trace(error);
			}
		}
		
		private function httpStatusHandler(e:HTTPStatusEvent):void 
		{
			
		}
		
		private function securityErrorHandler(e:SecurityErrorEvent):void 
		{
			
		}
		
		private function openHandler(e:Event):void 
		{
			
		}
		
		private function ioErrorHandler(e:IOErrorEvent):void 
		{
			
		}
		
		private function setStars():void 
		{	
			if (nPuntosTotal > 0 && nPuntosTotal < 30) 
			{
				nStars = 1;
			} else if (nPuntosTotal > 30 && nPuntosTotal < 50) {
				nStars = 2;
			} else if (nPuntosTotal > 50) {
				nStars = 3;
			}			
		}
	
		public function navSelect(s:String):void
		{
			//doNavSelect(s);
			if (this.contenido_mc.numChildren>0) 
			{
				TweenMax.to(this.contenido_mc, 0.3, { alpha:0, onComplete:navSet, onCompleteParams:[s]} );
			} else {
				navSet(s);
			}			
		}
		
		public function doSiguientePregunta():void 
		{
			
			nPuntosTotal += content_nav_mc.nPuntos;
			trace("nPuntosTotal " + nPuntosTotal);
			
			if (nPreguntaActual < nPreguntaTotal-1) 
			{
				nPreguntaActual++;
				setPregunta(nPreguntaActual);
				
			} else {	
				//doFinTiempo();
				tiempo_mc.dispatchEvent(new Event('tiempo'));				
			}
			//navSelect("cuestionario.Pregunta");
			
		}
		
		public function doFinTiempo():void 
		{
			trace("doFinTiempo");
			//onTiempo();
			if (nPuntosTotal > 0) 
				{
					trace("sumar puntos al sistema y luego click gana");
					
					// identificar el número de casilla en el tablero
					// identificar el tipo de casilla, para este caso debe ser tipo 1
					// 
						
					
					onClickGana();
				} else {
					try 
					{
						Gaia.api.goto('index/nav/home');
						//MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.doMoverFicha(0);
						MovieClip(Gaia.api.getPage(Pages.HOME).content).verificarTurnos();
						MovieClip(Gaia.api.getPage(Pages.NAV).content).sfxPlay("loose");
					} catch (e:Error) 
					{
						
					}
					
				}
		}
		
		private function navSet(s:String):void
		{
			this.contenido_mc.alpha = 0;
			if (this.contenido_mc.numChildren>0) 
			{
				for (var i:int = 0; i < this.contenido_mc.numChildren; i++) 
				{
					this.contenido_mc.removeChildAt(i);
				}
			}
			
			ClassReference = getDefinitionByName("pages."+s) as Class;
			content_nav_mc = new ClassReference();
			
			this.contenido_mc.addChild(content_nav_mc);
			TweenMax.to(this.contenido_mc, 0.5, { alpha:1 } );			
			
		/*	content_nav_mc.oPregunta = new Object();
			content_nav_mc.oPregunta = oPregunta;
			trace("content_nav_mc.oPregunta "+content_nav_mc.oPregunta);*/
		}
		
		public static function get getPregunta():Object 
		{
			return oPregunta.pregunta;
		}
		
		public static function get getComodinCantidad():Object 
		{
			return oComodin.cantidad;
		}
		public static function set setComodinCantidad(n:int):void
		{
			oComodin.cantidad = n;
			trace("oComodin.cantidad  "+oComodin.cantidad );
		}
		
	}
}