using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TestProject.Models
{
    public partial class Payment
    {
        public decimal Sum
        {
            get
            {
                return count * price;
            }
        }
    }
}
