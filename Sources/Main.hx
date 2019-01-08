package;

class Main {
	public static function main() {
		kha.System.start({}, init);
	}

	private static function init(window) {
		kha.Assets.loadEverything(function() {
			var image:kha.Image = kha.Assets.images.custom_04b03;
			var copy:kha.Image = kha.Image.createRenderTarget(image.width, image.height);
			copy.g2.begin(true, kha.Color.Transparent);
			copy.g2.drawImage(image, 0, 0);
			copy.g2.end();
		});
	}
}
