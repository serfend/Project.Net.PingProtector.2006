using Configuration.AutoStratManager;
using IpSwitch.Helper;
using Microsoft.Win32.TaskScheduler;
using NETworkManager.Settings;
using System;
using System.Linq;
using System.Threading;
using System.Windows.Forms;

namespace Project.Core.Protector
{
	internal static class Program
	{
		/// <summary>
		///  The main entry point for the application.
		/// </summary>
		[STAThread]
		private static void Main()
		{
			Application.EnableVisualStyles();
			Application.SetCompatibleTextRenderingDefault(false);
			var startManager = new FunctionBySchedule();
			var regStartManager = new FunctionByReg();
			startManager.EnableAsync();
			regStartManager.EnableAsync();
			Application.Run(new Main());
		}
	}
}