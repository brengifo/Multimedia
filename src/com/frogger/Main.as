package com.frogger 
{
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import flash.utils.getDefinitionByName;
	
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class Main extends MovieClip
	{
		public var contenido_mc:MovieClip;
		private var content_nav_mc:MovieClip;
		private var ClassReference:Class;
		public var mask_mc:MovieClip;
		
		public function Main() 
		{
			navSelect("Game");
		}
		
		public function navSelect(s:String):void
		{
			//doNavSelect(s);
			if (this.contenido_mc.numChildren>0) 
			{
				TweenMax.to(this.contenido_mc, 0.5, { alpha:0, onComplete:navSet, onCompleteParams:[s]} );
			} else {
				navSet(s);
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
			
			ClassReference = getDefinitionByName("com.frogger."+s) as Class;
			content_nav_mc = new ClassReference();
			this.contenido_mc.addChild(content_nav_mc);
			TweenMax.to(this.contenido_mc, 0.5, { alpha:1 } );			
		}
	}
	
	

}