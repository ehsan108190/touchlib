package app.demo.artgen
{
	import app.core.element.*;
	
	import com.touchlib.*;
	
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.system.LoaderContext;
	import flash.utils.*;
	
	public class ColorPicker extends Sprite
	{
		private var imgLoader:Loader = null;	     
		private var separateByPixels:BitmapData; 	
		
		function ColorPicker(){
			imgLoader = new Loader();		
			//imgLoader.contentLoaderInfo.addEventListener( ProgressEvent.PROGRESS, onProgressHandler);	
			imgLoader.contentLoaderInfo.addEventListener( Event.COMPLETE, onCompleteHandler, false, 0, true);	
			var context:LoaderContext = new LoaderContext();
			context.checkPolicyFile = true;		
			var request:URLRequest = new URLRequest( "color.png" );			
			imgLoader.unload();
			imgLoader.load( request , context);			
	
		}	
		function onCompleteHandler(event:Event = null){
		//var image:Bitmap = Bitmap(imgLoader.content);
       	separateByPixels = new BitmapData(imgLoader.width, imgLoader.height, false); 
       	separateByPixels.draw(imgLoader);
        var sampleSprite:Sprite = new Sprite();
        sampleSprite.graphics.beginBitmapFill(separateByPixels);
        sampleSprite.graphics.drawRect(0, 0, imgLoader.width, imgLoader.height)
        sampleSprite.graphics.endFill();        
        addChild(sampleSprite);		
        sampleSprite.addEventListener(MouseEvent.CLICK, onMouseDown);	   
		}	
		function onMouseDown(e:MouseEvent){
			trace(separateByPixels.getPixel(mouseX, mouseY));
		}
	}
}

/*          
import flash.display.BitmapData;
import flash.geom.ColorTransform;
var separateByPixels:BitmapData = new BitmapData(img._width, img._height, false);
separateByPixels.draw(img);
function setThumbColor(i) {
	var thumbColorTransform:ColorTransform = new ColorTransform();
	thumbColorTransform.rgb = i;
	your_thumb.transform.colorTransform = thumbColorTransform;
}
function onMouseDown(){
	setThumbColor(separateByPixels.getPixel(img._xmouse, img._ymouse));
}*/