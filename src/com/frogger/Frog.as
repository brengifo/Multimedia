package com.frogger 
{
	import flash.display.MovieClip;
	import com.frogger.Game
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Frog extends MovieClip
	{
		private var status:Number;
		
		static var STOP:Number = 1;
		static var PLAY:Number = 2;
		static var MOVE_X:Number = 8.5;
		static var MOVE_Y:Number = 10;
		static var TOTALFRAMES:Number = 4;

		public var broadcastMessage:Function;
		public var addListener:Function;
		public var removeListener:Function;

		private var ismoved:Boolean;
		private var ismoving:Boolean;
		public var boundsRegion1:MovieClip;

		private var checkID:Number ; // checker interval
		private var minpos:Number;
		
		//public var bounds:MovieClip;
		
		public function Frog() 
		{
			//AsBroadcaster.initialize(this)
			//this.addListener(this)
			stop();
			if (stage) doInit()
			else addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		private function doInit(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, doInit);
			
			this.addEventListener("movement_end", movement_end);
			this.addEventListener("movement_begin", movement_begin);
			this.addEventListener("movement_completed", movement_completed);
			
			//this.addEventListener("end_dying", end_dying);
			
			status = Frog.STOP;
			initializeListeners();
			//Game.getInstance().addListener(this);
		}
		
		public function resetScore():void
		{
			minpos = y;
		}
		
		public function Play()
		{
			//trace("Play");
			status = Frog.PLAY;
			//trace("status "+status);
			//this.checkID = _global.setTimeout(CheckPosition, 20, this)
			//this.checkID = setTimeout(CheckPosition, 20, this)
			this.checkID = setTimeout(CheckPosition, 20, this, true);
		}
		
		public function Stop()
		{
			//_global.clearTimeout(checkID);
			status = Frog.STOP;
			EndMoving();
		}
		
		public function VerifyPosition():Boolean
		{
			//trace("VerifyPosition");
			return CheckPosition(this, true);
		}
		
		/**
		 * Check the position of the FROG
		 */
		private function CheckPosition(obj:Frog, flag:Boolean):Boolean
		{
			//trace("CheckPosition");
			if(obj.status == Frog.PLAY)
			{
				var pt:flash.geom.Point = new flash.geom.Point(obj.x, obj.y);
				if(pt.y >= Game.DYING_REGION.top && pt.y <= Game.DYING_REGION.bottom)
				{
					if(!Game.DYING_REGION.containsPoint(pt))
					{
						// outside left/right bounds
						obj.Die(65)
						return false
					} else {
						if(!obj.GetIsMoved() && !obj.GetIsMoving() && flag==true)
						{
							// water! water!
							obj.Die(71)
							return false
						}
					}
				} else if(pt.y < Game.DYING_REGION.top)
				{
					trace("CheckPosition")
					var arrivals:Array = Game.getInstance().GetArrivals()
					for(var a in arrivals)
					{
						if(arrivals[a].boundsRegion1.transform.pixelBounds.intersects(obj.boundsRegion1.transform.pixelBounds))
						{
							trace("......")
							trace([arrivals[a], arrivals[a].status])
							if(arrivals[a].status === Arrivals.NOBONUS || arrivals[a].status == Arrivals.END)
							{
								obj.Die(87);
								return false
							} else {
								//obj.broadcastMessage("arrived", obj, arrivals[a])
								trace("dispatcht event arrived");
								Game.getInstance().arrived(arrivals[a]);
								
								this.removeEventListener("movement_end", movement_end);
								this.removeEventListener("movement_begin", movement_begin);
								this.removeEventListener("movement_completed", movement_completed);
								
								return false;
							}
						}
					}
					obj.Die(92);
					return false;
				}
				if(!flag)
				{
					obj.checkID = setTimeout(obj.CheckPosition, 20, obj);
				}
			}
			return true
		}
		
		public function Die(lineNum:Number)
		{
			Stop();
			/** testing */
			Game.getInstance().StopAll();
			rotate(0);
			gotoAndPlay("die");
			trace('DIE!: ' + lineNum)
		}
		
		public function Arrived()
		{

		}
		
		private function initializeListeners()
		{
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUpDo, false, 0, true);
     		//Key.addListener(this)
			
		}
		
		private function onKeyUpDo(e:KeyboardEvent):void
		{
			//trace(e.keyCode);			
			//trace("status " + status);
			//trace("ismoving " + ismoving);
			if(status != Frog.PLAY || ismoving)
			{
				return
			}
			//var code:Number = Key.getCode()
			var code:Number = e.keyCode;
			//trace("code "+code);
			switch(code)
			{
				//case Key.LEFT:
				case 37:
					move(0);
					break
				//case Key.RIGHT:
				case 39:
					move(180)
					break
				//case Key.UP:
				case 38:
					move(90)
					break
				//case Key.DOWN:
				case 40:
					move(-90)
					break
			}

		}
		
		private function move(rotation:Number)
		{
			//trace("move "+rotation);
			rotate(rotation);
			if(canMove())
			{
				if(rotation == 90)
				{
					if(y < minpos)
					{
						//broadcastMessage("add_points", this, 10)
						//dispatchEvent(new Event("add_points"), this);
						//MovieClip(parent).add_points(10);
						Game.getInstance().add_points(10);
						minpos = y;
					}
				}
				StartMoving();
				play();
			}
		}
		
		private function canMove():Boolean
		{
			var target_x:Number
			var target_y:Number
			if(rotation == 0)              // left
			{
				target_x = x - (Frog.MOVE_X * Frog.TOTALFRAMES)
			} else if(rotation == 180)     // right
			{
				target_x = x + (Frog.MOVE_X * Frog.TOTALFRAMES)
			} else if(rotation == 90)      // up
			{
				target_y = y - (Frog.MOVE_Y * Frog.TOTALFRAMES)
			} else if(rotation == -90)     // down
			{
				target_y = y + (Frog.MOVE_Y * Frog.TOTALFRAMES)
			}
			if(target_x < 0 || target_x > Game.WIDTH || target_y < 0 || target_y > Game.HEIGHT)
			{
				return false
			} else {
				return true
			}
		}
		
		private function rotate(value:Number)
		{
			if(rotation != value)
			{
				rotation = value
			}
		}
		
		private function movement_begin(evt:Object)
		{
		}

		private function movement_end(evt:Object)
		{
			EndMoving()
		}
		
		private function movement_completed(e:Event)
		{
			this.ismoving = false
		}
		
		private function StartMoving()
		{
			
			ismoving = true;
			//trace("StartMoving "+ismoving );
			this.addEventListener(Event.ENTER_FRAME, doMove);
			
			/*this.onEnterFrame = function()
			{
				if(rotation == 0)
				{
					x -= Frog.MOVE_X
				} else if(rotation == 180)
				{
					x += Frog.MOVE_X
				} else if(rotation == 90)
				{
					y -= Frog.MOVE_Y
				} else if(rotation == -90)
				{
					y += Frog.MOVE_Y
				}
			}*/
		}
		
		private function doMove(e:Event):void 
		{
			//trace("do move");
			if(rotation == 0)
			{
				x -= Frog.MOVE_X
			} else if(rotation == 180)
			{
				x += Frog.MOVE_X
			} else if(rotation == 90)
			{
				y -= Frog.MOVE_Y
			} else if(rotation == -90)
			{
				y += Frog.MOVE_Y
			}
			
		}
		
		private function EndMoving()
		{
			//trace("EndMoving");
			dispatchEvent(new Event("movement_completed"));
			this.removeEventListener(Event.ENTER_FRAME, doMove);
			/*this.onEnterFrame = function()
			{
				this.broadcastMessage("movement_completed")
				delete this.onEnterFrame
			}*/
		}
		
		private function stop_all():void
		{
			//trace('stop all: ' + this)
			this.Stop();
		}
		
		public function GetIsMoving():Boolean
		{
			return ismoving;
		}
		
		public function get bounds():MovieClip
		{
			return boundsRegion1;
		}

		public function GetIsMoved():Boolean
		{
			return ismoved;
		}

		public function SetIsMoved(value:Boolean)
		{
			ismoved = value;
		}
	}

}