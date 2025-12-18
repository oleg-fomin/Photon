					Member()
	omit('***$***',_VER_C55)
_ABCDllMode_        EQUATE(0)
_ABCLinkMode_       EQUATE(1)
	***$***
	Include('Equates.CLW'),ONCE
	Include('Keycodes.CLW'),ONCE
	Include('Errors.CLW'),ONCE
					MAP

						Module('Win32.lib')

							GDI_Ellipse(LONG hdc, uLONG, uLONG, uLONG, uLONG),ULONG,PASCAL,proc,name('Ellipse')
							PolyBezier(LONG hdc,uLONG,uLONG), uLONG, PASCAL, RAW, NAME('PolyBezier')
							GetSysColor(signed nIndex),long,pascal,NAME('GetSysColor')
							GetLastError(), LONG, PASCAL, NAME('GetLastError')
							GetDeviceCaps(UNSIGNED, SIGNED),SIGNED,PASCAL
							ReleaseDC(LONG, LONG),SIGNED,PASCAL
							GetDC(LONG),LONG,PASCAL
							ResetDC(LONG, LONG),LONG,PASCAL,NAME('ResetDCA')
							SetPixel(LONG, LONG, LONG, LONG),LONG,PASCAL,PROC
							CreateCompatibleDC(LONG),LONG,PASCAL
							CreateCompatibleBitmap(LONG, LONG, LONG),LONG,PASCAL
							BitBlt(long hdcDest, long nXDest, long nYDest, long nWidth, long nHeight, ulong hdcSrc, long nXSrc, long nYSrc, ulong dwRop), long, raw, pascal, name('BitBlt'),proc
							SelectObject(LONG, LONG),LONG,PASCAL,PROC
							SelectObj(LONG),LONG,PASCAL,Name('SelectObject')
							SetStretchBltMode(long,long),long,pascal,proc
							StretchBlt(long,long,long,long,long,Long,long,long,long,long,long),long,pascal,raw,PROC
							RoundRect(LONG hdc, signed nLeftRect, signed nTopRect, signed nRightRect, |
								signed nBottomRect, signed nWidth, signed nHeight),bool,pascal,Name('RoundRect')
							SetDCBrushColor(LONG hdc, uLONG),ULONG,PASCAL,proc
							SetDCPenColor(LONG hdc, uLONG),ULONG,PASCAL,proc
							GetStockObject(uLONG),ULONG,PASCAL,raw
							SetBkMode(LONG hdc, signed iBkMode),signed,pascal,proc,Name('SetBkMode')
							LoadBitmap(LONG hInst, long lpBitmapName),LONG,pascal, |
								name('LoadBitmapA')                            
							API:LoadImage(LONG ,*CSTRING,UNSIGNED,SIGNED,SIGNED,UNSIGNED), LONG, PASCAL, RAW, NAME('LoadImageA')
							API:TransparentBlt(LONG  hdcDest, LONG  xoriginDest, LONG  yoriginDest,|
								LONG  wDest, LONG  hDest, LONG  hdcSrc, LONG  xoriginSrc, LONG  yoriginSrc,|
								LONG  wSrc, LONG  hSrc, UNSIGNED crTransparent), LONG, PASCAL, RAW, NAME('TransparentBlt')
							API:DrawIconEx(LONG hdc, LONG xLeft, LONG yTop,LONG  hIcon, LONG cxWidth,|
								LONG cyWidth,UNSIGNED istepIfAniCur,LONG hbrFlickerFreeDraw,UNSIGNED diFlags), LONG, PASCAL, RAW, NAME('DrawIconEx')
                            
    !-------------------> Fonts
							CreateFontIndirect(*SA_LOGFONT lplf   | characteristics
							),LONG,PASCAL,RAW,NAME('CreateFontIndirectA')
							CreateFont(signed nHeight, signed nWidth, signed nEscapement, |
								signed nOrientation, signed fnWeight, unsigned fdwItalic, |
								unsigned fdwUnderline, unsigned fdwStrikeOut, unsigned |
								fdwCharSet, unsigned fdwOutputPrecision, unsigned |
								fdwClipPrecision, unsigned fdwQuality, unsigned |
								fdwPitchAndFamily, *CString lpszFace),LONG,pascal,raw,name('CreateFontA')
							SetTextColor(LONG hdc, LONG crColor),LONG,pascal,proc,Name('SetTextColor')
							GetTextExtentPoint32(LONG hdc,           | !handle to DC
								*CSTRING lpString,  | !text string
								LONG                        cbString,      | !characters in string
								*GDI_SIZE lpSize     | !string size SIZE structure
								),BOOL,PASCAL,RAW,PROC,NAME('GetTextExtentPoint32A')

							GetCharABCWidths(LONG hdc,         | !handle to DC
								UNSIGNED                    uFirstChar, | !first character in range
								UNSIGNED                    uLastChar,  | !last character in range
								UNSIGNED                    lpabc       | !pointer to array of character widths
								),BOOL,PASCAL,RAW,NAME('GetCharABCWidthsA')

							GetCharacterPlacement(LONG hDC,                  | !handle to DC
								*CSTRING lpString,         | !character string
								SIGNED                      nCount,             | !number of characters
								SIGNED                      nMaxExtent,         | !maximum extent for string
								*SA_GCP_RESULTS lpResults,    | !placement result
								ULONG                       dwFlags              | !placement options
								),ULONG,PASCAL,RAW,NAME('GetCharacterPlacementA')

							SetTextJustification(LONG hdc,          | !handle to DC
								SIGNED                      nBreakExtra,  | !length of extra space
								SIGNED                      nBreakCount   | !count of space characters
								),BOOL,PASCAL,PROC,Name('SetTextJustification')

							SetTextAlign(LONG hDC, UNSIGNED fMode),UNSIGNED,PASCAL,PROC,Name('SetTextAlign')
							GetTextAlign(LONG hDC),UNSIGNED,PASCAL,PROC,Name('GetTextAlign')

							GetFontLanguageInfo(LONG hdc),ULONG,PASCAL,Name('GetFontLanguageInfo')

							GetOutlineTextMetrics(LONG hdc,                    | !handle to DC
								UNSIGNED                    cbData,             | !size of metric data array
								<*? lpOTM>                   | !array of OTM, metric data array
								),UNSIGNED,PASCAL,RAW,NAME('GetOutlineTextMEtricsA')

							GetTextMetrics(LONG hdc, *TEXTMETRIC tm),Bool,Pascal,Raw,Proc,Name('GetTextMetricsA')

							GetKerningPairs(LONG hdc,                 | !handle to DC
								UNSIGNED                    nNumPairs,      | !number of kerning pairs
								<*? lpkrnpair> | !array of kerning pairs
								),UNSIGNED,PASCAL,RAW,NAME('GetKerningPairsA')

							TextOut(LONG hdc,             | !handle to DC
								LONG                        nXStart,       | !x-coordinate of starting position
								LONG                        nYStart,       | !y-coordinate of starting position
								*CSTRING lpString,  | !character string
								LONG                        cbString       | !number of characters
								),BOOL,PASCAL,PROC,RAW,NAME('TextOutA')

							TabbedTextOut(LONG hDC,   | !handle to DC
								Long                        X,       | !x-coord of start
								Long                        Y,       | !y-coord of start
								*Cstring lpString, |!character string
								Long                        nCount,  | !number of characters
								Long                        nTabPositions, | !number of tabs in array
								*Long lpnTabStopPositions, |!array of tab positions
								Long                        nTabOrigin | !start of tab expansion
								),Bool, Pascal, Raw, Proc, Name('TabbedTextOutA')

							ExtTextOut(LONG hDC,          | !handle to DC
								LONG                        X,           | !x-coordinate of reference point
								LONG                        Y,           | !y-coordinate of reference point
								ULONG                       fuOptions,   | !text-output options
								<*SA_RECT lprc>,     | !optional dimensions
								*? lpString,| !pointer to string or Glyph index array
								LONG                        cbCount,     | !number of characters in string
								<*? lpDx>       | !array of spacing values
								),BOOL,RAW,PASCAL,NAME('ExtTextOutA'),PROC


							DrawTextEx(LONG hDC,          | !handle to DC
								*CSTRING lpString, | !text to draw
								LONG                        nCount,       | !text length
								*SA_RECT lpRect,      | !formatting dimensions
								LONG                        uFormat,      | !text-drawing options
								<*SA_DRAWTEXTPARAMS dtp>| !Extended parameters
								),LONG,PROC,PASCAL,RAW,NAME('DrawTextExA')

							DrawText(LONG hdc, *CString lpszString, unsigned nCount, *GDI_RECT lpRect, |
								unsigned uFormat),signed,raw,pascal,proc,name('DrawTextA')

							DrawTextW(LONG hdc, *CString lpszString, unsigned nCount, *GDI_RECT lpRect, |
								unsigned uFormat),signed,raw,pascal,proc,name('DrawTextW')

							DrawTextExA(LONG hdc, *CString lpszString, unsigned nCount, *GDI_RECT lpRect, |
								unsigned uFormat, UNSIGNED lpdtp),signed,raw,pascal,proc,name('DrawTextExA')

							EnumFontFamiliesEx(UNSIGNED hdc,             | !handle to DC
								*LOGFONT lpLogfont,       | !font information
								*EnumFontFamExProc lpEnumFontFamExProc, | !callback function
								LONG        lParam,              | !additional data to pass to callback
								LONG        dwFlags=0            | !not used; must be 0
								),SIGNED,PROC,PASCAL,RAW,NAME('EnumFontFamiliesExA')

