﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoginReset : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		if (IsValid)
		{
			try
			{
				using (var webClient = new System.Net.WebClient())
				{
					string parameters = string.Format("callsign={0}", txtCallsign.Text);
					string strUrl = string.Format("{0}{1}{2}", System.Configuration.ConfigurationManager.AppSettings["webServiceRootUrl"], "ResetPassword?", parameters);
					string json = webClient.DownloadString(strUrl);
					dynamic data = JsonConvert.DeserializeObject<dynamic>(json);
				}

				lblDirections.Text = "A new password has been created and queued to send to the email address we have on file. It may take up to 15 minutes before you receive it.";
			}
			catch (Exception ex)
			{
				new ExceptionReport(ex);
				lblDirections.Text = "An error occurred while processing your reset request.  We have logged this error.  In the meantime you are welcome to browse to the home page, then back here to try again.";
			}
			btnSubmit.Enabled = false;
			txtCallsign.Enabled = false;
		}
	}
}