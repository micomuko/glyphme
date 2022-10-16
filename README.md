# GlyphMe

Very half-assed TTF support for heaps using [stb_truetype](https://github.com/nothings/stb).
I have never written any c/c++ code, bindings or font/text related code, so I don't really know what I'm doing.
Other than that, this works for me and as I'm busy with my own project I won't be improving this too much.
Feel free to fork this or whatever and make it better. Right now it only renders glyphs and uses heaps to do the 
actual text layout stuff. There is no text shaping, ligatures or anything fancy. 
Also even though stb_truetype supports some otf files most of the ones I have tried did not work correctly.

I don't know if the build.bat will work for you but the binding is just one source file so you will be able to figure it out! :)

![sample image](https://imgur.com/BEgvVP3.png)
## Basic Usage:

```haxe
using glyphme.GlyphMe;

class Sample extends hxd.App {

	override function init() {
		hxd.Res.initLocal();

		// directly creating a Font instance with pixel height 64 to be used in standard heaps components
		final font = hxd.Res.NotoSans_Regular.toTrueTypeFont(64);

		// optional: adding fallbacks for unsupported glyphs 
		font.addFallbacks(hxd.Res.SourceSansPro_Regular.toTrueTypeFontFile().getInfos());
		font.addFallbacks("C:/Windows/Fonts/malgunsl.ttf".loadTrueTypeFontFile().getInfos()); // standard windows korean font

		// creating standard heaps text
		final text = new h2d.Text(font, s2d);
		text.textAlign = Center;
		text.text = "Hello TTF!\n 안녕하세요 TTF!";
		text.x = s2d.width / 2;
		text.y = s2d.height / 2;
        
		// generating an atlas which will contain all glyphs in the text 
		// because dynamic glyph generation is not supported yet. 
		font.generateAtlas({atlasSize: 256}, [text.text]);
	}

	static function main() {
		new Sample();
	}
}
```

## Security Warning 

Directly from [stb_truetype](https://github.com/nothings/stb/blob/af1a5bc352164740c1cc1354942b1c6b72eacb8a/stb_truetype.h#L6):
```
NO SECURITY GUARANTEE -- DO NOT USE THIS ON UNTRUSTED FONT FILES
This library does no range checking of the offsets found in the file,
meaning an attacker can use it to read arbitrary memory.
```