EnumFontFamExProc           PROCEDURE(LONG lpElf,    |! pointer to ENUMLOGFONTEX or ENUMLOGFONTEXDV
								LONG                        lpNtm,    |! pointer to TEXTMETRIC or NEWTEXTMETRICEX or ENUMTEXTMETRIC
								LONG                        FontType, |! font type bitmap
								LONG                        lParam    |! optional user defined data
								),SIGNED,PASCAL,TYPE

							GetTextColor(LONG hdc),LONG,PASCAL,Name('GetTextColor')

							MoveToEx(uLONG,signed x, signed y, *POINT lpPoint),bool,raw,pascal,proc,Name('MoveToEx')
							LineTo(LONG hdc, signed x, signed y),bool,pascal,proc,Name('LineTo')
							GradientFill( ULong, long, LONG, long, LONG, LONG),long,pascal,raw,name('GradientFill'),proc



    !---------------> Maintenance
							DeleteObject(LONG),bool,pascal,proc,Name('DeleteObject')
							RemoveFontResourceA(LONG),PASCAL,raw
							RemoveFontMemResourceEx(LONG),PASCAL,raw
							DeleteDC(LONG),SIGNED,PASCAL


						END
					END ! map

	Include('ce_BufferedGraphics.inc'),ONCE

ce_BufferedGraphics.Allocate        PROCEDURE(SIGNED pControlFEQ) ! Declare Procedure
	CODE

		SELF.ControlFEQ = pControlFEQ
		SELF.controlHWnd  = pControlFEQ{PROP:Handle}
		SELF.controlDC    = GetDC(SELF.controlHWnd)
		SELF.sourceWidth  = pControlFEQ{PROP:Width}
		SELF.sourceHeight = pControlFEQ{PROP:Height}       
		SELF.memoryDC     = CreateCompatibleDC(SELF.controlDC)  
		RETURN(SELF.controlDC)

        
ce_BufferedGraphics.DeAllocate      PROCEDURE()

	CODE
        
		RetVal# = DeleteDC(SELF.memoryDC)
		RetVal# = DeleteDC(SELF.IconsMemoryDC)

		RETURN

        
ce_BufferedGraphics.IconsAllocate   PROCEDURE  (SIGNED IconspControlFEQ) ! Declare Procedure
	CODE

		SELF.IconsControlFEQ = IconspControlFEQ
		SELF.IconsControlHWnd  = IconspControlFEQ{PROP:Handle}
		SELF.IconsControlDC    = GetDC(SELF.controlHWnd)
		SELF.IconsSourceWidth  = IconspControlFEQ{PROP:Width}
		SELF.IconsSourceHeight = IconspControlFEQ{PROP:Height}       
		SELF.IconsMemoryDC     = CreateCompatibleDC(SELF.IconsControlDC)  
		RETURN(SELF.IconsControlDC)

        
ce_BufferedGraphics.IconsDeAllocate PROCEDURE()

	CODE
        
		RetVal# = DeleteDC(SELF.memoryDC)
		RetVal# = DeleteDC(SELF.ClonedMemoryDC)

		RETURN
        
        
        

ce_BufferedGraphics.SetPixel        PROCEDURE  (LONG pX, LONG pY, LONG pColour) ! Declare Procedure
	CODE
 !Stop('pX: ' & pX & ', pY: ' & pY & ', pColour: ' & pColour)
		SetPixel (SELF.memoryDC, pX, pY, pColour)
        
ce_BufferedGraphics.Load    PROCEDURE                         ! Declare Procedure
	CODE

        !Icons Layer, always the same size
		IF SELF.IconsControlFEQ <> 0
			SELF.sourceWidth  = SELF.ControlFEQ{PROP:Width}
			SELF.sourceHeight = SELF.ControlFEQ{PROP:Height}
			DeleteObject(SELF.IconsMemoryBitMap)
			SELF.IconsMemoryBitMap = CreateCompatibleBitmap(SELF.IconsControlDC, SELF.sourceWidth , SELF.sourceHeight)
			SELF.IconsMemoryOriginalBitMap = SelectObject(SELF.IconsMemoryDC, SELF.IconsMemoryBitMap)
			BitBlt(SELF.IconsMemoryDC, 0, 0, SELF.sourceWidth, SELF.sourceHeight, SELF.IconsControlDC , 0, 0, dwRop:SRCCOPY)
            
		END
            !Single Data Layer        
		SELF.sourceWidth  = SELF.ControlFEQ{PROP:Width}
		SELF.sourceHeight = SELF.ControlFEQ{PROP:Height}
		DeleteObject(SELF.memoryBitMap)
		SELF.memoryBitMap = CreateCompatibleBitmap(SELF.controlDC, SELF.sourceWidth , SELF.sourceHeight)
		SELF.memoryOriginalBitMap = SelectObject(SELF.memoryDC, SELF.memoryBitMap)
		BitBlt(SELF.memoryDC, 0, 0, SELF.sourceWidth, SELF.sourceHeight, SELF.controlDC , 0, 0, dwRop:SRCCOPY)
		

