package pages
{
	import com.adobe.serialization.json.JSON;
	import com.gaiaframework.assets.MovieClipAsset;
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import flash.net.navigateToURL;
	import flash.text.TextField;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	
	import com.gaiaframework.utils.SoundGroup;
	import flash.media.SoundTransform;
	
	import com.demonsters.debugger.MonsterDebugger;
	
	public class NavPage extends AbstractPage
	{	
		var loopHome:ISound;
		var loopMusic1:ISound;
		var sfxClick:ISound;
		var sfxCoin:ISound;
		var sfxSwap:ISound;
		var sfxWin:ISound;
		var sfxLoose:ISound;
		
		public var jsonPath:String;
		public var txt:TextField;
		
		public static var oData:Object = new Object();
		
		public var mute_mc:MovieClip;
		
		public var bMute:Boolean = false;
		
		public var releaseGaia:Function;
		
		public var ingresa_btn:MovieClip;
		
		public static function get id():String
		{
			return oData.id;
		}
		
		public static function get name():String
		{
			return oData.name;
		}
		
		public static function get gender():String
		{
			return oData.gender;
		}
		
		public static function get casillaActual():int
		{
			return oData.gameStatus.casillaActual;
		}
		
		public static function set casillaActual(n:int):void
		{
			oData.gameStatus.casillaActual = n;
		}
		
		public static function get tipoActual():uint
		{
			return oData.gameStatus.tipoActual;
		}
		
		public static function set tipoActual(n:uint):void
		{
			oData.gameStatus.tipoActual = n;
		}
		
		public static function get nComodin():uint
		{
			return oData.gameStatus.nComodin;
		}
		
		public static function set nComodin(n:uint):void
		{
			oData.gameStatus.nComodin = n;
		}
		
		public static function get nTiempo():uint
		{
			return oData.gameStatus.nTiempo;
		}
		
		public static function set nTiempo(n:uint):void
		{
			oData.gameStatus.nTiempo = n;
		}
		
		public static function get turnos():int
		{
			return oData.gameStatus.turnos;
		}
		
		public static function set turnos(n:int):void
		{
			oData.gameStatus.turnos = n;
		}
		
		public static function get puntos():int
		{
			return oData.gameStatus.puntos;
		}
		
		public static function set puntos(n:int):void
		{
			oData.gameStatus.puntos = n;
		}
		
		public static function get casillas():Array
		{
			return oData.gameStatus.casillas;
		}
		
		public static function set casillas(a:Array):void
		{
			oData.gameStatus.casillas = a;
		}
		
		public static function get moneda():int
		{
			return oData.gameStatus.moneda;
		}
		
		public static function set moneda(i:int):void
		{
			oData.gameStatus.moneda = i;
		}
		
		public static function get puntosGame():uint
		{
			return oData.gameStatus.puntosGame;
		}
		
		public static function set puntosGame(i:uint):void
		{
			oData.gameStatus.puntosGame = i;
		}
		
		public static function get bWin():Boolean
		{
			return oData.gameStatus.bWin;
		}
		
		public static function set bWin(b:Boolean):void
		{
			oData.gameStatus.bWin = b;
		}
		
		public static function get nStars():int
		{
			return oData.gameStatus.nStars;
		}
		
		public static function set nStars(n:int):void
		{
			oData.gameStatus.nStars= n;
		}
		
		public static function get sURL():String
		{
			return oData.sURL;
		}
		
		public function sumarPuntos(n:int):void 
		{
			NavPage.puntosGame = n;
			NavPage.puntos = NavPage.puntos + n;
			
		}
		
		public function NavPage()
		{
			super();
			alpha = 0;
			txt.visible = false;
			//new Scaffold(this);
			/*if (stage) doInit();
			else addEventListener(Event.ADDED_TO_STAGE, doInit);*/
			mute_mc.stop();
			mute_mc.visible = false;
			releaseGaia = Gaia.api.afterPreload(onAfterPreload, true);			
			ingresa_btn.visible = false;
			ingresa_btn.addEventListener('click', onClickGoIngresa);
		}
		
		private function onClickGoIngresa(e:Event):void 
		{
			navigateToURL(new URLRequest(oData.sURL  +'/login'), '_self');
			//navigateToURL(new URLRequest('../login'), '_self');
		}
		
		function onAfterPreload(event:GaiaEvent):void
		{
			
			releaseGaia(true);
			
			if (stage) doInit();
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
			//doInit();
			
		}
		
		public function doInit(e:Event = null)
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			TweenMax.to(this, 0.3, { alpha:1, onComplete:transitionInComplete } );
			
			//loopHome = assets.loopHome as ISound;
			//loopMusic1 = assets.loopMusic1 as ISound;
			sfxClick = assets.sfxClick as ISound;
			sfxCoin = assets.sfxCoin as ISound;
			sfxSwap = assets.sfxSwap as ISound;
			sfxWin = assets.sfxWin as ISound;
			sfxLoose = assets.sfxLoose as ISound;
			
			/*MonsterDebugger.initialize(this.stage.loaderInfo.parameters);
			MonsterDebugger.trace(this.stage.loaderInfo.parameters, this);*/
			
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
				//sURL = "https://www.web-applabs.com/clientes/interbank/interbank-juego/public";
				sURL = "http://www.web-applabs.com/clientes/interbank/interbank-juego/public";
				// /clientes/interbank/interbank-juego/public
				//MonsterDebugger.trace(sURL, this);
			}
			
			oData.sURL = sURL;
		/*	MonsterDebugger.trace("oData sURL "+oData.sURL, this);
			// ruta*/
			// https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/			
			//this.stage.loaderInfo.parameters;			
			cargarJSON();
			//cargarJSONSession();
			

			//cargarJSONSession();
			//cargarJSON();
			
		}
		
		public function cargarJSONSession():void 
		{
			// cargar preguntas
			//jsonPath = "user.json";
			jsonPath = oData.sURL+"/usuarios/juego/usuario-prueba"
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			request.url = jsonPath;
			loader.addEventListener(Event.COMPLETE, onLoaderCompleteSession);
			loader.load(request);
		}
		
		public function cargarJSON():void 
		{
			// cargar preguntas
			//jsonPath = "user.json";
			//jsonPath = "https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/obtener-usuario"
			jsonPath = oData.sURL+"/usuarios/juego/obtener-usuario"
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			request.url = jsonPath;
			loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			loader.load(request);
			
		}
		
		private function onLoaderComplete(e:Event):void
		{
			var loader:URLLoader = URLLoader(e.target);
			var jsonObject:Object = JSON.decode(loader.data);
			//MonsterDebugger.initialize(jsonObject);
			//trace("jsonObject " + jsonObject);
			
			if (jsonObject.data) 
			{
				initHome(jsonObject);
				
			} else {
				//trace("no hay data");
				//trace(jsonObject.error);
				txt.visible = true;
				txt.text = jsonObject.error;
				ingresa_btn.visible = true;
			}
			
		}
		
		private function onLoaderCompleteSession(e:Event):void
		{
			var loader:URLLoader = URLLoader(e.target);
			var jsonObject:Object = JSON.decode(loader.data);
			//MonsterDebugger.initialize(jsonObject);
			//trace("jsonObject " + jsonObject);
			
			cargarJSON();
			
		/*	if (jsonObject.data) 
			{
				initHome(jsonObject);
				
			} else {
				//trace("no hay data");
				trace(jsonObject.error);
				txt.visible = true;
				txt.text = jsonObject.error;
			}*/
		}
		
		public function initHome(jsonObject:Object):void 
		{
			
			//trace("jsonObject " + jsonObject.data);
			NavPage.oData = jsonObject.data;
			//oData = jsonObject.data;
			trace(NavPage.oData.gender);
			//trace(NavPage.oData.name);
			//trace(NavPage.oData.gender);
			//trace(NavPage.oData.gameStatus);
			//trace(NavPage.oData.gameStatus.casillas);
			
			Gaia.api.goto(Pages.HOME);
			
			//usuario_mc.oDataUser = oDataUser;
			//usuario_mc.oDataGameStatus = oDataGameStatus;
			
		/*	usuario_mc.setUsuario();
			usuario_mc.setDetalle();
			
			//tablero_mc.oDataUser = oDataUser;
			//tablero_mc.oDataGameStatus = oDataGameStatus;
			tablero_mc.setTablero();
			
			//info_mc.puntaje_mc.oDataGameStatus = oDataGameStatus;
			info_mc.puntaje_mc.setPuntaje();
			
			//info_mc.avatar_mc.oDataUser = oDataUser;
			info_mc.avatar_mc.setAvatar();
			
			verificarTurnos();*/
			//
			
			mute_mc.addEventListener('click', onClickMute);
		}
		
		private function onClickMute(e:Event):void 
		{
			if (!bMute) 
			{
				bMute = true;
				Gaia.api.setGlobalVolume(0);
				mute_mc.gotoAndStop(2);
			} else {
				Gaia.api.setGlobalVolume(1);
				mute_mc.gotoAndStop(1);
				bMute = false;
			}
			
		}
		
		
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
		
		public function playLoop(s:String = null):void 
		{
			trace("playLoop "+s);
			
			var transforming:SoundTransform;
			switch (s) 
			{
				case "home":
					return;
					transforming = new SoundTransform(0.50);
					loopHome.play(0.2, 999, transforming);					
					loopHome.addEventListener('soundComplete', onSoundCompleteLoopHome);
				break;
			case "music1":
					return;
					transforming = new SoundTransform(1);
					loopMusic1.play(0, 999, transforming);
					loopMusic1.addEventListener('soundComplete', onSoundCompleteLoopMusic1);
				break;
			case null:
					playLoop("home");
					return;
					playLoop("music1");						
				break;
				default:
			}
			
		}
		
		public function sfxPlay(s:String):void {
			try 
			{
				switch (s) 
				{
					case "click":
						sfxClick.play();	
					break;
					case "coin":
						sfxCoin.play();	
					break;
					case "swap":
						sfxSwap.play();	
					break;
					case "win":
						sfxWin.play();	
					break;
					case "loose":
						sfxLoose.play();	
					break;
					default:
				}
			} catch	(e:Error) {
				
			}
				
		}	
		
		private function onSoundCompleteLoopHome(e:Event):void 
		{
			loopHome.removeEventListener('soundComplete', onSoundCompleteLoopHome);
			playLoop();
		}
		
		private function onSoundCompleteLoopMusic1(e:Event):void 
		{
			loopMusic1.removeEventListener('soundComplete', onSoundCompleteLoopHome);
			playLoop("music1");
		}
		
		public function stopLoop():void 
		{	
			return;
			loopHome.removeEventListener('soundComplete', onSoundCompleteLoopHome);
			loopHome.stop();			
			loopMusic1.removeEventListener('soundComplete', onSoundCompleteLoopHome);
			loopMusic1.stop();
		}
		
		public function fadeOutLoop():void 
		{	
			return;
			loopHome.fadeTo(0, .5, onSoundFadeOutLoopComplete);			
			loopMusic1.fadeTo(0, .5);
		}
		
		private function onSoundFadeOutLoopComplete():void 
		{
			stopLoop();			
		}
	}
}
