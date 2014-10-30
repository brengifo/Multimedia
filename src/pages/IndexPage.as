﻿package pages
{
	import com.gaiaframework.templates.AbstractPage;
	import com.gaiaframework.events.*;
	import com.gaiaframework.debug.*;
	import com.gaiaframework.api.*;
	import flash.display.*;
	import flash.events.*;
	import com.greensock.TweenMax;
	//import pages.SoundASMixer;
	public class IndexPage extends AbstractPage
	{	
		public function IndexPage()
		{
			super();
			alpha = 0;
			//new Scaffold(this);
			//transitionIn();
		}
		override public function transitionIn():void 
		{
			super.transitionIn();
			//SoundASMixer.load_sound();
			TweenMax.to(this, 0.3, { alpha:1, onComplete:transitionInComplete } );
			//SoundASMixer.stopAll();
		}
		override public function transitionOut():void 
		{
			super.transitionOut();
			TweenMax.to(this, 0.3, {alpha:0, onComplete:transitionOutComplete});
		}
		
	}
}