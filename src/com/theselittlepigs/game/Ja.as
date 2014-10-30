package com.theselittlepigs.game 
{
	import com.theselittlepigs.frmBase;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Ja extends MovieClip
	{
		public var s:Number;
		public var kiri:Number;
		public var kanan:Number;
		public var atas:Number;
		public var bawah:Number;		
		
		public function Ja() 
		{
			//s = frmGame.jamspeed;
		}
		
		public function doFrame2() {
			s = frmBase.jamspeed;
			trace("doFrame2");
		}
		
		public function doJa():void 
		{
			//trace("s1 "+s);
			s = 1.05 * s;
			//trace("s2 "+s);
			y = y + s;
			
			if (frmBase.canjump == 1) 
			{
				kiri = MovieClip(parent).getChildByName("pb").x - 28;
				kanan = MovieClip(parent).getChildByName("pb").x + 28;
				atas = MovieClip(parent).getChildByName("pb").y - 25;
				bawah = MovieClip(parent).getChildByName("pb").y +35;
				if (kiri < x && x < kanan && atas < y && y < bawah) 
				{
					//trace("time icon!!!");
					MovieClip(parent)["timeicon"].gotoAndPlay("add");		
					MovieClip(parent).playSound("got");
					gotoAndStop(1);
				}
			}
		}
		
	}

}