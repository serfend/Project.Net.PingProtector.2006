using IpSwitch.Helper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading.Tasks;
using System.Management;

namespace PingProtector.BLL.Network.GatewayDictionary
{
	public class GatewayDictionary
	{
		public List<IpToNetwork> HasGatewayIp { get; set; }

		public GatewayDictionary()
		{
			var list = NetworkHelper.NetWorkList();
			HasGatewayIp = list.Where(i => i.GetIPProperties().GatewayAddresses.Any()).Select(i => new IpToNetwork()
			{
				Network = i,
				NetworkObj = NetworkHelper.GetNetworkByName(i.Description),
				Ip = i.GetIPProperties().GatewayAddresses.FirstOrDefault()?.Address.ToString()
			}).ToList();
		}
	}

	public class IpToNetwork
	{
		public string Ip { get; set; }
		public NetworkInterface Network { get; set; }
		public ManagementObject NetworkObj { get; set; }
	}
}