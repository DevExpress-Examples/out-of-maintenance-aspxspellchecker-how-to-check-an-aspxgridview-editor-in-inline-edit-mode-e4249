Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.Web.ASPxGridView
Imports DevExpress.Web.ASPxEditors

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub gv_CellEditorInitialize(ByVal sender As Object, ByVal e As ASPxGridViewEditorEventArgs)
		If TypeOf e.Editor Is ASPxMemo AndAlso e.Value IsNot Nothing Then
			Dim text As String = e.Value.ToString()
			Dim words() As String = text.Split(New Char() { " "c })
			For i As Integer = 0 To words.Length - 1
				If words(i).Length > 5 Then
					words(i) &= "a"
				End If
			Next i
			e.Editor.Value = String.Join(" ", words)
		End If
	End Sub
	Protected Sub gv_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
		Throw New InvalidOperationException("Data modifications are not allowed in online demos")
	End Sub
	Protected Sub gv_CommandButtonInitialize(ByVal sender As Object, ByVal e As ASPxGridViewCommandButtonEventArgs)
		If e.ButtonType = ColumnCommandButtonType.Cancel OrElse e.ButtonType = ColumnCommandButtonType.Update Then
			e.Visible = False
		End If
	End Sub
End Class