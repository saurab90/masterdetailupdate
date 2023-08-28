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
                table.rows[rIndex].cells[6].innerHTML = qty * price;
            //}
        

       

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

        var totalpriceCellforShow = "<td><input type='hidden' />" + selectedItems.OrdQTY * selectedItems.OrdPrice + "</td>"


        var createNewRow = "<tr>" + indexCell + serialCell + itemNameCell + itemNoteCell + itemQtyCell + itemPriceCell + totalpriceCellforShow + itemEditBtnCell + itemRemoveBtnCell + "</tr>"
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

        //e.preventDefault();
        //var valItemIndextd = $(this).closest('tr').find('.itemIndextd').val();
        //var valItemNametd = $(this).closest('tr').find('.itemNametd').val();
        //var valItemNotetd = $(this).closest('tr').find('.itemNotetd').val();
        //var valItemQtytd = $(this).closest('tr').find('.itemQtytd').val();
        //var valItemPricetd = $(this).closest('tr').find('.itemPricetd').val();

        //$("#OrdItemName").val(valItemNametd);
        //$("#OrdNotes").val(valItemNotetd);
        //$("#OrdQTY").val(valItemQtytd);
        //$("#OrdPrice").val(valItemPricetd);
            //alert(val);
        //==========================================================================
        for (var i = 1; i < table.rows.length; i++) {
            table.rows[i].onclick = function () {
                // get the seected row index
                rIndex = this.rowIndex;
                document.getElementById("OrdItemName").value = this.cells[2].innerText;
                document.getElementById("OrdNotes").value = this.cells[3].innerText;
                document.getElementById("OrdQTY").value = this.cells[4].innerText;
                document.getElementById("OrdPrice").value = this.cells[5].innerText;

                //document.getElementById("OrderDetails.Item_Name").value = this.cells[0].innerHTML;
                //document.getElementById("OrderDetails.Notes").value = this.cells[1].innerHTML;
                //document.getElementById("OrderDetails.QTY").value = this.cells[2].innerHTML;
                //document.getElementById("OrderDetails.Price").value = this.cells[3].innerHTML;
            };
        }

    });

    


//});




