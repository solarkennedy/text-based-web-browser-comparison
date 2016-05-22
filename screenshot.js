var system = require('system');
var page = require('webpage').create(),
	address, output, size;

if (system.args.length < 4 || system.args.length > 5) {
    console.log('Usage: viewport.js URL filename sizeX sizeY');
    phantom.exit();
} else {
    address = system.args[1];
    output = system.args[2];
    sizeX = system.args[3];
    sizeY = system.args[4];
    page.viewportSize = { width: sizeX, height: sizeY };
    page.clipRect = { top: 0, left: 0, width: sizeX, height: sizeY };
    page.open(address, function (status) {
        if (status !== 'success') {
            console.log('Unable to load the address!');
        } else {
            console.log('Opened ' + address);
            page.evaluate(function(w, h) {
              document.body.style.width = w + "px";
              document.body.style.height = h + "px";
            }, sizeX, sizeY);
            console.log('Set size to ' + sizeX + "x" + sizeY);
            window.setTimeout(function () {
                page.render(output);
		console.log("Output to " + output)
                phantom.exit();
            }, 200);
        }
    });
}
