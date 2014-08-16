function sortTitle(a, b) {
    a = a.cells[0].firstChild.firstChild.nodeValue.toLowerCase();
    b = b.cells[0].firstChild.firstChild.nodeValue.toLowerCase();
    return a.localeCompare(b);
}
function sortNumber(a, b) {
    a = parseInt(a.cells[1].firstChild.nodeValue,'10');
    b = parseInt(b.cells[1].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}
function sortTotalWords(a, b) {
    a = parseInt(a.cells[5].firstChild.nodeValue,'10');
    b = parseInt(b.cells[5].firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}
function sortUniqueWords(a, b) {
    a = parseInt(a.cells[6].firstChild.firstChild.nodeValue,'10');
    b = parseInt(b.cells[6].firstChild.firstChild.nodeValue,'10');
    return ((a < b)? - 1: ((a > b)? 1: 0));
}
function sortContributors(a, b) {
    a = a.cells[7].firstChild.nodeValue.toLowerCase();
    b = b.cells[7].firstChild.nodeValue.toLowerCase();
    return a.localeCompare(b);
}
function sortEnglish(a, b) { // just the number before the en dash
    if (a.cells[4].firstChild.nodeValue === '(none)') {
        a = 0;
    } else {
        a = parseInt(a.cells[4].firstChild.nodeValue.split("–")[0],'10');
    }
    if (b.cells[4].firstChild.nodeValue === '(none)') {
        b = 0;
    } else {
        b = parseInt(b.cells[4].firstChild.nodeValue.split("–")[0],'10');
    }
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