ce_BufferedGraphics.Render  PROCEDURE                       ! Declare Procedure
	CODE
        
		SetStretchBltMode(SELF.controlDC, 3)
		StretchBlt(SELF.controlDC, 0, 0, SELF.sourceWidth, SELF.sourceHeight, SELF.memoryDC, 0, 0, SELF.sourceWidth, SELF.sourceHeight, dwRop:SRCCOPY)
        
		
ce_BufferedGraphics.RoundRect       PROCEDURE(SIGNED StartX,SIGNED StartY,SIGNED EndX,SIGNED EndY, SIGNED Radius, ULONG OutlineColor, ULONG FillColor)

ReturnedVal                             LONG

	CODE
		

		SelectObject(SELF.memoryDC,GetStockObject(GDI_NULL_BRUSH))
		
		IF FillColor => 10
			ReturnedVal# = SetDCBrushColor(SELF.memoryDC,FillColor)
			SelectObject(SELF.memoryDC,GetStockObject(GDI_DC_BRUSH))
		END
		
		
		SelectObject(SELF.memoryDC,GetStockObject(GDI_NULL_PEN))
		IF OutlineColor => 10
			SetDCPenColor(SELF.memoryDC,OutlineColor)
			SelectObject(SELF.memoryDC,GetStockObject(GDI_DC_PEN))
		END
        
		ReturnedVal = RoundRect(SELF.memoryDC ,StartX,StartY,EndX,EndY,Radius,Radius)
        
		RETURN(ReturnedVal)
		
		

        
ce_BufferedGraphics.DrawBox PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY, ULONG BoxColor, ULONG OutlineColor,LONG Radius)

ReturnedVal                     LONG

	CODE
		
		IF OutlineColor + BoxColor => 1
			
			IF OutlineColor = 0
				SELF.PenColor(GDI_NULL_PEN)
			ELSE
				SELF.PenColor(OutlineColor)
			END
		
			IF BoxColor = 0
				BrushColorRetVal# = SELF.BrushColor(GDI_NULL_BRUSH)
			ELSE
				BrushColorRetVal# = SELF.BrushColor(BoxColor)
			END
		
			ReturnedVal = RoundRect(SELF.memoryDC ,StartX,StartY,EndX,EndY,Radius,Radius)
		END
		
        
ce_BufferedGraphics.DrawImage       PROCEDURE(STRING pImageFile, UNSIGNED pW, UNSIGNED pH)

THinst                                  LONG
FileToLoad                              CSTRING(128)
ReturnedHandle                          UNSIGNED
hdcorg                                  LONG
hdcTemp                                 LONG
hDCImg                                  UNSIGNED
LastError                               STRING(128)
MemoryBitMap                            LONG

	CODE
        
		FileToLoad = pImageFile

		ReturnedHandle = API:LoadImage(0h,FileToLoad,GDI_IMAGE_BITMAP,pW,pH,GDI_LR_LOADFROMFILE)
 
		IF ReturnedHandle = 0
            !LastError = 
            !MESSAGE('LoadImage(%Z) error %i ' & GetLastError())
		ELSE
			hDCImg = GetDC(ReturnedHandle)
			hdcTemp = CreateCompatibleDC(hDCImg)

			SelectObject(SELF.IconsMemoryDC,ReturnedHandle)
        !MESSAGE(GetLastError())

			BitBlt(SELF.IconsMemoryDC, 0, 0, pW, pH, hDCImg, 0, 0,dwRop:SRCCOPY)
			BitBlt(SELF.memoryDC, 10, 10, pW, pH, SELF.IconsMemoryDC, 0, 0,dwRop:SRCCOPY)
			Fuck# = ReleaseDC(SELF.IconsMemoryDC,ReturnedHandle)
		END

        
		RETURN FALSE
        

        
ce_BufferedGraphics.PenColor        PROCEDURE(LONG PenColor)

	CODE
		
        SetDCPenColor(SELF.memoryDC,PenColor)
		SelectObject(SELF.memoryDC,GetStockObject(GDI_DC_PEN))
		
		
		RETURN

ce_BufferedGraphics.BrushColor      PROCEDURE(LONG BrushColor)

	CODE

		IF BrushColor = 0
			ReturnedVal# = SetDCBrushColor(SELF.memoryDC,GDI_NULL_BRUSH)
			SelectObject(SELF.memoryDC,GetStockObject(GDI_DC_BRUSH))
			
		ELSE
			ReturnedVal# = SetDCBrushColor(SELF.memoryDC,BrushColor)
			SelectObject(SELF.memoryDC,GetStockObject(GDI_DC_BRUSH))
			
		END
		
		RETURN(ReturnedVal#)


!=========================> Fonts

ce_BufferedGraphics.InitFont        PROCEDURE(STRING FontFace, uLONG TextPoints)

	CODE

		SELF.FontFace = CLIP(FontFace)
		SELF.FontHandle = CreateFont(TextPoints,0,0,0,0,0,0,0,0,0,0,2,0,SELF.FontFace)
		SELF.TempFontHandle = SelectObject(SELF.memoryDC,SELF.FontHandle)
		SELF.Background(COLOR:Red)
!

		RETURN

ce_BufferedGraphics.FontColor       PROCEDURE(LONG TextColor)

	CODE

		SetTextColor(SELF.memoryDC,TextColor)

		RETURN

!==========================> Maintenance Stuff

ce_BufferedGraphics.FreeGDIResources        PROCEDURE()

	CODE

		ReturnedVal# = ReleaseDC(SELF.memoryDC, SELF.controlDC)
		ReturnedVal# = ReleaseDC(SELF.memoryDC,SELF.TempFontHandle)
		ReturnedVal# = ReleaseDC(SELF.memoryDC,SELF.FontHandle)
		DeleteObject(SELF.TempFontHandle)
		DeleteObject(SELF.FontHandle)



		RETURN

ce_BufferedGraphics.RemoveFontResourceGDI   PROCEDURE()

	CODE

		DeleteObject(SELF.FontHandle)
		DeleteObject(SELF.TempFontHandle)
    !

		RETURN
        
ce_BufferedGraphics.Background      PROCEDURE(LONG BackgroundMode)

	CODE
        
		SetBkMode(SELF.memoryDC,BackgroundMode)
        
		RETURN

        
ce_BufferedGraphics.Ln      PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY)

ptOldPoint                      GROUP,PRE(PNT)
x                                   SIGNED
y                                   SIGNED
								END


	CODE

		SelectObject(SELF.memoryDC,GDI_NULL_PEN)
		MoveToEx(SELF.memoryDC,StartX,StartY,ptOldPoint)
		SelectObject(SELF.memoryDC,GDI_DC_PEN)
		LineTo(SELF.memoryDC,EndX,EndY)

		RETURN
        
        
        
        
        !===================================> Cells, interlinked...
        
        
