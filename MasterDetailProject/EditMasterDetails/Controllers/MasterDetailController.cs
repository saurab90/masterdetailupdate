using EditMasterDetails.Models;
using System;
using System.Collections.Generic;
using System.Net;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace EditMasterDetails.Controllers
{
    public class MasterDetailController : Controller
    {
        RenassaDbEntities db = new RenassaDbEntities();

        public ActionResult Index()
        {
            return View(db.OrderMasters.ToList());
        }


        // GET: MasterDetail
        public ActionResult Create()
        {
            return View();
        }

        // In create time details data come from virtual table according to table db name wise with index in code behind.
        // In Update it dosen't match with db name wise in code behind that's we send it through array.

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create( OrderMaster orderMaster) 
        {
            if (ModelState.IsValid && orderMaster.OrderDetails != null && orderMaster.OrderDetails.Count > 0)
            {
                db.OrderMasters.Add(orderMaster);

                var isOrderAdded = db.SaveChanges() > 0;
                if (isOrderAdded)
                {
                    return View(orderMaster);
                }

            }
            return View();
        }


        // GET: Order/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            //OrderMaster orderMaster = db.OrderMasters.Find(id);

            OrderviewModel orderviewModel = new OrderviewModel()
            {
                orderMaster = db.OrderMasters.Find(id),
                orderDetail = db.OrderDetails.Find(id),
                OrderDetails = db.OrderDetails.Where(x => x.Order_No == id)
            };

            if (orderviewModel == null)
            {
                return HttpNotFound();
            }
            return View(orderviewModel);

        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        //public ActionResult Edit([Bind(Include = "Order_No,Table_ID,Description,Order_DATE,Waiter_Name")] OrderMaster orderMaster)
        public ActionResult Edit(OrderMaster orderMaster)
        //public ActionResult Edit(OrderviewModel orderviewModel)
        {
            if (ModelState.IsValid)
            {
                //db.Entry(orderMaster).State = EntityState.Modified;
                //db.SaveChanges();
                return RedirectToAction("Index");
            }
            //return View(orderMaster);
            return View();
        }

        [HttpPost]
        public ActionResult EditedSave(List<string> rows, string tableId, string description, DateTime masterdate, string writer, string orderNumber, OrderMaster orderMaster)
        {

            if (ModelState.IsValid)
            {
                rows.ForEach(x =>
                {
                    var row = x.Split('-');

                    var ordDetailsNo = row[0];
                    var orderNo = row[1];
                    var itemName = row[2];
                    var notes = row[3];
                    var qty = row[4];
                    var price = row[5];

                    // Save/Update to the database(Starts)....

                    SqlConnection con = new SqlConnection
                                  (@"Data Source=.;Initial Catalog=RenassaDb;Integrated Security=True");

                    //string qry = "insert into Photos (title,photo) values(@title, @photo)";
                    //UPDATE OrderDetails SET Item_Name = 'xx', Notes = 'oky' Where Order_Detail_No = 1 AND Order_No = 1005
                    string qry = "UPDATE OrderDetails SET Item_Name = @itemName, Notes = @notes, QTY = @qty, Price = @price Where Order_Detail_No = @ordDetailNum AND Order_No = @orderNum";

                    if (orderNo != string.Empty) // when order number not null then update detail's table data
                    {
                        // Details Data Update...!
                        SqlCommand cmd = new SqlCommand(qry, con);

                        cmd.CommandType = CommandType.Text;
                        con.Open();
                        cmd.Parameters.Add("@itemName", SqlDbType.VarChar).Value = itemName;
                        cmd.Parameters.Add("@notes", SqlDbType.VarChar).Value = notes;
                        cmd.Parameters.Add("@qty", SqlDbType.Int).Value = Convert.ToInt32(qty);
                        cmd.Parameters.Add("@price", SqlDbType.Int).Value = Convert.ToInt32(price);

                        cmd.Parameters.Add("@ordDetailNum", SqlDbType.Int).Value = Convert.ToInt32(ordDetailsNo);
                        cmd.Parameters.Add("@orderNum", SqlDbType.Int).Value = Convert.ToInt32(orderNo);

                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                    else
                    {
                        // save new column in detail's table from virtual table edit page

                        OrderDetail orderDetail = new OrderDetail();
                        orderDetail.Item_Name = itemName;
                        orderDetail.Notes = notes;
                        orderDetail.QTY = Convert.ToInt32(qty);
                        orderDetail.Price = Convert.ToInt32(price);
                        orderDetail.Order_No = Convert.ToInt32(orderNumber);

                        db.OrderDetails.Add(orderDetail);
                        db.SaveChanges();

                    }
                    

                    // Master Data Update...!

                    string qryMasterData = "UPDATE OrderMasters SET Table_ID = @tableId, Description = @description, Order_DATE = @date, Waiter_Name = @writerName Where Order_No = @orderNum";

                    SqlCommand cmd2 = new SqlCommand(qryMasterData, con);

                    cmd2.CommandType = CommandType.Text;
                    con.Open();
                    cmd2.Parameters.Add("@tableId", SqlDbType.VarChar).Value = tableId;
                    cmd2.Parameters.Add("@description", SqlDbType.VarChar).Value = description;
                    cmd2.Parameters.Add("@date", SqlDbType.DateTime).Value = masterdate;
                    cmd2.Parameters.Add("@writerName", SqlDbType.VarChar).Value = writer;


                    //cmd2.Parameters.Add("@orderNum", SqlDbType.Int).Value = Convert.ToInt32(orderNo);
                    cmd2.Parameters.Add("@orderNum", SqlDbType.Int).Value = Convert.ToInt32(orderNumber);

                    
                    cmd2.ExecuteNonQuery();
                    con.Close();

                    // Save/Update to the database(end)....

                });
                

                //db.Entry(orderMaster).State = EntityState.Modified;
                //db.SaveChanges();
                //return RedirectToAction("Index");
            }
            //return this.RedirectToAction("Index", "MasterDetail");
            //return RedirectToAction("Index", "MasterDetail");
            return View();
        }

    }
}