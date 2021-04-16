package;

import js.Syntax;
import js.html.Element;
import haxe.Json;
import js.Browser.*;

using StringTools;
using Lambda;

class Main {
	var isDebug = true;
	var DEBUG = true;

	public function new() {
		if (DEBUG)
			console.log('${App.NAME} - MonkeeBugger - ${App.getBuildDate()}');

		for (i in 0...10) {
			haxe.Timer.delay(() -> {
				console.log('test ${i} in ${i * 1000}ms');
			}, i * 1000);
		}

		console.log('log');
		console.warn('warn');
		console.error('error');
		console.info('info');
	}

	static public function main() {
		document.addEventListener('DOMContentLoaded', (event) -> {
			var app = new Main();
		});
	}
}
