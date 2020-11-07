^D::
ToolTip , Searching, 0, 0, 17
Loop
{
if WinActive("Among Us")
{

;TEMP
ToolTip, Temperature, 0, 0, 1
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\Temp.bmp
If ErrorLevel = 0 
{
	ToolTip , Temperature, X, Y, 17
}

;leaves
ToolTip, leaves, 0, 0, 1
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\leaves.bmp
If ErrorLevel = 0 
{
	ToolTip , leaves, X, Y, 17
	MouseMove X,Y+200
	Click down
	Sleep 3200
	Click up
	Send {ESC}
}
;button
ToolTip, button1, 0, 0, 1
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\button.bmp
If(ErrorLevel < 1) 
{
	MouseMove X+50,Y+50
	Click down
	Sleep 3200
	Click up
	Send {Esc}
}

;button2
ToolTip, button2, 0, 0, 1
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\button2.bmp
If(ErrorLevel < 1) 
{
	MouseMove X+50,Y+50
	Click down
	Sleep 3200
	Click up
	Send {Esc}
}

;lab Btn
ToolTip, lab, 0, 0, 1
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\labBtn.bmp
If(ErrorLevel < 1) 
{
	MsgBox
	ToolTip, lab, X, Y, 17
	;Click, X+20,Y+20
	;Sleep 20
	;Send {Esc}
}

;switch
ToolTip, switch, 0, 0, 1
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\Switch.bmp
If(ErrorLevel < 1) 
{
	Click, X+10,Y+10
}

;wires
ToolTip, wires, 0, 0, 1
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\Wires.bmp
If(ErrorLevel < 1) 
{
	ToolTip ,Wires, X, Y, 17
	; look for the wires on the left
	lX := []
	lY := []
	Loop, 4
	{
		ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\wires\%A_Index%.bmp
		lX[A_Index]:=X+75
		lY[A_Index]:=Y
	}
	
	rX := []
	rY := []
	; look for the wires on the right
	Loop, 4
	{
		ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\wires\%A_Index%R.bmp
		rX[A_Index]:=X-80
		rY[A_Index]:=Y
	}
	; move the mouse
	Loop, 4
	{
		MouseMove lX[A_Index], lY[A_Index]
		Click down
		Sleep 100
		MouseMove rX[A_Index], rY[A_Index]
		Click up
		Sleep 20
	}
}

;reporting
;racecondition
if WinActive("Among Us")
{
	Send R
	Sleep 250
}



}}
Return


^I::
ToolTip , Reporting, 0, 0, 1
Loop
{
Send R
Sleep 500
}

^T::Exitapp
^R::Reload