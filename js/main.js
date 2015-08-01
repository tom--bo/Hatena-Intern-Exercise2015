// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
var parseLTSVLog= function (LTSV) {
    var ret = [];
    var lines = LTSV.split("\n");
    var l = lines.length - 1;

    for(var i=0; i<l; i++){
        var line_hash = {};
        var val = lines[i].split("\t");
        var v = val.length;
        for(var j=0; j<v; j++){
            if(val[j].indexOf("epoch:") != -1){
                line_hash["epoch"] = Number(val[j].replace("epoch:", ""));
            }
            else if(val[j].indexOf("path:") != -1){
                line_hash["path"] = val[j].replace("path:", "");
            }
        }
        ret.push(line_hash);
    }

    return ret;
}

// 課題 JS-2: 関数 `createLogTable` を記述してください

