//$(document).ready(function () {
var rIndex,
    table = document.getElementById("table");

    $("#AddBtn").click(function () {

        createRowForOrder();

    });

    $("#UpdateBtn").click(function () {
        
            //var fname = document.getElementById("fname").value,
            //    lname = document.getElementById("lname").value,
            //    age = document.getElementById("age").value;

        var itemname = document.getElementById("OrdItemName").value,
            notes = document.getElementById("OrdNotes").value,
            qty = document.getElementById("OrdQTY").value,
            price = document.getElementById("OrdPrice").value;
        

            //if (!checkEmptyInput()) {
                //table.rows[rIndex].cells[0].innerHTML = itemname;
                //table.rows[rIndex].cells[1].innerHTML = notes;
                table.rows[rIndex].cells[2].innerHTML = itemname;
                table.rows[rIndex].cells[3].innerHTML = notes;
                table.rows[rIndex].cells[4].innerHTML = qty;
                table.rows[rIndex].cells[5].innerHTML = price;
            //}
        

        //function removeSelectedRow() {
        //    table.deleteRow(rIndex);
        //    // clear input text
        //    document.getElementById("OrderDetails.Item_Name").value = "";
        //    document.getElementById("OrderDetails.Notes").value = "";
        //    document.getElementById("OrderDetails.QTY").value = "";
        //    document.getElementById("OrderDetails.Price").value = "";
        //}

        // its not completed yeat.....

    });

    function createRowForOrder() {

        var selectedItems = getSelectedItems();

        var index = $("#OrdDetailTable").children("tr").length;

        var sl = index;

        var indexCell = "<td style='display:none'> <input class='itemIndextd'  type='hidden' id='Index" + index + "' name='OrderDetails.Index' value='" + index + "' /></td>"

        var serialCell = "<td>" + (++sl) + "</td>"
        var itemNameCell = "<td><input class='itemNametd' type='hidden' id='ItemName" + index + "' name='OrderDetails[" + index + "].Item_Name' value='" + selectedItems.OrdItemName + "' />" + selectedItems.OrdItemName + "</td>"
        var itemNoteCell = "<td><input class='itemNotetd' type='hidden' id='ItemNote" + index + "' name='OrderDetails[" + index + "].Notes' value='" + selectedItems.OrdNotes + "' />" + selectedItems.OrdNotes + "</td>"
        var itemQtyCell = "<td><input class='itemQtytd' type='hidden' id='ItemQty" + index + "' name='OrderDetails[" + index + "].QTY' value='" + selectedItems.OrdQTY + "' />" + selectedItems.OrdQTY + "</td>"
        var itemPriceCell = "<td><input class='itemPricetd' type='hidden' id='ItemPrice" + index + "' name='OrderDetails[" + index + "].Price' value='" + selectedItems.OrdPrice + "' />" + selectedItems.OrdPrice + "</td>"

        // For update Button Cell
        //style = 'background-color: #4CAF50' // for in line styling
        var itemEditBtnCell = "<td style = 'text-align:center'><input class='btn btn-primary btnEdit' type='button' id='ItemEditBtn" + index + "' value='Edit' /></td>"

        // For Remove Button Cell
        var itemRemoveBtnCell = "<td style = 'text-align:center'><input class='btn btn-warning' type='button' id='ItemRemoveBtn" + index + "' value='Remove' /></td>"


        var createNewRow = "<tr>" + indexCell + serialCell + itemNameCell + itemNoteCell + itemQtyCell + itemPriceCell + itemEditBtnCell + itemRemoveBtnCell + "</tr>"
        $("#OrdDetailTable").append(createNewRow);

        $("#OrdItemName").val("");
        $("#OrdNotes").val("");
        $("#OrdQTY").val("");
        $("#OrdPrice").val("");
    }

    function getSelectedItems() {

        var OrdItemName = $("#OrdItemName").val();
        var OrdNotes = $("#OrdNotes").val();
        var OrdQTY = $("#OrdQTY").val();
        var OrdPrice = $("#OrdPrice").val();

        var item = {
            "OrdItemName": OrdItemName,
            "OrdNotes": OrdNotes,
            "OrdQTY": OrdQTY,
            "OrdPrice": OrdPrice
        }
        return item;
    }

    $(document).on('click', '.btnEdit', function (e) {
        
        for (var i = 1; i < table.rows.length; i++) {
            table.rows[i].onclick = function () {
                // get the seected row index
                rIndex = this.rowIndex;
                document.getElementById("OrdItemName").value = this.cells[2].innerText;
                document.getElementById("OrdNotes").value = this.cells[3].innerText;
                document.getElementById("OrdQTY").value = this.cells[4].innerText;
                document.getElementById("OrdPrice").value = this.cells[5].innerText;

                
            };
        }

    });

$('#textButton').click(function () {
    // Master Variables....
    //var recipName = $('.input-search-person').val();
    var tableId = document.getElementById("tableId").value,
        description = document.getElementById("description").value,
        masterdate = document.getElementById("masterdate").value,
        writer = document.getElementById("writer").value;

        orderNumber = document.getElementById("orderNumber").value; // common orderNumber for new column added in edit table

    // Details Variables....
    var rows = [];
       $('#table tbody tr').each(function () {
            var ordDetailsNo = $(this).find('td').eq(0).text().trim();
            var orderNo = $(this).find('td').eq(1).text().trim();
            var itemName = $(this).find('td').eq(2).text().trim();
            var notes = $(this).find('td').eq(3).text().trim();
            var qty = $(this).find('td').eq(4).text().trim();
            var price = $(this).find('td').eq(5).text().trim();

            var row = ordDetailsNo + "-" + orderNo + "-" + itemName + "-" + notes + "-" + qty + "-" + price;
            rows.push(row);

    });

    // For new added data in virtual table in edit 
    $('#table2 tbody tr').each(function () {
        //var ordDetailsNo = $(this).find('td').eq(0).text().trim();
        //var orderNo = $(this).find('td').eq(1).text().trim();
        var ordDetailsNo = "";
        var orderNo = "";
        var itemName = $(this).find('td').eq(2).text().trim();
        var notes = $(this).find('td').eq(3).text().trim();
        var qty = $(this).find('td').eq(4).text().trim();
        var price = $(this).find('td').eq(5).text().trim();

        var row = ordDetailsNo + "-" + orderNo + "-" + itemName + "-" + notes + "-" + qty + "-" + price;
        //var row = itemName + "-" + notes + "-" + qty + "-" + price;

        rows.push(row);
    });


    $.post('/MasterDetail/EditedSave',
        { rows: rows, tableId: tableId, description: description, masterdate: masterdate, writer: writer, orderNumber: orderNumber},
        function (data) {
            //$('#recipientList').append(data);
            
        });

    //window.location.href = "@Url.Action('Index','MasterDetail')";
    window.location.assign("/masterDetail/index"); 
});


//});




