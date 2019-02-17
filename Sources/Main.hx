package;

import kha.Assets;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;

class Main {
	static function update(): Void {

	}

	static function render(framebuffer: Framebuffer): Void {

	}

	public static function main() {
		System.start({title: "Kha", width: 800, height: 600}, function (_) {
			// Just loading everything is ok for small projects
			Assets.loadEverything(function () {
				trace("Color: " + kha.Assets.images.white.at(0, 0)); // Prints -1 (correct) w/ WebGL, and 255 (incorrect) with Canvas
				// Avoid passing update/render directly,
				// so replacing them via code injection works
				Scheduler.addTimeTask(function () { update(); }, 0, 1 / 60);
				System.notifyOnFrames(function (framebuffers) { render(framebuffers[0]); });
			});
		});
	}
}
