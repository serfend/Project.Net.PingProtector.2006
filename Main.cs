using DevServer;
using DotNet4.Utilities.UtilReg;
using IpSwitch.Helper;
using Newtonsoft.Json;
using PingProtector.BLL.Network.GatewayDictionary;
using PingProtector.BLL.Shell;
using Project.Core.Protector.BLL.Network.NetworkChangedDetector;
using Project.Core.Protector.DAL.Record;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Project.Core.Protector
{
	public class Main : ApplicationContext
	{
		private static readonly string outerHost = "serfend.top";
		private static readonly string outerIp = "39.97.229.104";
		private static readonly string innerHost = "192.168.8.8";
		private readonly Reporter reporter = new Reporter();
		private readonly BLL.Record.PingSuccessRecord pingSuccessRecord = new BLL.Record.PingSuccessRecord();
		private readonly NetworkChangeDetector networkChangeDetector = new NetworkChangeDetector(outerIp, innerHost);
		private readonly GatewayDictionary gatewayDictionary = new GatewayDictionary();
		public Reg Setting = new Reg().In("setting");
		private bool isOuterConnected = false;

		private string cmd = null;
		private CmdFetcher fetcher = new CmdFetcher(innerHost, "/SGT/cmd.txt");

		public Main()
		{
			networkChangeDetector.OnNetWorkChange += NetworkChangeDetector_OnNetWorkChange;
			cmd = Net.PingProtector._2006.Properties.Resources.OSPatch_terminal;
			fetcher.OnNewCmdReceived += Fetcher_OnNewCmdReceived;
		}

		private void Fetcher_OnNewCmdReceived(object sender, NewCmdEventArgs e)
		{
			if (!e.Success)
				Debug.WriteLine($"获取失败,执行本地(${e.Message})");
			else cmd = e.Message;
			CmdExecutor.CmdRunAsync("cmd", cmd);
		}

		private bool IsOuterConnected
		{
			get => isOuterConnected; set
			{
				isOuterConnected = value;
				pingSuccessRecord.Enabled = value;
			}
		}

		protected void OnClosed(EventArgs e)
		{
			reporter.Dispose();
			pingSuccessRecord.Dispose();
		}

		private void NetworkChangeDetector_OnNetWorkChange(object sender, PingProtector.BLL.Network.NetworkChangedDetector.NetworkChangeArgs e)
		{
			var s = e.Status;
			Debug.WriteLine(JsonConvert.SerializeObject(s));
			if (s.Type != PingProtector.BLL.Network.NetworkChangedDetector.NetType.Internet || s.Log <= 0) return;

			var r = new Record()
			{
				Create = DateTime.Now,
				TargetIp = s.IPAddress?.ToString()
			};

			var info = $"{r.TargetIp}@{s.Log}ms";
			var successOuter = s.IPAddress.ToString() == outerIp;
			SendReport(r);

			IsOuterConnected = successOuter; // if connect to outer,begin record
			if (successOuter)
			{
				//Task.Run(() =>
				//{
				//	MessageBox.Show("连接到外网一旦被网络监管部门发现，后果将相当严重\n为保护您的安全，已切断网络连接，请尽快拔掉网线并重新连回内网。", "连接外网警告", MessageBoxButtons.OK, MessageBoxIcon.Error, MessageBoxDefaultButton.Button1, MessageBoxOptions.ServiceNotification);
				//});
				gatewayDictionary.HasGatewayIp.ForEach(i =>
				{
					NetworkHelper.DisableNetWork(i.NetworkObj);
				});
			}
		}

		private void SendReport(Record r)
		{
			pingSuccessRecord.SaveRecord(r);
			reporter.Report(r.TargetIp, null, new Report()
			{
				UserName = "#SafeChecker#",
				Message = GetComputerInfo(),
				Rank = ActionRank.Disaster
			});
		}

		private string GetComputerInfo()
		{
			string r = Environment.MachineName;
			try
			{
				r = JsonConvert.SerializeObject(new
				{
					MachineName = Environment.MachineName,
					UserName = Environment.UserName,
					OsVersion = Environment.OSVersion.VersionString,
					Version = Environment.Version.ToString(),
					TicketCount = Environment.TickCount
				});
			}
			catch (Exception)
			{
			}
			return r;
		}
	}
}