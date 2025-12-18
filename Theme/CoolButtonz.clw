					MEMBER()

					MAP
						MODULE('win32')
							GetSysColor(signed nIndex),long,pascal,NAME('GetSysColor')
						END

						INCLUDE('CWUTIL.INC'),ONCE
					END

	INCLUDE('CoolButtonz.inc'),ONCE

CoolButtonz.Construct       PROCEDURE()
	CODE

		SELF.ButtonQ &= New(ButtonQ_Type)
		SELF.imageMarginLeft     = 6
		SELF.imageMarginTop      = 2
		SELF.imageWidth          = 22
		SELF.imageHeight         = 22
		SELF.promptMarginLeft    = 6
		SELF.promptMarginTop     = 4
		SELF.DefaultColor 		= 00937032h
        



CoolButtonz.Destruct        PROCEDURE()
	CODE

		FREE(SELF.ButtonQ)
		DISPOSE(SELF.ButtonQ)

CoolButtonz.Init    PROCEDURE(WindowManager pWM, <STRING pFont>)
	CODE

		pWM.AddItem(SELF.WindowComponent)
		IF Omitted(pFont) = FALSE
			SELF.fontName = pFont
		END

		0{PROP:Buffer} = 1 					! More memory consumption but worth it...


CoolButtonz.SetButtonProperties     PROCEDURE(SIGNED pButtonFEQ)

	CODE

		SELF.DefaultColor = pButtonFEQ{PROP:COLOR}
		SELF.ButtonQ.imageFEQ{PROP:Disable} 		= pButtonFEQ{PROP:Disable}
		SELF.ButtonQ.promptFEQ{PROP:Disable} 	= pButtonFEQ{PROP:Disable}
		SELF.ButtonQ.regionFEQ{PROP:Hide} 	= pButtonFEQ{PROP:Disable}
		SELF.ButtonColor = pButtonFEQ{PROP:COLOR}
	
CoolButtonz.AddButtonMimic  PROCEDURE(SIGNED pButtonFEQ, LONG pFillNormal, BYTE pActionFactor=77, BYTE Enable2in1)
ParentFeq                       SIGNED
	CODE

		SELF.ButtonQ.ButtonFEQ  = pButtonFEQ ! Original Button FEQ		
		SELF.ButtonQ.actionFactor = pActionFactor

		ParentFeq = SELF.ButtonQ.ButtonFEQ{PROP:Parent}

		IF pFillNormal < 255 ! If an invalid color is passed
			SELF.ButtonQ.fillNormal = SELF.DefaultColor	
		ELSE
			SELF.ButtonQ.fillNormal = pFillNormal
		END
	
  	! Add an image as the Button BG

        !!SELF.ButtonQ.BTNimageFEQ = Create(0, CREATE:Image, ParentFeq)

  	! Make a border
!
		SELF.ButtonQ.BTNBorderFEQ = Create(0, CREATE:Box, ParentFeq)
		SELF.ButtonQ.BTNBorderFEQ{PROP:FillColor} = SELF.MixColors(SELF.ButtonColor, COLOR:White, 50)
		SELF.ButtonQ.BTNBorderFEQ{PROP:Fill} = SELF.ButtonColor
		SELF.ButtonQ.BTNBorderFEQ{PROP:LineWidth} = 1
		SELF.ButtonQ.BTNBorderFEQ{PROP:Round} = TRUE
		SELF.ButtonQ.BTNBorderFEQ{PROP:Hide} = TRUE
        

  	! Add an icon

		SELF.ButtonQ.imageFEQ = Create(0, CREATE:Image, ParentFeq)

  	! Original Text from the button itself
		SELF.ButtonQ.promptFEQ = Create(0, CREATE:Prompt, ParentFeq)
		SELF.ButtonQ.promptFEQ{PROP:FontColor} = 00FFF8F8h
		SELF.ButtonQ.promptFEQ{PROP:Font} = 'Arial Narrow'
		SELF.ButtonQ.promptFEQ{PROP:FontSize} = 9
		SELF.ButtonQ.promptFEQ{PROP:FontStyle}   = FONT:bold
		SELF.ButtonQ.promptFEQ{PROP:Trn} = TRUE
		IF SELF.fontName
			SELF.ButtonQ.promptFEQ{PROP:FontName} = SELF.fontName
		END

  	! A Region with IMM to receive the event...

		SELF.ButtonQ.regionFEQ = Create(0, CREATE:Region, ParentFeq)
		SELF.ButtonQ.regionFEQ{PROP:IMM} = TRUE

	!Filename of the original Icon?
		SELF.ButtonQ.IconText = SELF.ButtonQ.ButtonFEQ{PROP:Icon}


		! We are algmost ready... Let's add the info to the Queue

		Add(SELF.ButtonQ)
		SELF.RebuildButtons(pButtonFEQ, Enable2in1)
		SELF.ResizeButtons(pButtonFEQ, Enable2in1)


