using glyphme.GlyphMe;

class Sample extends hxd.App {
	var text:h2d.Text;
	var time = 0.;

	override function init() {
		// directly creating a Font instance with pixel height 64 to be used in standard heaps components
		final font = "C:/Windows/Fonts/malgunsl.ttf".loadTrueTypeFontFile().toTrueTypeFont(64); // standard windows korean front

		// heaps text creation
		text = new h2d.Text(font, s2d);
		text.textAlign = Center;
		text.text = "Hello TTF!\n 안녕하세요 TTF!";
		text.x = s2d.width / 2;
		text.y = s2d.height / 2;

		// generating an atlas which will contain all glyphs in the text
		// because dynamic glyph generation is not supported yet.
		font.generateAtlas({atlasSize: 256}, [text.text]);

		final atlas = new h2d.Bitmap(font.tile, s2d);
	}

	override function update(dt:Float) {
		text.scaleX = text.scaleY = 2 + Math.sin(time += dt);
	}

	static function main() {
		new Sample();
	}
}