ce_BufferedGraphics.Draw_Cell_With_Header   PROCEDURE(SIGNED StartX, SIGNED StartY, |
												SIGNED Cell_Width, SIGNED Cell_Height, ULONG BoxColor, ULONG OutlineColor, SIGNED Cell_Roundness,|
												SIGNED Label_Cell_Width, SIGNED Label_Cell_Height, ULONG Label_BoxColor, ULONG Label_OutlineColor, SIGNED Label_Cell_Roundness,|
												STRING Label_Text, LONG Label_Left_Padding, LONG Label_Top_Padding, STRING Label_Justify, STRING Label_FontFace, LONG Label_FontPoints, ULONG Label_FontColor,|
												STRING Data_Text,LONG Data_Left_Padding, LONG Data_Top_Padding, STRING Data_Justify, STRING Data_FontFace, LONG Data_FontPoints, ULONG Data_FontColor)

TextCoords                                      LIKE(GDI_RECT)
SizeStruct                                      LIKE(GDI_SIZE)
PointsSTR                                       STRING(8192)
InitialRadius                                   LONG
MaxInitialItems                                 uLONG
ExtraItems                                      uLONG
MinDistance                                     uLONG
Q_ID                                            LONG
BG_Hor_Padding                                  uLONG
BG_Ver_Padding                                  uLONG
TextOut                                         CSTRING(4096)
hFont                                           uLONG
hTmp                                            uLONG
FontFace                                        CSTRING(128)
ThisTextPoints                                  uLONG
ThisTextHeight                                  uLONG
ThisTextLen                                     uLONG
ThisTextWidth                                   uLONG
ThisTextXpos                                    uLONG
ThisTextYpos                                    uLONG
ThisRegionStartX                                uLONG
ThisRegionStartY                                uLONG
ThisRegionEndX                                  uLONG
ThisRegionEndY                                  uLONG
Multiplier                                      uLONG
IconName                                        CSTRING(256)
hBitmap                                         uLONG
hdcorg                                          uLONG
hdcTemp                                         uLONG
IconHandle                                      uLONG
W_Paint_hdc                                     uLONG
PStructure                                      LIKE(GDI_PAINTSTRUCT)
PStructure_ADD                                  uLONG
hWndRgn                                         uLONG
UniWinRect                                      LIKE(GDI_RECT)
LocBlackBrush                                   uLONG
RoundedCornerVal                                ULONG
TextPadding                                     uLONG
ThisParent                                      LONG
LastFEQ                                         LONG
TopMarginText                                   ULONG
uAlignPrev                                      ULONG
Max_Chars_Per_Line                              ULONG
This_Char_Width                                 ULONG
Justify                                         CSTRING(64)
Left_Padding                                    LONG
Top_Padding                                     LONG
LabelBoxStartX                                  LONG
LabelBoxStartY                                  LONG
LabelTopMargin                                  ULONG
DataTopMargin                                   ULONG
ThisTExtJustification                           LONG
DataBoxStartX                                   LONG
DataBoxStartY                                   LONG
TextParms                                       LONG
LabelHeight                                     ULONG



	CODE
        
        
!=============> Main Cell
		
		SELF.RoundRect(StartX, StartY, StartX + Cell_Width, StartY + Cell_Height,Cell_Roundness,OutlineColor,BoxColor)
        
!=============> Second Cell for the label
		IF (Label_Cell_Height + Label_Cell_Width) => 1
        !Let's center it
			LabelBoxStartX = INT(StartX + ((Cell_Width - Label_Cell_Width) / 2))			
			SELF.RoundRect(LabelBoxStartX, StartY + Label_Top_Padding, LabelBoxStartX + Label_Cell_Width, StartY + Label_Cell_Height, Label_Cell_Roundness,Label_OutlineColor,Label_BoxColor)
		END
        
		
		DataBoxStartY = StartY + Label_Cell_Height + 3!pixels

!=============> Label
        
		IF LEN(CLIP(Label_Text)) => 1
			FontFace = Label_FontFace
			ThisTextPoints = Label_FontPoints
			SELF.InitFont(FontFace,ThisTextPoints)
			SELF.FontColor(Label_FontColor)
			TextOut = CLIP(Label_Text)
			ThisTextLen = LEN(TextOut)
			GetTextExtentPoint32(SELF.memoryDC,TextOut,ThisTextLen,SizeStruct)

			Left_Padding = Label_Left_Padding
			Top_Padding = Label_Top_Padding
			Justify = Label_Justify
			
			ThisTextYpos = StartY + ((Label_Cell_Height - SizeStruct.cy) / 2 )
        
			!DO Calculate_Line_Or_MultiLine_ROUTINE
			
			TextParms = DT_SINGLELINE
			
			CASE UPPER(Label_Justify)

			OF 'CENTER'
				TextParms = BOR(TextParms,DT_CENTER)
					
			OF 'LEFT'
					TextParms = BOR(TextParms,DT_LEFT )
					
			OF 'RIGHT'
					TextParms = BOR(TextParms,DT_RIGHT)
			END
			
			
			IF TextCoords.Bottom > 0
				LabelHeight = TextCoords.Bottom
			ELSE
				LabelHeight = 0
			END
			
			!Let's calculate the position
			
			ThisTextXpos = StartX + Left_Padding
			ThisTextYpos = StartY + Top_Padding
			ThisTextWidth = SizeStruct.cx
			ThisTextHeight = SizeStruct.cy    
			TextCoords.left = ThisTextXpos + ((Cell_Width - ThisTextWidth) / 2)
			TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
			TextCoords.top = ThisTextYpos 
			TextCoords.bottom = TextCoords.top + ThisTextHeight
        
			DrawTextExA(SELF.memoryDC,TextOut,ThisTextLen,TextCoords,TextParms,0)
			
			SELF.RemoveFontResourceGDI()  
		END
        

!=============> Data
		
		IF LEN(CLIP(LEFT(Data_Text))) => 1
			FontFace = Data_FontFace
			ThisTextPoints = Data_FontPoints
			SELF.InitFont(FontFace,ThisTextPoints)
			SELF.FontColor(Data_FontColor)
			TextOut = CLIP(LEFT(Data_Text))
			ThisTextLen = LEN(TextOut)
			GetTextExtentPoint32(SELF.memoryDC,TextOut,ThisTextLen,SizeStruct)

			
             
			Left_Padding = Data_Left_Padding
			Top_Padding = Data_Top_Padding
			Justify = Data_Justify

			ThisTextYpos = StartY + ((Cell_Height - Label_Cell_Height - SizeStruct.cy) / 2) + Label_Cell_Height
			
			TextParms = ''
			TextParms = BOR(TextParms,DT_WORDBREAK)			
			TextParms = BOR(TextParms,DT_EXPANDTABS)			
			
			
			IF SizeStruct.cx > Cell_Width - (Left_Padding*4) !more than one line
				!ThisTextYpos = StartY + ((Cell_Height - Label_Cell_Height - SizeStruct.cy) / 2) + Label_Cell_Height
				ThisTextXpos = StartX + Left_Padding
				ThisTextWidth = SizeStruct.cx
				ThisTextHeight = SizeStruct.cy
				TextCoords.left = ThisTextXpos 
				TextCoords.right = ThisTextXpos + Cell_Width - Left_Padding * 3
				TextCoords.top = StartY + Label_Cell_Height + 3
				TextCoords.bottom = StartY + Cell_Height - 3
			ELSE
				ThisTextXpos = StartX + Left_Padding
				ThisTextWidth = Cell_Width - Left_Padding * 4
				ThisTextHeight = SizeStruct.cy
				TextCoords.left = ThisTextXpos
				TextCoords.right = TextCoords.left + Cell_Width - Left_Padding * 3! * 1.4
				TextCoords.top = ThisTextYpos 
				TextCoords.bottom = TextCoords.top + Cell_Height - 3
			
			END
			
			
			CASE UPPER(Justify)

			OF 'CENTER'
				TextParms = BOR(TextParms,DT_CENTER)
					
			OF 'LEFT'
					TextParms = BOR(TextParms,DT_LEFT )
					
			OF 'RIGHT'
					TextParms = BOR(TextParms,DT_RIGHT)
			END
			
			
			DrawTextExA(SELF.memoryDC,TextOut,ThisTextLen,TextCoords,TextParms ,0)
			
			SELF.RemoveFontResourceGDI()
		END
        
        
		RETURN
		
        
