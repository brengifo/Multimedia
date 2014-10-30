package com.as3birds
{
    import flash.display.*;
    import flash.text.*;

    public class clsBird extends MovieClip
    {
        public var _ART:MovieClip;
        public var txtTalk:TextField;

        public function clsBird()
        {
            addFrameScript(0, this.frame1);
            return;
        }// end function

        function frame1()
        {
            stop();
            return;
        }// end function

    }
}
