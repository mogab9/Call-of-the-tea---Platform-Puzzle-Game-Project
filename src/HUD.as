package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class HUD extends FlxGroup
	{
		private var currentRabbit_img:FlxSprite;
		
		private var tabRabbits:Vector.<FlxSprite>;
		private var tabRabbitsActive:Vector.<FlxSprite>;
		private var tabRabbitsInactive:Vector.<FlxSprite>;
			
		// health
		private var heartRabbit:FlxSprite;
		private var healthRabbit:FlxText;
		
		public function HUD()
		{			
			//----------rabbit-----------
			//current rabbit ID
			/*currentRabbit_id = new FlxText(5, 5, 100);
			currentRabbit_id.color = 0xffffffff;
			currentRabbit_id.shadow = 0xff000000;
			currentRabbit_id.scrollFactor.x = 0;
			currentRabbit_id.scrollFactor.y = 0;
			currentRabbit_id.text = "1";
			add(currentRabbit_id);*/
			
			//table of rabbits images for the HUD
			tabRabbits = new Vector.<FlxSprite>(Registry.players.length, true);
			tabRabbitsActive = new Vector.<FlxSprite>(Registry.players.length, true);
			tabRabbitsInactive = new Vector.<FlxSprite>(Registry.players.length, true);
			
			for (var i:uint = 0; i < Registry.players.length; i++) {
				tabRabbitsActive[i] = new FlxSprite(20 + (i * 16), 2);
				tabRabbitsInactive[i] = new FlxSprite(20 + (i * 16), 2);
				
				tabRabbitsActive[i].scrollFactor.x = 0;
				tabRabbitsInactive[i].scrollFactor.x = 0;
				
				tabRabbitsActive[i].scrollFactor.y = 0;
				tabRabbitsInactive[i].scrollFactor.y = 0;
								
				tabRabbitsActive[i].loadGraphic(Registry.players[i].playerPNG, true, true, 16, 18, true);
				tabRabbitsInactive[i].loadGraphic(Registry.players[i].playerPNG_HUD, true, true, 16, 18, true);
				
				if (i == Player.currentId-1) {
					tabRabbits[i] = tabRabbitsActive[i];
				}
				else {
					tabRabbits[i] = tabRabbitsInactive[i]
				}
				add(tabRabbits[i]);
			}
			
			
			//-----------------health -----------------
			//health ID 
			healthRabbit = new FlxText(70, 5, 100);
			healthRabbit.color = 0xffffffff;
			healthRabbit.shadow = 0xff000000;
			healthRabbit.scrollFactor.x = 0;
			healthRabbit.scrollFactor.y = 0;
			healthRabbit.text = "1";
			//add(healthRabbit);
			
			//img hearth
			heartRabbit = new FlxSprite(50, 2);
			heartRabbit.scrollFactor.x = 0;
			heartRabbit.scrollFactor.y = 0;
			heartRabbit.loadGraphic(Registry.players[Player.currentId-1].ImgHealth, true, true, 16, 18, true); // TO DO > DON'T WORK !!!!
			//add(heartRabbit);	
		}
		
		override public function update():void
		{
			//healthRabbit.text = players[Player.currentId-1].health.toString();
			if (FlxG.keys.ONE || FlxG.keys.TWO || FlxG.keys.THREE || FlxG.keys.FOUR) {
				//FlxG.log(Player.currentId - 1);
				if (FlxG.keys.ONE) {
					for (var i:uint = 0; i < Registry.players.length; i++) {
						remove(tabRabbits[i]);
						tabRabbits[i] = tabRabbitsInactive[i];
						add(tabRabbits[i]);
					}
					remove(tabRabbits[0]);
					tabRabbits[0] = tabRabbitsActive[0];
					add(tabRabbits[0]);
				}
				if (FlxG.keys.TWO && Player.nbPlayers >= 2) {
					for (var i:uint = 0; i < Registry.players.length; i++) {
						remove(tabRabbits[i]);
						tabRabbits[i] = tabRabbitsInactive[i];
						add(tabRabbits[i]);
					}
					remove(tabRabbits[1]);
					tabRabbits[1] = tabRabbitsActive[1];
					add(tabRabbits[1]);
				}
				if (FlxG.keys.THREE && Player.nbPlayers >= 3) {
					for (var i:uint = 0; i < Registry.players.length; i++) {
						remove(tabRabbits[i]);
						tabRabbits[i] = tabRabbitsInactive[i];
						add(tabRabbits[i]);
					}
					remove(tabRabbits[2]);
					tabRabbits[2] = tabRabbitsActive[2];
					add(tabRabbits[2]);
					
				}
				if (FlxG.keys.FOUR && Player.nbPlayers >= 4) {
					for (var i:uint = 0; i < Registry.players.length; i++) {
						remove(tabRabbits[i]);
						tabRabbits[i] = tabRabbitsInactive[i];
						add(tabRabbits[i]);
					}
					remove(tabRabbits[3]);
					tabRabbits[3] = tabRabbitsActive[3];
					add(tabRabbits[3]);
					
				}
			}
		}
		
		override public function destroy():void
		{
			trace("HUD nuked");
		}
		
	}

}