Fit_TextBox_ROUTINE        ROUTINE

	DATA 

	CODE		
	
	CASE UPPER(Justify)

	OF 'CENTER'
        
		
		ThisTextXpos = StartX + Left_Padding
		ThisTextWidth = SizeStruct.cx
		ThisTextHeight = SizeStruct.cy    
		TextCoords.left = ThisTextXpos + ((Cell_Width - ThisTextWidth) / 2)
		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
		TextCoords.top = ThisTextYpos ! + ((Cell_Height - ThisTextHeight) / 2)
		TextCoords.bottom = TextCoords.top + Cell_Height - 3


	OF 'LEFT'
        
		ThisTextXpos = StartX + Left_Padding
		ThisTextWidth = SizeStruct.cx
		ThisTextHeight = SizeStruct.cy    
		TextCoords.left = ThisTextXpos !+ ThisTextWidth
		TextCoords.right = TextCoords.left + Cell_Width - Left_Padding * 3! * 1.4
		TextCoords.top = DataBoxStartY
		TextCoords.bottom = TextCoords.top + Cell_Height - 3

	OF 'RIGHT'
        
		ThisTextXpos = StartX + Cell_Width - Left_Padding - SizeStruct.cx
		ThisTextWidth = SizeStruct.cx
		ThisTextHeight = SizeStruct.cy    
		TextCoords.left = ThisTextXpos !+ ThisTextWidth
		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
		TextCoords.top = ThisTextYpos! + ((Cell_Height - ThisTextHeight) / 2)
		TextCoords.bottom = TextCoords.top + ThisTextHeight

	END
		
		
!	OF 'CENTER'
!        
!		ThisTextXpos = StartX + Left_Padding
!		ThisTextWidth = SizeStruct.cx
!		ThisTextHeight = SizeStruct.cy    
!		TextCoords.left = ThisTextXpos + ((Cell_Width - ThisTextWidth) / 2)
!		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
!		TextCoords.top = ThisTextYpos ! + ((Cell_Height - ThisTextHeight) / 2)
!		TextCoords.bottom = TextCoords.top + ThisTextHeight
!
!
!	OF 'LEFT'
!        
!		ThisTextXpos = StartX + Left_Padding
!		ThisTextWidth = SizeStruct.cx
!		ThisTextHeight = SizeStruct.cy    
!		TextCoords.left = ThisTextXpos !+ ThisTextWidth
!		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
!		TextCoords.top = ThisTextYpos! + ((Cell_Height - ThisTextHeight) / 2)
!		TextCoords.bottom = TextCoords.top + ThisTextHeight
!
!	OF 'RIGHT'
!        
!		ThisTextXpos = StartX + Cell_Width - Left_Padding - SizeStruct.cx
!		ThisTextWidth = SizeStruct.cx
!		ThisTextHeight = SizeStruct.cy    
!		TextCoords.left = ThisTextXpos !+ ThisTextWidth
!		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
!		TextCoords.top = ThisTextYpos! + ((Cell_Height - ThisTextHeight) / 2)
!		TextCoords.bottom = TextCoords.top + ThisTextHeight
!
!	END		
    
		EXIT
		
ce_BufferedGraphics.DrawRoundButton PROCEDURE(SIGNED StartX, SIGNED StartY, |
										SIGNED Cell_Width, SIGNED Cell_Height, ULONG BoxColor, ULONG OutlineColor, |
										STRING Data_Text,LONG Data_Left_Padding, LONG Data_Top_Padding, | 
										STRING Data_Justify, STRING Data_FontFace, LONG Data_FontPoints, ULONG Data_FontColor)

TextCoords                                      LIKE(GDI_RECT)
SizeStruct                                      LIKE(GDI_SIZE)
PointsSTR                                       STRING(8192)
InitialRadius                                   LONG
MaxInitialItems                                 uLONG
ExtraItems                                      uLONG
MinDistance                                     uLONG
Q_ID                                            LONG
BG_Hor_Padding                                  uLONG
BG_Ver_Padding                                  uLONG
TextOut                                         CSTRING(128)
hFont                                           uLONG
hTmp                                            uLONG
FontFace                                        CSTRING(128)
ThisTextPoints                                  uLONG
ThisTextHeight                                  uLONG
ThisTextLen                                     uLONG
ThisTextWidth                                   uLONG
ThisTextXpos                                    uLONG
ThisTextYpos                                    uLONG
ThisRegionStartX                                uLONG
ThisRegionStartY                                uLONG
ThisRegionEndX                                  uLONG
ThisRegionEndY                                  uLONG
Multiplier                                      uLONG
IconName                                        CSTRING(256)
hBitmap                                         uLONG
hdcorg                                          uLONG
hdcTemp                                         uLONG
IconHandle                                      uLONG
W_Paint_hdc                                     uLONG
PStructure                                      LIKE(GDI_PAINTSTRUCT)
PStructure_ADD                                  uLONG
hWndRgn                                         uLONG
UniWinRect                                      LIKE(GDI_RECT)
LocBlackBrush                                   uLONG
RoundedCornerVal                                ULONG
TextPadding                                     uLONG
ThisParent                                      LONG
LastFEQ                                         LONG
TopMarginText                                   ULONG
uAlignPrev                                      ULONG
Max_Chars_Per_Line                              ULONG
This_Char_Width                                 ULONG
Justify                                         CSTRING(64)
Left_Padding                                    LONG
Top_Padding                                     LONG
LabelBoxStartX                                  LONG
LabelBoxStartY                                  LONG
LabelTopMargin                                  ULONG
DataTopMargin                                   ULONG

	CODE
        
        
!=============> Circle
		
		SELF.Ellip(StartX, StartY, StartX + Cell_Width, StartY + Cell_Height,OutlineColor,BoxColor)

