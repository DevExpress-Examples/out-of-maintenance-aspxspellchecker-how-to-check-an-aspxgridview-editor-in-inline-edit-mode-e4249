<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v15.1, Version=15.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript">
        var isCheckInProcess = false;
        function OnCustomButtonClick(s, e) {
            if (e.buttonID === "btnCancel") {
                grid.CancelEdit();
            }
            else if (e.buttonID === "btnUpdate" && !isCheckInProcess) {
                checker.CheckElement(memoNotes.GetInputElement());
                isCheckInProcess = true;
            }
        }
        function OnAfterCheck(s, e) {
            isCheckInProcess = false;
            grid.UpdateEdit();
        }
        function OnCheckCompleteFormShowing(s, e) {
            e.cancel = true;
        }
    </script>

</head>
<body>
    <form id="frmMain" runat="server">
    <dx:ASPxSpellChecker ID="sc" runat="server" ClientInstanceName="checker" Culture="English (United States)">
        <ClientSideEvents AfterCheck="OnAfterCheck" CheckCompleteFormShowing="OnCheckCompleteFormShowing" />
        <Dictionaries>
            <dx:ASPxSpellCheckerISpellDictionary AlphabetPath="~/App_Data/Dictionaries/EnglishAlphabet.txt"
                GrammarPath="~/App_Data/Dictionaries/english.aff" DictionaryPath="~/App_Data/Dictionaries/american.xlg"
                CacheKey="ispellDic" Culture="English (United States)" EncodingName="Western European (Windows)">
            </dx:ASPxSpellCheckerISpellDictionary>
        </Dictionaries>
    </dx:ASPxSpellChecker>
    <dx:ASPxGridView ID="gv" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
        DataSourceID="ads" KeyFieldName="EmployeeID" OnCellEditorInitialize="gv_CellEditorInitialize"
        OnRowUpdating="gv_RowUpdating" 
        oncommandbuttoninitialize="gv_CommandButtonInitialize">
        <Columns>
            <dx:GridViewCommandColumn VisibleIndex="0" ShowEditButton="True">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnUpdate" Text="Update" Visibility="EditableRow">
                    </dx:GridViewCommandColumnCustomButton>
                    <dx:GridViewCommandColumnCustomButton ID="btnCancel" Text="Cancel" Visibility="EditableRow">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="EmployeeID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="LastName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FirstName" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataMemoColumn FieldName="Notes" VisibleIndex="5">
                <PropertiesMemoEdit ClientInstanceName="memoNotes">
                </PropertiesMemoEdit>
            </dx:GridViewDataMemoColumn>
        </Columns>
        <SettingsEditing Mode="Inline" />
        <ClientSideEvents CustomButtonClick="OnCustomButtonClick" />
    </dx:ASPxGridView>
    <asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/nwind.mdb" SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Title], [Notes] FROM [Employees]"
        UpdateCommand="UPDATE [Employees] SET [LastName] = ?, [FirstName] = ?, [Title] = ?, [Notes] = ? WHERE [EmployeeID] = ?">
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Notes" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    </form>
</body>
</html>