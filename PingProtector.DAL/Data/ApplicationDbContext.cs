using Project.Core.Protector.DAL.Entity.Record;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PingProtector.DAL.Data
{
	public class ApplicationDbContext : DbContext
	{
		public ApplicationDbContext() : base("PingProtectorNet")
		{
		}

		public DbSet<Record> UserActionLogRecord { set; get; }
	}
}