!=============> Data
		IF LEN(CLIP(Data_Text)) => 1
			FontFace = Data_FontFace
			ThisTextPoints = Data_FontPoints
			SELF.InitFont(FontFace,ThisTextPoints)
			SELF.FontColor(Data_FontColor)
			TextOut = CLIP(LEFT(Data_Text))
			ThisTextLen = LEN(TextOut)
			GetTextExtentPoint32(SELF.memoryDC,TextOut,ThisTextLen,SizeStruct)
             
			Left_Padding = Data_Left_Padding
			Top_Padding = Data_Top_Padding
			Justify = Data_Justify
			ThisTextYpos = StartY + ((Cell_Height - (SizeStruct.cy)) / 2)
			DO Justify_Text_ROUTINE
        
			DrawText(SELF.memoryDC,TextOut,ThisTextLen,TextCoords,0)        
			SELF.RemoveFontResourceGDI()  
		END
        
        
		RETURN
        
Justify_Text_ROUTINE        ROUTINE

	DATA 

	CODE		
	
	CASE UPPER(Justify)

	OF 'CENTER'
        
		ThisTextXpos = StartX + Left_Padding
		ThisTextWidth = SizeStruct.cx
		ThisTextHeight = SizeStruct.cy
		TextCoords.left = INT(ThisTextXpos + ((Cell_Width - ThisTextWidth) / 2))
		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
		TextCoords.top = ThisTextYpos ! + ((Cell_Height - ThisTextHeight) / 2)
		TextCoords.bottom = TextCoords.top + ThisTextHeight


	OF 'LEFT'
        
		ThisTextXpos = StartX + Left_Padding
		ThisTextWidth = SizeStruct.cx
		ThisTextHeight = SizeStruct.cy    
		TextCoords.left = ThisTextXpos !+ ThisTextWidth
		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
		TextCoords.top = ThisTextYpos! + ((Cell_Height - ThisTextHeight) / 2)
		TextCoords.bottom = TextCoords.top + ThisTextHeight

	OF 'RIGHT'
        
		ThisTextXpos = StartX + Cell_Width - Left_Padding - SizeStruct.cx
		ThisTextWidth = SizeStruct.cx
		ThisTextHeight = SizeStruct.cy    
		TextCoords.left = ThisTextXpos !+ ThisTextWidth
		TextCoords.right = TextCoords.left + ThisTextWidth! * 1.4
		TextCoords.top = ThisTextYpos! + ((Cell_Height - ThisTextHeight) / 2)
		TextCoords.bottom = TextCoords.top + ThisTextHeight

	END
    
	EXIT		
!-----------------------------------------------------------------------------!
! MixColors
! Mix color1 and color2 using the percentage of mix.
! If pColor1 is white the pColor2 will be the same pColor2 color but bright
! If pColor1 is black the pColor2 will be the same pColor2 color but darker
!-----------------------------------------------------------------------------!

ce_BufferedGraphics.MixColors       PROCEDURE (LONG pColor1, LONG pColor2, BYTE pPercentageMix)

CWColor1                                LONG,AUTO
RGBT1                                   GROUP,OVER(CWColor1)
R                                           BYTE
G                                           BYTE
B                                           BYTE
DitherMode                                  BYTE
										END
CWColor2                                LONG,AUTO
RGBT2                                   GROUP,OVER(CWColor2)
R                                           BYTE
G                                           BYTE
B                                           BYTE
DitherMode                                  BYTE
										END
RetCWColor                              LONG
RetRGBT                                 GROUP,OVER(RetCWColor)
R                                           BYTE
G                                           BYTE
B                                           BYTE
DitherMode                                  BYTE
										END

DitherColors                            LONG,AUTO

	CODE
		IF pPercentageMix > 100
			pPercentageMix = 100
		END

		DitherColors = SYSTEM {PROP:ColorHighByte} * 1000000h

		IF BAND (pColor1, 80000000h)
			pColor1 = GetSysColor (BAND (pColor1, 0FFFFh))
		ELSE
			pColor1 = BOR (DitherColors, BAND (pColor1, 0FFFFFFh))
		END
		IF BAND (pColor2, 80000000h)
			pColor2 = GetSysColor (BAND (pColor2, 0FFFFh))
		ELSE
			pColor2 = BOR (DitherColors, BAND (pColor2, 0FFFFFFh))
		END

		CWColor1 = pColor1
		CWColor2 = pColor2

		RetRGBT.R = (RGBT1.R + ((RGBT2.R - RGBT1.R) * pPercentageMix/100))
		RetRGBT.G = (RGBT1.G + ((RGBT2.G - RGBT1.G) * pPercentageMix/100))
		RetRGBT.B = (RGBT1.B + ((RGBT2.B - RGBT1.B) * pPercentageMix/100))
		RetRGBT.DitherMode = 0

		RETURN BOR (RetCWColor, DitherColors)        
		
		
		
		
ce_BufferedGraphics.Bezier  PROCEDURE(LONG StartX,LONG StartY,LONG EndX, LONG EndY, LONG BezierColor)

BezierPTs                       LIKE(BezierPoints)
LOC:BezierPTR                   LONG

Magnet                          GROUP,DIM(2)
x                                   LONG
y                                   LONG
								END

MagnetDev                       LONG

Bezier_Distance                        UNSIGNED


	CODE

		
		Bezier_Distance = SQRT(((EndX - StartX) ^ 2) + ((EndY - StartY) ^ 2))
		
		IF BezierColor => 1
			SELF.PenColor(BezierColor)
		ELSE
			SELF.PenColor(RANDOM(1,65535))
		END
		
		
		

		MagnetDev = INT(Bezier_Distance / 4) + RANDOM(1,INT(Bezier_Distance / 5)) !RANDOM(17,50)!INT(((EndX - StartX) +  (EndY - StartY)) / 2)
		!MESSAGE('MagnetDev = ' & MagnetDev)
	
		Magnet.x[1] = StartX - RANDOM(-50,50)
		Magnet.y[1] = StartY - RANDOM(-50,50)
		Magnet.x[2] = EndX - RANDOM(-50,50)
		Magnet.y[2] = EndY - RANDOM(-50,50)
	
		IF EndX =< StartX AND EndY =< StartY
			Magnet.x[1] = StartX + MagnetDev
			Magnet.y[1] = StartY - MagnetDev
			Magnet.x[2] = EndX - MagnetDev
			Magnet.y[2] = EndY + MagnetDev
		END
		
		IF EndX =< StartX AND EndY => StartY
			Magnet.x[1] = StartX - MagnetDev
			Magnet.y[1] = StartY + MagnetDev
			Magnet.x[2] = EndX + MagnetDev
			Magnet.y[2] = EndY - MagnetDev
		END
		IF EndX => StartX AND EndY =< StartY
			Magnet.x[1] = StartX + MagnetDev
			Magnet.y[1] = StartY + MagnetDev
			Magnet.x[2] = EndX - MagnetDev
			Magnet.y[2] = EndY - MagnetDev
		END
		
		IF EndX => StartX AND EndY => StartY
			Magnet.x[1] = StartX + MagnetDev
			Magnet.y[1] = StartY + MagnetDev
			Magnet.x[2] = EndX - MagnetDev
			Magnet.y[2] = EndY - MagnetDev
		END
	
		BezierPTs.x[1] = StartX
		BezierPTs.y[1] = StartY
		BezierPTs.x[2] = Magnet.x[1]
		BezierPTs.y[2] = Magnet.y[1]
		BezierPTs.x[3] = Magnet.x[2]
		BezierPTs.y[3] = Magnet.y[2]
		BezierPTs.x[4] = EndX
		BezierPTs.y[4] = EndY

		LOC:BezierPTR = ADDRESS(BezierPTs)
		
		ThisBezier# = PolyBezier(SELF.memoryDC,LOC:BezierPTR,4)

	
		RETURN

