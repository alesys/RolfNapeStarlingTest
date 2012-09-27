package
{
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		[Embed(source="../assets/sprites.png")]
		private static const SPRITES:Class;
		[Embed(source="../assets/sprites.xml",mimeType="application/octet-stream")]
		private static const XMLSPRITES:Class;
		private static var atlas:TextureAtlas;
		
		public static const SPRITE_FLAVIA:String = "sprite_fla";
		public static const SPRITE_MARIANA:String = "sprite_mariana";
		
		public static function getTexture(spriteName:String):Vector.<Texture>
		{
			if (!atlas)
				atlas = new TextureAtlas(Texture.fromBitmap(new SPRITES()),XML(new XMLSPRITES()));
			return atlas.getTextures(spriteName);
		}
	}
}