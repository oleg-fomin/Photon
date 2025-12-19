

   MEMBER('Photon.clw')                                    ! This is a MEMBER module


   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PHOTON003.INC'),ONCE        !Local module procedure declarations
                     END


!!! <summary>
!!! Generated from procedure template - Window
!!! Password Window
!!! </summary>
Neuron_Password PROCEDURE (LONG NeuronPTR)

LOC:PasswordTries    LONG(0)                               ! 
LOC:ReturnValue      LONG(1)                               ! 
LOC:Password         CSTRING(32)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW,AT(,,231,64),FONT('Microsoft Sans Serif',8,00FFFFF0h,FONT:regular,CHARSET:DEFAULT), |
  TILED,CENTER,COLOR(00372A1Fh),GRAY,IMM,HLP('Password'),SYSTEM,WALLPAPER('Noise4.jpg')
                       PROMPT('Password:'),AT(15,12),USE(?LOC:Password:Prompt),TRN
                       ENTRY(@s31),AT(53,12,163,10),USE(LOC:Password),PASSWORD,REQ,TRN
                       BUTTON('&Cancel'),AT(161,36,66,22),USE(?Cancel),LEFT,COLOR(002731D5h),ICON('cancel_32x32.png'), |
  FLAT,MSG('Cancel Operation'),TIP('Cancel Operation')
                       BUTTON('&OK'),AT(87,36,66,22),USE(?Ok),LEFT,COLOR(COLOR:Green),ICON('ok_32x32.png'),FLAT,MSG('Accept operation'), |
  TIP('Accept Operation')
                     END

CoolEntryFields EntryFields
Buttonz CoolButtonz
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
WindowResizeEnd        PROCEDURE(),DERIVED
                     END


  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop
  RETURN(LOC:ReturnValue)

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------
Pass_ROUTINE        ROUTINE
	
	CLEAR(NEU:Record)
	GET(Neurons,NeuronPTR)
	IF NOT ERRORCODE()
		IF LOC:Password = NEU:Password
			LOC:ReturnValue = 0
			POST(EVENT:CloseWindow)
		ELSE
			MESSAGE('Wrong Password')
			LOC:ReturnValue = 1
			LOC:PasswordTries += 1
			CLEAR(LOC:Password)
			SELECT(?LOC:Password)
			IF LOC:PasswordTries => 3
				MESSAGE('Too many tries')
				POST(EVENT:Accepted,?Cancel)
			END
		END
	END

	
	EXIT
	
