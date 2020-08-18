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
				if (exePath == ConfigurationManager.Current.ApplicationFullName) return;
				if (File.Exists(exePath))
				{
					var target = GetMd5(exePath);
					var current = GetMd5(ConfigurationManager.Current.ApplicationFullName);
					//var item = new { target, current };
					//MessageBox.Show(JsonConvert.SerializeObject(item));
					if (target == current) return;
				}
				File.Copy(ConfigurationManager.Current.ApplicationFullName, exePath, true);
				ConfigurationManager.Current.ApplicationFullName = exePath;
				ConfigurationManager.Current.ApplicationName = NewName;
				ConfigurationManager.Current.ExecutionPath = path;
			}
		}

		public string GetMd5(string filename)
		{
			string result = string.Empty;
			var currentPath = ConfigurationManager.Current.ExecutionPath;
			var checkFile = $"{currentPath}\\{new Random().Next(10000, 99999)}";
			File.Copy(filename, checkFile);
			using (var file = new FileStream(checkFile, FileMode.Open))
			{
				var md5C = new System.Security.Cryptography.MD5Cng();
				var md5 = md5C.ComputeHash(file).Select(i => i.ToString("x2"));
				result = string.Join("", md5);
			}
			File.Delete(checkFile);
			return result;
		}
	}
}