CoolButtonz.IsHidden        PROCEDURE()

HiddenProp                      BYTE
DisabledProp                    BYTE

	CODE
		

		
		HiddenProp = SELF.ButtonQ.ButtonFEQ{PROP:Hide}
		DisabledProp = SELF.ButtonQ.ButtonFEQ{PROP:Disable}
		
		SELF.ButtonQ.BTNBorderFEQ{PROP:Disable} 	= DisabledProp
		SELF.ButtonQ.imageFEQ{PROP:Disable} 	= DisabledProp
		SELF.ButtonQ.promptFEQ{PROP:Disable} 	= DisabledProp
		SELF.ButtonQ.regionFEQ{PROP:Disable} 	= DisabledProp
		
		! If the button is hidden or disabled, we will inherit the property
		
		SELF.ButtonQ.BTNBorderFEQ{PROP:Hide} = HiddenProp
		SELF.ButtonQ.imageFEQ{PROP:Hide} = HiddenProp
		SELF.ButtonQ.promptFEQ{PROP:Hide} = HiddenProp
		SELF.ButtonQ.regionFEQ{PROP:Hide} = HiddenProp
		

		
		
CoolButtonz.RefreshButtonz  PROCEDURE()

	CODE
		!i# = 1
		LOOP i# = 1 TO RECORDS(SELF.ButtonQ) BY 1
			Get(SELF.ButtonQ,i#)
			IF ErrorCode()
				RETURN
			END
			SELF.IsHidden()
		END !LOOP
		
		RETURN


CoolButtonz.RebuildButtons  PROCEDURE(SIGNED pButtonFEQ,BYTE Enable2in1)
SavePixels                      BYTE

	CODE

		SavePixels = 0{PROP:Pixels}

		SELF.ButtonQ.ButtonFEQ = pButtonFEQ
		Get(SELF.ButtonQ, SELF.ButtonQ.ButtonFEQ)
		IF ErrorCode()
			RETURN
		END

		SELF.ButtonQ.BTNBorderFEQ{PROP:FillColor} = SELF.MixColors(SELF.buttonQ.fillNormal, COLOR:White, 15)
		SELF.ButtonQ.BTNBorderFEQ{PROP:Fill} = SELF.MixColors(SELF.buttonQ.fillNormal, COLOR:Black, 57)
        
		SELF.ButtonQ.BTNBorderFEQ{PROP:LineWidth} = 1
		SELF.ButtonQ.BTNBorderFEQ{PROP:Hide} = FALSE


		SELF.ButtonQ.promptFEQ{PROP:Text} = SELF.ButtonQ.ButtonFEQ{PROP:Text}

		! Icon
		
		IF pButtonFEQ{PROP:Icon} <> ''
			SELF.ButtonQ.imageFEQ{PROP:Text} = SELF.ButtonQ.ButtonFEQ{PROP:Icon}	
		ELSE
			SELF.ButtonQ.imageFEQ{PROP:Text} = 'morpho.png'
		END
	


		SELF.IsHidden()

		0{PROP:Pixels} = SavePixels


CoolButtonz.ResizeButtons   PROCEDURE(SIGNED pButtonFEQ,BYTE Enable2in1)
pos                             GROUP
XPos                                SIGNED           !Horizontal coordinate
YPos                                SIGNED           !Vertical coordinate
Width                               UNSIGNED         !Width
Height                              UNSIGNED         !Height
LEDHeight                           UNSIGNED
								END
SavePixels                      BYTE
	CODE
		SavePixels = 0{PROP:Pixels}
		0{PROP:Pixels} = TRUE
		pos.LEDHeight = 0 ! The small colored underline of the button

		SELF.ButtonQ.ButtonFEQ = pButtonFEQ
		Get(SELF.ButtonQ, SELF.ButtonQ.ButtonFEQ)
		IF ErrorCode()
			RETURN
		END
	
		GetPosition(pButtonFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height) ! Where is the original button?

		IF Enable2in1 = FALSE ! Is it a Laptop or Slate?
            !SetPosition(SELF.ButtonQ.BTNimageFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
			SetPosition(SELF.ButtonQ.BTNBorderFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		!SetPosition(SELF.ButtonQ.LedFEQ, pos.XPos, pos.YPos + pos.Height - pos.LEDHeight + 1, pos.Width, pos.LEDHeight)
			SetPosition(SELF.ButtonQ.imageFEQ, pos.XPos+SELF.imageMarginLeft, pos.YPos + ((pos.Height - SELF.ButtonQ.imageFEQ{PROP:Height}) / 2) , SELF.imageWidth, SELF.imageHeight)
			SELF.ButtonQ.imageFEQ{PROP:NoHeight} = TRUE
			SELF.ButtonQ.imageFEQ{PROP:NoWidth} = TRUE
		
		
		!SELF.ButtonQ.imageFEQ{PROP:Xpos} = !SELF.ButtonQ.LedFEQ{PROP:Xpos} + ((!SELF.ButtonQ.LedFEQ{PROP:Width} - SELF.ButtonQ.imageFEQ{PROP:Width}) / 2 )
			SetPosition(SELF.ButtonQ.promptFEQ, SELF.ButtonQ.imageFEQ{PROP:Xpos} + SELF.ButtonQ.imageFEQ{PROP:Width} + SELF.imageMarginLeft, SELF.ButtonQ.imageFEQ{PROP:Ypos} + (SELF.ButtonQ.imageFEQ{PROP:Height} / 2) - (SELF.ButtonQ.promptFEQ{PROP:Height} / 2))
			SetPosition(SELF.ButtonQ.regionFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		ELSE
            !SetPosition(SELF.ButtonQ.BTNimageFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
			SetPosition(SELF.ButtonQ.BTNBorderFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		!SetPosition(SELF.ButtonQ.LedFEQ, pos.XPos, pos.YPos + pos.Height - pos.LEDHeight + 1, pos.Width, pos.LEDHeight)
		!SELF.ButtonQ.LedFEQ{PROP:Round} = FALSE
			SetPosition(SELF.ButtonQ.imageFEQ, pos.XPos+SELF.imageMarginLeft, pos.YPos+SELF.imageMarginTop, SELF.imageWidth, SELF.imageHeight)
			SELF.ButtonQ.imageFEQ{PROP:NoHeight} = TRUE
			SELF.ButtonQ.imageFEQ{PROP:NoWidth} = TRUE
			SetPosition(SELF.ButtonQ.promptFEQ, pos.XPos+SELF.promptMarginLeft, SELF.ButtonQ.imageFEQ{PROP:Ypos} + SELF.ButtonQ.imageFEQ{PROP:Height} + SELF.promptMarginTop )
			SetPosition(SELF.ButtonQ.regionFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		END

	! Let's "hide" the button... No, not really, but we will send it away so the end user cannot see it or press it...

		pButtonFEQ{PROP:Height} = 0
		pButtonFEQ{PROP:Width} = 0
		pButtonFEQ{PROP:Xpos} = -10000
		pButtonFEQ{PROP:Ypos} = -10000

		SELF.IsHidden()

		! Restore the Pixels Property of the Window

		0{PROP:Pixels} = SavePixels

CoolButtonz.Buttons2in1     PROCEDURE(SIGNED pButtonFEQ,BYTE Enable2in1)
pos                             GROUP
XPos                                SIGNED           !Horizontal coordinate
YPos                                SIGNED           !Vertical coordinate
Width                               UNSIGNED         !Width
Height                              UNSIGNED         !Height
LEDHeight                           UNSIGNED
								END
SavePixels                      BYTE
	CODE
		SavePixels = 0{PROP:Pixels}
		0{PROP:Pixels} = TRUE
		pos.LEDHeight = 0 ! The small colored underline of the button

		SELF.ButtonQ.ButtonFEQ = pButtonFEQ
		Get(SELF.ButtonQ, SELF.ButtonQ.ButtonFEQ)
		IF ErrorCode()
			RETURN
		END
	
        !GetPosition(SELF.ButtonQ.BTNimageFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height) ! Where is the original button?

		IF Enable2in1 = FALSE ! Is it a Laptop or Slate?
            !SetPosition(SELF.ButtonQ.BTNimageFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
			SetPosition(SELF.ButtonQ.BTNBorderFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		!SetPosition(SELF.ButtonQ.LedFEQ, pos.XPos, pos.YPos + pos.Height - pos.LEDHeight + 1, pos.Width, pos.LEDHeight)
			SetPosition(SELF.ButtonQ.imageFEQ, pos.XPos+SELF.imageMarginLeft, pos.YPos + ((pos.Height - SELF.ButtonQ.imageFEQ{PROP:Height}) / 2) , SELF.imageWidth, SELF.imageHeight)
			SELF.ButtonQ.imageFEQ{PROP:NoHeight} = TRUE
			SELF.ButtonQ.imageFEQ{PROP:NoWidth} = TRUE
		
		!SELF.ButtonQ.imageFEQ{PROP:Xpos} = !SELF.ButtonQ.LedFEQ{PROP:Xpos} + ((!SELF.ButtonQ.LedFEQ{PROP:Width} - SELF.ButtonQ.imageFEQ{PROP:Width}) / 2 )
		!SetPosition(SELF.ButtonQ.promptFEQ, pos.XPos + (!SELF.ButtonQ.BTNimageFEQ{PROP:Width} / 2) - (SELF.ButtonQ.promptFEQ{PROP:Width} / 2), SELF.ButtonQ.imageFEQ{PROP:Ypos} + SELF.ButtonQ.imageFEQ{PROP:Height} + SELF.promptMarginTop )
			SetPosition(SELF.ButtonQ.promptFEQ, SELF.ButtonQ.imageFEQ{PROP:Xpos} + SELF.ButtonQ.imageFEQ{PROP:Width} + SELF.imageMarginLeft, SELF.ButtonQ.imageFEQ{PROP:Ypos} + (SELF.ButtonQ.imageFEQ{PROP:Height} / 2) - (SELF.ButtonQ.promptFEQ{PROP:Height} / 2))
			SetPosition(SELF.ButtonQ.regionFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		ELSE
            !SetPosition(SELF.ButtonQ.BTNimageFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
			SetPosition(SELF.ButtonQ.BTNBorderFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		!SetPosition(SELF.ButtonQ.LedFEQ, pos.XPos, pos.YPos + pos.Height - pos.LEDHeight + 1, pos.Width, pos.LEDHeight)
		!SELF.ButtonQ.LedFEQ{PROP:Round} = FALSE
			SetPosition(SELF.ButtonQ.imageFEQ, pos.XPos+SELF.imageMarginLeft, pos.YPos+SELF.imageMarginTop, SELF.imageWidth, SELF.imageHeight)
			SELF.ButtonQ.imageFEQ{PROP:NoHeight} = TRUE
			SELF.ButtonQ.imageFEQ{PROP:NoWidth} = TRUE
			SetPosition(SELF.ButtonQ.promptFEQ, pos.XPos+SELF.promptMarginLeft, SELF.ButtonQ.imageFEQ{PROP:Ypos} + SELF.ButtonQ.imageFEQ{PROP:Height} + SELF.promptMarginTop )
			SetPosition(SELF.ButtonQ.regionFEQ, pos.XPos, pos.YPos, pos.Width, pos.Height)
		END

	! Restore the Pixels Property of the Window
		

			
		0{PROP:Pixels} = SavePixels

CoolButtonz.RefreshTile     PROCEDURE(SIGNED pButtonFEQ, BYTE Enable2in1)

	CODE

		SELF.ButtonQ.ButtonFEQ = pButtonFEQ
		Get(SELF.ButtonQ, SELF.ButtonQ.ButtonFEQ)
		IF NOT ERRORCODE()
			SELF.RebuildButtons(pButtonFEQ, Enable2in1)
		ELSE
			RETURN
		END


CoolButtonz.WindowComponent.TakeEvent       PROCEDURE() ! ,BYTE ! Declare Procedure
RetVal                                          BYTE
	CODE
		RetVal = PARENT.WindowComponent.TakeEvent()
		IF 0{Prop:AcceptAll} = TRUE
			RETURN RetVal
		END

		IF FIELD()

			SELF.ButtonQ.regionFEQ = Field()
			Get(SELF.ButtonQ, SELF.ButtonQ.regionFEQ)

			IF ErrorCode() = FALSE

				CASE EVENT()
				
				OF EVENT:MouseDown
					
				!SELF.ButtonQ.LedFEQ{PROP:Fill} = MixColors(COLOR:Black, SELF.ButtonQ.fillNormal, SELF.ButtonQ.actionFactor)

				OF EVENT:MouseUp
				!SELF.ButtonQ.LedFEQ{PROP:Fill} = SELF.ButtonQ.fillNormal
					IF SELF.ButtonQ.ButtonFEQ{PROP:Disable} = FALSE
						POST(Event:Accepted, SELF.ButtonQ.ButtonFEQ)
						SELECT(SELF.ButtonQ.ButtonFEQ)
!						SELF.ButtonQ.BTNimageFEQ{PROP:Text} = 'w50.png'
					END
					

				OF EVENT:MouseIn



					SELF.ButtonQ.BTNBorderFEQ{PROP:FillColor} = SELF.MixColors(SELF.buttonQ.fillNormal, COLOR:White, 20)
					SELF.ButtonQ.BTNBorderFEQ{PROP:Fill} = SELF.MixColors(SELF.buttonQ.fillNormal, COLOR:Black, 37)
					SELF.ButtonQ.BTNBorderFEQ{PROP:LineWidth} = 1        
					SELF.ButtonQ.promptFEQ{PROP:FontColor} = 00FFFFFFh	
					SELF.ButtonQ.imageFEQ{PROP:Text} = 'Hot_' & SELF.ButtonQ.IconText
	
					


				OF EVENT:MouseOut

					SELF.ButtonQ.promptFEQ{PROP:FontColor} = 00CCCCCCh
					SELF.ButtonQ.imageFEQ{PROP:Text} = SELF.ButtonQ.IconText
					SELF.ButtonQ.BTNBorderFEQ{PROP:FillColor} = SELF.MixColors(SELF.buttonQ.fillNormal, COLOR:White, 15)
					SELF.ButtonQ.BTNBorderFEQ{PROP:Fill} = SELF.MixColors(SELF.buttonQ.fillNormal, COLOR:Black, 57)
					!END
					
				END
			END
		END

		RETURN RetVal

!-----------------------------------------------------------------------------!
! MixColors
! Mix color1 and color2 using the percentage of mix.
! If pColor1 is white the pColor2 will be the same pColor2 color but bright
! If pColor1 is black the pColor2 will be the same pColor2 color but darker
!-----------------------------------------------------------------------------!

CoolButtonz.MixColors       PROCEDURE (LONG pColor1, LONG pColor2, BYTE pPercentageMix)

CWColor1                        LONG,AUTO
RGBT1                           GROUP,OVER(CWColor1)
R                                   BYTE
G                                   BYTE
B                                   BYTE
DitherMode                          BYTE
								END
CWColor2                        LONG,AUTO
RGBT2                           GROUP,OVER(CWColor2)
R                                   BYTE
G                                   BYTE
B                                   BYTE
DitherMode                          BYTE
								END
RetCWColor                      LONG
RetRGBT                         GROUP,OVER(RetCWColor)
R                                   BYTE
G                                   BYTE
B                                   BYTE
DitherMode                          BYTE
								END

DitherColors                    LONG,AUTO

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

		RETURN BOR(RetCWColor, DitherColors)