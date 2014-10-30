package pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
    import com.demonsters.debugger.MonsterDebugger;
	
	public class Fin_TurnoPage extends AbstractPage
	{	
		public var contenido_mc:MovieClip;
		public static var oData:Object = new Object();
		
		public function Fin_TurnoPage()
		{
			super();
			alpha = 0;
			//new Scaffold(this);
			//contenido_mc.siguiente_btn.addEventListener('click', onClickAvanzar);
			TweenMax.to(contenido_mc.siguiente_btn, 1, { scaleX:1.05, scaleY:1.05 , yoyo:true, ease:Quad.easeInOut, repeat: -1 } )
			contenido_mc.siguiente_btn.visible = false;
		}
		
		private function onClickAvanzar(e:Event):void 
		{
			//MovieClip(Gaia.api.getPage('index/nav').content).cargarJSON();
			Gaia.api.goto('index/nav/home');
			// verificar turnos
			MovieClip(Gaia.api.getPage(Pages.HOME).content).verificarTurnos();
			//MovieClip(Gaia.api.getPage(Pages.HOME).content).tablero_mc.setStarsCasilleroActual();
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			contenido_mc.x = 800;
			TweenMax.to(this, 0.3, { alpha:1, onComplete:transitionInComplete } );
			TweenMax.to(contenido_mc, .3, { x:0, ease:Quad.easeOut, delay:.3 } );
			
			//contenido_mc.txt.htmlText = "¡TIENES "+NavPage.puntos+" puntos, <br>te ESTÁS ACERCANDO a ser el mejor!"
			contenido_mc.txt.htmlText = "¡GANASTE "+NavPage.puntosGame+" puntos, <br>ahora tienes en total "+NavPage.puntos+" puntos!"
			MovieClip(Gaia.api.getPage(Pages.NAV).content).sfxPlay("win");
			
			
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
				//sURL = "https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego";
				//sURL = "https://www.web-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego";
				//sURL = "https://www.web-applabs.com/clientes/interbank/interbank-juego/public";
				sURL = "http://www.web-applabs.com/clientes/interbank/interbank-juego/public";
				//MonsterDebugger.trace(sURL, this);
			}			
			oData.sURL = sURL;			
			grabarPuntaje();			
		}
		
		public  function grabarPuntaje():void 
		{
			//var uploadPath:String = "https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/guardar";
			var uploadPath:String = oData.sURL+"/usuarios/juego/guardar";
			var urlRequest:URLRequest = new URLRequest();
			var urlVars:URLVariables = new URLVariables();
			urlRequest = new URLRequest();
			urlRequest.url = uploadPath;
			//https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/guardar?idc=1&tipo=1&puntos=30&stars=1		
			urlVars.puntos = NavPage.puntosGame;
			urlVars.idc = NavPage.casillaActual;
			urlVars.tipo = NavPage.tipoActual;
			urlVars.stars = NavPage.nStars;
			urlVars.moneda = NavPage.moneda;
			
			if (NavPage.tipoActual == 1) 
			{
				urlVars.tiempo = NavPage.nTiempo;
				urlVars.comodin = NavPage.nComodin;
			} else { 
				urlVars.tiempo = 0;
				urlVars.comodin = 0;
			}
			
			
			urlRequest.data = urlVars;
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, completeHandler);
			
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			urlLoader.addEventListener(Event.OPEN, openHandler);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			urlLoader.load(urlRequest);
			MonsterDebugger.initialize(this);
			MonsterDebugger.trace(this, urlRequest.url +"?" + urlRequest.data);
			trace(urlRequest.url +"?"+urlRequest.data);
		}
		
		private function openHandler(e:Event):void 
		{
			
		}
		
		private function httpStatusHandler(e:HTTPStatusEvent):void 
		{
			
		}
		
		private function securityErrorHandler(e:SecurityErrorEvent):void 
		{
			
		}
		
		private function ioErrorHandler(e:IOErrorEvent):void 
		{
			
		}
		
		private function completeHandler(e:Event):void 
		{
			contenido_mc.siguiente_btn.visible = true;
			contenido_mc.siguiente_btn.addEventListener('click', onClickAvanzar);
			MonsterDebugger.trace(this, e.currentTarget.data);
		}
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(contenido_mc, .3, { x:-800, ease:Quad.easeIn } );
			TweenMax.to(this, 0.3, { alpha:0, onComplete:transitionOutComplete, delay:.3} );
			MovieClip(Gaia.api.getPage(Pages.HOME).content).info_mc.puntaje_mc.setPuntaje();
		}
	}
}
