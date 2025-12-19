#TEMPLATE(SuperTiles,'Super Buttonz'),FAMILY('ABC'),FAMILY('CW20')
#!Copyright SoftVelocity
#!
#EXTENSION(SuperTiles,'Super Buttonz Global Template'),APPLICATION,LAST
#!
#SHEET
#TAB('Super Buttonz Global Template B0.9')
#!#BOXED('')
#DISPLAY('This template will allow to create Buttonz optimized for Touch Screens')
#DISPLAY('In Clarion 10.x.')
#!#ENDBOXED
#ENDTAB
#ENDSHEET
#! ----------------------------------------------------------------
#AT(%AfterGlobalIncludes)
  INCLUDE('CoolButtonz.inc'),ONCE
#ENDAT
#! ----------------------------------------------------------------
#AT(%ProgramProcedures)
#ENDAT
#!----------------------------------------------------------------
#EXTENSION(SuperTilesCreator,'Create Cool Buttons'),PROCEDURE, LAST
#DISPLAY('Converts buttons into Cool Buttons optimized for touch screens')
#PROMPT('Theme should be EVENT:Accepted aware',CHECK),%EventAcceptedAware,at(10),DEFAULT(%True)
#PROMPT('Theme should be EVENT:Selected aware',CHECK),%EventSelectedAware,at(11),DEFAULT(%False)
#BOXED('')
#PROMPT('Transform',OPTION),%WhatToTransform,REQ,DEFAULT('All Buttons')
#PROMPT('All Buttons',RADIO)
#PROMPT('Selected Buttons',RADIO)
#BUTTON ('Buttons'), MULTI(%TilesControls, %BTNControl), INLINE
#PROMPT('Buttons:',CONTROL),%BTNControl
#ENDBUTTON
#ENDBOXED
#! ----------------------------------------------------------------
#ATSTART
#DECLARE(%IMGControlNumber)
#DECLARE(%IMGVar)
#ENDAT
#! ----------------------------------------------------------------
#AT(%WindowManagerMethodCodeSection,'Init','(),BYTE'),PRIORITY(9000)
	Buttonz.Init(SELF)
	DO InitButtonz_ROUTINE
#ENDAT
#! ----------------------------------------------------------------
#AT(%WindowManagerMethodCodeSection,'TakeEvent','(),BYTE'),PRIORITY(6300)
	!Something was triggered on the screen, Either EVENT:Accepted or EVENT:Selected
	CASE EVENT()
#IF(%EventAcceptedAware)	
	OF EVENT:Accepted
		DO RebuildButtonz_ROUTINE
#ENDIF
#IF(%EventSelectedAware)	
	OF EVENT:Selected
		DO RebuildButtonz_ROUTINE
#ENDIF
	END
#ENDAT
#! ----------------------------------------------------------------
#AT (%DataSection)
Buttonz CoolButtonz
#ENDAT
#! ----------------------------------------------------------------
#AT(%ResizerMethodCodeSection,, 'WindowResizeEnd',),PRIORITY(7500)
	DO ResizeButtons_ROUTINE
#ENDAT
#! ----------------------------------------------------------------
#AT(%ProcedureRoutines)
ResizeButtons_ROUTINE ROUTINE
#CASE(%WhatToTransform)
#OF('All Buttons')
	!IF NOT (WebServer.IsEnabled())
	LOOP ThisBTN#  = FirstField() TO LastField()
  		IF ThisBTN#{Prop:Type} = Create:Button
    		Buttonz.ResizeButtons(ThisBTN#,GLO:2in1)
  		END
	END !LOOP
	!END
#OF('Selected Buttons')
#FOR(%TilesControls)
#IF(%BTNControl)
	    	Buttonz.ResizeButtons(%BTNControl,GLO:2in1)
#ENDIF
#ENDFOR	    	
#ENDCASE
InitButtonz_ROUTINE    ROUTINE                !Pass buttons to the Cool Buttons Class
#CASE(%WhatToTransform)
#OF('All Buttons')
	!IF NOT (WebServer.IsEnabled())
	LOOP ThisBTN#  = FirstField() TO LastField()
  		IF ThisBTN#{Prop:Type} = Create:Button
    		Buttonz.AddButtonMimic(ThisBTN#,ThisBTN#{PROP:Color},,GLO:2in1)
  		END
	END !LOOP
	!END
#OF('Selected Buttons')
#FOR(%TilesControls)
#IF(%BTNControl)
	    	Buttonz.AddButtonMimic(%BTNControl,%BTNControl{PROP:Color},,GLO:2in1)
#ENDIF
#ENDFOR	    	
#ENDCASE
RebuildButtonz_ROUTINE     ROUTINE                !Re-draw the buttons if the window changed
#CASE(%WhatToTransform)
#OF('All Buttons')
	!IF NOT (WebServer.IsEnabled())
	LOOP ThisBTN#  = FirstField() TO LastField()
  		IF ThisBTN#{Prop:Type} = Create:Button
    		Buttonz.RebuildButtons(ThisBTN#,GLO:2in1)
  		END
	END !LOOP
	!END
#OF('Selected Buttons')	
#FOR(%TilesControls)
#IF(%BTNControl)
		Buttonz.RebuildButtons(%BTNControl,GLO:2in1)
#ENDIF
#ENDFOR
#ENDCASE
TilesPosition_ROUTINE     ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode, Legacy, it should dissapear										
	DO Enable2in1Buttons_ROUTINE

Enable2in1Buttons_ROUTINE ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode
#CASE(%WhatToTransform)
#OF('All Buttons')
	!IF NOT (WebServer.IsEnabled())
	LOOP ThisBTN#  = FirstField() TO LastField()
  		IF ThisBTN#{Prop:Type} = Create:Button
    		Buttonz.Buttons2in1(ThisBTN#,GLO:2in1)
  		END
	END !LOOP
	!END
#OF('Selected Buttons')	
#FOR(%TilesControls)
#IF(%BTNControl)
		Buttonz.Buttons2in1(%BTNControl,GLO:2in1)
#ENDIF
#ENDFOR
#ENDCASE
#ENDAT	