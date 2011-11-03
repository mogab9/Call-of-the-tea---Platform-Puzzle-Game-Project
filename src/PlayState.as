package  
{
	import flash.display.Graphics;
	import flash.ui.Mouse;
	
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var player:Player;
		protected var levelOne:BaseLevel;
		
		//Pause elements
		private var title:FlxText;
		private var playButton:FlxButton;
		public var pauseGroup:FlxGroup;
		
		public function PlayState() {
		}
		
		protected function onSpriteAddedCallback(sprite:FlxSprite, group:FlxGroup):void {
			if (sprite is Player) {
				//player = sprite as Player;
			}
		}
		
		override public function create():void
		{
			// --------Init-----------
			levelOne = new Level_levelOne(true, onSpriteAddedCallback);
			pauseGroup = new FlxGroup(); // pauseGroup 
			
			//--------Pause Menu---------
			title = new FlxText(0, 16, FlxG.width, "Pause");
			title.setFormat (null, 16, 0xFFFFFFFF, "center");
			
			//playButton = new FlxButton(0, -2, "Play");
			playButton = new FlxButton(FlxG.width / 2 - 40, FlxG.height / 2, "Resume");
			
			playButton.onUp = function():void {
				trace("pressBackGame triggered");
				FlxG.paused = false;
			}
			pauseGroup.add(playButton);
			pauseGroup.add(title);
			//---------------------------
			
		}

		
		override public function update():void {
			//We check the Escape key to display (or not) the Pause menu
			if (FlxG.keys.justReleased("ESCAPE") || FlxG.keys.justReleased("P")) {
				trace("pause menu");
				FlxG.paused = !FlxG.paused;
				flash.ui.Mouse.show();
				if(FlxG.paused)
					return pauseGroup.update();
			}
			
			if (!FlxG.paused) {
				super.update();
				FlxG.collide(player, levelOne.mainLayer);
			}
		}
		
		override public function draw():void {
			super.draw();
			if (FlxG.paused){
				pauseGroup.draw();
				pauseGroup.update();
			}
		}
	}

}