package com.frogger 
{
	import com.adobe.utils.ArrayUtil;
	import com.reintroducing.data.Collection;
	import com.reintroducing.data.Iterator;
	import flash.text.TextField;
	import flash.utils.clearTimeout;
	import flash.utils.setTimeout;

	import flash.display.MovieClip;
	import flash.events.Event;
	
	import com.frogger.Frog;
	import com.frogger.Car;
	import com.frogger.settings.*;
	
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import com.demonsters.debugger.MonsterDebugger;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Game extends MovieClip 
	{
		public static var PLAYING:Number  = 1
		public static var STOPPED:Number  = 0
		private var status:Number

		public static var FROG_X:Number = 155
		public static var FROG_Y:Number = 580
		public static var DYING_REGION:Rectangle  = new Rectangle()
		public static var FINISH_REGION:Rectangle = new Rectangle()

		public static var WIDTH:Number
		public static var HEIGHT:Number
		public static var __game__:Game

		public var frog:Frog
		public var target:MovieClip
		public var elements:Collection;
		//var elements:Array;
		//var broadcastMessage:Function
		//var addListener:Function
		//var removeListener:Function
		
		private var startTime:Number
		private var intermediateTime:Number
		private var dateTime:Date

		private var controller:MovieClip
		private var lives_container:MovieClip
		private var movementID:Number
		private var level:Number
		private var lives:Number
		private var arrived_instances:Array
		private var points:Number
		
		public var a1:Arrivals;
		public var a2:Arrivals;
		public var a3:Arrivals;
		public var a4:Arrivals;
		public var a5:Arrivals;
		
		public var timer:MovieClip;
		public var score:TextField;
		
		public var display_panel:MovieClip;
		
		public function Game() 
		{
			super();
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			GameDoInit(this);
			WIDTH  = 483
			HEIGHT = 600
			DYING_REGION = new Rectangle(0, 120, 483, 181)
			//org.sepy.Game.FINISH_REGION = new flash.geom.Rectangle(0, 80, 483, 40)
			FINISH_REGION = new Rectangle(0, 80, 483, 40);
			Init();
			Start(true);
		}
		
		public function GameDoInit(scope:MovieClip):void 
		{
			trace("game");
			//AsBroadcaster.initialize(this);
			//this.addListener(this)
			Game.__game__ = this;
			level = 1;
			lives = 3;
			target = scope;
			points = 0;
			//controller = target.createEmptyMovieClip("__controller__", 15000)
			controller = new MovieClip();
			controller.name = "__controller__";
			addChild(controller);
			//elements = new CollectionImpl()
			elements = new Collection("elements");
			arrived_instances = [target.a1, target.a2, target.a3, target.a4, target.a5]

		}
		
		 /**
		 * Initialize a new level
		 */
		public function Init():void
		{
			for(var a:String in arrived_instances)
			{
				arrived_instances[a].init();
			}
			
			// place cars
			this.placeElement(CarSet1);
			this.placeElement(CarSet2);
			this.placeElement(CarSet3);
			this.placeElement(CarSet4);
			this.placeElement(CarSet5);

			// snake
			this.placeElement(SnakeSet1);

			// place turtles
			this.placeElement(TurtleSet1);
			this.placeElement(TurtleSet2);

			// place tree2
			this.placeElement(TreeSet1);
			this.placeElement(TreeSet2);
			this.placeElement(TreeSet3);

			// show lives
			createLives();
			status = Game.PLAYING;
			placeFrog();
			
			//test
			//removeFrog();
		}
		
		public function RemoveAll()
		{
			removeFrog();
			status = Game.STOPPED;
			var iter:Iterator = GetElements();
			while(iter.hasNext())
			{
				var item:MovieClip = MovieClip(iter.next());
				//item.removeMovieClip();
				target.removeChild(item);
			}
			elements.clear();
			target.display_panel.gotoAndStop(1);

			for(var a:String in arrived_instances)
			{
				arrived_instances[a].reset();
			}
		}
		
		private function placeFrog():void
		{
			// place the frog
			trace("placeFrog");
			//var __frog:MovieClip = target.attachMovie("frog", "frog", 15999);
			var __frog:MovieClip = new Frog();
			
			this.frog  = Frog(__frog);
			this.frog.name = "frog";
			addChild(this.frog);
			this.frog.x = Game.FROG_X;
			this.frog.y = Game.FROG_Y;
			//this.frog.addListener(this);
			this.frog.addEventListener("end_dying", end_dying);
			this.frog.gotoAndStop("firstframe");
			this.frog.resetScore();
			
		}
		
		private function removeFrog():void
		{
			//frog.removeMovieClip();	
			trace("removeFrog");
			try 
			{
				var clip:MovieClip = MovieClip(this.frog);
				clip.parent.removeChild(clip);
				
			} catch (e:Error) {
				trace(e);
			}
			
		}
		
		private function RestartLevel(force:Boolean)
		{
			//target.display_panel.gotoAndStop(1);
			target.timer.gotoAndPlay(2);
			placeFrog();
			RestartAll();
			this.Start(false);
		}
		
		

		
		 private function createLives()
		{
			// place lives
			//lives_container.removeMovieClip();
			//lives_container = target.createEmptyMovieClip("lives_container", 10);
			//lives_container = null;
			try 
			{
				removeChild(lives_container);
			} catch (e:Error) {
				
			}
			
			lives_container = new MovieClip();
			addChild(lives_container);
			var live_mc:MovieClip;
			for(var a:Number = 1; a < lives; a++)
			{
				//live_mc = lives_container.attachMovie("lives", "live_"+a, a)				
				live_mc = new mcLives();
				lives_container.addChild(live_mc);
				live_mc.y = Game.HEIGHT + (live_mc.height/2) + 10
				live_mc.x = a * (live_mc.width+10);
			}
		}
		
	    private function placeElement(className)
		{
			trace("className " + className);			
			var tot:Number = className.GetCarsNumber(GetLevel())
			var el:MovieClip;

			var w:Number = Game.WIDTH;
			var total_w:Number;
			var dist:Number

			var max_w:Number
			var min_w:Number

			var index:Number = className.depth;
			var clip_name:String
			
			for(var a:Number = 0; a < tot; a++)
			{
				clip_name = className.clipName;
				//trace("clip_name "+clip_name);
				if(className.ALT != undefined && level > 1 && a%2==0)
				{
					clip_name = className.ALT.clipName;
					trace("if "+clip_name);
				}
				//el = target.attachMovie(clip_name, clip_name+"_"+index, index)
				var ClassReference = getDefinitionByName(clip_name) as Class;
				el = new ClassReference();
				el.name = clip_name+"_" + index;
				trace(el.name);
				target.addChild(el);
				el.cacheAsBitmap = true
				total_w = el.width*(tot)
				max_w = Math.max(total_w, w)+el.width
				min_w = Math.min(total_w, w)

				dist = (max_w-(total_w))/(tot)
				el.x = ((el.width+dist)*a)
				el.rightBorder = max_w-el.width
				el.y  = className.Y
				el.direction = className.D
				el.velocity  = className.V + (className.I * this.GetLevel());
				
				el.SetStartPosition(className.D == Constants.LEFT ? el.rightBorder : -el.width/2)
				//el.SetStartPosition(className.D == -1 ? el.rightBorder : -el.width/2)
				
				if(el is Turtle)
				{
					if(el is com.frogger.Alligator)
					{
						el.submarine = true
					} else {
						el.submarine = a%2
					}
					//el.submarine = a%2
				}
				push(el);
				index += 1
			}
		}
		
		public function Start(firstTime:Boolean)
		{
			dateTime = new Date();
			if(firstTime)
			{
				startTime = dateTime.getTime();
			}
			intermediateTime = dateTime.getTime()
			frog.Play();
			//trace("Start " + firstTime);
			controller.addEventListener(Event.ENTER_FRAME, onEnterFrameController);
			/*controller.onEnterFrame = function()
			{
				if(Game.getInstance().status == Game.PLAYING)
				{
					Game.getInstance().MoveElements(Game.getInstance())
				} else {
					delete this.onEnterFrame
				}
			}*/
		}
		
		private function MoveElements(obj:Game)
		{
			obj.GetFrog().SetIsMoved(false);
			var iter:Iterator = obj.GetElements();
			while(iter.hasNext())
			{
				var el = iter.next();				
				el.Go(el);
			}
			obj.GetFrog().VerifyPosition();
		}
		
		public function GetLevel():Number
		{
			return level;
		}
		
		public function GetFrog():Frog
		{
			return frog;
		}
		
		public function GetArrivals():Array
		{
			return arrived_instances;
		}
		
		private function push(obj:MovieClip):void
		{
			elements.addItem(obj)
		}
		
		public function GetElements():Iterator
		{
			return elements.getIterator()
		}
		
		public function StopAll()
		{
			status = Game.STOPPED
			//broadcastMessage("stop_all")
			dispatchEvent(new Event("stop_all"));
		}
		
		public function RestartAll()
		{
			status = Game.PLAYING;
			//broadcastMessage("play_all")
			dispatchEvent(new Event("play_all"));
		}
		
		static public function getInstance():Game
		{
			return Game.__game__;
		}
		
		/**
		* finished the dying animation....
		*/
		private function end_dying(e:Event)
		{
			lives--
			trace('remaining lives: ' + lives)
			if(lives > 0)
			{
				removeFrog();
				RestartLevel(false);
				createLives();
			} else {
				GameOver();
			}
		}
		
		private function GameOver()
		{
			StopAll();
			target.display_panel.sText = "FIN DEL JUEGO";
			target.display_panel.gotoAndStop(3);			
			dateTime = new Date();
			var endTime:Number  = dateTime.getTime();
			var totalTime:Number = Math.round((endTime-startTime)/1000)
			trace("total time played: " + totalTime)
			trace("your score: " + points)
			trace("your level: " + level)
			
			MovieClip(root).sumarPuntos(Math.ceil(points*0.01));
			
		}
		
		public function arrived(arrivedClip:Arrivals)
		{
			dateTime = new Date();
			StopAll();
			removeFrog();
			if(arrivedClip.status == Arrivals.BONUS)
			{
				//broadcastMessage("add_points", GetFrog(), 200)
				add_points(200);
			}
			arrivedClip.touch();
			var remainingTime = Math.round((target.timer.totalFrames - target.timer.currentFrame)/30)
			//broadcastMessage("add_points", GetFrog(), remainingTime*50)
			add_points(remainingTime * 50);

			var elapsedTime = Math.round((dateTime.getTime()-intermediateTime)/1000)

			trace('clip: ' + arrivedClip)
			trace("timer: " + remainingTime);
			if(is_level_completed())
			{
				target.display_panel.sText = "AUMENTANDO NIVEL"
				trace("level up");
			} else {
				target.display_panel.sText = "TIEMPO " + elapsedTime
				trace("time "+elapsedTime);
			}
			target.display_panel.gotoAndPlay(2);
		}
		
		private function stop_all()
		{
			target.timer.stop();
		}
		
		public function end_display()
		{
			if(is_level_completed())
			{
				//broadcastMessage("add_points", GetFrog(), 500)
				add_points(500);
				level++
				RemoveAll();
				Init();
				Start(false);
			} else {
				RestartLevel(false);
			}
		}
		
		private function is_level_completed():Boolean
		{
			for(var a:String in arrived_instances)
			{
				if(arrived_instances[a].status != Arrivals.END)
				{
					return false;
				}
			}
			return true;
		}
		
		public function end_time()
		{
			GetFrog().Die(0);
		}
		
		//public function add_points(evt:Frog, pt:Number)
		public function add_points(pt:Number)
		{
			points += pt;
			target.score.text = points;
			trace("puntos "+points);
		}
		
		 /** test **/
		public function Test()
		{
			trace('############## Test ################')
			StopAll();
		}
		
		/*public function setTimeout(f:Function, t:Number, mc:MovieClip):void {
			setTimeout(f, t, mc);
		}
		
		public function clearTimeout(n:Number):void {
			clearTimeout(n);
		}*/
		
		private function onEnterFrameController(e:Event):void 
		{
				if(Game.getInstance().status == Game.PLAYING)
				{
					Game.getInstance().MoveElements(Game.getInstance())
				} else {
					//delete this.onEnterFrame
					controller.removeEventListener(Event.ENTER_FRAME, onEnterFrameController);
				}
		}

	}
}