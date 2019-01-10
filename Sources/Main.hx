package;

class Main {
	public static function main() {
		kha.System.start({}, function init(window) {
			kha.Assets.loadEverything(function() {
				var image:kha.Image = kha.Assets.images.pixelmix_hd_4x;

				var copy:kha.Image = kha.Image.createRenderTarget(image.width, image.height);
				copy.g2.begin(true, kha.Color.Transparent);
				copy.g2.drawImage(image, 0, 0);
				copy.g2.end();

				copy.g2.begin(false);
				copy.g2.end();

				kha.System.notifyOnFrames(function render(framebuffers:Array<kha.Framebuffer>):Void {
					var framebuffer = framebuffers[0];
					framebuffer.g2.begin();
					framebuffer.g2.end();
				});
			});
		});
	}
}
