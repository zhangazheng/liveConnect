package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	
	public class playerExtend extends Sprite
	{
		protected var video:LiveConnect;
		protected var videoOverlay:Sprite;
		protected var iconContainer:Sprite;
		protected var icons:Array;
		
		protected var avatarWidth:Number;
		private var curUsrId:String;

		public function playerExtend()
		{
			super();
			
			// 支持 autoOrient
			
			video = new LiveConnect(200,200);
			
			addChild(video);
			video.updateHost("192.168.1.184");
			
			if (ExternalInterface.available) 
			{
				//ExternalInterface.addCallback("loadDocImage", this.addDocImage);
				ExternalInterface.addCallback("resize", this.resize);
				ExternalInterface.addCallback("stopVideo", video.stopVideo);
				ExternalInterface.addCallback("upload", video.upload);
				ExternalInterface.addCallback("playVideo", video.playVideo);
				ExternalInterface.addCallback("updateHost", video.updateHost);
				ExternalInterface.addCallback("playAudio", video.playAudio);
				ExternalInterface.addCallback("stopAudio", video.stopAudio);
				ExternalInterface.addCallback("stopAll", video.stopAll);
				ExternalInterface.addCallback("loadCapture", video.loadCapture);
				ExternalInterface.addCallback("setCurUsrId",this.setCurUsrId);
			}
			
			/*videoOverlay = new Sprite();
			videoOverlay.graphics.beginFill(0xFF0000, 0);
			videoOverlay.graphics.drawRect(0,0,stage.stageWidth-20,stage.stageHeight);
			videoOverlay.graphics.endFill();
			addChild(videoOverlay);
			videoOverlay.addEventListener(MouseEvent.CLICK, onVideoClick);
			
			iconContainer = new Sprite();
			iconContainer.y = stage.stageHeight - stage.stageHeight/4;
			icons = [];
			iconContainer.visible = false;
			addChild(iconContainer);
			
			if(stage.stageWidth>stage.stageHeight)
				avatarWidth = stage.stageHeight/4;
			else
				avatarWidth = stage.stageWidth/4;
			if(avatarWidth>100)
				avatarWidth = 100;
			*/
			/*video.upload("121");
			this.setCurUsrId("121");
			video.playVideo("121");
			addDocImage("121","http://192.168.174.247:3000/assets/tianxuejun.jpg");
			addDocImage("84690","http://192.168.174.247:3000/assets/default.jpg");*/

			//iconContainer.y = stage.stageHeight - avatarWidth;
		}
		
		
		protected function onVideoClick(event:MouseEvent):void
		{
			iconContainer.visible = !iconContainer.visible;
		}
		
		protected function onClick(event:MouseEvent):void
		{
			video.stopVideo();
			trace(event.target);
			video.playVideo(event.target.parent.docId);
			//trace(event.target.parent.docId);
			var docIds:String;
			docIds="";
			if(icons.length > 0){
				for (var i:int = 0; i < icons.length; i++){
					if(icons[i].docId != this.curUsrId)
						docIds = docIds + icons[i].docId + ',';
				}
			}
			if(docIds.charAt(docIds.length-1) == ",")
				docIds = docIds.substring(0,docIds.length-1);
			//video.playAudio(docIds);
			trace(docIds);
		}
		
		protected function onResize(e:Event):void {
			/*if(e.type == "imageReady")
				trace("got image ready resize event...");*/
			resize();
		}
		
		public function resize():void{
			video.resize(stage.stageWidth, stage.stageHeight);
			/*videoOverlay.width = stage.stageWidth - 20;
			videoOverlay.height = stage.stageHeight;
			iconContainer.y = stage.stageHeight - avatarWidth;
			if(icons.length > 0){
				for (var i:int = 0; i < icons.length; i++){
					
					icons[i].resize(avatarWidth,avatarWidth);
					if(i == 0)
						icons[i].relativeLoc = 0;
					else
						icons[i].relativeLoc = icons[i-1].relativeLoc + 5 + icons[i-1].width;
					
					icons[i].resize(avatarWidth,avatarWidth);
					//trace("equal?",avatarWidth,icons[i].width);
				}
			}*/
		}
	  public function setCurUsrId(id:String):void{
	  	    this.curUsrId = id;
	  }
	}
}