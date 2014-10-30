package pages.home {
	import fl.containers.UILoader;
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import com.greensock.TweenMax;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import pages.HomePage;
	import pages.NavPage;
	
	import com.greensock.easing.*;
	import com.greensock.plugins.*;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	
	 import com.demonsters.debugger.MonsterDebugger;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Tablero extends MovieClip
	{
		private var nXActual:Number = 0;
		private var nXAnterior:Number = 0;
		
		public var mcTablero:MovieClip;
		
		public var t0:MovieClip;
		public var t1:MovieClip;
		public var t2:MovieClip;
		public var t3:MovieClip;
		public var t4:MovieClip;
		public var t5:MovieClip;
		public var t6:MovieClip;
		public var t7:MovieClip;
		public var t8:MovieClip;
		public var t9:MovieClip;
		public var t10:MovieClip;
		public var t11:MovieClip;
		public var t12:MovieClip;
		public var t13:MovieClip;
		public var t14:MovieClip;
		public var t15:MovieClip;
		public var t16:MovieClip;
		public var t17:MovieClip;
		public var t18:MovieClip;
		public var t19:MovieClip;
		public var t20:MovieClip;
		public var t21:MovieClip;
		public var t22:MovieClip;
		public var t23:MovieClip;
		public var t24:MovieClip;
		public var t25:MovieClip;
		public var t26:MovieClip;
		public var t27:MovieClip;
		public var t28:MovieClip;
		public var t29:MovieClip;
		public var t30:MovieClip;
		public var t31:MovieClip;
		public var t32:MovieClip;
		public var t33:MovieClip;
		public var t34:MovieClip;
		public var t35:MovieClip;
		public var t36:MovieClip;
		public var t37:MovieClip;
		public var t38:MovieClip;
		public var t39:MovieClip;
		public var t40:MovieClip;
		public var t41:MovieClip;
		
		public var ficha_mc:MovieClip;
		
		public var nCasillaActual:int = 0;
		
		public var aRecorridoCompleto:Array;
		public var aRecorrido:Array;
		
		/*public var oDataUser:* = [ {  "id": "715929801",  "name": "Benjamín Rengifo" } ];
		public var oDataGameStatus:* = [ {  "id": "715929801",  "casilla": "38", "turnos": "10" } ];*/
		
		public var dragger_mc:MovieClip;
		
		public var bg_mc:MovieClip;
		
		public function Tablero() 
		{
			mcTablero = this;
			TweenPlugin.activate([BezierPlugin]);
/*			aRecorridoCompleto = [
					{x:t0.x,y:t0.y},
					{x:t1.x,y:t1.y},
					{x:t2.x,y:t2.y},
					{x:t3.x,y:t3.y},				
					{x:t4.x,y:t4.y},
					{x:t5.x,y:t5.y},
					{x:t6.x,y:t6.y},
					{x:t7.x,y:t7.y},
					{x:t8.x,y:t8.y},
					{x:t9.x,y:t9.y},				
					{x:t10.x,y:t10.y},
					{x:t11.x,y:t11.y},
					{x:t12.x,y:t12.y},
					{x:t13.x,y:t13.y},				
					{x:t14.x,y:t14.y},
					{x:t15.x,y:t15.y},
					{x:t16.x,y:t16.y},
					{x:t17.x,y:t17.y},
					{x:t18.x,y:t18.y},
					{x:t19.x,y:t19.y},				
					{x:t20.x,y:t20.y},
					{x:t21.x,y:t21.y},
					{x:t22.x,y:t22.y},
					{x:t23.x,y:t23.y},
					{x:t24.x,y:t24.y},
					{x:t25.x,y:t25.y},
					{x:t26.x,y:t26.y},
					{x:t27.x,y:t27.y},
					{x:t28.x,y:t28.y},
					{x:t29.x,y:t29.y},				
					{x:t30.x,y:t30.y},
					{x:t31.x,y:t31.y},
					{x:t32.x,y:t32.y},
					{x:t33.x,y:t33.y},
					{x:t34.x,y:t34.y},
					{x:t35.x,y:t35.y},
					{x:t36.x,y:t36.y},
					{x:t37.x,y:t37.y},
					{x:t38.x,y:t38.y},
					{x:t39.x,y:t39.y},				
					{x:t40.x,y:t40.y},
					];
			aRecorrido = aRecorridoCompleto;	*/
			//trace("oDataGameStat "+oDataGameStatus[0].turnos);
			
			//setTablero();
			
			//doMoverFicha(38);
			//setCasillas(1);
			
			//dragger_mc.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownDo);
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
			
		}
		
		public function loadBG():void 
		{
			/*UILoaderLoad("images/paso01.jpg", bg_mc.bg1);
			UILoaderLoad("images/paso02.jpg", bg_mc.bg2);
			UILoaderLoad("images/paso03.jpg", bg_mc.bg3);
			UILoaderLoad("images/paso04.jpg", bg_mc.bg4);
			UILoaderLoad("images/paso05.jpg", bg_mc.bg5);
			UILoaderLoad("images/paso06.jpg", bg_mc.bg6);*/
		}
		
		public function doInit(e:Event=null):void 
		{

			
			/*var aCuestionario:Array = new Array(1, 2, 3, 4, 13, 14, 15, 24, 25, 26, 27, 34, 35, 36, 37, 40);
			var aSorpresa:Array = new Array(9, 10, 11, 12, 20, 21, 22, 23, 28, 29, 30, 38, 39);
			//var aCuestionario:Array = new Array(3, 4, 13, 14, 15, 24, 25, 26, 27, 34, 35, 36, 37, 40);
			//var aSorpresa:Array = new Array(1, 2, 9, 10, 11, 12, 20, 21, 22, 23, 28, 29, 30, 38, 39);
			var aJuego1:Array = new Array(5, 6, 7, 8);
			var aJuego2:Array = new Array(16, 17, 18, 19);
			var aJuego3:Array = new Array( 31, 32, 33);*/
				
			// setTipo = 0, inicio
			
			// setTipo = 1, cuestionario
			// setTipo = 2, juego 1
			// setTipo = 3, juego 2
			// setTipo = 4, juego 3
			// setTipo = 5, sorpresa
			
			// setTipo = 6, fin
			
			//                                                                           id
		/*	var aCuestionario:Array = new Array(1,4, 8, 12, 16, 20, 24, 28, 32, 36, 40); // 1
			var aJuego1:Array = new Array(2, 6, 10, 14, 18, 22, 26, 30, 34, 38);             // 2
			var aJuego2:Array = new Array(3, 7, 11, 15, 19, 23, 27, 31, 35, 37);             // 3
			var aJuego3:Array = new Array( );	                                                                // 4
			var aSorpresa:Array = new Array(5, 9, 13, 17, 21, 25, 29, 33, 39);                // 5*/
			
		
				/*
				
				
				//MovieClip(this.getChildByName("t" + i)).setTipo = 1;
				for each (var nCuestionario in aCuestionario){
					
					if (nCuestionario == i) 
					{
						//trace(nCuestionario);
						MovieClip(this.getChildByName("t" + i)).setTipo = 1;
						//return;
					}
				}
				
				for each (var nJuego1 in aJuego1){
					
					if (nJuego1 == i) 
					{
						//trace(nJuego);
						MovieClip(this.getChildByName("t" + i)).setTipo = 2;
						//return;
					}
				}
				
				for each (var nJuego2 in aJuego2){
					
					if (nJuego2 == i) 
					{
						//trace(nJuego);
						MovieClip(this.getChildByName("t" + i)).setTipo = 3;
						//return;
					}
				}
				
				for each (var nJuego3 in aJuego3){
					
					if (nJuego3 == i) 
					{
						//trace(nJuego);
						MovieClip(this.getChildByName("t" + i)).setTipo = 4;
						//return;
					}
				}
				
				for each (var nSorpresa in aSorpresa){
					
					if (nSorpresa == i) 
					{
						//trace(nSorpresa);
						MovieClip(this.getChildByName("t" + i)).setTipo = 5;
						//return;
					}
				}
				
				*/
			
		}
		
		public function UILoaderLoad(s:String, uiLoader:UILoader) {
            /*var request:URLRequest = new URLRequest(s);
            uiLoader.scaleContent = false;*/
            //uiLoader.addEventListener(Event.COMPLETE,loadComplete);
            //uiLoader.addEventListener(ProgressEvent.PROGRESS,loadProgress);            
            //uiLoader.load(request);
			uiLoader.source = s;
			
        }
		
		private function loadProgress(e:ProgressEvent):void {
            //uiLoaderLabel.text = String(e.target.percentLoaded);
        }
        private function loadComplete(e:Event):void {
            //uiLoaderLabel.text = "Load Complete";    
        }
		
		private function onMouseDownDo(e:MouseEvent):void 
		{
			
		}
		
		public function setTablero():void 
		{
			nCasillaActual = int(NavPage.casillaActual);
			setFichaPosicion(nCasillaActual);
			var aPrimerNombre:Array = NavPage.name.split(" ");
			var s:String = aPrimerNombre[0].toUpperCase();
			ficha_mc.nombre_txt.htmlText = "<b>" + s + "</b>";
			
			//MonsterDebugger.initialize(NavPage.casillas);
			
			for (var i:int = 0; i <=41; i++) 
			{				
				if (i == 0) 
				{
					MovieClip(this.getChildByName("t" + i)).setTipo = 0;
				}
				
				if (i == 41) 
				{
					MovieClip(this.getChildByName("t" + i)).setTipo = 6;
				}
				
				if (i > 0 && i < 41) 
				{
					MovieClip(this.getChildByName("t" + i)).setTipo = NavPage.casillas[i - 1].tipo;
					MovieClip(this.getChildByName("t" + i)).setStars = NavPage.casillas[i - 1].stars;
				}
			}
		}
		
		public function setFichaPosicion(n:int):void 
		{
			ficha_mc.x = MovieClip(this)["t" + nCasillaActual].x;
			ficha_mc.y = MovieClip(this)["t" + nCasillaActual].y;
			
			
			
			doMoverTablero();
			MovieClip(this).ficha_mc.setBehavior("parado");
			TweenMax.delayedCall(.5, mostrarTablero);
		}
		
		public function setStarsCasilleroActual():void 
		{
			MovieClip(this.getChildByName("t" + NavPage.casillaActual)).setStars = NavPage.nStars;
		}
		
		private function mostrarTablero():void 
		{
			TweenMax.to(this, .5, {alpha:1, ease:Quad.easeInOut});
		}
		
		public function doMoverFicha(n:int):void 
		{
			aRecorrido = new Array();
			aRecorrido = setCasillas(n);
			NavPage.moneda = n;
			//trace("domoverficha NavPage.moneda "+NavPage.moneda);
			TweenMax.to(ficha_mc, 2 , { bezier:aRecorrido, curviness:2, ease:Quad.easeInOut, onUpdate: doMoverTablero, onComplete: doCheckCasilla });
		}
		
		public function doCheckCasilla():void 
		{
			//trace("mc " + MovieClip(this)["t" + nCasillaActual].name);
			
			
			var nTipo:int = (MovieClip(this)["t" + nCasillaActual].getTipo);
			for (var i:int = 1; i < 41; i++) 
			{
				MovieClip(this)["t" + i].actual_mc.gotoAndStop(1);
			}
			MovieClip(this)["t" + nCasillaActual].actual_mc.gotoAndStop(2);
			MovieClip(this)["t" + nCasillaActual].actual_mc.alpha = 0;
			TweenMax.to(MovieClip(this)["t" + nCasillaActual].actual_mc, 1, { alpha:1, ease:Quad.easeInOut, onComplete:ejecutarTipo, onCompleteParams:[nTipo] } );
			ficha_mc.setBehavior("parado");
			
			NavPage.casillaActual = nCasillaActual;
			MovieClip(parent).usuario_mc.setDetalle();
			//ficha_mc.behavior_mc.scaleX = 1;
			
			TweenMax.to(ficha_mc.behavior_mc, .3, { scaleX:1, ease:Quad.easeOut});
		}
		
		public function ejecutarTipo(nTipo:uint):void 
		{
			NavPage.tipoActual = nTipo;
			switch (nTipo) 
			{
				case 0:
					trace("ejecutar inicio");
					MovieClip(this).ficha_mc.setBehavior("parado");
					MovieClip(parent).verificarTurnos();
				break;
				case 1:
					trace("ejecutar cuestionario");
					MovieClip(this).ficha_mc.setBehavior("parado");
					Gaia.api.goto('index/nav/home/cuestionario');
					
				break;
				case 2:
					trace("ejecutar juego 1");
					MovieClip(this).ficha_mc.setBehavior("parado");
					Gaia.api.goto('index/nav/juego1');
				break;
				case 3:
					trace("ejecutar juego 2");
					MovieClip(this).ficha_mc.setBehavior("parado");
					Gaia.api.goto('index/nav/juego2');
				break;
				case 4:
					trace("ejecutar juego 3");
					MovieClip(this).ficha_mc.setBehavior("parado");
					Gaia.api.goto('index/nav/juego3');
				break;
				case 5:
					trace("ejecutar sorpresa");
					MovieClip(this).ficha_mc.setBehavior("parado");
					Gaia.api.goto('index/nav/home/sorpresa');
				break;
				case 6:
					trace("ejecutar fin");
					MovieClip(this).ficha_mc.setBehavior("fin");
					Gaia.api.goto('index/nav/home/fin_game');
				break;
			}
			//MovieClip(parent).usuario_mc.setDetalle();
			
		}
		
			
		public function setCasillas(n:int):Array 
		{		
			//trace("nCasillaActual " + nCasillaActual);
			var aCasillas:Array = new Array();	
			
			//var nCasillaSiguiente:int = nCasillaActual+n;
			var nCasillaSiguiente:int;
			//trace("nCasillaSiguiente "+nCasillaSiguiente);
			
			var aCasillasMovieClips:Array = new Array();
			
			var nCasilla:int;
			if (n > 0) 
			{
				nCasillaSiguiente = nCasillaActual+n;
				for (var i:int = nCasillaActual; i <=  nCasillaSiguiente; i++) 
				{ 
					nCasilla = i;
					if (i >= 42) 
					{
						switch (i) 
						{
							case 41:
								nCasilla = 40;							
							break;
							case 42:
								nCasilla = 40;
							break;
							case 43:
								nCasilla = 39;
							break;
							case 44:
								nCasilla = 38;
							break;
							case 45:
								nCasilla = 37;
							break;
						}
						aCasillasMovieClips.push(MovieClip(this)["t" + nCasilla]);
					} else {
						aCasillasMovieClips.push(MovieClip(this)["t" + nCasilla]);	
					}
					
					//trace("mc "+MovieClip(this)["t" + i].name);
				}
				//trace("aMCs "+aCasillasMovieClips.length);
			} else if (n < 0) {
				trace("retroceder casillas") ;
				nCasillaSiguiente = nCasillaActual + n;
				//trace("nCasillaSiguiente: " + nCasillaSiguiente +" = nCasillaActual: "+nCasillaActual+" - n: "+n  );
				//trace("nCasillaActual " + nCasillaActual);				
				for (var j:int = nCasillaActual; j >= nCasillaSiguiente  ; j--) 
				{ 
					
					nCasilla = j;
					trace("nCasilla "+nCasilla);
					if (j <= 0) 
					{
						switch (i) 
						{
							case 0:
								nCasilla = 0;
							break;
							case -1:
								nCasilla = 0;
							break;
							case -2:
								nCasilla = 0;
							break;
							case -3:
								nCasilla = 0;
							break;
						}
						aCasillasMovieClips.push(MovieClip(this)["t" + nCasilla]);
						//trace("if aCMCs.push: t"+nCasilla);
					} else {
						aCasillasMovieClips.push(MovieClip(this)["t" + nCasilla]);	
						//trace("else aCMCs.push: t"+nCasilla);
					}
				}
				//trace("\n");
			}
			
			
			for (var k:int = 0; k < aCasillasMovieClips.length; k++) 
			{
				aCasillas.push( { x:aCasillasMovieClips[k].x, y:aCasillasMovieClips[k].y } );				
			}
			
			nCasillaActual = nCasilla;
			//trace("nCasillaActual " + nCasillaActual);
			
			return aCasillas;
		}
		
		private function doMoverTablero():void 
		{
			
			if (nXActual >= nXAnterior) 
			{
				TweenMax.to(ficha_mc.behavior_mc, .3, { scaleX:1, ease:Quad.easeOut});
			} else if (nXActual <= nXAnterior) {
				TweenMax.to(ficha_mc.behavior_mc, .3, { scaleX:-1, ease:Quad.easeOut});
			}
			nXAnterior = nXActual;
			nXActual = ficha_mc.x;
			
			MovieClip(this).ficha_mc.setBehavior("caminar");
			//trace("ficha.x "+ficha_mc.x);
			
			if (!MovieClip(parent).isZoomed) 
			{
				if (ficha_mc.x < 430) {
					//trace("x if");
				} else {
					//trace("x else");
					//mcTablero.x = 0 - ficha_mc.x + 610;
					TweenMax.to(mcTablero, .5, { x:0 - ficha_mc.x + 610, ease:Quad.easeOut});
					
				}
				
				//trace("ficha_mc.y "+ficha_mc.y); 
				if (ficha_mc.y < -1500) 
				{
					//trace("y if")
				} else if (ficha_mc.y < 2400) 
				{
					//trace("y else");
					//mcTablero.y = 0 - ficha_mc.y + 480 - 130;
					TweenMax.to(mcTablero, .5, { y:0 - ficha_mc.y + 480 - 130, ease:Quad.easeOut});
				}
			}
			
			
		}
	}
}