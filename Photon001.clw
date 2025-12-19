

   MEMBER('Photon.clw')                                    ! This is a MEMBER module


   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE
   INCLUDE('MENUStyle.INC'),ONCE
   INCLUDE('winext.inc'),ONCE

                     MAP
                       INCLUDE('PHOTON001.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('PHOTON002.INC'),ONCE        !Req'd for module callout resolution
                       INCLUDE('PHOTON003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Frame
!!! Photon Data Manager
!!! </summary>
Main PROCEDURE 

SavedProc            LONG                                  ! 
LOC:OriginalTimer    SHORT                                 ! 
LOC:Init             BYTE                                  ! 
MenuStyleMgr MenuStyleManager
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
AppFrame             APPLICATION('Photon'),AT(,,1081,569),FONT('Microsoft Sans Serif',8,,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTERED,CENTER,ICON('photon.ico'),MAX,STATUS(-1,80,120,45),SYSTEM,WALLPAPER('Frame_WP.jpg'),IMM
                       MENUBAR,USE(?Menubar)
                         MENU('&File'),USE(?FileMenu)
                           ITEM('&Print Setup ...'),USE(?PrintSetup),MSG('Setup printer'),STD(STD:PrintSetup)
                           ITEM,USE(?SEPARATOR1),SEPARATOR
                           ITEM('E&xit'),USE(?Exit),MSG('Exit this application'),STD(STD:Close)
                         END
                         MENU('&Edit'),USE(?EditMenu)
                           ITEM('Cu&t'),USE(?Cut),MSG('Cut Selection To Clipboard'),STD(STD:Cut)
                           ITEM('&Copy'),USE(?Copy),MSG('Copy Selection To Clipboard'),STD(STD:Copy)
                           ITEM('&Paste'),USE(?Paste),MSG('Paste From Clipboard'),STD(STD:Paste)
                         END
                         MENU('&Window'),USE(?WindowMenu),STD(STD:WindowList)
                           ITEM('T&ile'),USE(?Tile),MSG('Arrange multiple opened windows'),STD(STD:TileWindow)
                           ITEM('&Cascade'),USE(?Cascade),MSG('Arrange multiple opened windows'),STD(STD:CascadeWindow)
                           ITEM('&Arrange Icons'),USE(?Arrange),MSG('Arrange the icons for minimized windows'),STD(STD:ArrangeIcons)
                         END
                         MENU('&Help'),USE(?HelpMenu)
                           ITEM('&Contents'),USE(?Helpindex),MSG('View the contents of the help file'),STD(STD:HelpIndex)
                           ITEM('&Search for Help On...'),USE(?HelpSearch),MSG('Search for help on a subject'),STD(STD:HelpSearch)
                           ITEM('&How to Use Help'),USE(?HelpOnHelp),MSG('Provides general instructions on using help'), |
  STD(STD:HelpOnHelp)
                           ITEM,USE(?SEPARATOR2),SEPARATOR
                           ITEM('About Photon'),USE(?About_Photon)
                         END
                       END
                       TOOLBAR,AT(0,0,1081,30),USE(?TOOLBAR1),COLOR(COLOR:Black)
                         BUTTON('My Universe'),AT(2,3,95,24),USE(?Universe),FONT(,,00FFFFE0h),LEFT,ICON('molecule.png'), |
  FLAT,TRN
                       END
                     END

CoolEntryFields EntryFields
Buttonz CoolButtonz
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
FrameExtension       CLASS(WindowExtenderClass)
TrayIconMouseLeft2     PROCEDURE(),DERIVED
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
RePaint_ROUTINE     ROUTINE
	
	
	
	EXIT
	
Set_Mac_Address_License_ROUTINE     ROUTINE
	
	
EXIT
Menu::Menubar ROUTINE                                      ! Code for menu items on ?Menubar
Menu::FileMenu ROUTINE                                     ! Code for menu items on ?FileMenu
Menu::EditMenu ROUTINE                                     ! Code for menu items on ?EditMenu
Menu::WindowMenu ROUTINE                                   ! Code for menu items on ?WindowMenu
Menu::HelpMenu ROUTINE                                     ! Code for menu items on ?HelpMenu
  CASE ACCEPTED()
  OF ?About_Photon
    START(About_Photon, 25000)
  END
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
      Buttonz.ResizeButtons(?Universe,GLO:2in1)
InitButtonz_ROUTINE    ROUTINE                !Pass buttons to the Cool Buttons Class
      Buttonz.AddButtonMimic(?Universe,?Universe{PROP:Color},,GLO:2in1)
RebuildButtonz_ROUTINE     ROUTINE                !Re-draw the buttons if the window changed
  Buttonz.RebuildButtons(?Universe,GLO:2in1)
ButtonzPosition_ROUTINE     ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode, Legacy, it should dissapear										
 DO Enable2in1Buttons_ROUTINE
Enable2in1Buttons_ROUTINE ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode
  Buttonz.Buttons2in1(?Universe,GLO:2in1)
SetThemeWallpaper_ROUTINE ROUTINE

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Main')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:Geometries.Open()                                 ! File Geometries used by this procedure, so make sure it's RelationManager is open
  Relate:License.Open()                                    ! File License used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Open(AppFrame)                                      ! Open window
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  Do DefineListboxStyle
  FrameExtension.Init(AppFrame,1,0,0{PROP:Icon},'Photon')
  SELF.SetAlerts()
   CoolEntryFields.Init(SELF)
   DO InitEntries_ROUTINE
   Buttonz.Init(SELF)
   DO InitButtonz_ROUTINE
      AppFrame{PROP:TabBarLocation} = MDITabLocation:Bottom
      AppFrame{PROP:TabBarStyle} = TabStyle:Default
      AppFrame{PROP:TabBarVisible}  = True
      MenuStyleMgr.Init(?Menubar)
      MenuStyleMgr.SuspendRefresh()
      MenuStyleMgr.SetThemeColors('VistaAero')
      MenuStyleMgr.ApplyTheme()
      MenuStyleMgr.Refresh(TRUE)
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  IF SELF.FilesOpened
    Relate:Geometries.Close()
    Relate:License.Close()
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
    CASE ACCEPTED()
    ELSE
      DO Menu::Menubar                                     ! Process menu items on ?Menubar menu
      DO Menu::FileMenu                                    ! Process menu items on ?FileMenu menu
      DO Menu::EditMenu                                    ! Process menu items on ?EditMenu menu
      DO Menu::WindowMenu                                  ! Process menu items on ?WindowMenu menu
      DO Menu::HelpMenu                                    ! Process menu items on ?HelpMenu menu
    END
  ReturnValue = PARENT.TakeAccepted()
    CASE ACCEPTED()
    OF ?Universe
      START(Universe_NG, 25000)
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
    IF EVENT()
       FrameExtension.TakeEvent()
    END
  IF EnterByTabManager.TakeEvent()
     RETURN(Level:Notify)
  END
  ReturnValue = PARENT.TakeEvent()
  CASE EVENT()
  
  OF EVENT:Iconized
  	
  	GLO:WasIconized =TRUE
  	
  OF EVENT:Maximized
  	IF LOC:Init = FALSE
  		
  		LOC:Init = TRUE
  	ELSE
  		GLO:ForceRefresh = TRUE
  		
  	END
  	
  
  OF EVENT:Restore
  
  	
  OF EVENT:Timer
  	
  END
   !Something was triggered on the screen, Either EVENT:Accepted or EVENT:Selected
   CASE EVENT()
   OF EVENT:Accepted
    DO EntriesPosition_ROUTINE
    DO RebuildButtonz_ROUTINE
   END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


ThisWindow.TakeWindowEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all window specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeWindowEvent()
    CASE EVENT()
    OF EVENT:OpenWindow
      GLO:Theme = ''
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue


FrameExtension.TrayIconMouseLeft2 PROCEDURE


  CODE
  PARENT.TrayIconMouseLeft2
  POST(EVENT:Maximize)

