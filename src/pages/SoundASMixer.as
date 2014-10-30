package pages 
{
	import treefortress.sound.SoundInstance;
	import treefortress.sound.SoundAS;
	/**
	 * ...
	 * @author Benjamín Rengifo
	 */
	public class SoundASMixer extends Object
	{
		public static var SOUND_MOUSE_UP:String = "sfxMouseUp";
		public static var SOUND_SWAP:String = "sfxSwap";
		public static var SOUND_CORRECT:String = "sfxCorrect";
		public static var SOUND_INCORRECT:String = "sfxIncorrect";
		public static var SOUND_WIN:String = "sfxWin";
		public static var SOUND_LOOSE:String = "sfxLoose";
		public static var SOUND_COIN:String = "sfxCoin";
		
		public static var SOUND_MUSIC_1:String = "loopHome";
		public static var SOUND_MUSIC_2:String = "loopGame1";
		public static var SOUND_MUSIC_3:String = "loopGame2";
		public static var SOUND_MUSIC_4:String = "loopGame3";	
		
		//public static var _SoundAS:SoundManager = new SoundManager();
		
		public function SoundASManager() 
		{
			load_sound();
		}
		
		public static function load_sound():void 			
		{
			SoundAS.loadSound("sound/Loop.mp3", "loopHome");
			SoundAS.loadSound("sound/Music.mp3", "loopGame1");
			SoundAS.loadSound("sound/Solo1.mp3", "loopGame2");
			SoundAS.loadSound("sound/Loop.mp3", "loopGame3");
			
			SoundAS.loadSound("sound/Click.mp3", SOUND_MOUSE_UP);
		/*	SoundAS.loadSound("sound/Music.mp3", SOUND_MUSIC, 100);
			SoundAS.loadSound("sound/Solo1.mp3", SOUND_SOLO_1, 100);
			SoundAS.loadSound("sound/Solo2.mp3", SOUND_SOLO_2, 100);
		*/
		}
		
		public static function playLoop(sSound:String, nVolume):void {
			SoundAS.playLoop(sSound, nVolume);			
		}
		
		public static function stopAll():void 
		{
			SoundAS.stopAll();
		}
		
	}

}