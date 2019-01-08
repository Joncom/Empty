package;

class Main {
	public static function main() {
		kha.System.start({}, function(window) {
			kha.Assets.loadEverything(function() {
				var image:kha.Image = kha.Assets.images.custom_04b03;
				var copy:kha.Image = kha.Image.createRenderTarget(image.width, image.height);
				copy.g2.begin(true, kha.Color.Transparent);
				copy.g2.drawImage(image, 0, 0);
				copy.g2.end();
				var bytes = copy.getPixels();
				var i = 0;
				for (y in 0...image.height) {
					for (x in 0...image.width) {
						var alpha = bytes.get((y * image.width + x) * 4 + 3);
						if (alpha > 0) {
							i++;
						}
					}
				}
				if (i > 0) {
					trace("Found some data");
				} else {
					trace("Found NO data");
				}
				kha.System.notifyOnFrames(function render(framebuffers:Array<kha.Framebuffer>):Void {
					var framebuffer = framebuffers[0];
					framebuffer.g2.begin();
					framebuffer.g2.end();
				});
			});
		});
	}
}
