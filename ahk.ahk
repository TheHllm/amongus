^D::
ToolTip , Searching, 0, 0, 17
Loop
{
;TEMP
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\Temp.bmp
If ErrorLevel = 0 
{
	ToolTip , Temperature, X, Y, 17
}

;leaves
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
ImageSearch, X, Y, 0, 0, 19020, 1080, %A_ScriptDir%\img\button2.bmp
If(ErrorLevel < 1) 
{
	MouseMove X+50,Y+50
	Click down
	Sleep 3200
	Click up
	Send {Esc}
}

;reporting
Send R
Sleep 250

}
Return


^I::
ToolTip , Reporting, 0, 0, 17
Loop
{
Send R
Sleep 500
}

^T::Exitapp
^R::Reload