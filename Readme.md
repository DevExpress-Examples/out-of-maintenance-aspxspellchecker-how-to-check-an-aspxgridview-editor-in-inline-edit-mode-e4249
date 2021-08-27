<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128536804/15.1.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4249)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# ASPxSpellChecker - How to check an ASPxGridView editor in Inline edit mode
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e4249/)**
<!-- run online end -->


<p>This example illustrates how to perform check spelling in a specific ASPxGridView editor in Inline edit mode:<br />
- Hide the default Update and Cancel command buttons by handling the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_CommandButtonInitializetopic"><u>ASPxGridView.CommandButtonInitialize</u></a> event;<br />
- Define custom Update and Cancel buttons in order to provide a custom response when clicking them and prevent editing changes from immediate submission;<br />
- Handle the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_CustomButtonClicktopic"><u>ASPxClientGridView.CustomButtonClick</u></a> event. If the "Update" button is clicked, perform check spelling in a specific editor via the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSpellCheckerScriptsASPxClientSpellChecker_CheckElementtopic"><u>ASPxClientSpellChecker.CheckElement</u></a> method (pass the editor input element retrieved via the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsScriptsASPxClientEdit_GetInputElementtopic"><u>ASPxClientEdit.GetInputElement</u></a> method as a parameter);<br />
- After the check spelling procedure is completed, submit the editing changes via the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_UpdateEdittopic"><u>ASPxClientGridView.UpdateEdit</u></a> method.</p><p>Note that data modifications are not allowed in online demos. To allow editing in local/offline mode, download the example and comment out the "throw..." operation in the ASPxGridView.RowUpdating event handler.</p>

<br/>


