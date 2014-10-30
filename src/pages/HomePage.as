package pages
{
	import com.adobe.serialization.json.JSON;
	import com.gaiaframework.utils.SoundGroup;
	import flash.media.SoundTransform;
	import flash.net.URLVariables;
	
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import flash.geom.Matrix;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	import flash.geom.Rectangle;
	import flash.geom.Point;
	
	import com.gaiaframework.api.ISound;
	 
	import com.demonsters.debugger.MonsterDebugger;
	
	public class HomePage extends AbstractPage
	{	
		public var tablero_mc:MovieClip;
		public var mask_mc:MovieClip;
		public var lanzamoneda_mc:MovieClip;
		public var usuario_mc:MovieClip;
		public var info_mc:MovieClip;
		public var bg_mc:MovieClip;
		
		//public var oDataUser:Object = [ {  "id": "715929801",  "name": "Benjamín Rengifo", "gender":"m" } ];
		//public var oDataGameStatus:Object = [ {  "id": "715929801",  "casilla": "8", "turnos": "50", "puntos":"1234"} ];
		
		public var isZoomed:Boolean = false;  //a var to keep track of whether your zoomed in or out
		public var jsonPath:String;
		public static var oData:Object = new Object();
		
		var percX:Number;
		var percY:Number;
		var destX:Number;
		var destY:Number;
		var isDragging:Boolean = false; //a var to keep track of whether the bg is being dragged
		var tmpMousePoint:Point = new Point(); //this stores the mouse coordinates on the mouse down, to compare later on the mouse up to see if the mouse moved
		var decay:Number = .27; //make this lower for slower drag, make it 1 to turn off a smooth drag all together
		var tmpMouseMoved:Boolean = false; //to keep track on mouse up whether the action was a drag or a click
		var mouseMoveSensitivity:Number = 15; //how far does mouse need to move before you cancel the click event
		var offset:Point = new Point(); //the offset of the initial mouse click relative to bg_mc's  0,0
		
		public function HomePage()
		{
			//super();
			alpha = 0;
			//new Scaffold(this);
			if (stage) doInit();
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		public function doInit(e:Event = null)
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			//cargarJSON();
		
		}
		
	/*	public function cargarJSON():void 
		{
			// cargar preguntas
			jsonPath = "user.json"
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest();
			request.url = jsonPath;
			loader.addEventListener(Event.COMPLETE, onLoaderComplete);
			loader.load(request);
		}*/
		
		/*private function onLoaderComplete(e:Event):void
		{
			var loader:URLLoader = URLLoader(e.target);			
			var jsonObject:Object = JSON.decode(loader.data);
			if (jsonObject.data) 
			{
				initHome(jsonObject);
			} else {
				trace("no hay data");
			}
			
			
		}*/
		
		public function initHome():void 
		{	
			//trace("jsonObject " + jsonObject.data);
			//NavPage.oData = jsonObject.data;
			//oData = jsonObject.data;
		/*	trace(NavPage.oData.id);
			trace(NavPage.oData.name);
			trace(NavPage.oData.gender);
			trace(NavPage.oData.gameStatus);
			trace(NavPage.oData.gameStatus.casillas);
			*/
			
			//scaleAroundMouse(bg_mc, .28);
			//isZoomed = true;
			
			usuario_mc.setUsuario();
			usuario_mc.setDetalle();
			tablero_mc.alpha = 0;
			TweenMax.delayedCall(1.4, tablero_mc.setTablero);
			//TweenMax.to(tablero_mc, .3, { alpha:0, onComplete:tablero_mc.setTablero, ease:Quad.easeOut, delay:1} );
			info_mc.puntaje_mc.setPuntaje();
			
			//info_mc.avatar_mc.oDataUser = oDataUser;
			info_mc.avatar_mc.setAvatar();
			
			verificarTurnos();
			
			
			
			bg_mc = tablero_mc;
			
			//bg_mc.doubleClickEnabled = true;
			bg_mc.addEventListener(MouseEvent.MOUSE_DOWN,mouseDown);
			bg_mc.addEventListener(MouseEvent.CLICK,mouseClick, false, 99999); //listen with a higher priority than any other click listeners on bg_mc - this way if it's a drag, you can cancel the click event
			//Image panned and masked
			//bg_mc.mask = mask_mc;
			
			//Add listeners for the imgLoader movie clip.
			bg_mc.doubleClickEnabled = true;  
			//bg_mc.addEventListener(MouseEvent.DOUBLE_CLICK, increaseSize);
			
			//bg_mc.addEventListener(MouseEvent.CLICK, decreaseSize,false,0,true);
			//bg_mc.addEventListener(MouseEvent.DOUBLE_CLICK, decreaseSize);
			
			stage.addEventListener(MouseEvent.MOUSE_WHEEL,ZM,false,0,true);//adding to the stage means the mouse does not have to be over the sprite in order to zoom
			
			scaleAroundMovieClip(bg_mc, bg_mc, .28);
			bg_mc.y = 500;
			isZoomed = true;
			
			//
		}
		
		function ZM(e:MouseEvent):void
		/*ZOOM*/
		{
			/*bg_mc.width+=e.delta; // whether you adjust the scale or the width/height is up to you. I find using width/height easier to control
			bg_mc.height+=e.delta;*/
			//trace("e.delta " + e.delta);
			var nDelta:int = e.delta;
			if (nDelta >= 1) 
			{					
				if (isZoomed) 
				{
					scaleAroundMouse(bg_mc, 1, getBoundsRect());
					isZoomed = false;
				}
				
			} else {
				if (!isZoomed) 
				{
					scaleAroundMouse(bg_mc, .28);
					isZoomed = true;
				}				
			}			
		}
		
		public function scaleAroundMouse(objectToScale:DisplayObject, scaleAmount:Number,          
			bounds:Rectangle = null, onComplete:Function = null):TweenLite {
			// scaling will be done relatively
			var relScaleX:Number = scaleAmount / objectToScale.scaleX;
			var relScaleY:Number = scaleAmount / objectToScale.scaleY;
			// map vector to centre point within parent scope

			var scalePoint:Point = objectToScale.localToGlobal( new         
			Point(objectToScale.mouseX, objectToScale.mouseY));
			scalePoint = objectToScale.parent.globalToLocal( scalePoint );
			// current registered postion AB
			var AB:Point = new Point( objectToScale.x, objectToScale.y );
			//trace("AB "+AB);
			// CB = AB - scalePoint, objectToScale vector that will scale as it runs from the centre
			var CB:Point = AB.subtract( scalePoint );
			CB.x *= relScaleX;
			CB.y *= relScaleY;
			// recaulate AB, objectToScale will be the adjusted position for the clip
			AB = scalePoint.add( CB );
			// set actual properties
			//trace("bounds " + bounds);
			var limits:Rectangle;
			if(bounds){
				limits = new Rectangle(
					bounds.x + (bounds.width - (objectToScale.width * relScaleX)),
					bounds.y + (bounds.height - (objectToScale.height * relScaleY)),
					(objectToScale.width * relScaleX) - bounds.width,
					(objectToScale.height * relScaleY) - bounds.height
				);
				
				//trace("limits "+limits);
				
				if(AB.x < limits.x) AB.x = limits.x;
				if(AB.x > limits.x + limits.width) AB.x = limits.x + limits.width;
				if(AB.y < limits.y) AB.y = limits.y;
				if(AB.y > limits.y + limits.height) AB.y = limits.y + limits.height;      
			} else {
				//trace("no bounds ");
				//trace("objectToScale " + objectToScale.x);
				limits = new Rectangle(
					mask_mc.x + (mask_mc.width - (objectToScale.width * relScaleX)),
					mask_mc.y + (mask_mc.height - (objectToScale.height * relScaleY)),
					(objectToScale.width * relScaleX) - mask_mc.width,
					(objectToScale.height * relScaleY) - mask_mc.height
				);
				
				//trace("limits "+limits);
				
				if(AB.x < limits.x) AB.x = limits.x;
				if(AB.x > limits.x + limits.width) AB.x = limits.x + limits.width;
				if(AB.y < limits.y) AB.y = limits.y;
				if(AB.y > limits.y + limits.height) AB.y = limits.y + limits.height;  
			}

			TweenLite.killTweensOf(objectToScale); //need to add this so the click/double click don't compete with each other
			return TweenLite.to(objectToScale, 1,{onComplete: onComplete, 
			scaleX: scaleAmount, scaleY: scaleAmount, x: AB.x, y: AB.y});
		}
		
		public function scaleAroundMovieClip(mc:MovieClip, objectToScale:DisplayObject, scaleAmount:Number,          
			bounds:Rectangle = null, onComplete:Function = null):TweenLite {
			// scaling will be done relatively
			var relScaleX:Number = scaleAmount / objectToScale.scaleX;
			var relScaleY:Number = scaleAmount / objectToScale.scaleY;
			// map vector to centre point within parent scope

			var scalePoint:Point = objectToScale.localToGlobal( new         
			Point(mc.x+400, mc.y-380));
			scalePoint = objectToScale.parent.globalToLocal( scalePoint );
			// current registered postion AB
			var AB:Point = new Point( objectToScale.x, objectToScale.y );
			//trace("AB "+AB);
			// CB = AB - scalePoint, objectToScale vector that will scale as it runs from the centre
			var CB:Point = AB.subtract( scalePoint );
			CB.x *= relScaleX;
			CB.y *= relScaleY;
			// recaulate AB, objectToScale will be the adjusted position for the clip
			AB = scalePoint.add( CB );
			// set actual properties
			//trace("bounds " + bounds);
			var limits:Rectangle;
			if(bounds){
				limits = new Rectangle(
					bounds.x + (bounds.width - (objectToScale.width * relScaleX)),
					bounds.y + (bounds.height - (objectToScale.height * relScaleY)),
					(objectToScale.width * relScaleX) - bounds.width,
					(objectToScale.height * relScaleY) - bounds.height
				);
				
				//trace("limits "+limits);
				
				if(AB.x < limits.x) AB.x = limits.x;
				if(AB.x > limits.x + limits.width) AB.x = limits.x + limits.width;
				if(AB.y < limits.y) AB.y = limits.y;
				if(AB.y > limits.y + limits.height) AB.y = limits.y + limits.height;      
			} else {
				//trace("no bounds ");
				//trace("objectToScale " + objectToScale.x);
				limits = new Rectangle(
					mask_mc.x + (mask_mc.width - (objectToScale.width * relScaleX)),
					mask_mc.y + (mask_mc.height - (objectToScale.height * relScaleY)),
					(objectToScale.width * relScaleX) - mask_mc.width,
					(objectToScale.height * relScaleY) - mask_mc.height
				);
				
				//trace("limits "+limits);
				
				if(AB.x < limits.x) AB.x = limits.x;
				if(AB.x > limits.x + limits.width) AB.x = limits.x + limits.width;
				if(AB.y < limits.y) AB.y = limits.y;
				if(AB.y > limits.y + limits.height) AB.y = limits.y + limits.height;  
			}

			TweenLite.killTweensOf(objectToScale); //need to add this so the click/double click don't compete with each other
			return TweenLite.to(objectToScale, 1,{onComplete: onComplete, 
			scaleX: scaleAmount, scaleY: scaleAmount, x: AB.x, y: AB.y});
		}


		public function increaseSize(event:MouseEvent=null):void {
			//trace("increaseSize");
			
			//scaleAroundMouse(bg_mc, 1, getBoundsRect());
			scaleAroundMovieClip(bg_mc.ficha_mc, bg_mc, 1, getBoundsRect());
			isZoomed = false;
			
			/*var affineTransform:Matrix = tablero_mc.transform.matrix;
			affineTransform.translate( -mouseX, -mouseY );
			affineTransform.scale( 0.8, 0.8 );
			affineTransform.translate( mouseX, mouseY );
			var originalMatrix:Matrix = tablero_mc.transform.matrix;
			TweenLite.to(originalMatrix, 0.7, {a:affineTransform.a, b:affineTransform.b, c:affineTransform.c, d:affineTransform.d, tx:affineTransform.tx, ty:affineTransform.ty, onUpdate:applyMatrix, onUpdateParams:[originalMatrix]});
	*/
			/*if(isZoomed){
				scaleAroundMouse(bg_mc, 1, getBoundsRect());
				isZoomed = false;
			}*/
		}
		
		public function applyMatrix(o:Object):void 
		{
			//trace("o "+o);
		}
		


		public function decreaseSize(event:MouseEvent):void {
			//trace("decreaseSize doubleClick");
			if (!isZoomed) {
				//trace("lol isZoomed "+isZoomed);
				scaleAroundMouse(bg_mc, .4, getBoundsRect());  
				isZoomed = false;
			} 
		}
		
		private function mouseDown(e:Event):void {
			/*if (isZoomed) 
			{
				scaleAroundMouse(bg_mc, 1, getBoundsRect());
				isZoomed = false;
			}*/
			
            //reset these to default
			isDragging = true;
			tmpMouseMoved = false;

			tmpMousePoint.x = mouseX; //capture the current mouse to check later if it moved (so you know the user intended to drag not click)
			tmpMousePoint.y = mouseY;
			offset.x = bg_mc.mouseX;
			offset.y = bg_mc.mouseY;

			bg_mc.addEventListener(Event.ENTER_FRAME,bgEnterFrame); //listen every frame until the mouse is released
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		}
		
		private function bgEnterFrame(e:Event):void {
			
			//trace("ef " + isZoomed);
			
			if (!isZoomed) 
			{
				bg_mc.x += decay * (mouseX - offset.x - bg_mc.x);
				bg_mc.y += decay * (mouseY - offset.y - bg_mc.y);

				var bounds:Rectangle = getBoundsRect();

				switch(true){
					case (bg_mc.x < bounds.x):
						bg_mc.x = bounds.x;
						break;

					case (bg_mc.x > bounds.x + bounds.width):
						bg_mc.x = bounds.x + bounds.width;
				}
		
				switch(true){
					case (bg_mc.y < bounds.y):
						bg_mc.y = bounds.y;
						break;

					case (bg_mc.y > bounds.y + bounds.height):
						bg_mc.y = bounds.y + bounds.height;
				}

				if(Math.abs(tmpMousePoint.x - mouseX) > mouseMoveSensitivity || Math.abs(tmpMousePoint.y - mouseY) > mouseMoveSensitivity){
					tmpMouseMoved = true;
				}
			}
			
			
		}

		private function mouseUp(e:Event):void {
			try 
			{
				isDragging = false;
			//remove listeners
				bg_mc.removeEventListener(Event.ENTER_FRAME,bgEnterFrame);
				stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			} catch (e:Error) {
				
			}
			
		}

		private function mouseClick(e:MouseEvent):void {
			trace("CLICK cap");
			trace("mouseClick isZoomed " + isZoomed);
			/*if (isZoomed) 
			{
				scaleAroundMouse(bg_mc, 1, getBoundsRect());
				isZoomed = false;
			}*/
			if(tmpMouseMoved){
				trace("Kill");
				e.stopImmediatePropagation(); //cancel the mouse event
			}
		}
		
		
		
		private function getBoundsRect():Rectangle {
			return new Rectangle((mask_mc.x + mask_mc.width) - bg_mc.width, (mask_mc.y + mask_mc.height) - bg_mc.height, bg_mc.width - mask_mc.width, bg_mc.height - mask_mc.height);
		}
		
		public function verificarTurnos():void 
		{
			var nTurnos:uint = uint(NavPage.turnos);
			trace("nTurnos " + nTurnos);
			if (nTurnos > 0) 
			{
				trace("tiene " + nTurnos + " turnos, preparar el boton de lanzar moneda" );
				initGame();
			} else {
				trace("no tiene turnos mostrar avisos y fin");
				Gaia.api.goto('index/nav/home/fin_turnos');
			}
			
			//https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/obtener-turnos
			//var uploadPath:String = "https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/obtener-turnos";
			/*MonsterDebugger.initialize(this);
			MonsterDebugger.trace("NavPage.sURL "+NavPage.sURL, this);*/
			//trace("nav page "+NavPage.sURL);
			var uploadPath:String = oData.sURL+"/usuarios/juego/obtener-turnos";
			var urlRequest:URLRequest = new URLRequest();
			var urlVars:URLVariables = new URLVariables();
			urlRequest = new URLRequest();
			urlRequest.url = uploadPath;
			
			
			urlRequest.data = urlVars;
			
			var urlLoader:URLLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, completeHandlerTurnos);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			urlLoader.addEventListener(Event.OPEN, openHandler);
			urlLoader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			urlLoader.addEventListener(HTTPStatusEvent.HTTP_STATUS, httpStatusHandler);
			urlLoader.load(urlRequest);
			trace(urlRequest.url +"?"+urlRequest.data);
			
		}
		
		private function completeHandlerTurnos(e:Event):void 
		{
			trace("completeHandlerTurnos "+e.currentTarget.data);
		}
		
		public function sumarPuntos(n:int):void 
		{
			//NavPage.puntos = NavPage.puntos + n;
			//NavPage.bWin = true;
			MovieClip(Gaia.api.getPage(Pages.NAV).content).sumarPuntos(n);
		}
		
		public function restarTurno():void 
		{
			var nTurnos:uint = uint(NavPage.turnos);
			
			//bypass
			// implementar servicio lanzar moneda			
			
			if (nTurnos > 0) 
			{
				NavPage.turnos = uint(NavPage.turnos) - 1;
				trace("NavPage.turnos  "+NavPage.turnos );
			} else 
			{
				trace("no tiene turnos, continuar con el fin de los turnos");
				Gaia.api.goto('index/nav/home/fin_turnos');
			}
			
			//usuario_mc.oDataGameStatus = oDataGameStatus;
			usuario_mc.setDetalle();
			
			//return;
			
			//var uploadPath:String = "https://www.internet-applabs.com/clientes/interbank/interbank-juego/public/usuarios/juego/guardar-lanzamiento";
			var uploadPath:String =oData.sURL+"/usuarios/juego/guardar-lanzamiento";
			var urlRequest:URLRequest = new URLRequest();
			var urlVars:URLVariables = new URLVariables();
			urlRequest = new URLRequest();
			urlRequest.url = uploadPath;
			
			urlVars.moneda = NavPage.moneda;
			
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
		
		private function completeHandler(e:Event):void 
		{
			
		}
		
		public function initGame():void 
		{
			lanzamoneda_mc.activarBoton();
		}
		
		override public function transitionIn():void 
		{
			super.transitionIn();
			//this.y = -490
			TweenMax.to(this, 0.5, { alpha:1, onComplete:transitionInComplete, ease:Quad.easeOut} );
			//TweenMax.from(tablero_mc, 0.3, { x:400, onComplete:transitionInComplete } );
			
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
			
			
			initHome();
			MovieClip(Gaia.api.getPage(Pages.NAV).content).playLoop();
		}
		
		public function initSounds():void 
		{
			
		}
		
		
		
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.5, { alpha:0, onComplete:transitionOutComplete } );
		}
	}
}

