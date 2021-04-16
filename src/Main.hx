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

	var file = CompileTime.readFile("style.css");

	public function new() {
		// trace('Main');
		// trace(file);

		document.addEventListener('DOMContentLoaded', (event) -> {
			if (DEBUG)
				trace('x'); // console.log('${App.NAME} - MonkeeRoute - ${App.getBuildDate()}');

			init();
		});

		output('hi');
		for (i in 0...10) {
			haxe.Timer.delay(() -> {
				output('test ${i} in ${i * 1000}ms');
			}, i * 1000);
		}

		// console.log('log');
		// console.warn('warn');
		// console.error('error');
		// console.info('info');

		highjack();

		console.log('log');
		console.warn('warn');
		console.error('error');
		console.info('info');
	}

	function highjack() {
		Syntax.code("var old = console.log;
		var logger = document.getElementById('debugDiv');
		console.log = function(message) {
			if (typeof message == 'object') {
				logger.innerHTML += (JSON && JSON.stringify ? JSON.stringify(message) : message) + '<br />';
			} else {
				logger.innerHTML += message + '**<br />';

				{0}( message);

			}
		} ", this.output);

	}

	// https://stackoverflow.com/questions/6604192/showing-console-errors-and-alerts-in-a-div-inside-the-page
	// function highjack() {
	// 	if (Type.typeof(console) != "undefined") {
	// 		if (Type.typeof(console.log) != 'undefined') {
	// 			console.olog = console.log;
	// 		} else {
	// 			console.olog = function() {};
	// 		}
	// 	}
	// 	untyped console.log = function(message) {
	// 		console.olog(message);
	// 		$('#debugDiv').append('<p>' + message + '</p>');
	// 	};
	// 	untyped console.error = console.debug = console.info = console.log;
	// }

	function init():Element {
		var _id = "debugDiv";
		var div = document.getElementById(_id);
		if (document.getElementById(_id) == null) {
			div = document.createDivElement();
			div.id = _id;
			div.setAttribute('style',
				"font-family: 'Courier New', Courier, monospace;padding: 10px; height: 200px; width: 100%; border: 1px solid #333; overflow:scroll;position: fixed;bottom: 0; color: white; background-color: rgba(0,0,0,0.5)");
			document.body.appendChild(div);
		}
		return div;
	}

	/**
	 * in-page debug screen usefull for mobile debuggin /
	 *
	 * @param {string} message
	 */
	function output(message) {
		var div = init();

		var d = Date.now();
		var time = d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds() + " - ";

		var txt = div.innerText;
		div.innerText = time + message + "\n" + txt;
	}

	static public function main() {
		var app = new Main();
	}
}
