#SingleInstance, force
CoordMode, Mouse, Screen

^D::
ToolTip , Searching, 0, 0, 17
Loop
{
if WinActive("Among Us")
{

;TEMP
ToolTip, Temperature, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\Temp.bmp
If ErrorLevel = 0 
{
	ToolTip , Temperature, X, Y, 17
}

;leaves
ToolTip, leaves, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\leaves.bmp
If ErrorLevel = 0 
{
	ToolTip , leaves, X, Y, 17
	MouseMove X,Y+265
	Click down
	Sleep 3200
	Click up
	Send {ESC}
}
;button
ToolTip, button1, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\button.bmp
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
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\button2.bmp
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
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\labBtn.bmp
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
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\Switch.bmp
If(ErrorLevel < 1) 
{
	Click, X+10,Y+10
}

;divert
ToolTip, divert, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\divert.bmp
If(ErrorLevel < 1) 
{
	ToolTip, divert, X, Y, 17
	ImageSearch, X2, Y2, 0, 0, 1920, 1080, %A_ScriptDir%\img\divertSlider.bmp
	
	MouseMove X2+45,Y2+35
	Click down
	MouseMove, X2+45, Y + 100, 10
	Click up
}

;weapons
ToolTip, weapons, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\divert.bmp
If(ErrorLevel < 1) 
{
	ToolTip, divert, X, Y, 17
	ImageSearch, X2, Y2, 0, 0, 1920, 1080, %A_ScriptDir%\img\divertSlider.bmp
	
	MouseMove X2+45,Y2+35
	Click down
	MouseMove, X2+45, Y + 100, 10
	Click up
}

;divertAccept
ToolTip, divertAccept, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\divertAccept.bmp
If(ErrorLevel < 1) 
{
	MouseClick,, X+25,Y+80
}


;weapons
ToolTip, weapons, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\weapons.bmp
If(ErrorLevel < 1) 
{
	MouseClick,, X+25,Y+80
}


;wires
ToolTip, wires, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\Wires.bmp
If(ErrorLevel < 1) 
{
	ColorMap:={}
	rY:=[]
	Loop, 4{
		PixelGetColor, lColor, 560, 80+A_Index*189
		ColorMap[lColor]:=A_Index
		
	}
	Loop, 4{
		PixelGetColor, rColor, 1350, 80+A_Index*189
		
		rY[ColorMap[rColor]]:=80+A_Index*189
	}

	;; move the mouse
	Loop, 4
	{
		MouseMove 600, 80+A_Index*189, 2
		Sleep 10
		Click down
		Sleep 20
		MouseMove 1280, rY[A_Index], 2
		Sleep 10
		Click up
		Sleep 10
	}
}

;reporting
;racecondition
if WinActive("Among Us")
{
	Send R
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