InitEntries_ROUTINE    ROUTINE                !Pass Entry Fields to the Entries Class
 LOOP i#  = FirstField() TO LastField()
    IF i#{Prop:Type} = Create:Entry OR i#{Prop:Type} = Create:TEXT
      CoolEntryFields.AddEntryBG(i#,i#{PROP:Color},,GLO:2in1)
    END
 END !LOOP
EntriesPosition_ROUTINE     ROUTINE                !Re-draw the entries if the window changed
 LOOP i#  = FirstField() TO LastField()
    IF i#{Prop:Type} = Create:Entry OR i#{Prop:Type} = Create:TEXT
      CoolEntryFields.RefreshEntry(i#,GLO:2in1)
    END
 END !LOOP
ResizeButtons_ROUTINE ROUTINE
 LOOP ThisBTN#  = FirstField() TO LastField()
    IF ThisBTN#{Prop:Type} = Create:Button
      Buttonz.ResizeButtons(ThisBTN#,GLO:2in1)
    END
 END !LOOP
InitButtonz_ROUTINE    ROUTINE                !Pass buttons to the Cool Buttons Class
 LOOP ThisBTN#  = FirstField() TO LastField()
    IF ThisBTN#{Prop:Type} = Create:Button
      Buttonz.AddButtonMimic(ThisBTN#,ThisBTN#{PROP:Color},,GLO:2in1)
    END
 END !LOOP
RebuildButtonz_ROUTINE     ROUTINE                !Re-draw the buttons if the window changed
 LOOP ThisBTN#  = FirstField() TO LastField()
    IF ThisBTN#{Prop:Type} = Create:Button
      Buttonz.RebuildButtons(ThisBTN#,GLO:2in1)
    END
 END !LOOP
ButtonzPosition_ROUTINE     ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode, Legacy, it should dissapear										
 DO Enable2in1Buttons_ROUTINE
Enable2in1Buttons_ROUTINE ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode
 LOOP ThisBTN#  = FirstField() TO LastField()
    IF ThisBTN#{Prop:Type} = Create:Button
      Buttonz.Buttons2in1(ThisBTN#,GLO:2in1)
    END
 END !LOOP
SetThemeWallpaper_ROUTINE ROUTINE

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Neuron_Password')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?LOC:Password:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  IF SELF.Request = SelectRecord
     SELF.AddItem(?Ok,RequestCancelled)                    ! Add the close control to the window manger
  ELSE
     SELF.AddItem(?Ok,RequestCompleted)                    ! Add the close control to the window manger
  END
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Neurons.SetOpenRelated()
  Relate:Neurons.Open()                                    ! File Neurons used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(QuickWindow)                                   ! Open window
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  Do DefineListboxStyle
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
   CoolEntryFields.Init(SELF)
   DO InitEntries_ROUTINE
   Buttonz.Init(SELF)
   DO InitButtonz_ROUTINE
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Neurons.Close()
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?LOC:Password
      DO Pass_ROUTINE
    OF ?Ok
      ThisWindow.Update()
      DO Pass_ROUTINE
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
   !Something was triggered on the screen, Either EVENT:Accepted or EVENT:Selected
   CASE EVENT()
   OF EVENT:Accepted
    DO EntriesPosition_ROUTINE
    DO RebuildButtonz_ROUTINE
   OF EVENT:Selected
    DO EntriesPosition_ROUTINE
    DO RebuildButtonz_ROUTINE
   END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window


Resizer.WindowResizeEnd PROCEDURE


  CODE
  PARENT.WindowResizeEnd
   DO EntriesPosition_ROUTINE
   DO ResizeButtons_ROUTINE

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Themes
!!! </summary>
Update_Themes PROCEDURE 

CurrentTab           STRING(80)                            ! 
ActionMessage        CSTRING(40)                           ! 
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::THM:Record  LIKE(THM:RECORD),THREAD
QuickWindow          WINDOW('Form Themes'),AT(,,262,54),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,GRAY,IMM,MDI,HLP('Update_Themes'),SYSTEM
                       PROMPT('Theme Name:'),AT(17,12),USE(?THM:ThemeName:Prompt:2)
                       ENTRY(@s32),AT(67,11,140,10),USE(THM:ThemeName,,?THM:ThemeName:2)
                       BUTTON('&Cancel'),AT(191,25,49,14),USE(?Cancel),LEFT,ICON('WACANCEL.ICO'),FLAT,MSG('Cancel operation'), |
  TIP('Cancel operation')
                       BUTTON('&OK'),AT(139,25,49,14),USE(?OK),LEFT,ICON('WAOK.ICO'),DEFAULT,FLAT,MSG('Accept dat' & |
  'a and close the window'),TIP('Accept data and close the window')
                     END

ThisWindow           CLASS(WindowManager)
Ask                    PROCEDURE(),DERIVED
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
Run                    PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
                     END

CurCtrlFeq          LONG
FieldColorQueue     QUEUE
Feq                   LONG
OldColor              LONG
                    END

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Ask PROCEDURE

  CODE
  CASE SELF.Request                                        ! Configure the action message text
  OF ViewRecord
    ActionMessage = 'View Record'
  OF InsertRecord
    ActionMessage = 'Record Will Be Added'
  OF ChangeRecord
    ActionMessage = 'Record Will Be Changed'
  END
  QuickWindow{PROP:Text} = ActionMessage                   ! Display status message in title bar
  PARENT.Ask


ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Update_Themes')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?THM:ThemeName:Prompt:2
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(THM:Record,History::THM:Record)
  SELF.AddHistoryField(?THM:ThemeName:2,2)
  SELF.AddUpdateFile(Access:Themes)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Themes.Open()                                     ! File Themes used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Themes
  IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing ! Setup actions for ViewOnly Mode
    SELF.InsertAction = Insert:None
    SELF.DeleteAction = Delete:None
    SELF.ChangeAction = Change:None
    SELF.CancelAction = Cancel:Cancel
    SELF.OkControl = 0
  ELSE
    SELF.ChangeAction = Change:Caller                      ! Changes allowed
    SELF.CancelAction = Cancel:Cancel+Cancel:Query         ! Confirm cancel
    SELF.OkControl = ?OK
    IF SELF.PrimeUpdate() THEN RETURN Level:Notify.
  END
  SELF.Open(QuickWindow)                                   ! Open window
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?THM:ThemeName:2{PROP:ReadOnly} = True
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Themes.Close()
  END
  GlobalErrors.SetProcedureName
  RETURN ReturnValue


ThisWindow.Run PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Run()
  IF SELF.Request = ViewRecord                             ! In View Only mode always signal RequestCancelled
    ReturnValue = RequestCancelled
  END
  RETURN ReturnValue


ThisWindow.TakeAccepted PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receive all EVENT:Accepted's
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?OK
      ThisWindow.Update()
      IF SELF.Request = ViewRecord AND NOT SELF.BatchProcessing THEN
         POST(EVENT:CloseWindow)
      END
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window

