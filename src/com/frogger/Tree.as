package com.frogger {
	import com.frogger.Game
	import com.frogger.settings.Constants
	import com.frogger.Car
	import com.frogger.Frog

	public class Tree extends Car
	{
		public function Tree()
		{
			super();
		}
		
		public function DoAfterGo(movement:Number):void
		{
			var frog:Frog = Game.getInstance().GetFrog()
			try 
			{
				if(this.bounds.hitTestObject(frog.bounds) && frog.GetIsMoving() == false)
				{
					frog.x += movement
					frog.SetIsMoved(true)
				}	
			}catch (e:Error) {
				
			}
			
		}
	}
}