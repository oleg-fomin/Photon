#TEMPLATE(SuperEntries,'Super Entries'),FAMILY('ABC'),FAMILY('CW20')
#!Copyright SoftVelocity
#!
#EXTENSION(SuperEntries,'Super Entries Global Template'),APPLICATION,LAST
#!
#SHEET
#TAB('Super Entries Global Template B0.9')
#!#BOXED('')
#DISPLAY('This template will allow to add cool themes to Entry Fields')
#DISPLAY('In Clarion 10.x.')
#!#ENDBOXED
#ENDTAB
#ENDSHEET
#! ----------------------------------------------------------------
#AT(%AfterGlobalIncludes)
  INCLUDE('EntryFields.inc'),ONCE
#ENDAT
#! ----------------------------------------------------------------
#AT(%ProgramProcedures)
#ENDAT
#!----------------------------------------------------------------
#EXTENSION(SuperEntriesCreator,'Create Cool Looking Entries'),PROCEDURE, LAST
#DISPLAY('Converts normal entries into cool entries')
#PROMPT('Theme should be EVENT:Accepted aware',CHECK),%EventAcceptedAware,at(10),DEFAULT(%True)
#PROMPT('Theme should be EVENT:Selected aware',CHECK),%EventSelectedAware,at(11),DEFAULT(%False)
#BOXED('')
#PROMPT('Transform',OPTION),%WhatToTransform,REQ,DEFAULT('All Entry Fields')
#PROMPT('All Entry Fields',RADIO)
#PROMPT('Selected Fields',RADIO)
#BUTTON ('Entry Fields'), MULTI(%EntresControls, %IMGControl), INLINE
#PROMPT('Entry Field:',CONTROL),%IMGControl
#ENDBUTTON
#ENDBOXED
#! ----------------------------------------------------------------
#ATSTART
#DECLARE(%IMGControlNumber)
#DECLARE(%IMGVar)
#ENDAT
#! ----------------------------------------------------------------
#AT(%WindowManagerMethodCodeSection,'Init','(),BYTE'),PRIORITY(9000)
	CoolEntryFields.Init(SELF)
	DO InitEntries_ROUTINE
#ENDAT
#! ----------------------------------------------------------------
#AT(%WindowManagerMethodCodeSection,'TakeEvent','(),BYTE'),PRIORITY(6300)
	!Something was triggered on the screen, Either EVENT:Accepted or EVENT:Selected
	CASE EVENT()
#IF(%EventAcceptedAware)	
	OF EVENT:Accepted
		DO EntriesPosition_ROUTINE
#ENDIF
#IF(%EventSelectedAware)	
	OF EVENT:Selected
		DO EntriesPosition_ROUTINE
#ENDIF
	END
#ENDAT
#! ----------------------------------------------------------------
#AT (%DataSection)
CoolEntryFields EntryFields
#ENDAT
#! ----------------------------------------------------------------
#AT(%ResizerMethodCodeSection,, 'WindowResizeEnd',),PRIORITY(7500)
	DO EntriesPosition_ROUTINE
#ENDAT
#! ----------------------------------------------------------------
#AT(%ProcedureRoutines)
InitEntries_ROUTINE    ROUTINE                !Pass Entry Fields to the Entries Class
#CASE(%WhatToTransform)
#OF('All Entry Fields')
	!IF NOT (WebServer.IsEnabled())
	LOOP i#  = FirstField() TO LastField()
  		IF i#{Prop:Type} = Create:Entry OR i#{Prop:Type} = Create:TEXT
    		CoolEntryFields.AddEntryBG(i#,i#{PROP:Color},,GLO:2in1)
  		END
	END !LOOP
	!END
#OF('Selected Fields')
#FOR(%EntresControls)
	    	CoolEntryFields.AddEntryBG(%IMGControl,%IMGControl{PROP:Color},,GLO:2in1)
#ENDFOR	    	
#ENDCASE
EntriesPosition_ROUTINE     ROUTINE                !Re-draw the entries if the window changed
#CASE(%WhatToTransform)
#OF('All Entry Fields')
	!IF NOT (WebServer.IsEnabled())
	LOOP i#  = FirstField() TO LastField()
  		IF i#{Prop:Type} = Create:Entry OR i#{Prop:Type} = Create:TEXT
    		CoolEntryFields.RefreshEntry(i#,GLO:2in1)
  		END
	END !LOOP
	!END
#OF('Selected Fields')	
#FOR(%EntresControls)
		CoolEntryFields.RefreshEntry(%IMGControl,GLO:2in1)
#ENDFOR
#ENDCASE
#ENDAT