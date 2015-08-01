// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
var parseLTSVLog= function (LTSV) {
    var ret = undefined;
    var lines = LTSV.split("\n");
    var l = lines.length;

    for(var i=0; i<l; i++){
        var val = lines[i].split("\t");
        var v = val.length;
        for(var j=0; j<v; j++){
            if(v[j].indexOf("epoch:") != -1){
                ret["epach"] = v[j].replace("epach:", "");
            }
            if(v[j].indexOf("path:") != -1){
                ret["path"] = v[j].replace("path:", "");
            }
        }
    }

    return ret;
}

// 課題 JS-2: 関数 `createLogTable` を記述してください
