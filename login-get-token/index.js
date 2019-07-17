let AbbyyClient = require("nodejs-ocr");
let client = new AbbyyClient('myAppId', 'myPassword', 'https://cloud.ocrsdk.com'); // Use https here if you'd like

function ocrComplete(err, results) {
    if (!err) {
        console.log(results.toString()); // Raw results of completed Task (or a TaskId for submitImage calls)
    }
}

let apiParameters = {
    language: 'English',
    profile: 'textExtraction',
    textType: 'typewriter',
    exportFormat: 'xml'
    // etc...
};
client.processImage(apiParameters, 'https://www.pktest.me/yzm.php?type=0.69331548254013731563178158005', ocrComplete); 