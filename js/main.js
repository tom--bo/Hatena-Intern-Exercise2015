// 課題 JS-1: 関数 `parseLTSVLog` を記述してください
var parseLTSVLog = function (LTSV) {
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
var createLogTable = function (target, LTSV_arr) {

    var table = document.createElement('table');
    target.appendChild(table);

    var thead = document.createElement('thead')
    thead.innerHTML = '<tr><th>path</th><th>epoch</th></tr>';
    table.appendChild(thead);

    var tbody = document.createElement('tbody')
    var len = LTSV_arr.length;
    for(var i=0; i< len; i++){
        tbody.innerHTML += "<tr><td>" + LTSV_arr[i]["path"] + "</td><td>" + LTSV_arr[i]["epoch"] + "</td></tr>";
    }
    table.appendChild(tbody);

}

