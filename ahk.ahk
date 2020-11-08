#SingleInstance, force
CoordMode, Mouse, Screen

CheckPoints(x,y,c){ 
	for i, elm in x
	{
		PixelGetColor, detColor, elm, y[i]
		if(Not detColor = c[i])
		{
			return False
		}
	}
	return True
}


^D::
Loop
{
;if WinActive("Among Us")
if True
{
;leaves
ToolTip, leaves, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\leaves.bmp
If ErrorLevel = 0 
{
	MouseMove X,Y+265
	Click down
	MouseMove X,Y+565
	Sleep 3000
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
labX:=[1070,1202,1262]
labY:=[942,939,935]
labColor:=[0x373537,0x3FF700,0x00BD00]

If(CheckPoints(labX, labY, labColor)) 
{
	MouseClick,, 1262,935
	Sleep 20
	Send {Esc}
}

;switch TODO testme
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
	Sleep 10
	Click down
	Sleep 10
	MouseMove, X2+45, Y - 400
	Sleep 10
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
		MouseMove 600, 80+A_Index*189, 1
		Sleep 10
		Click down
		Sleep 10
		MouseMove 1280, rY[A_Index], 1
		Sleep 10
		Click up
		Sleep 10
	}
}

;wallet
ToolTip, wallet, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\Wallet.bmp
If(ErrorLevel < 1) 
{
	Click 750, 810
	Sleep 800
	MouseMove 520, 430
	Sleep 10
	Click down
	MouseMove 1400, 430, 7
	Click up
}

;Download/Upload
ToolTip, download, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\download_btn.bmp
If(ErrorLevel < 1) 
{
	MouseClick,, X+10,Y+10
}
ToolTip, upload, 0, 0, 1
ImageSearch, X, Y, 0, 0, 1920, 1080, %A_ScriptDir%\img\upload_btn.bmp
If(ErrorLevel < 1) 
{
	MouseClick,, X+10,Y+10
}


;timing
ToolTip, timing, 0, 0, 1

;detec the slivers of colors
timingX := [1118,1118,1118]
timingY := [230,500,770]
timingColor := [0x00E3FF,0xFF6253,0xFFF96F]


If(CheckPoints(timingX,timingY, timingColor)) 
{
	Loop, 3{
		i:=A_Index
		Loop %discard%{
			;wait for the color to not be the background
			PixelGetColor, col, 1200, -30+i*260
			if col != 0
			{
				;click the btn
				MouseClick,, 1200, -30+i*260
				break
			}
		}
	}

}

;Shields
ToolTip, Shields, 0, 0, 1

;detec three distinctive dots
shieldsX := [1410,1360,1350]
shieldsY := [654,600,615]
shieldsColor := [0x3A1C09,0x91491E,0xFFFFFF]

ClickShield(x,y)
{
	Sleep 10
	MouseClick,, x+20,y
}

if(CheckPoints(shieldsX, shieldsY, shieldsColor)){
	ClickShield(610,410)
	ClickShield(830,290)
	ClickShield(610,410)
	ClickShield(1045,415)
	ClickShield(828,540)
	ClickShield(600,670)
	ClickShield(1047,670)
	ClickShield(827,793)
}


;reporting
;racecondition
if WinActive("Among Us")
{
	Send R
}



}}
Return



^T::Exitapp
^R::Reload