﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var pctCurrent = document.getElementById("hdnPercentCurrent").value / 100;
            var total = document.getElementById("lblCount").innerText;

            var current = total * pctCurrent;
            var pastDue = total - current;

            var data = google.visualization.arrayToDataTable([
                ['Update status', 'Repeaters'],
                ['Current', current],
                ['Past due', pastDue]
            ]);

            var options = {
                backgroundColor: 'transparent',
                colors: ['#ed6750', '#46c742'],
                legend: { textStyle: { color: '#ffffff', fontSize: 18 } },
                reverseCategories: true,
                title: 'Number of repeaters with current records',
                titleTextStyle: { color: '#ffffff', fontName: 'Cinzel Decorative', fontSize: 23, bold: true }
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section>
		<h1>Arkansas Repeater Council</h1>
		<p>
			The Arkansas Repeater Council coordinates
amateur radio repeater frequencies in the state of Arkansas. We utilize available data from our own database, as well as information from surrounding states.  We use our own standards and guidelines as well as those of the <a href="http://iowarepeater.org/mid-america-coordination-council/">Mid-America Coordination Council</a> and the <a href="http://nfcc.us/">National Frequency Coordinators Council</a>.
		</p>
    </section>
    <section>
        <div id="homeStatsContainer">
            <div class="stat">
                <h1><asp:label id="lblCount" ClientIDMode="Static" runat="server" text="100"></asp:label></h1>
                <span class="normalText">active coordinated repeaters</span>
            </div>
            <div class="stat">
                <h1><asp:label id="lblCoordinationCount" runat="server" text="100"></asp:label></h1>
                <span class="normalText">coordinations automatically processed</span>
            </div>
            <div class="stat">
                <h1><asp:label id="lblAverageDaysPerCoordination" runat="server" text="10"></asp:label> days</h1>
                <span class="normalText">average time to coordinate</span>
            </div>
        </div>
        <div class="currentRepeaters" id="piechart"></div>
        <div style="clear: both;"><asp:label id="lblRecentChanges" runat="server" text="Ch-ch-ch-ch-changes"></asp:label></div>
    </section>
    <asp:HiddenField ID="hdnPercentCurrent" ClientIDMode="Static" runat="server" />
</asp:Content>