ce_BufferedGraphics.Poly    PROCEDURE(LONG CenterX,LONG CenterY,LONG Sides,LONG Radius,LONG StartAngle)


cx                              DECIMAL(10,2)
cy                              DECIMAL(10,2)
n                               DECIMAL(10,2)
r                               DECIMAL(10,2)
ang                             DECIMAL(10,2)
startAng                        DECIMAL(10,2)
PI                              DECIMAL(10,6)
ARRAYSTR                        STRING(8192)
centerAng                       DECIMAL(10,4)
vx                              LONG
VY                              LONG



	CODE
	
		PI = 3.141592	
		cx = CenterX
		cy = CenterY
		n = Sides
		r = Radius
		startAng = StartAngle
		
		startAng =  (startAng / 180) * PI
		centerAng = 2 * PI / n
		IF StartAngle = 0
			IF (startAng / 2) = INT((startAng / 2))		
				startAng = PI / 2
			ELSE
				startAng = (PI/2) - (centerAng/2)		
			END
		END
		LOOP Sides + 1 TIMES
			I# += 1
			ang = startAng + (I# * centerAng)

			StartPntX# = vx
			StartPntY# = vy
			
			vx = ROUND((cx + r*cos(ang)),.1)
			vy = ROUND((cy - r*sin(ang)),.1)
		
			IF I# = 1
				EndPntX# = vx
				EndPntY# = vy
			END
		
			IF I# => 2 AND I# <= Sides
				SELF.Ln(StartPntX#,StartPntY#, vx,vy)
			
			END
		
			IF I# = Sides + 1
				SELF.Ln(StartPntX#,StartPntY#,EndPntX#,EndPntY#)
			
			END
		
			IF StartPntX# + StartPntY# <> 0
				ARRAYSTR = StartPntX# & ',' & StartPntY# & '<13>' & CLIP(ARRAYSTR)
			END

		END !Loop
		
		RETURN(CLIP(ARRAYSTR))
	
ce_BufferedGraphics.Trn     PROCEDURE(LONG CenterX,LONG CenterY,LONG InnerCircle,LONG OuterCircle,<STRING Direction>)

PAX                             LONG
PAY                             LONG
PBX                             LONG
PBY                             LONG
PCX                             LONG
PCY                             LONG

TriangleHeight                  DECIMAL(10,2)
SideA                           DECIMAL(10,2)
SideB                           DECIMAL(10,2)
SideC                           DECIMAL(10,2)
TriangleArea                    DECIMAL(10,2)


	CODE
	!actually, we need only 2 values... The circle and  where to start drawing
	!Deprecated, a total waste of time
	!replaced by a more modern algorith supporting n number of sides
		RETURN
		CASE UPPER(Direction)

		OF 'T'
			DO Draw_Top_Triangle_ROUTINE
		OF 'D'
			DO Draw_Down_Triangle_ROUTINE
		OF 'L'
			DO Draw_Left_Triangle_ROUTINE
		OF 'R'
			DO Draw_Right_Triangle_ROUTINE
		ELSE
			DO Draw_Top_Triangle_ROUTINE
		END !CASE
	
	
		RETURN
	
	!ROUTINES
	
Draw_Top_Triangle_ROUTINE   ROUTINE

	Radius# = InnerCircle / 2
	SideA = ROUND(((Radius# * SQRT(3)) * 2),1)
	TriangleHeight = ROUND(((SQRT(3) / 2) * SideA),1)
	SideB = SideA
	SideC = SideA
	
	
	PAX = CenterX - (SideA / 2)
	PAY = CenterY + Radius#
	PBX = CenterX + (SideA / 2)
	PBY = PAY
	PCX = CenterX
	PCY = PAY - TriangleHeight

!	GDI.PenColor(COLOR:Teal)
	
	SELF.LN(PAX,PAY,PBX,PBY)
	SELF.LN(PBX,PBY,PCX,PCY)
	SELF.LN(PCX,PCY,PAX,PAY)
	

	
	EXIT
	
	
Draw_Down_Triangle_ROUTINE  ROUTINE
	
	EXIT
	
Draw_Left_Triangle_ROUTINE  ROUTINE
	
	EXIT
	
Draw_Right_Triangle_ROUTINE ROUTINE
	
	EXIT
	
!ce_BufferedGraphics.Ln     PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY)
!
!ptOldPoint              GROUP,PRE(PNT)
!x                           SIGNED
!y                           SIGNED
!						END
!
!
!	CODE
!	
!		SelectObject(SELF.controlDC,NULL_PEN)		
!		SA_MoveToEx(SELF.controlDC,StartX,StartY,ptOldPoint)
!		SelectObject(SELF.controlDC,DC_PEN)
!		SA_LineTo(SELF.controlDC,EndX,EndY)
!!	
!!	SelectObject(SELF.controlHWnd,NULL_PEN)
!!	SA_MoveToEx(SELF.controlHWnd,StartX,StartY,ptOldPoint)
!!	SelectObject(SELF.controlHWnd,DC_PEN)
!!	SA_LineTo(SELF.controlHWnd,EndX,EndY)
!
!		RETURN


ce_BufferedGraphics.Ellip   PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY, ULONG OutlineColor, ULONG FillColor)

	CODE
	
		

		SelectObject(SELF.memoryDC,GetStockObject(GDI_NULL_BRUSH))
		
		IF FillColor => 10
			ReturnedVal# = SetDCBrushColor(SELF.memoryDC,FillColor)
			SelectObject(SELF.memoryDC,GetStockObject(GDI_DC_BRUSH))
		END
		
		
		SelectObject(SELF.memoryDC,GetStockObject(GDI_NULL_PEN))
		IF OutlineColor => 10
			SetDCPenColor(SELF.memoryDC,OutlineColor)
			SelectObject(SELF.memoryDC,GetStockObject(GDI_DC_PEN))
		END
		
		GDI_Ellipse(SELF.memoryDC,StartX,StartY,EndX,EndY)
	
	
		RETURN	
        
		
ce_BufferedGraphics.DrawGradient    PROCEDURE(BYTE pFillOrder, LONG pStartColour, LONG pEndColour,<LONG StartX>,<LONG StartY>,<LONG EndX>,<LONG EndY>)                   ! Declare Procedure
originalPropPixels                      BYTE
	CODE
		
		SELF.StartColour_Clarion = pStartColour
		SELF.EndColour_Clarion = pEndColour
		SELF.FillOrder = pFillOrder

		SELF.RectVertex[1].RVX         = StartX
		SELF.RectVertex[1].RVY         = StartY
		SELF.RectVertex[1].RVRed       = SELF.StartColour.Red * 255
		SELF.RectVertex[1].RVGreen     = SELF.StartColour.Green * 255
		SELF.RectVertex[1].RVBlue      = SELF.StartColour.Blue * 255
		SELF.RectVertex[1].RVAlpha     = 0

		
		IF EndX = 0
			SELF.RectVertex[2].RVX         = SELF.sourceWidth
		ELSE
			SELF.RectVertex[2].RVX         = EndX
		END
		
		IF EndY = 0	
			SELF.RectVertex[2].RVY         = SELF.sourceHeight
		ELSE
			SELF.RectVertex[2].RVY         = EndY
		END
		
		SELF.RectVertex[2].RVRed       = SELF.EndColour.Red * 255
		SELF.RectVertex[2].RVGreen     = SELF.EndColour.Green * 255
		SELF.RectVertex[2].RVBlue      = SELF.EndColour.Blue * 255
		SELF.RectVertex[2].RVAlpha     = 0


		CASE SELF.FillOrder
		OF GRADIENT_FILL_RECT_H
			SELF.GradientRect.GRUpperLeft  = 0
			SELF.GradientRect.GRLowerRight = 1
		OF GRADIENT_FILL_RECT_V
			SELF.GradientRect.GRUpperLeft  = 1
			SELF.GradientRect.GRLowerRight = 0
		END

		GradientFill(SELF.memoryDC, Address(SELF.RectVertex), 2, Address(SELF.GradientRect), 1, SELF.FillOrder)
		

		
ce_BufferedGraphics.DrawDoubleGradient      PROCEDURE(BYTE pFillOrder, LONG pStartColour, LONG pEndColour)                   ! Declare Procedure
originalPropPixels                              BYTE
	CODE
		
		SELF.StartColour_Clarion = pStartColour
		SELF.EndColour_Clarion = pEndColour
		SELF.FillOrder = pFillOrder
		

  !SELF.DCHandle = GetDC(0{PROP:ClientHandle})
		CASE SELF.FillOrder 
		
		OF GRADIENT_FILL_RECT_V

			SELF.RectVertex[1].RVX         = 0
			SELF.RectVertex[1].RVY         = 0
			SELF.RectVertex[1].RVRed       = SELF.StartColour.Red * 255
			SELF.RectVertex[1].RVGreen     = SELF.StartColour.Green * 255
			SELF.RectVertex[1].RVBlue      = SELF.StartColour.Blue * 255
			SELF.RectVertex[1].RVAlpha     = 0

			SELF.RectVertex[2].RVX         = SELF.sourceWidth
			SELF.RectVertex[2].RVY         = SELF.sourceHeight / 2
			SELF.RectVertex[2].RVRed       = SELF.EndColour.Red * 255
			SELF.RectVertex[2].RVGreen     = SELF.EndColour.Green * 255
			SELF.RectVertex[2].RVBlue      = SELF.EndColour.Blue * 255
			SELF.RectVertex[2].RVAlpha     = 0
			
		OF GRADIENT_FILL_RECT_H
			
			SELF.RectVertex[1].RVX         = 0
			SELF.RectVertex[1].RVY         = 0
			SELF.RectVertex[1].RVRed       = SELF.StartColour.Red * 255
			SELF.RectVertex[1].RVGreen     = SELF.StartColour.Green * 255
			SELF.RectVertex[1].RVBlue      = SELF.StartColour.Blue * 255
			SELF.RectVertex[1].RVAlpha     = 0

			SELF.RectVertex[2].RVX         = SELF.sourceWidth / 2
			SELF.RectVertex[2].RVY         = SELF.sourceHeight
			SELF.RectVertex[2].RVRed       = SELF.EndColour.Red * 255
			SELF.RectVertex[2].RVGreen     = SELF.EndColour.Green * 255
			SELF.RectVertex[2].RVBlue      = SELF.EndColour.Blue * 255
			SELF.RectVertex[2].RVAlpha     = 0
			
			
		END
		

		CASE SELF.FillOrder
		OF GRADIENT_FILL_RECT_H
			SELF.GradientRect.GRUpperLeft  = 0
			SELF.GradientRect.GRLowerRight = 1
		OF GRADIENT_FILL_RECT_V
			SELF.GradientRect.GRUpperLeft  = 1
			SELF.GradientRect.GRLowerRight = 0
		END

		GradientFill(SELF.memoryDC, Address(SELF.RectVertex), 2, Address(SELF.GradientRect), 1, SELF.FillOrder)
		!ReturnedVal# = ReleaseDC(SELF.controlDC, SELF.controlDC)
		!DeleteDC(SELF.DCHandle)	
		
		CASE SELF.FillOrder 
		
		OF GRADIENT_FILL_RECT_V
			
			SELF.RectVertex[1].RVX         = 0
			SELF.RectVertex[1].RVY         = SELF.sourceHeight / 2
			SELF.RectVertex[1].RVRed       = SELF.EndColour.Red * 255
			SELF.RectVertex[1].RVGreen     = SELF.EndColour.Green * 255
			SELF.RectVertex[1].RVBlue      = SELF.EndColour.Blue * 255
			SELF.RectVertex[1].RVAlpha     = 0

			SELF.RectVertex[2].RVX         = SELF.sourceWidth
			SELF.RectVertex[2].RVY         = SELF.sourceHeight
			SELF.RectVertex[2].RVRed       = SELF.StartColour.Red * 255
			SELF.RectVertex[2].RVGreen     = SELF.StartColour.Green * 255
			SELF.RectVertex[2].RVBlue      = SELF.StartColour.Blue * 255
			SELF.RectVertex[2].RVAlpha     = 0
			
		OF GRADIENT_FILL_RECT_H
			
			SELF.RectVertex[1].RVX         = SELF.sourceWidth / 2
			SELF.RectVertex[1].RVY         = 0
			SELF.RectVertex[1].RVRed       = SELF.EndColour.Red * 255
			SELF.RectVertex[1].RVGreen     = SELF.EndColour.Green * 255
			SELF.RectVertex[1].RVBlue      = SELF.EndColour.Blue * 255
			SELF.RectVertex[1].RVAlpha     = 0

			SELF.RectVertex[2].RVX         = SELF.sourceWidth
			SELF.RectVertex[2].RVY         = SELF.sourceHeight
			SELF.RectVertex[2].RVRed       = SELF.StartColour.Red * 255
			SELF.RectVertex[2].RVGreen     = SELF.StartColour.Green * 255
			SELF.RectVertex[2].RVBlue      = SELF.StartColour.Blue * 255
			SELF.RectVertex[2].RVAlpha     = 0
			
			
		END
		

		CASE SELF.FillOrder
		OF GRADIENT_FILL_RECT_H
			SELF.GradientRect.GRUpperLeft  = 0
			SELF.GradientRect.GRLowerRight = 1
		OF GRADIENT_FILL_RECT_V
			SELF.GradientRect.GRUpperLeft  = 1
			SELF.GradientRect.GRLowerRight = 0
		END

		GradientFill(SELF.memoryDC, Address(SELF.RectVertex), 2, Address(SELF.GradientRect), 1, SELF.FillOrder)
