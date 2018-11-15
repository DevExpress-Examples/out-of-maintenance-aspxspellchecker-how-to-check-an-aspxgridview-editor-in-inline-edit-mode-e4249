<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
<!-- default file list end -->
# ASPxSpellChecker - How to check an ASPxGridView editor in Inline edit mode


<p>This example illustrates how to perform check spelling in a specific ASPxGridView editor in Inline edit mode:<br />
- Hide the default Update and Cancel command buttons by handling the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_CommandButtonInitializetopic"><u>ASPxGridView.CommandButtonInitialize</u></a> event;<br />
- Define custom Update and Cancel buttons in order to provide a custom response when clicking them and prevent editing changes from immediate submission;<br />
- Handle the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_CustomButtonClicktopic"><u>ASPxClientGridView.CustomButtonClick</u></a> event. If the "Update" button is clicked, perform check spelling in a specific editor via the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxSpellCheckerScriptsASPxClientSpellChecker_CheckElementtopic"><u>ASPxClientSpellChecker.CheckElement</u></a> method (pass the editor input element retrieved via the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxEditorsScriptsASPxClientEdit_GetInputElementtopic"><u>ASPxClientEdit.GetInputElement</u></a> method as a parameter);<br />
- After the check spelling procedure is completed, submit the editing changes via the client-side <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewScriptsASPxClientGridView_UpdateEdittopic"><u>ASPxClientGridView.UpdateEdit</u></a> method.</p><p>Note that data modifications are not allowed in online demos. To allow editing in local/offline mode, download the example and comment out the "throw..." operation in the ASPxGridView.RowUpdating event handler.</p>

<br/>


