using glyphme.GlyphMe;

class Sample extends hxd.App {
	var text:h2d.Text;
	var time = 0.;
	var font:glyphme.TrueTypeFont;
	var atlas:h2d.Bitmap;

	override function init() {
		// directly creating a Font instance with pixel height 64 to be used in standard heaps components
		font = "C:/Windows/Fonts/Arial.ttf".loadTrueTypeFontFile().toTrueTypeFont(64);

		function addWindowsFallback(file:String) {
			try {
				final path = "C:/Windows/Fonts/" + file;
				font.addFallbacks(path.loadTrueTypeFontFile().getInfos());
			} catch (e) {
				trace('couldn\'t load Font: $file');
			}
		}

		// fallbacks for various languages
		addWindowsFallback("malgunsl.ttf");
		addWindowsFallback("Segoeuil.ttf");
		addWindowsFallback("msgothic.ttc");
		addWindowsFallback("msjh.ttc");
		addWindowsFallback("Nirmalas.ttf");

		// heaps text creation
		text = new h2d.Text(font, s2d);

		text.text = sampleText;

		// generating an atlas which will contain all glyphs in the text
		// because dynamic glyph generation is not supported yet.
		font.generateAtlas({fontHeightInPixels: 32}, [text.text]);

		atlas = new h2d.Bitmap(font.tile, s2d);
		hxd.Window.getInstance().addEventTarget(event -> text.scale(1 - event.wheelDelta * .1));
	}

	static function main() {
		new Sample();
	}

	final sampleText = "Anglo-Saxon (ang)
العربية (ar)
سنڌي (sd)
Azərbaycan (az)
Български (bg)
বাংলা (bn)
Català (ca)
Česky (cs)
Deutsch (de)
Ελληνικά (el)
English (en)
Esperanto (eo)
Español (es)
فارسی (fa)
Suomi (fi)
Français (fr)
ગુજરાતી (gu)
עברית (he)
हिन्दी (hi)
Bahasa Indonesia (id)
मराठी (mr)
Italiano (it)
日本語 (ja)
한국어 (ko)
Latviešu (lv)
Lietuvių (lt)
Bahasa Melayu (ms)
Македонски (mk)
مازِرونی (mzn)
नेपाल भाषा (new)
ਪੰਜਾਬੀ (pa)
Polski (pl)
پښتو (ps)
Português (pt)
Română (ro)
Русский (ru)
Svenska (sv)
தமிழ் (ta)
ไทย (th)
Türkçe (tr)
Українська (uk)
Tiếng Việt (vi)
Yorùbá (yo)
中文 (zh)";
}
