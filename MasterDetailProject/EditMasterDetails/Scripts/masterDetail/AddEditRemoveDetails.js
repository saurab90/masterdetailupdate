var rIndex,
    table = document.getElementById("table");

// check the empty input
function checkEmptyInput() {
    var isEmpty = false,
        itemname = document.getElementById("OrderDetails.Item_Name").value,
        notes = document.getElementById("OrderDetails.Notes").value,
        qty = document.getElementById("OrderDetails.QTY").value;
        price = document.getElementById("OrderDetails.Price").value;

    if (itemname === "") {
        alert("Item Name Connot Be Empty");
        isEmpty = true;
    }
    else if (notes === "") {
        alert("Notes Connot Be Empty");
        isEmpty = true;
    }
    else if (qty === "") {
        alert("Qty Connot Be Empty");
        isEmpty = true;
    }
    else if (price === "") {
        alert("Price number Connot Be Empty");
        isEmpty = true;
    }
    return isEmpty;
}

// add Row
function addHtmlTableRow() {
    // get the table by id
    // create a new row and cells
    // get value from input text
    // set the values into row cell's
    if (!checkEmptyInput()) {
        var newRow = table.insertRow(table.length),
            cell1 = newRow.insertCell(0),
            cell2 = newRow.insertCell(1),
            cell3 = newRow.insertCell(2),
            cell4 = newRow.insertCell(3),

            itemname = document.getElementById("OrderDetails.Item_Name").value,
            notes = document.getElementById("OrderDetails.Notes").value,
            qty = document.getElementById("OrderDetails.QTY").value;
            price = document.getElementById("OrderDetails.Price").value;

        cell1.innerHTML = itemname;
        cell2.innerHTML = notes;
        cell3.innerHTML = qty;
        cell4.innerHTML = price;

        // call the function to set the event to the new row
        selectedRowToInput();
    }
}

// display selected row data into input text fields
function selectedRowToInput() {

    for (var i = 1; i < table.rows.length; i++) {
        table.rows[i].onclick = function () {
            // get the seected row index
            rIndex = this.rowIndex;
            document.getElementById("OrderDetails.Item_Name").value = this.cells[0].innerHTML;
            document.getElementById("OrderDetails.Notes").value = this.cells[1].innerHTML;
            document.getElementById("OrderDetails.QTY").value = this.cells[2].innerHTML;
            document.getElementById("OrderDetails.Price").value = this.cells[3].innerHTML;
        };
    }
}
selectedRowToInput();

function editHtmlTbleSelectedRow() {
    //var fname = document.getElementById("fname").value,
    //    lname = document.getElementById("lname").value,
    //    age = document.getElementById("age").value;

    var itemname = document.getElementById("OrderDetails.Item_Name").value,
        notes = document.getElementById("OrderDetails.Notes").value,
        qty = document.getElementById("OrderDetails.QTY").value;
        price = document.getElementById("OrderDetails.Price").value;

    if (!checkEmptyInput()) {
        table.rows[rIndex].cells[0].innerHTML = itemname;
        table.rows[rIndex].cells[1].innerHTML = notes;
        table.rows[rIndex].cells[2].innerHTML = qty;
        table.rows[rIndex].cells[3].innerHTML = price;
    }
}

function removeSelectedRow() {
    table.deleteRow(rIndex);
    // clear input text
    document.getElementById("OrderDetails.Item_Name").value = "";
    document.getElementById("OrderDetails.Notes").value = "";
    document.getElementById("OrderDetails.QTY").value = "";
    document.getElementById("OrderDetails.Price").value = "";
}



$(function () {
    $("#btnSave").click(function () {
        $.post("/DemoMasterDetails/saveMasterDetail",
            { name: $("#txtName").val() },
            function (response) {
                //alert("Hello: " + response.Name + " .\nCurrent Date and Time: " + response.DateTime);
            }
        );
    });
});

