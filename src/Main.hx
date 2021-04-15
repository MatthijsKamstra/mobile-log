package;

import js.Browser.*;

using StringTools;
using Lambda;

class Main {
	var isDebug = true;

	public function new() {
		trace('Main');
		output('hi');
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
			untyped div.style = "padding: 10px; height: 200px; width: 100%; border: 1px solid #333; overflow:scroll;position: fixed;bottom: 0; color: white; background-color: rgba(0,0,0,0.5);";
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
