using DotNet4.Utilities.UtilReg;
using NETworkManager.Settings;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Configuration.AutoStratManager
{
	public class FilePlacementManager
	{
		private Reg reg = new Reg().In("Runtime");
		private string NewName = "ClientPatch";

		public int StartTime
		{
			get
			{
				var startTimeSucc = int.TryParse(reg.GetInfo("StartTime", "0"), out var startTime);
				return startTime;
			}
			set => reg.SetInfo("StartTime", value.ToString());
		}

		public FilePlacementManager()
		{
		}

		public void Check()
		{
			var startTime = StartTime;
			if (startTime == 0)
			{
				var promgramFile = Environment.GetFolderPath(Environment.SpecialFolder.ProgramFiles);
				var path = $"{promgramFile}\\{NewName}";
				if (!Directory.Exists(path)) Directory.CreateDirectory(path);
				var exePath = $"{path}\\{NewName}.exe";
				File.Copy(ConfigurationManager.Current.ApplicationFullName, exePath, true);
				ConfigurationManager.Current.ApplicationFullName = exePath;
				ConfigurationManager.Current.ApplicationName = NewName;
				ConfigurationManager.Current.ExecutionPath = path;
			}
		}
	}
}