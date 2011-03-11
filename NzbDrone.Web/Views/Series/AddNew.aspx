﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<AddNewSeriesModel>" %>
<%@ Import Namespace="NzbDrone.Web.Models" %>
<%@ Import Namespace="Telerik.Web.Mvc.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Add New Series
</asp:Content>
<asp:Content ID="Menu" ContentPlaceHolderID="ActionMenu" runat="server">
    <%
        Html.RenderPartial("SubMenu");
    %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <%= Html.Label("Enter a Series Name") %>
    <%= Html.TextBox("new_series_name", String.Empty, new { id="new_series_id" }) %>

    <p>
        <button class="t.button" onclick="searchSeries ()">Search</button>
    </p>

    //Search Button - Perform AJAX search for this Series on TVDB

    //Return results with Radio Box + First Aired information, (link to TVDB too?) + Hidden ID text

    User selects radio button and then presses add (or skips which clears results and #new_series_id)

    Add, ask user to choose where to save the show in (used when sorting) then add the show... Possibly ask user to choose Quality Profile
    
    <div id="result"></div>

    <script type="text/javascript" language="javascript">

        function searchSeries() {
            var seriesSearch = $('#new_series_id');

//            if ($seriesSearch.length < 1) {
//                alert("Enter a valid name to search for");
//                return;
//            }          

            //Setup a function to handle the results... Or return a partial...
            $("#result").load('<%=Url.Action("SearchForSeries", "Series") %>', {
                seriesName: seriesSearch.val()
            }

            //this.window.location = '<%= Url.Action("Index", "Series") %>';

            );
        }

    </script>

</asp:Content>
