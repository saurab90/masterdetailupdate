//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EditMasterDetails
{
    using System;
    using System.Collections.Generic;
    
    public partial class OrderMaster
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public OrderMaster()
        {
            this.OrderDetails = new HashSet<OrderDetail>();
        }
    
        public int Order_No { get; set; }
        public string Table_ID { get; set; }
        public string Description { get; set; }
        public System.DateTime Order_DATE { get; set; }
        public string Waiter_Name { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}