Attribute VB_Name = "Module1"
Sub MultipleYearStockData()

For Each ws In Worksheets
ws.Cells(1, 9).Value = "Ticker"
ws.Cells(1, 10).Value = "Yearly Change"
ws.Cells(1, 11).Value = "Percent Change"
ws.Cells(1, 12).Value = "Total Stock Volume"

ws.Cells(1, 16).Value = "Ticker"
ws.Cells(1, 17).Value = "Value"

ws.Cells(2, 15).Value = "Greatest % Increase"
ws.Cells(3, 15).Value = "Greatest % Decrease"
ws.Cells(4, 15).Value = "Greatest Total Volume"

Dim i As Long

Dim Open_Price_Row As Long

Dim tickerName As String

Dim Open_Yearly_Price As Double

Dim Total_Stock_Volume As Double
Total_Stock_Volume = 0

Dim Yearly_Change As Double
Yearly_Change = 0

Dim Yearly_Percent_Change As Double

Dim Print_Row As Long
Print_Row = 2

Dim lastRow As Long
lastRow = ws.Cells(Rows.Count, 1).End(xlUp).Row
Open_Price_Row = 2
Open_Yearly_Price = ws.Cells(Open_Price_Row, 3).Value

For i = 2 To lastRow

If ws.Cells(i + 1, 1).Value <> ws.Cells(i, 1).Value Then
tickerName = ws.Cells(i, 1).Value
ws.Range("I" & Print_Row).Value = tickerName

Yearly_Change = (ws.Cells(i, 6).Value - Open_Yearly_Price)
ws.Range("J" & Print_Row).Value = Yearly_Change

Yearly_Percent_Change = (Yearly_Change / Open_Yearly_Price)
ws.Range("K" & Print_Row).Value = Yearly_Percent_Change
ws.Range("K" & Print_Row).Style = "Percent"
ws.Range("K" & Print_Row).NumberFormat = "0.00%"

Total_Stock_Volume = Total_Stock_Volume + ws.Cells(i, 7).Value
ws.Range("L" & Print_Row).Value = Total_Stock_Volume
Print_Row = Print_Row + 1
Yearly_Change = 0
Total_Stock_Volume = 0
Open_Yearly_Price = ws.Cells(i + 1, 3).Value

Else
Total_Stock_Volume = Total_Stock_Volume + ws.Cells(i, 7).Value

End If

Next i

Dim Year_Last_Row As Long
Year_Last_Row = ws.Cells(Rows.Count, 10).End(xlUp).Row

For i = 2 To Year_Last_Row

If ws.Cells(i, 10).Value >= 0 Then
ws.Cells(i, 10).Interior.ColorIndex = 10

End If

If ws.Cells(i, 10).Value < 0 Then
ws.Cells(i, 10).Interior.ColorIndex = 9

End If

Next i

Dim Total_Stock_Volume_Row As Long
Total_Stock_Volume_Row = ws.Cells(Rows.Count, 12).End(xlUp).Row

Dim Total_Stock_Volume_Row_Max As Double
Total_Stock_Volume_Row_Max = 0

For i = 2 To Total_Stock_Volume_Row

If Total_Stock_Volume_Row_Max < ws.Cells(i, 12).Value Then
Total_Stock_Volume_Row_Max = ws.Cells(i, 12).Value
ws.Cells(4, 17).Value = Total_Stock_Volume_Row_Max
ws.Cells(4, 16).Value = ws.Cells(i, 9).Value

End If

Next i

Dim Percent_Last_Row As Long
Percent_Last_Row = ws.Cells(Rows.Count, 11).End(xlUp).Row

Dim percent_max As Double
percent_max = 0

Dim percent_min As Double
percent_min = 0

For i = 2 To Percent_Last_Row

If percent_max < ws.Cells(i, 11).Value Then
percent_max = ws.Cells(i, 11).Value
ws.Cells(2, 17).Value = percent_max
ws.Cells(2, 17).Style = "Percent"
ws.Cells(2, 16).Value = ws.Cells(i, 9).Value

ElseIf percent_min > ws.Cells(i, 11).Value Then
percent_min = ws.Cells(i, 11).Value
ws.Cells(3, 17).Value = percent_min
ws.Cells(3, 17).Style = "Percent"
ws.Cells(3, 16).Value = ws.Cells(i, 9).Value

End If

Next i

Next ws

End Sub


