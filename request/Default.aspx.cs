﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class request_Default : System.Web.UI.Page
{
	Credentials creds;
	protected void Page_Load(object sender, EventArgs e)
	{
		creds = Utilities.GetExistingCredentials();
		ARC.User user = ARC.User.Load(creds);

		if (!Page.IsPostBack)
		{
			txtPersonCallsign.Text = user.Callsign;
			txtEmail.Text = user.Email;
			txtPersonName.Text = user.FullName;
		}
	}

	protected void btnCancel_Click(object sender, EventArgs e)
	{
		Response.Redirect("~/Dashboard/");
	}

	protected void btnSubmit_Click(object sender, EventArgs e)
	{
		new CoordinationRequest(txtLatitude.Text, txtLongitude.Text, txtOutputPower.Text, txtAltitude.Text, txtAntennaHeight.Text, txtFrequency.Text, creds).Save();
		Response.Redirect("~/Dashboard/");
	}
}