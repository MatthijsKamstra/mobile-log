package;

import haxe.Json;
import js.Browser.*;

using StringTools;
using Lambda;

class Main {
	var isDebug = true;

	var file = CompileTime.readFile("style.css");

	public function new() {
		trace('Main');
		trace(file);

		output('hi');
		for (i in 0...10) {
			haxe.Timer.delay(() -> {
				output('test ${i} in ${i * 1000}ms');
			}, i * 1000);
		}
	}

	/**
	 * in-page debug screen usefull for mobile debuggin /
	 *
	 * @param {string} message
	 */
	function output(message) {
		if (!isDebug) {
			// if debug mode is false, don't show this
			return;
		}
		var _id = "debugDiv";
		var div = document.getElementById(_id);
		if (document.getElementById(_id) == null) {
			div = document.createDivElement();
			div.id = _id;
			div.setAttribute('style',
				"font-family: 'Courier New', Courier, monospace;padding: 10px; height: 200px; width: 100%; border: 1px solid #333; overflow:scroll;position: fixed;bottom: 0; color: white; background-color: rgba(0,0,0,0.5)");
			document.body.appendChild(div);
		}

		var d = Date.now();
		var time = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds() + " - ";

		var txt = div.innerText;
		div.innerText = time + message + "\n" + txt;
	}

	static public function main() {
		var app = new Main();
	}
}
