package ui 
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;

	public class DialogBox
	{
		[Embed(source = '../../assets/textures/ui/dialog_box.png')] private var imgBackingBox:Class;
		
		public var m_aGraphics:FlxGroup;
		
		// Graphic objects:
		private var m_tBackingBox:FlxSprite;
		private var m_tDialogBoxAvatarBox:FlxSprite;
		private var m_tText:FlxText;
		
		private var m_bActive:Boolean = false;
		
		public function DialogBox() 
		{			
			// backbox
			m_tBackingBox = new FlxSprite(0,90);
			m_tBackingBox.loadGraphic(imgBackingBox);
			m_tBackingBox.x =  -10; // FIX THIS WITH SOME RELATIVE POS
			m_tBackingBox.y = 120; // FIX THIS  WITH SOME RELATIVE POS
			
			// text box
			m_tText = new FlxText(m_tBackingBox.x + 90, m_tBackingBox.y, 250, "", false);
			m_tText.setFormat("Istria", 16, 0xff2d1601);
			
			// adding to stage
			m_aGraphics = new FlxGroup;
			m_aGraphics.add(m_tBackingBox);
			m_aGraphics.add(m_tText);
			m_aGraphics.exists = false;
			
			//DialogBoxAvatars
			m_tDialogBoxAvatarBox = new FlxSprite(10, 158);
			m_tDialogBoxAvatarBox.x = m_tBackingBox.x + 21;
			m_tDialogBoxAvatarBox.y = m_tBackingBox.y + 6;
			m_aGraphics.add(m_tDialogBoxAvatarBox);
		}
		
		public function setIsActive(bActive:Boolean):void
		{
			m_bActive = bActive;
			m_aGraphics.exists = m_bActive;
		}
		
		public function getIsActive():Boolean
		{
			return m_bActive;
		}
		
		public function setText(sString:String):void
		{
			m_tText.text = sString;
		}
		
		public function setDialogBoxAvatar(cDialogBoxAvatar:Class):void
		{
			m_tDialogBoxAvatarBox.loadGraphic(cDialogBoxAvatar);
		}
	}
}
