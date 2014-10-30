package com.theselittlepigs.game 
{
	import com.theselittlepigs.frmBase;
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Bg extends MovieClip
	{
		public var wid:Number;
		public var speed:Number;
		public var pos:Number;
		public var now:Number;
		public var startl:Number;
		public var pic2:MovieClip;
		public var pic:MovieClip;
		public var ny:Number;
		public var i:Number;
		public function Bg() 
		{
			if (stage) doInit()
			addEventListener(Event.ADDED_TO_STAGE, doInit);
		}
		
		public function doInit(e:Event = null):void 
		{
				addFrameScript(0, doFrame1);
				addFrameScript(1, doFrame2);
				addFrameScript(2, doFrame3);
		}
		
		public function doFrame1():void 
		{
			wid = pic.height;
			pic2 = new Pic();
			addChild(pic2);
			pic2.y = pic.y + wid;
			speed = frmBase.bgspeed;
			pos = 0;
			now = 0;
			startl = 0;
		}

		public function doFrame2():void 
		{			
			if (frmBase.now > now) 
			{
				
				//trace("frmGame.now " + frmGame.now);
				//trace("now " + now);
				
				pos = pos + speed / 2;
				now = now + speed;
				frmBase.now2 = now;
				
				if (pos < -wid) 
				{
					pos = wid + pos;
				}
				if (pos>0) 
				{
					pos = 0-wid + pos;
				}
				y = pos;
				//TweenMax.to(this, 0.1, { y:pos+speed, ease:Quad.easeInOut} );
				i = startl;
				/*trace("frmGame.p " + frmGame.p);
				trace("i " + i);*/

				while (i < frmBase.p) 
				{	
					var clip:MovieClip;					
					//trace ("i " + i);
					if (MovieClip(parent).getChildByName("p"+i) != null) 
					{
						//trace("rsrs "+MovieClip(parent).getChildByName("p"+i).y);
						ny = MovieClip(parent).getChildByName("p" + i).y + (speed);
						MovieClip(parent).getChildByName("p" + i).y = ny;
						//TweenMax.to(MovieClip(parent).getChildByName("p" + i), 1, { y:ny, ease:Quad.easeInOut} );
						//MovieClip(parent).getChildByName("p" + i).y = ny;						
					} else {
						
					}

					if (ny > 550) 
					{	
						//trace(ny + "ny > 550 " + ny);			
						if (MovieClip(parent).getChildByName("p"+i) != null) 
						{
							clip = MovieClip(MovieClip(parent).getChildByName("p" + i));
							//trace("clip "+clip);
							clip.parent.removeChild(clip);						
							startl = i;
						}
						
					}			
					i = i + 1;
				}
				
				
				if (MovieClip(parent).getChildByName("grass") != null) 
				{
					if (MovieClip(parent).getChildByName("grass").visible == 1)
					{
						if (MovieClip(parent).getChildByName("grass").y < 550) 
						{
							MovieClip(parent).getChildByName("grass").y = MovieClip(parent).getChildByName("grass").y + speed;
							//TweenMax.to(MovieClip(parent).getChildByName("grass"), 1, { y:MovieClip(parent).getChildByName("grass").y + speed, ease:Quad.easeInOut} );
						}
						else
						{						
							try 
							{
								clip = MovieClip(MovieClip(parent).getChildByName("grass"));
								clip.parent.removeChild(clip);
							} 
							catch (e:Error) 
							{
								trace(e);
							}
						}
					}
				}
				
				// cake
				MovieClip(parent)["cake"].y = MovieClip(parent)["cake"].y + speed;
				if (MovieClip(parent)["cake"].y > -40) 
				{
					MovieClip(parent)["cake"].visible = true;
				}
				else 
				{
					MovieClip(parent)["cake"].visible = false;
				}
				if (MovieClip(parent)["cake"].y > 530)
				{
					MovieClip(parent)["cake"].y = 180;
					MovieClip(parent)["cake"].x = 1000;
					// icon goto and play 2
					MovieClip(parent)["cake"].gotoAndPlay(1);
				}
			}
		}
		
				
		public function doFrame3():void 
		{
			gotoAndPlay(MovieClip(this).currentFrame - 1);
		}
		
	}

}