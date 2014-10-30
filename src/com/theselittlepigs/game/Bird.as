package com.theselittlepigs.game 
{
	import com.theselittlepigs.frmBase;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.Event;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Bird extends MovieClip
	{
		public var d:Number;
		public var b:MovieClip;
		public var udah:int;
		
		public function Bird() 
		{
			
		}
		public function doFrame(n:int):void 
		{
			switch (n) 
			{
				case 1:
					//d = eval("/:birddelay") + random(30);	
					d = frmBase.birddelay + (Math.random() * 30);				
					
				break;
				case 56:
					//d = eval("/:birdview");
					d = frmBase.birdview;
					
				break;
				
				default:
			}
		}
		
		public function initBtnListener(btn:SimpleButton):void 
		{
			
			btn.addEventListener('click', onClickBird);
		}
		
		private function onClickBird(e:Event):void 
		{			
			MovieClip(parent).getChildByName("jam").x = e.currentTarget.parent.parent.x;
			MovieClip(parent).getChildByName("jam").y = e.currentTarget.parent.y + e.currentTarget.parent.parent.y + 40;
			udah = 1;
			MovieClip(MovieClip(parent).getChildByName("jam")).gotoAndPlay(2);
			//MovieClip(MovieClip(parent).getChildByName("srope")).gotoAndPlay(2);
			e.currentTarget.parent.parent.gotoAndPlay("out");
		}
		
		
	}

}