// tried to do this in powershell with a json nest, no joy so did what I would do at work
// I asked the experts (programmers) who gave me the base code and talked me through it
// please see the java.txt for example of the code being run. 30 minutes isnt long !
// Credit to Danius K. !

var object = {"a1": { "b1": { "c1": "d1" }}};

function getObjectKeys(object, key) {
    const keys = key.split('.');
    let obj = object;
    for (let ikey of keys) {
        for (let [objKey, value] of Object.entries(obj)) {
            if(!keys.includes(objKey)) {
                continue;
            }
            obj = value;
        }
    }
    return obj;
}
