function overlay(id,text,url) {
    //http://answers.oreilly.com/topic/1823-adding-a-page-overlay-in-javascript/
    
    
    if (document.getElementById(id)) return; 
    var overlay = document.createElement("div");
    var XMousePos = window.event.clientX;
    var Ypos = window.event.clientY;
    var windowWidth = window.innerWidth;
    if (windowWidth - XMousePos > 300) {
        var Xpos = XMousePos
    } else {
        var Xpos = windowWidth - 310
    };
    overlay.setAttribute("id", id);
    overlay.setAttribute("style", "z-index: 10; background-color: white; position: absolute; left: " + Xpos + "px; top: " + Ypos + "px; border: 2px solid black; width: 300px; padding: 2px; margin: 0;")
    overlay.setAttribute("onclick", "document.body.removeChild(document.getElementById('" + id + "'))");
    overlay.setAttribute("class", "overlay");
    overlay.innerHTML = "<div>" + text + "</div>";
    document.body.appendChild(overlay);
}




function sortEthnicity(a, b) {
    a = a.cells[0].firstChild.firstChild.nodeValue.toLowerCase();
    b = b.cells[0].firstChild.firstChild.nodeValue.toLowerCase();
    return a.localeCompare(b);
}
function sortClass(a, b) {
    a = a.cells[0].firstChild.firstChild.nodeValue.toLowerCase();
    b = b.cells[0].firstChild.firstChild.nodeValue.toLowerCase();
    return a.localeCompare(b);

function sortNames(a, b) {
    a = parseInt(a.cells[1].firstChild.nodeValue,'10');
    b = parseInt(b.cells[1].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}

function sortActions(a, b) {
    a = parseInt(a.cells[1].firstChild.nodeValue,'10');
    b = parseInt(b.cells[1].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}

function sortDescriptions(a, b) {
    a = parseInt(a.cells[1].firstChild.nodeValue,'10');
    b = parseInt(b.cells[1].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}

function sortSpeeches(a, b) {
    a = parseInt(a.cells[1].firstChild.nodeValue,'10');
    b = parseInt(b.cells[1].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}

function sortMentions(a, b) {
    a = parseInt(a.cells[1].firstChild.nodeValue,'10');
    b = parseInt(b.cells[1].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}

function sortBooks(a, b) {
    a = parseInt(a.cells[1].firstChild.nodeValue,'10');
    b = parseInt(b.cells[1].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}


function sortMe(chooseSort) {
    /* outline
    1. create an array to hold (pointers to) the original table rows
    2. sort the array
    3. create a new table body as a document fragment and populate it with the sorted array
    4. insert the fragment (contents) into the table
    */
    var oldTable = document.getElementById('myTable');
    var oldTableBody = oldTable.tBodies[0];
    var oldTableRows = oldTableBody.rows;
    var newTableArray = new Array();
    for (var i = 0, rowCount = oldTableRows.length; i < rowCount; i++) {
        newTableArray.push(oldTableRows[i]);
    }
    newTableArray.sort(chooseSort);
    var newFragment = document.createDocumentFragment();
    for (var i = 0, rowCount = newTableArray.length; i < rowCount; i++) {
        newFragment.appendChild(newTableArray[i]);
    }
    oldTableBody.appendChild(newFragment);
}
}
