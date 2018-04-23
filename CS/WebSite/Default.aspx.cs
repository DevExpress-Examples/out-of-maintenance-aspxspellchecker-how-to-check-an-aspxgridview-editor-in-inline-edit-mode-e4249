using System;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void gv_CellEditorInitialize(object sender, ASPxGridViewEditorEventArgs e) {
        if (e.Editor is ASPxMemo && e.Value != null) {
            string text = e.Value.ToString();
            string[] words = text.Split(new char[] { ' ' });
            for (int i = 0; i < words.Length; i++) {
                if (words[i].Length > 5)
                    words[i] += "a";
            }
            e.Editor.Value = string.Join(" ", words);
        }
    }
    protected void gv_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
        throw new InvalidOperationException("Data modifications are not allowed in online demos");
    }
    protected void gv_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e) {
        if (e.ButtonType == ColumnCommandButtonType.Cancel || e.ButtonType == ColumnCommandButtonType.Update)
            e.Visible = false;
    }
}