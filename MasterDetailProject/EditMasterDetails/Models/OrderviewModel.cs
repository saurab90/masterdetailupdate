using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EditMasterDetails.Models
{
    public class OrderviewModel
    {
        public OrderMaster orderMaster { get; set; }
        public OrderDetail orderDetail { get; set; }

        public virtual IEnumerable<OrderDetail> OrderDetails { get; set; }
    }
}