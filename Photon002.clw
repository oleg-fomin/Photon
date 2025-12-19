

   MEMBER('Photon.clw')                                    ! This is a MEMBER module


   INCLUDE('ABBROWSE.INC'),ONCE
   INCLUDE('ABDROPS.INC'),ONCE
   INCLUDE('ABEIP.INC'),ONCE
   INCLUDE('ABPOPUP.INC'),ONCE
   INCLUDE('ABRESIZE.INC'),ONCE
   INCLUDE('ABTOOLBA.INC'),ONCE
   INCLUDE('ABWINDOW.INC'),ONCE

                     MAP
                       INCLUDE('PHOTON002.INC'),ONCE        !Local module procedure declarations
                       INCLUDE('PHOTON003.INC'),ONCE        !Req'd for module callout resolution
                     END


!!! <summary>
!!! Generated from procedure template - Splash
!!! </summary>
About_Photon PROCEDURE 

LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
window               WINDOW,AT(,,878,436),FONT('Microsoft Sans Serif',8,,FONT:regular),NOFRAME,CENTERED,CENTER, |
  GRAY,MDI,WALLPAPER('Photon-Splash.jpg')
                     END

ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass

  CODE
  GlobalResponse = ThisWindow.Run()                        ! Opens the window and starts an Accept Loop

!---------------------------------------------------------------------------
DefineListboxStyle ROUTINE
!|
!| This routine create all the styles to be shared in this window
!| It`s called after the window open
!|
!---------------------------------------------------------------------------

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('About_Photon')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = 1
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.Open(window)                                        ! Open window
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  Do DefineListboxStyle
  TARGET{Prop:Timer} = 500                                 ! Close window on timer event, so configure timer
  TARGET{Prop:Alrt,255} = MouseLeft                        ! Alert mouse clicks that will close window
  TARGET{Prop:Alrt,254} = MouseLeft2
  TARGET{Prop:Alrt,253} = MouseRight
  SELF.SetAlerts()
  EnterByTabManager.Init(False)
  RETURN ReturnValue


ThisWindow.Kill PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.Kill()
  IF ReturnValue THEN RETURN ReturnValue.
  GlobalErrors.SetProcedureName
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
    OF EVENT:AlertKey
      CASE KEYCODE()
      OF MouseLeft
      OROF MouseLeft2
      OROF MouseRight
        POST(Event:CloseWindow)                            ! Splash window will close on mouse click
      END
    OF EVENT:LoseFocus
        POST(Event:CloseWindow)                            ! Splash window will close when focus is lost
    OF Event:Timer
      POST(Event:CloseWindow)                              ! Splash window will close on event timer
    OF Event:AlertKey
      CASE KEYCODE()                                       ! Splash window will close on mouse click
      OF MouseLeft
      OROF MouseLeft2
      OROF MouseRight
        POST(Event:CloseWindow)
      END
    ELSE
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

!!! <summary>
!!! Generated from procedure template - Window
!!! Universe NG
!!! </summary>
Universe_NG PROCEDURE 

SavedProc            LONG                                  ! 
LOC:Focused_Neuron_ID LONG                                 ! 
LOC:ReloadList       LONG                                  ! 
LOC:Original_Toolbar_Size LONG                             ! 
LOC:Is_Menu_Visible  BYTE                                  ! 
LOC:Focused_Neuron_Parent_ID LONG                          ! 
LOC:DisplayMenu      BYTE                                  ! 
LOC:MenuActive       CSTRING(64)                           ! 
LOC:NeuronPTR        LONG                                  ! 
Is_Menu_Visible      BYTE                                  ! 
LOC:Active_Thought   LONG                                  ! 
Focused_Neuron       LONG                                  ! 
Touched_Neuron       LONG                                  ! 
LOC:Password         CSTRING(32)                           ! 
LOC:ThemeUpdate      LONG                                  ! 
Q:Menu_Areas         QUEUE,PRE(Q:Menu_Area)                ! 
Start_X              LONG                                  ! 
Start_Y              LONG                                  ! 
End_X                LONG                                  ! 
End_Y                LONG                                  ! 
Kind                 CSTRING(32)                           ! 
Option               CSTRING(32)                           ! 
PTR                  LONG                                  ! 
                     END                                   ! 
ptOldPoint           GROUP,PRE(PNT)                        ! 
x                    SIGNED                                ! 
y                    SIGNED                                ! 
                     END                                   ! 
LOC:Coords           STRING(64)                            ! 
RGB_GRP              GROUP,PRE()                           ! 
HighByte             BYTE                                  ! 
blue                 BYTE                                  ! 
green                BYTE                                  ! 
red                  BYTE                                  ! 
                     END                                   ! 
LOC:Bezier           LIKE(SA_POINT),DIM(4)                 ! 
LOC:WinHandle        UNSIGNED                              ! 
MenuClicked          BYTE                                  ! 
LOC:FilesDropped     CSTRING(8192)                         ! 
LOC:ResetPics        LONG                                  ! 
LOC:FilesDroppedDummy CSTRING(8192)                        ! 
QUE:Files            QUEUE,PRE()                           ! 
Filename             CSTRING(1024)                         ! 
                     END                                   ! 
Filename             CSTRING(1024)                         ! 
LOC:SearchString_Copy CSTRING(64)                          ! 
LOC:ShellCommand     CSTRING(1024)                         ! 
LOC:EmptyCString     CSTRING(21)                           ! 
LOC:MenuVisible      BYTE                                  ! 
RGB_Address          ULONG                                 ! 
LOC:memoryDC         LONG                                  ! 
LOC:memoryBitMap     LONG                                  ! 
LOC:memoryOriginalBitMap LONG                              ! 
RectVertex           GROUP,PRE(),DIM(2)                    ! 
RVX                  LONG                                  ! 
RVY                  LONG                                  ! 
RVRed                USHORT                                ! 
RVGreen              USHORT                                ! 
RVBlue               USHORT                                ! 
RVAlpha              USHORT                                ! 
                     END                                   ! 
RVX                  LONG                                  ! 
RVY                  LONG                                  ! 
RVRed                USHORT                                ! 
RVGreen              USHORT                                ! 
RVBlue               USHORT                                ! 
RVAlpha              USHORT                                ! 
GradientRect         GROUP,PRE()                           ! 
GRUpperLeft          ULONG                                 ! 
GRLowerRight         ULONG                                 ! 
                     END                                   ! 
GRUpperLeft          ULONG                                 ! 
GRLowerRight         ULONG                                 ! 
LOC:WindowHandle     LONG                                  ! 
LOC:ClickedParentID  LONG                                  ! 
LOC:controlDC        LONG                                  ! 
LOC:sourceWidth      LONG                                  ! 
LOC:sourceHeight     LONG                                  ! 
ThisWNDC             LONG                                  ! 
MyWindowDC           UNSIGNED                              ! 
FactorA              DECIMAL(7,2)                          ! 
Q:ImageFEQs          QUEUE,PRE(Q:Img)                      ! 
ID                   ULONG                                 ! 
FEQ                  LONG                                  ! 
Pointer              LONG                                  ! 
StartX               LONG                                  ! 
StartY               LONG                                  ! 
StartXpos            LONG                                  ! 
StartYpos            LONG                                  ! 
EndXpos              LONG                                  ! 
EndYpos              LONG                                  ! 
IsImage              BYTE                                  ! 
                     END                                   ! 
ID                   ULONG                                 ! 
FEQ                  LONG                                  ! 
Pointer              LONG                                  ! 
StartX               LONG                                  ! 
StartY               LONG                                  ! 
StartXpos            LONG                                  ! 
StartYpos            LONG                                  ! 
EndXpos              LONG                                  ! 
EndYpos              LONG                                  ! 
IsImage              BYTE                                  ! 
FactorB              DECIMAL(7,2)                          ! 
FactorC              DECIMAL(7,2)                          ! 
PenHandle            ULONG                                 ! 
FactorD              DECIMAL(7,2)                          ! 
TestRadius           DECIMAL(7,2)                          ! 
LOC:KeyCode          CSTRING(32)                           ! 
mousexpos            SIGNED                                ! 
mouseypos            SIGNED                                ! 
Stepper              LONG                                  ! 
GDI_OK               BYTE                                  ! 
LOC:ToolbarHeight    LONG                                  ! 
LOC:ClickedData      LONG                                  ! 
LOC:ClickedData_Saved LONG                                 ! 
LOC:ClickedData_Menu LONG                                  ! 
LOC:Parent           LONG                                  ! 
LOC:RebuildResize    BYTE                                  ! 
ThisWallpaper        CSTRING(255)                          ! 
Q:PolyCoords         QUEUE,PRE(QPCoords)                   ! 
ID                   LONG                                  ! 
Xpos                 LONG                                  ! 
Ypos                 LONG                                  ! 
                     END                                   ! 
LOC:PagePosition     STRING(260)                           ! 
LOC:QuoteNumberPos   LONG                                  ! 
LOC:JPGName          STRING(256)                           ! 
LOC:Quotation        LONG                                  ! 
LOC:OldQuoteNumber   LONG                                  ! 
LOC:NewQuoteNumber   LONG                                  ! 
Q:BreadCrumbs        QUEUE,PRE(Q:BreadCrumbs)              ! 
Start_X              LONG                                  ! 
Start_Y              LONG                                  ! 
End_X                LONG                                  ! 
End_Y                LONG                                  ! 
Kind                 CSTRING(32)                           ! 
PTR                  LONG                                  ! 
                     END                                   ! 
LOC:SearchString     CSTRING(32)                           ! 
LOC:ContractsYPos    LONG                                  ! 
LOC:ContractsXPos    LONG                                  ! 
LOC:ShowClosedContracts BYTE                               ! 
Q:Areas              QUEUE,PRE(Q:Area)                     ! 
Start_X              LONG                                  ! 
Start_Y              LONG                                  ! 
End_X                LONG                                  ! 
End_Y                LONG                                  ! 
Kind                 CSTRING(32)                           ! 
PTR                  LONG                                  ! 
                     END                                   ! 
LOC:Margin           LONG                                  ! 
First_Line           LONG                                  ! 
LOC:This_Parent      LONG                                  ! 
Q:Data_Queue         QUEUE,PRE(Q:Data_Queue)               ! 
PTR                  LONG                                  ! 
Kind                 CSTRING(32)                           ! 
Quotation_Item_SubTotal DECIMAL(12,4)                      ! 
Quotation_Delivery_Item_SubTotal DECIMAL(12,4)             ! 
This_Item_Qnty       DECIMAL(10,3)                         ! 
This_Item_Delivery_Qnty DECIMAL(10,3)                      ! 
GreenBar             BYTE                                  ! 
                     END                                   ! 
QUEUE:FEQs           QUEUE,PRE(Q:FEQ)                      ! 
Control_FEQ          SIGNED                                ! 
                     END                                   ! 
Control_FEQ          SIGNED                                ! 
FDCB9::View:FileDropCombo VIEW(Thoughts)
                       PROJECT(THO:Thought)
                       PROJECT(THO:Thought_ID)
                     END
BRW19::View:Browse   VIEW(Lists)
                       PROJECT(LIS:List)
                       PROJECT(LIS:List_ID)
                       PROJECT(LIS:Neuron_ID)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LIS:List               LIKE(LIS:List)                 !List box control field - type derived from field
LIS:List_ID            LIKE(LIS:List_ID)              !Primary key field - type derived from field
LIS:Neuron_ID          LIKE(LIS:Neuron_ID)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
BRW21::View:Browse   VIEW(Themes)
                       PROJECT(THM:ThemeName)
                       PROJECT(THM:ID)
                     END
Queue:Browse:1       QUEUE                            !Queue declaration for browse/combo box using ?List:2
THM:ThemeName          LIKE(THM:ThemeName)            !List box control field - type derived from field
THM:ID                 LIKE(THM:ID)                   !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
Queue:FileDropCombo  QUEUE                            !
THO:Thought            LIKE(THO:Thought)              !List box control field - type derived from field
THO:Thought_ID         LIKE(THO:Thought_ID)           !Browse hot field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
QuickWindow          WINDOW('My Universe'),AT(,,1023,595),FONT('Microsoft Sans Serif',8,00FFFFF0h,FONT:regular, |
  CHARSET:DEFAULT),RESIZE,MAXIMIZE,TILED,ALRT(MouseLeft2),ALRT(MouseLeftUp),ALRT(MouseRightUp), |
  CENTER,COLOR(0028180Eh),GRAY,IMM,MDI,HLP('Universe_NG'),SYSTEM
                       TOOLBAR,AT(0,0,1023,31),USE(?TOOLBAR),FONT(,,00FFFFF0h)
                         TEXT,AT(996,4,1,1),USE(?LOG),VSCROLL,FLAT,HIDE,TRN
                         COMBO(@s128),AT(78,9,157,12),USE(THO:Thought),DROP(5),FORMAT('512L(2)|M@s128@E(00FFFFF0' & |
  'H,00492C18H,,)'),FROM(Queue:FileDropCombo),IMM,TRN
                         STRING('Line of Thought:'),AT(12,10),USE(?STRING1),TRN
                       END
                       REGION,AT(0,-1,163,485),USE(?Universe_Area),IMM,SCROLL
                       SHEET,AT(761,4,261,561),USE(?Neuron_Work_Area_SHEET)
                         TAB('Extended Data'),USE(?TAB1)
                           TEXT,AT(765,25,250,169),USE(?Extended_Data),VSCROLL
                           LIST,AT(765,226,251,205),USE(?List),RIGHT(1),VSCROLL,FLAT,FORMAT('25L(2)|M@s255@'),FROM(Queue:Browse), |
  IMM
                           BUTTON('&Insert'),AT(882,436,42,12),USE(?Insert),HIDE
                           BUTTON('&Change'),AT(923,436,42,12),USE(?Change),HIDE
                           BUTTON('&Delete'),AT(966,436,42,12),USE(?Delete),HIDE
                           BUTTON('Update'),AT(986,196,30,26),USE(?Update_Extended_Data_BTN),ICON('save_32x32.png'),HIDE
                         END
                         TAB('Settings'),USE(?TAB2)
                           BUTTON('Update Theme'),AT(803,458,95,26),USE(?Update_Theme_BTN),COLOR(COLOR:Green),ICON('Check_16x16.png'), |
  FLAT,TRN
                           BUTTON('Save as new Theme'),AT(923,458,95,26),USE(?Save_as_New_Theme_BTN),COLOR(COLOR:Green), |
  ICON('add_32x32.png'),FLAT,TRN
                           SHEET,AT(794,128,215,15),USE(?Themes_Sheet)
                             TAB('Neurons'),USE(?TAB3)
                               SPIN(@N3~%~),AT(885,154,60,10),USE(GLO:Neurons_Area),RIGHT(1),FLAT,RANGE(50,79),STEP(1)
                               PROMPT('Neurons Area:'),AT(833,154),USE(?GLO:Neurons_Area:Prompt),TRN
                               PROMPT('Neuron Width:'),AT(832,170),USE(?GLO:Cell_Width:Prompt),TRN
                               SPIN(@n-10),AT(885,170,60,10),USE(GLO:Cell_Width),DECIMAL(12),FLAT
                               PROMPT('Neuron Height:'),AT(829,186),USE(?GLO:Cell_Height:Prompt),TRN
                               SPIN(@n-10),AT(885,186,60,10),USE(GLO:Cell_Height),DECIMAL(12),FLAT
                               PROMPT('Text Size:'),AT(847,218),USE(?GLO:Text_Points:Prompt),TRN
                               SPIN(@n-10),AT(885,218,60,10),USE(GLO:Text_Points),DECIMAL(12),FLAT
                               PROMPT('Vertical Margin:'),AT(829,250),USE(?GLO:Vertical_Margin:Prompt),TRN
                               SPIN(@n-10),AT(885,250,60,10),USE(GLO:Vertical_Margin),DECIMAL(12),FLAT
                               PROMPT('Horizontal Margin:'),AT(821,266),USE(?GLO:Horizontal_Margin:Prompt),TRN
                               SPIN(@n-10),AT(885,266,60,10),USE(GLO:Horizontal_Margin),DECIMAL(12),FLAT
                               PROMPT('InterNeuron Gap:'),AT(824,282),USE(?GLO:Intercell_Gap:Prompt:2),TRN
                               SPIN(@n-10),AT(885,282,60,10),USE(GLO:Intercell_Gap,,?GLO:Intercell_Gap:2),DECIMAL(12),FLAT
                               PROMPT('Focused N. V. Margin:'),AT(808,298),USE(?GLO:Main_Neuron_Y_Margin:Prompt),TRN
                               SPIN(@n-10),AT(885,298,60,10),USE(GLO:Main_Neuron_Y_Margin),DECIMAL(12),FLAT
                               ENTRY(@n13),AT(885,314,60,10),USE(GLO:Outline_Color),RIGHT(1),FLAT
                               PROMPT('Neurons Outline Color:'),AT(808,314),USE(?GLO:Outline_Color:Prompt),TRN
                               PROMPT('Text Color:'),AT(844,234),USE(?GLO:Text_Color:Prompt),TRN
                               ENTRY(@n13),AT(885,234,60,10),USE(GLO:Text_Color),RIGHT(1),FLAT
                               PROMPT('Label Fill Color:'),AT(831,362),USE(?GLO:Label_Box_Color:Prompt),TRN
                               ENTRY(@n13),AT(885,362,60,10),USE(GLO:Label_Box_Color),RIGHT(1),FLAT
                               PROMPT('Bezier Color:'),AT(839,394),USE(?GLO:Bezier_Color:Prompt),TRN
                               ENTRY(@n13),AT(885,394,60,10),USE(GLO:Bezier_Color),RIGHT(1),FLAT
                               PROMPT('Label Text Color:'),AT(825,378),USE(?GLO:Label_Text_Color:Prompt),TRN
                               ENTRY(@n13),AT(885,378,60,10),USE(GLO:Label_Text_Color),RIGHT(1),FLAT
                               ENTRY(@n13),AT(885,346,60,10),USE(GLO:Label_Outline_Color),RIGHT(1),FLAT
                               PROMPT('Label Outline Color:'),AT(817,346),USE(?GLO:Label_Outline_Color:Prompt),TRN
                               SPIN(@P###P),AT(885,202,60,10),USE(GLO:MaxChars),RIGHT(1),FLAT
                               PROMPT('Max Neuron Chars:'),AT(817,202),USE(?GLO:MaxChars:Prompt),TRN
                               ENTRY(@n13),AT(885,330,60,10),USE(GLO:Box_Color),RIGHT(1),FLAT
                               PROMPT('Neurons Fill Color:'),AT(821,330),USE(?GLO:Box_Color:Prompt),TRN
                               PROMPT('Neuron Font:'),AT(837,410),USE(?GLO:NeuronFont:Prompt),TRN
                               ENTRY(@s128),AT(885,410,108,10),USE(GLO:Neuron_Font)
                               BUTTON('...'),AT(998,408,16),USE(?Select_Neuron_Font_BTN),FLAT
                               BUTTON('...'),AT(953,232,14,14),USE(?Pick_Text_Color),FLAT
                               BUTTON('...'),AT(953,328,14,14),USE(?Pick_Neurons_Fill_Color),FONT(,,,FONT:regular),COLOR(0028180Eh), |
  FLAT
                               BUTTON('...'),AT(953,344,14,14),USE(?Pick_Label_Outline_Color),COLOR(0028180Eh),FLAT
                               BUTTON('...'),AT(953,360,14,14),USE(?Pick_Label_Fill_Color),COLOR(0028180Eh),FLAT
                               BUTTON('...'),AT(953,376,14,14),USE(?Pick_Label_Text_Color),COLOR(0028180Eh),FLAT
                               BUTTON('...'),AT(953,392,14,14),USE(?Pick_Bezier_Color),COLOR(0028180Eh),FLAT
                             END
                             TAB('Focused Neuron'),USE(?TAB4)
                               SPIN(@n-10),AT(916,159,60,10),USE(GLO:Central_Neuron_Extra_Height),DECIMAL(12),FLAT
                               PROMPT('Focused Neuron Extra Height:'),AT(814,159),USE(?GLO:Central_Neuron_Extra_Heigh:Prompt), |
  TRN
                               SPIN(@n-10.2),AT(916,175,60,10),USE(GLO:Round_Button_Text_Points),DECIMAL(12),FLAT
                               PROMPT('Round Button Text Size:'),AT(832,175),USE(?GLO:Round_Button_Text_Points:Prompt),TRN
                               ENTRY(@n13),AT(916,191,60,10),USE(GLO:Round_Button_Outline_Color),RIGHT(1),FLAT
                               PROMPT('Round Button Text Color:'),AT(829,207),USE(?Round_Button_Text_Color:Prompt),TRN
                               ENTRY(@n13),AT(916,207,60,10),USE(GLO:Round_Button_Text_Color),RIGHT(1),FLAT
                               PROMPT('Round Button Outline Color:'),AT(821,191),USE(?GLO:Round_Button_Outline_Color:Prompt), |
  TRN
                               PROMPT('Round Button Box Color:'),AT(831,223),USE(?GLO:Round_Button_Box_Color:Prompt),TRN
                               ENTRY(@n13),AT(917,223,60,10),USE(GLO:Round_Button_Box_Color),RIGHT(1),FLAT
                               PROMPT('Round Button Height:'),AT(841,271),USE(?GLO:RoundButton_Height:Prompt),TRN
                               SPIN(@n13),AT(917,271,60,10),USE(GLO:RoundButton_Height),RIGHT(1),FLAT
                               PROMPT('Round Button Width:'),AT(843,256),USE(?GLO:RoundButton_Width:Prompt),TRN
                               SPIN(@n13),AT(917,256,60,10),USE(GLO:RoundButton_Width),RIGHT(1),FLAT
                               BUTTON('...'),AT(981,189,14,14),USE(?Pick_Round_Button_Outline_Color),FONT(,,,FONT:regular), |
  COLOR(0028180Eh),FLAT
                               BUTTON('...'),AT(981,205,14,14),USE(?Pick_Round_Button_Text_Color),FONT(,,,FONT:regular),COLOR(0028180Eh), |
  FLAT
                               BUTTON('...'),AT(981,221,14,14),USE(?Pick_Round_Button_Box_Color),FONT(,,,FONT:regular),COLOR(0028180Eh), |
  FLAT
                             END
                             TAB('Icons'),USE(?TAB5)
                               ENTRY(@n-14),AT(879,167,60,10),USE(GLO:IconColor),RIGHT(1)
                               PROMPT('Icon Color:'),AT(837,167),USE(?GLO:IconColor:Prompt),TRN
                               ENTRY(@n-14),AT(879,183,60,10),USE(GLO:IconBG),RIGHT(1)
                               PROMPT('Icon Background Color:'),AT(797,183),USE(?GLO:IconBG:Prompt),TRN
                               SPIN(@n-10),AT(879,199,60,10),USE(GLO:Icon_Size),DECIMAL(12)
                               PROMPT('Icon Size:'),AT(839,199),USE(?GLO:Icon_Size:Prompt),TRN
                               BUTTON('...'),AT(943,165,14,14),USE(?Pick_Text_Color:7),COLOR(0028180Eh),FLAT
                             END
                             TAB('Background'),USE(?TAB6)
                               OPTION('Gradient Orientation'),AT(843,223,117,23),USE(GLO:Gradient_Orientation,,?GLO:Gradient_Orientation:2), |
  BOXED,TRN
                                 RADIO('Horizontal'),AT(907,233),USE(?GLO:Gradient_Orientation:Radio1),TRN,VALUE('Horizontal')
                                 RADIO('Vertical'),AT(859,233),USE(?GLO:Gradient_Orientation:Radio2),TRN,VALUE('Vertical')
                               END
                               OPTION('Gradient Options:'),AT(843,198,117,23),USE(GLO:Gradient_Options),BOXED,TRN
                                 RADIO('Single'),AT(863,208),USE(?GLO:Gradient_Options:Radio1),TRN,VALUE('Single')
                                 RADIO('Double'),AT(903,208),USE(?GLO:Gradient_Options:Radio2),TRN,VALUE('Double')
                               END
                               ENTRY(@n13),AT(891,157,60,10),USE(GLO:Gradient_Start),RIGHT(1)
                               PROMPT('Gradient Start:'),AT(839,157),USE(?GLO:Gradient_Start:Prompt),TRN
                               ENTRY(@n13),AT(891,174,60,10),USE(GLO:Gradient_End),RIGHT(1)
                               PROMPT('Gradient End:'),AT(843,174),USE(?GLO:Gradient_End:Prompt),TRN
                               BUTTON('...'),AT(956,155,14,14),USE(?Pick_Gradient_Start_Color),COLOR(0028180Eh),FLAT
                               BUTTON('...'),AT(956,173,14,12),USE(?Pick_Gradient_End_Color),COLOR(0028180Eh),FLAT
                             END
                             TAB('DB'),USE(?TAB7)
                               CHECK('Debug DB:'),AT(813,155),USE(GLO:Debug_DB),TRN
                             END
                           END
                           LIST,AT(793,66,215,57),USE(?List:2),FORMAT('128L(2)|M@s32@'),FROM(Queue:Browse:1),IMM
                         END
                       END
                     END

CoolEntryFields EntryFields
Buttonz CoolButtonz
ThisWindow           CLASS(WindowManager)
Init                   PROCEDURE(),BYTE,PROC,DERIVED
Kill                   PROCEDURE(),BYTE,PROC,DERIVED
TakeAccepted           PROCEDURE(),BYTE,PROC,DERIVED
TakeEvent              PROCEDURE(),BYTE,PROC,DERIVED
TakeFieldEvent         PROCEDURE(),BYTE,PROC,DERIVED
TakeWindowEvent        PROCEDURE(),BYTE,PROC,DERIVED
                     END

Toolbar              ToolbarClass
Resizer              CLASS(WindowResizeClass)
Init                   PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)
WindowResizeEnd        PROCEDURE(),DERIVED
                     END

FDCB9                CLASS(FileDropComboClass)             ! File drop combo manager
Q                      &Queue:FileDropCombo           !Reference to browse queue type
                     END

BRW19                CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
PrimeRecord            PROCEDURE(BYTE SuppressClear = 0),BYTE,PROC,DERIVED
                     END

BRW19::Sort0:Locator StepLocatorClass                      ! Default Locator
BRW21                CLASS(BrowseClass)                    ! Browse using ?List:2
Q                      &Queue:Browse:1                !Reference to browse queue
TakeNewSelection       PROCEDURE(),DERIVED
                     END

BRW21::Sort0:Locator StepLocatorClass                      ! Default Locator
BRW19::EIPManager    BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List
EditInPlace::LIS:List EditEntryClass                       ! Edit-in-place class for field LIS:List
WinGDI              CLASS(ce_BufferedGraphics)
                    END
LC                  CLASS
Redraw_BG                  PROCEDURE()
FillTree                PROCEDURE(STRING Action)
Display_Menu            PROCEDURE(STRING Action,LONG PTR)
Add_Area                PROCEDURE(STRING Kind, LONG PTR, LONG Start_X, LONG Start_Y, LONG End_X, LONG End_Y)
Add_Menu_Area           PROCEDURE(STRING Kind, STRING Menu_Option, LONG PTR, LONG Start_X, LONG Start_Y, LONG End_X, LONG End_Y)
!Draw_Menu_Option        PROCEDURE(LONG X, LONG Y, LONG Cell_Width, LONG Cell_Height, LONG Cell_Round, STRING Label_Text, LONG Label_Padding, STRING Data_Text,LONG Data_Padding),LONG
Manage_GDI_Clicks       PROCEDURE(STRING Action)
ProcessClicks           PROCEDURE(STRING Clicks)
Log                     PROCEDURE(STRING WhatToLog)
Next_Delivery           PROCEDURE(STRING Contract),LONG
Manage_Themes           PROCEDURE(STRING Action,<LONG Theme_ID>)
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
Color_Fields_ROUTINE        ROUTINE
    ?GLO:Text_Color{PROP:Color} = GLO:Text_Color 
    ?GLO:Text_Color{PROP:FontColor} = GLO:Text_Color
    ?GLO:Outline_Color{PROP:Color} = GLO:Outline_Color
    ?GLO:Outline_Color{PROP:FontColor} = GLO:Outline_Color
    ?GLO:Box_Color{PROP:Color} = GLO:Box_Color
    ?GLO:Box_Color{PROP:FontColor} = GLO:Box_Color
    ?GLO:Label_Outline_Color{PROP:Color} = GLO:Label_Outline_Color
    ?GLO:Label_Outline_Color{PROP:FontColor} = GLO:Label_Outline_Color
    ?GLO:Label_Box_Color{PROP:Color} = GLO:Label_Box_Color
    ?GLO:Label_Box_Color{PROP:FontColor} = GLO:Label_Box_Color
    ?GLO:Label_Text_Color{PROP:Color} = GLO:Label_Text_Color
    ?GLO:Label_Text_Color{PROP:FontColor} = GLO:Label_Text_Color
    ?GLO:Bezier_Color{PROP:Color} = GLO:Bezier_Color
    ?GLO:Bezier_Color{PROP:FontColor} = GLO:Bezier_Color
    ?GLO:Round_Button_Outline_Color{PROP:Color} = GLO:Round_Button_Outline_Color
    ?GLO:Round_Button_Outline_Color{PROP:FontColor} = GLO:Round_Button_Outline_Color
    ?GLO:Round_Button_Text_Color{PROP:Color} = GLO:Round_Button_Text_Color
    ?GLO:Round_Button_Text_Color{PROP:FontColor} = GLO:Round_Button_Text_Color
    ?GLO:Round_Button_Box_Color{PROP:Color} = GLO:Round_Button_Box_Color
    ?GLO:Round_Button_Box_Color{PROP:FontColor} = GLO:Round_Button_Box_Color
    ?GLO:IconColor{PROP:Color} = GLO:IconColor
    ?GLO:IconColor{PROP:FontColor} = GLO:IconColor
    ?GLO:IconBG{PROP:Color} = GLO:IconBG
    ?GLO:IconBG{PROP:FontColor} = GLO:IconBG
    ?GLO:Gradient_Start{PROP:Color} = GLO:Gradient_Start
    ?GLO:Gradient_Start{PROP:FontColor} = GLO:Gradient_Start
    ?GLO:Gradient_End{PROP:Color} = GLO:Gradient_End
    ?GLO:Gradient_End{PROP:FontColor} = GLO:Gradient_End
    EXIT
    
Layout_ROUTINE      ROUTINE
	
DATA

Horizontal_Margin   LONG
Vertical_Margin     LONG
Tab_Height  LONG
Neurons_Area_Width  LONG
Percentile_Units    LONG
SetX        LONG
SetY        LONG
SetWidth    LONG
SetHeight   LONG
PercentileUnits     LONG
Extended_Data_Height        LONG
Lists_Height        LONG



CODE
	
	
    Percentile_Units = QuickWindow{PROP:Height} / 100
	
    Extended_Data_Height = 23 * Percentile_Units	
    Lists_Height = 23 * Percentile_Units
    Horizontal_Margin = 10
    Vertical_Margin = 10
    Tab_Height   = 25
	
    Percentile_Units = INT(0{PROP:Width} / 100)
    Neurons_Area_Width = GLO:Neurons_Area * Percentile_Units
    SETPOSITION(?Universe_Area,0,0,Neurons_Area_Width,QuickWindow{PROP:Height})! Need to manually set the position, don't ask, the answer is not funny	
    SETPOSITION(?Neuron_Work_Area_SHEET,?Universe_Area{PROP:Width} + 1,0,0{PROP:Width} - Neurons_Area_Width,Tab_Height)
	
	
    SetX = ?Neuron_Work_Area_SHEET{PROP:Xpos} + Horizontal_Margin
    SetY = ?Neuron_Work_Area_SHEET{PROP:Ypos} + Tab_Height + Vertical_Margin
    SetWidth = ?Neuron_Work_Area_SHEET{PROP:Width} - Horizontal_Margin - Horizontal_Margin
    SetHeight = Extended_Data_Height
	
    SETPOSITION(?Extended_Data,SetX,SetY,SetWidth,SetHeight)
	
    SetX = ?Extended_Data{PROP:Xpos} 
    SetY = ?Extended_Data{PROP:Ypos} + ?Extended_Data{PROP:Height} + Vertical_Margin
    SetWidth = ?Extended_Data{PROP:Width}
    SetHeight = Lists_Height
    DO Color_Fields_ROUTINE
    SETPOSITION(?List,SetX,SetY,SetWidth,SetHeight)	
    DISPLAY()
    DISPLAY(?Universe_Area) !Let's output the mod, try to comment the line and see what happens...
    

    EXIT
InitEntries_ROUTINE    ROUTINE                !Pass Entry Fields to the Entries Class
      CoolEntryFields.AddEntryBG(?Extended_Data,?Extended_Data{PROP:Color},,GLO:2in1)
EntriesPosition_ROUTINE     ROUTINE                !Re-draw the entries if the window changed
  CoolEntryFields.RefreshEntry(?Extended_Data,GLO:2in1)
ResizeButtons_ROUTINE ROUTINE
      Buttonz.ResizeButtons(?Update_Theme_BTN,GLO:2in1)
      Buttonz.ResizeButtons(?Save_as_New_Theme_BTN,GLO:2in1)
InitButtonz_ROUTINE    ROUTINE                !Pass buttons to the Cool Buttons Class
      Buttonz.AddButtonMimic(?Update_Theme_BTN,?Update_Theme_BTN{PROP:Color},,GLO:2in1)
      Buttonz.AddButtonMimic(?Save_as_New_Theme_BTN,?Save_as_New_Theme_BTN{PROP:Color},,GLO:2in1)
RebuildButtonz_ROUTINE     ROUTINE                !Re-draw the buttons if the window changed
  Buttonz.RebuildButtons(?Update_Theme_BTN,GLO:2in1)
  Buttonz.RebuildButtons(?Save_as_New_Theme_BTN,GLO:2in1)
ButtonzPosition_ROUTINE     ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode, Legacy, it should dissapear										
 DO Enable2in1Buttons_ROUTINE
Enable2in1Buttons_ROUTINE ROUTINE     	!Re-draw the buttons if the window changed in 2 in 1 mode
  Buttonz.Buttons2in1(?Update_Theme_BTN,GLO:2in1)
  Buttonz.Buttons2in1(?Save_as_New_Theme_BTN,GLO:2in1)
SetThemeWallpaper_ROUTINE ROUTINE

ThisWindow.Init PROCEDURE

ReturnValue          BYTE,AUTO

  CODE
  GlobalErrors.SetProcedureName('Universe_NG')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Universe_Area
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  Relate:A_Neurons.Open()                                  ! File A_Neurons used by this procedure, so make sure it's RelationManager is open
  Relate:Lists.SetOpenRelated()
  Relate:Lists.Open()                                      ! File Lists used by this procedure, so make sure it's RelationManager is open
  Relate:Themes.Open()                                     ! File Themes used by this procedure, so make sure it's RelationManager is open
  Access:Thoughts.UseFile()                                ! File referenced in 'Other Files' so need to inform it's FileManager
  Access:Neurons.UseFile()                                 ! File referenced in 'Other Files' so need to inform it's FileManager
  SELF.FilesOpened = True
  BRW19.Init(?List,Queue:Browse.ViewPosition,BRW19::View:Browse,Queue:Browse,Relate:Lists,SELF) ! Initialize the browse manager
  BRW21.Init(?List:2,Queue:Browse:1.ViewPosition,BRW21::View:Browse,Queue:Browse:1,Relate:Themes,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?Neuron_Work_Area_SHEET{PROP:TabSheetStyle} = TabStyle:Colored
  ?Themes_Sheet{PROP:TabSheetStyle} = TabStyle:Colored
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  ?THO:Thought{PROP:LineHeight} = 13
  ?List{PROP:LineHeight} = 13
  ?List:2{PROP:LineHeight} = 13
  Do DefineListboxStyle
  0{PROP:Buffer} = 1
  0{PROP:Pixels} = 1
  ?TOOLBAR{PROP:Height} = 50
  Resizer.Init(AppStrategy:Centered)                       ! Don't change the windows controls when window resized
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW19.Q &= Queue:Browse
  BRW19.FileLoaded = 1                                     ! This is a 'file loaded' browse
  BRW19.AddSortOrder(,LIS:Neuron_ID_Key)                   ! Add the sort order for LIS:Neuron_ID_Key for sort order 1
  BRW19.AddRange(LIS:Neuron_ID,Touched_Neuron)             ! Add single value range limit for sort order 1
  BRW19.AddLocator(BRW19::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW19::Sort0:Locator.Init(,LIS:Neuron_ID,1,BRW19)        ! Initialize the browse locator using  using key: LIS:Neuron_ID_Key , LIS:Neuron_ID
  BRW19.AddField(LIS:List,BRW19.Q.LIS:List)                ! Field LIS:List is a hot field or requires assignment from browse
  BRW19.AddField(LIS:List_ID,BRW19.Q.LIS:List_ID)          ! Field LIS:List_ID is a hot field or requires assignment from browse
  BRW19.AddField(LIS:Neuron_ID,BRW19.Q.LIS:Neuron_ID)      ! Field LIS:Neuron_ID is a hot field or requires assignment from browse
  BRW21.Q &= Queue:Browse:1
  BRW21.AddSortOrder(,THM:Theme_Name_Key)                  ! Add the sort order for THM:Theme_Name_Key for sort order 1
  BRW21.AddLocator(BRW21::Sort0:Locator)                   ! Browse has a locator for sort order 1
  BRW21::Sort0:Locator.Init(,THM:ThemeName,1,BRW21)        ! Initialize the browse locator using  using key: THM:Theme_Name_Key , THM:ThemeName
  BRW21.AddResetField(LOC:ThemeUpdate)                     ! Apply the reset field
  BRW21.AddField(THM:ThemeName,BRW21.Q.THM:ThemeName)      ! Field THM:ThemeName is a hot field or requires assignment from browse
  BRW21.AddField(THM:ID,BRW21.Q.THM:ID)                    ! Field THM:ID is a hot field or requires assignment from browse
  FDCB9.Init(THO:Thought,?THO:Thought,Queue:FileDropCombo.ViewPosition,FDCB9::View:FileDropCombo,Queue:FileDropCombo,Relate:Thoughts,ThisWindow,GlobalErrors,1,0,0)
  FDCB9.SetConfirmAutoAdd(False)
  FDCB9.RemoveDuplicatesFlag = TRUE
  FDCB9.Q &= Queue:FileDropCombo
  FDCB9.AddSortOrder(THO:Tought_ID_Key)
  FDCB9.AddField(THO:Thought,FDCB9.Q.THO:Thought) !List box control field - type derived from field
  FDCB9.AddField(THO:Thought_ID,FDCB9.Q.THO:Thought_ID) !Browse hot field - type derived from field
  FDCB9.AddUpdateField(THO:Thought_ID,LOC:Active_Thought)
  ThisWindow.AddItem(FDCB9.WindowComponent)
  FDCB9.DefaultFill = 0
  BRW21.AddToolbarTarget(Toolbar)                          ! Browse accepts toolbar control
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
    Relate:A_Neurons.Close()
    Relate:Lists.Close()
    Relate:Themes.Close()
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
    OF ?THO:Thought
      Focused_Neuron = 0
      LOC:Focused_Neuron_Parent_ID = 0
      LOC:Active_Thought = THO:Thought_ID
      LC.FillTree('REBUILD')
      FDCB9.TakeAccepted()
    OF ?Update_Theme_BTN
      ThisWindow.Update()
      LC.Manage_Themes('UPDATE',THM:ID)
      LC.FillTree('REDRAW')
    OF ?Save_as_New_Theme_BTN
      ThisWindow.Update()
      LC.Manage_Themes('NEW')
    OF ?GLO:Neurons_Area
      LC.FillTree('REDRAW')
    OF ?GLO:Cell_Width
      LC.FillTree('REDRAW')
    OF ?GLO:Cell_Height
      LC.FillTree('REDRAW')
    OF ?GLO:Text_Points
      LC.FillTree('REDRAW')
    OF ?GLO:Vertical_Margin
      LC.FillTree('REDRAW')
    OF ?GLO:Horizontal_Margin
      LC.FillTree('REDRAW')
    OF ?GLO:Intercell_Gap:2
      LC.FillTree('REDRAW')
    OF ?GLO:Main_Neuron_Y_Margin
      LC.FillTree('REDRAW')
    OF ?GLO:Outline_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Text_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Label_Box_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Bezier_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Label_Text_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Label_Outline_Color
      LC.FillTree('REDRAW')
    OF ?GLO:MaxChars
      LC.FillTree('REDRAW')
    OF ?GLO:Box_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Neuron_Font
      LC.FillTree('REDRAW')
    OF ?Select_Neuron_Font_BTN
      ThisWindow.Update()
      IF FONTDIALOG('Choose Display Font',GLO:Neuron_Font,GLO:Text_Points,GLO:Text_Color,GLO:Text_Style,0)
      
      
      ELSE
      
      
      
      END
    OF ?Pick_Text_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Text_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Neurons_Fill_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Box_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Label_Outline_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Label_Outline_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Label_Fill_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Label_Box_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Label_Text_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Label_Text_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Bezier_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Bezier_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?GLO:Central_Neuron_Extra_Height
      LC.FillTree('REDRAW')
    OF ?GLO:Round_Button_Text_Points
      LC.FillTree('REDRAW')
    OF ?GLO:Round_Button_Outline_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Round_Button_Text_Color
      LC.FillTree('REDRAW')
    OF ?GLO:Round_Button_Box_Color
      LC.FillTree('REDRAW')
    OF ?GLO:RoundButton_Height
      LC.FillTree('REDRAW')
    OF ?GLO:RoundButton_Width
      LC.FillTree('REDRAW')
    OF ?Pick_Round_Button_Outline_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Round_Button_Outline_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Round_Button_Text_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Round_Button_Text_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Round_Button_Box_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Round_Button_Box_Color)
          DO Color_Fields_ROUTINE
      END
      
    OF ?GLO:IconColor
      LC.FillTree('REDRAW')
    OF ?GLO:IconBG
      LC.FillTree('REDRAW')
    OF ?GLO:Icon_Size
      LC.FillTree('REDRAW')
    OF ?Pick_Text_Color:7
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:IconColor)
          DO Color_Fields_ROUTINE
      END
      
    OF ?GLO:Gradient_Start
      LC.FillTree('REDRAW')
    OF ?GLO:Gradient_End
      LC.FillTree('REDRAW')
    OF ?Pick_Gradient_Start_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Gradient_Start)
          DO Color_Fields_ROUTINE
      END
      
    OF ?Pick_Gradient_End_Color
      ThisWindow.Update()
      IF COLORDIALOG('Pick text color', GLO:Gradient_End)
          DO Color_Fields_ROUTINE
      END
      
    OF ?GLO:Debug_DB
      LC.FillTree('REDRAW')
    END
    !LC.FillTree('REDRAW')
    !MESSAGE('Redrwa end of loop')
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
  !MESSAGE(EVENT())
  
  CASE EVENT()
  
  OF EVENT:RePaint
  	
  	MESSAGE('RePaint Event Posted')
  	LC.FillTree('REDRAW')
  
  OF 4
  	
      !PRESSKEY(DownKey)
      
  
  OF 3
      !MESSAGE('Wheel Up')
      !PRESSKEY(UpKey)
  
  OF EVENT:AlertKey
      
      CASE KEYCODE()
      
      END !CASE KEYCODE   
      
  OF EVENT:PreAlertKey
      
      CASE KEYCODE()
      
      OF MouseRightUp
          
          LC.Manage_GDI_Clicks('MouseRightUp')
          
      OF MouseLeftUp
  
          LC.Manage_GDI_Clicks('MouseLeftUp')
      
      OF MouseLeft2
          
          LC.Manage_GDI_Clicks('MouseLeft2')
          
      OF MouseRight2
          
      
      OF DownKey
  
          !LC.FillTree('DOWN')
          !SetKeyCode(0h)
      
      OF UpKey
  
          
      OF HomeKey
          !LC.FillTree('HOME')
          !SetKeyCode(0h)
      
      OF EndKey
          !LC.FillTree('END')
          !SetKeyCode(0h)
      
      OF PgDnKey
          !LC.FillTree('PAGE_DOWN')
          !SetKeyCode(0h)
      
      OF PgUpKey
          !LC.FillTree('PAGE_UP')
          !SetKeyCode(0h)
          
      
      END !CASE KEYCODE   
  END !CASE:EVENT
  
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


ThisWindow.TakeFieldEvent PROCEDURE

ReturnValue          BYTE,AUTO

Looped BYTE
  CODE
  LOOP                                                     ! This method receives all field specific events
    IF Looped
      RETURN Level:Notify
    ELSE
      Looped = 1
    END
  ReturnValue = PARENT.TakeFieldEvent()
  CASE FIELD()
  OF ?GLO:Gradient_Orientation:2
    LC.FillTree('REDRAW')
  OF ?GLO:Gradient_Options
    LC.FillTree('REDRAW')
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
    OF EVENT:GainFocus
      LC.FillTree('REDRAW')
    OF EVENT:Notify
      LC.FillTree('REDRAW')
    OF EVENT:OpenWindow
      Focused_Neuron = 0
      LOC:Focused_Neuron_Parent_ID = 0
      0{PROP:Pixels} = TRUE
      
      DO Layout_ROUTINE
      
      ReturnedVal# = WinGDI.Allocate(?Universe_Area)
    END
    RETURN ReturnValue
  END
  ReturnValue = Level:Fatal
  RETURN ReturnValue

LC.Manage_Themes    PROCEDURE(STRING Action,<LONG Theme_ID>)


CODE
	
	CASE Action
	
	OF 'LOAD'
		DO Load_Theme_ROUTINE
		
	OF 'UPDATE'
		DO Update_Theme_ROUTINE
		
	OF 'NEW'
		DO New_Theme_ROUTINE
	
	END !CASE
	
	
	RETURN
	
Load_Theme_ROUTINE  ROUTINE
	
	CLEAR(THM:Record)
	THM:ID = Theme_ID
	GET(Themes,THM:ID_Theme_Color_Key)
	IF NOT ERRORCODE()


		GLO:Cell_Width = THM:Cell_Width
		GLO:MaxChars = THM:MaxChars
		GLO:Neurons_Area = THM:Neurons_Area
		GLO:IconColor = THM:IconColor
		GLO:IconBG = THM:IconBG
		GLO:Icon_Size = THM:Icon_Size
		GLO:Debug_DB = THM:Debug_DB
		GLO:Menu_Height = THM:Menu_Height
		GLO:Menu_Width = THM:Menu_Width
		GLO:Cell_Height = THM:Cell_Height
		GLO:Central_Neuron_Extra_Height = THM:Central_Neuron_Extra_Height
		GLO:Text_Points = THM:Text_Points
		GLO:Horizontal_Margin = THM:Horizontal_Margin
		GLO:Vertical_Margin = THM:Vertical_Margin
		GLO:Intercell_Gap = THM:Intercell_Gap
		GLO:Main_Neuron_Y_Margin = THM:Main_Neuron_Y_Margin
		GLO:Outline_Color = THM:Outline_Color
		GLO:Label_Outline_Color = THM:Label_Outline_Color
		GLO:Box_Color = THM:Box_Color
		GLO:Label_Box_Color = THM:Label_Box_Color
		GLO:Text_Color = THM:Text_Color
		GLO:Label_Text_Color = THM:Label_Text_Color
		GLO:Bezier_Color = THM:Bezier_Color
		GLO:Gradient_Start = THM:Gradient_Start
		GLO:Gradient_End = THM:Gradient_End
		GLO:Gradient_Options = THM:Gradient_Options
		GLO:Gradient_Orientation = THM:Gradient_Orientation
		GLO:RoundButton_Height = THM:RoundButton_Height
		GLO:RoundButton_Width = THM:RoundButton_Width
		GLO:Round_Button_Text_Points = THM:Round_Button_Text_Points
		GLO:Round_Button_Outline_Color = THM:Round_Button_Outline_Color
		GLO:Round_Button_Box_Color = THM:Round_Button_Box_Color
		GLO:Round_Button_Text_Color = THM:Round_Button_Text_Color
		GLO:Neuron_Font = THM:Neuron_Font
		GLO:Label_Font = THM:Label_Font
	END

	
	
	EXIT

New_Theme_ROUTINE   ROUTINE
	
	CLEAR(THM:RecorD)
	
	
	THM:ThemeName  = ''
	THM:Cell_Width = GLO:Cell_Width
	THM:MaxChars = GLO:MaxChars
	THM:Neurons_Area = GLO:Neurons_Area
	THM:IconColor = GLO:IconColor
	THM:IconBG = GLO:IconBG
	THM:Icon_Size = GLO:Icon_Size
	THM:Debug_DB = GLO:Debug_DB
	THM:Menu_Height = GLO:Menu_Height
	THM:Menu_Width = GLO:Menu_Width
	THM:Cell_Height = GLO:Cell_Height
	THM:Central_Neuron_Extra_Height = GLO:Central_Neuron_Extra_Height
	THM:Text_Points = GLO:Text_Points
	THM:Horizontal_Margin = GLO:Horizontal_Margin
	THM:Vertical_Margin = GLO:Vertical_Margin
	THM:Intercell_Gap = GLO:Intercell_Gap
	THM:Main_Neuron_Y_Margin = GLO:Main_Neuron_Y_Margin
	THM:Outline_Color = GLO:Outline_Color
	THM:Label_Outline_Color = GLO:Label_Outline_Color
	THM:Box_Color = GLO:Box_Color
	THM:Label_Box_Color = GLO:Label_Box_Color
	THM:Text_Color = GLO:Text_Color
	THM:Label_Text_Color = GLO:Label_Text_Color
	THM:Bezier_Color = GLO:Bezier_Color
	THM:Gradient_Start = GLO:Gradient_Start
	THM:Gradient_End = GLO:Gradient_End
	THM:Gradient_Options = GLO:Gradient_Options
	THM:Gradient_Orientation = GLO:Gradient_Orientation
	THM:RoundButton_Height = GLO:RoundButton_Height
	THM:RoundButton_Width = GLO:RoundButton_Width
	THM:Round_Button_Text_Points = GLO:Round_Button_Text_Points
	THM:Round_Button_Outline_Color = GLO:Round_Button_Outline_Color
	THM:Round_Button_Box_Color = GLO:Round_Button_Box_Color
	THM:Round_Button_Text_Color = GLO:Round_Button_Text_Color
	THM:Neuron_Font = GLO:Neuron_Font
	THM:Label_Font = GLO:Label_Font
	
	GlobalRequest = InsertRecord
	Update_Themes()
	
	CASE GlobalResponse
	
	OF RequestCompleted
		LOC:ThemeUpdate += 1
	END
	
	
	EXIT
	
	

Update_Theme_ROUTINE        ROUTINE

	CLEAR(THM:Record)
	THM:ID = Theme_ID
	GET(Themes,THM:ID_Theme_Color_Key)
	
	IF NOT ERRORCODE()
		
		THM:Cell_Width = GLO:Cell_Width
		THM:MaxChars = GLO:MaxChars
		THM:Neurons_Area = GLO:Neurons_Area
		THM:IconColor = GLO:IconColor
		THM:IconBG = GLO:IconBG
		THM:Icon_Size = GLO:Icon_Size
		THM:Debug_DB = GLO:Debug_DB
		THM:Menu_Height = GLO:Menu_Height
		THM:Menu_Width = GLO:Menu_Width
		THM:Cell_Height = GLO:Cell_Height
		THM:Central_Neuron_Extra_Height = GLO:Central_Neuron_Extra_Height
		THM:Text_Points = GLO:Text_Points
		THM:Horizontal_Margin = GLO:Horizontal_Margin
		THM:Vertical_Margin = GLO:Vertical_Margin
		THM:Intercell_Gap = GLO:Intercell_Gap
		THM:Main_Neuron_Y_Margin = GLO:Main_Neuron_Y_Margin
		THM:Outline_Color = GLO:Outline_Color
		THM:Label_Outline_Color = GLO:Label_Outline_Color
		THM:Box_Color = GLO:Box_Color
		THM:Label_Box_Color = GLO:Label_Box_Color
		THM:Text_Color = GLO:Text_Color
		THM:Label_Text_Color = GLO:Label_Text_Color
		THM:Bezier_Color = GLO:Bezier_Color
		THM:Gradient_Start = GLO:Gradient_Start
		THM:Gradient_End = GLO:Gradient_End
		THM:Gradient_Options = GLO:Gradient_Options
		THM:Gradient_Orientation = GLO:Gradient_Orientation
		THM:RoundButton_Height = GLO:RoundButton_Height
		THM:RoundButton_Width = GLO:RoundButton_Width
		THM:Round_Button_Text_Points = GLO:Round_Button_Text_Points
		THM:Round_Button_Outline_Color = GLO:Round_Button_Outline_Color
		THM:Round_Button_Box_Color = GLO:Round_Button_Box_Color
		THM:Round_Button_Text_Color = GLO:Round_Button_Text_Color
		THM:Neuron_Font = GLO:Neuron_Font
		THM:Label_Font = GLO:Label_Font
		PUT(Themes)
		
	END
	
	EXIT
LC.FillTree         PROCEDURE(STRING Action)

FEQ_PTR                 LONG
Line_Height             LONG
Max_Lines               LONG
Box_Width               LONG
Box_Height              LONG
Box_Center_X            LONG
Box_Center_Y            LONG

Percentile_Units        LONG
Joint_Quotations        STRING(256)
Date_Separator          CSTRING(5)

Y_Pos                   LONG
X_Pos                   LONG
XX                      ULONG
YY                      ULONG
AbsX                    LONG
AbsY                    LONG
BXX                     ULONG
BYY                     ULONG
BW                      ULONG
BH                      ULONG

Quotation_Detail_Header BYTE
Quotation_Detail_Delivery_Header        BYTE
Packs_Header            BYTE

Neuron_With_Header      QUEUE,PRE(Neuron_With_Header)
StartX                      LONG
StartY                      LONG
Cell_Width                  LONG
Cell_Height                 LONG
BoxColor                    ULONG
OutlineColor                ULONG
Cell_Roundness              LONG
Label_Cell_Width            LONG
Label_Cell_Height           LONG
Label_BoxColor              ULONG
Label_OutlineColor          ULONG
Label_Cell_Roundness        LONG
Label_Text                  STRING(1024)
Label_Left_Padding          LONG
Label_Top_Padding           LONG
Label_Justify               STRING(32)
Label_FontFace              STRING(32)
Label_FontPoints            LONG
Label_FontColor             ULONG
Data_Text                   STRING(1024)
Data_Left_Padding           LONG
Data_Top_Padding            LONG
Data_Justify                CSTRING(64)
Data_FontFace               STRING(128)
Data_FontPoints             LONG
Data_FontColor              ULONG

                        END


RoundButton             GROUP,PRE(RoundButton)
StartX                      LONG
StartY                      LONG
Cell_Width                  LONG
Cell_Height                 LONG
BoxColor                    ULONG
OutlineColor                ULONG
Cell_Roundness              LONG
Label_Cell_Width            LONG
Label_Cell_Height           LONG
Label_BoxColor              ULONG
Label_OutlineColor          ULONG
Label_Cell_Roundness        LONG
Label_Text                  STRING(1024)
Label_Left_Padding          LONG
Label_Top_Padding           LONG
Label_Justify               STRING(32)
Label_FontFace              STRING(32)
Label_FontPoints            LONG
Label_FontColor             ULONG
Data_Text                   STRING(1024)
Data_Left_Padding           LONG
Data_Top_Padding            LONG
Data_Justify                CSTRING(64)
Data_FontFace               STRING(128)
Data_FontPoints             LONG
Data_FontColor              ULONG

                        END



Print_Quotation_Detail_Header   BYTE
Print_Quotation_Delivery_Header BYTE
Print_Quotation_Packs_Header    BYTE





MouseDownX              LONG
MouseDownY              LONG
ThisQRec                LONG
XX                      LONG
YY                      LONG
Horizontal_Padding      LONG
Vertical_Padding        LONG
Former_Menu_Width       LONG

This_Menu               STRING(32)
End_X                   LONG


Menu                    GROUP
StartX                      LONG
StartY                      LONG
Cell_Width                  LONG
Cell_Height                 LONG
BoxColor                    ULONG
OutlineColor                ULONG
Cell_Roundness              LONG
Label_Cell_Width            LONG
Label_Cell_Height           LONG
Label_BoxColor              ULONG
Label_OutlineColor          ULONG
Label_Cell_Roundness        LONG
Label_Text                  STRING(1024)
Label_Left_Padding          LONG
Label_Top_Padding           LONG
Label_Justify               STRING(32)
Label_FontFace              STRING(32)
Label_FontPoints            LONG
Label_FontColor             ULONG
Data_Text                   STRING(1024)
Data_Left_Padding           LONG
Data_Top_Padding            LONG
Data_Justify                CSTRING(64)
Data_FontFace               STRING(128)
Data_FontPoints             LONG
Data_FontColor              ULONG
                        END



!Neuron
Neuron                  GROUP,PRE(Neuron)
StartX                      LONG
StartY                      LONG
Width                       LONG
Height                      LONG
BoxColor                    ULONG
OutlineColor                ULONG
Roundness                   LONG
Ypos                        LONG


!Axon

Axon_Root                   LONG
Left_Axon_StartX            LONG
Left_Axon_StartY            LONG

Right_Axon_StartX           LONG
Right_Axon_StartY           LONG

Center_Axon_StartX          LONG
Center_Axon_StartY          LONG





Label_Width                 LONG
Label_Height                LONG
Label_BoxColor              ULONG
Label_OutlineColor          ULONG
Label_Roundness             LONG
Label_Text                  STRING(1024)
Label_Left_Padding          LONG
Label_Top_Padding           LONG
Label_Justify               STRING(32)
Label_FontFace              STRING(32)
Label_FontPoints            LONG
Label_FontColor             ULONG
Data_Text                   STRING(1024)
Data_Left_Padding           LONG
Data_Top_Padding            LONG
Data_Justify                CSTRING(64)
Data_FontFace               STRING(128)
Data_FontPoints             LONG
Data_FontColor              ULONG

DC_Anchor                   DECIMAL(6)
Half_DC_Anchor              DECIMAL(6)


                        END



Columns                 GROUP,PRE(Columns)

FarLeft_Column_XPos         LONG
FarLeft_Column_YPos         LONG
FarLeft_Column_Width        LONG
FarLeft_Column_Height       LONG

FarRight_Column_XPos        LONG
FarRight_Column_YPos        LONG
FarRight_Column_Width       LONG
FarRight_Column_Height      LONG

UpperLeft_Column_XPos       LONG
UpperLeft_Column_YPos       LONG
UpperLeft_Column_Width      LONG
UpperLeft_Column_Height     LONG

UpperCenter_Column_XPos     LONG
UpperCenter_Column_YPos     LONG
UpperCenter_Column_Width    LONG
UpperCenter_Column_Height   LONG

UpperRight_Column_XPos      LONG
UpperRight_Column_YPos      LONG
UpperRight_Column_Width     LONG
UpperRight_Column_Height    LONG

LowerLeft_Column_XPos       LONG
LowerLeft_Column_YPos       LONG
LowerLeft_Column_Width      LONG
LowerLeft_Column_Height     LONG
LowerLeft_Column_Max_Items  UNSIGNED

LowerCenter_Column_XPos     LONG
LowerCenter_Column_YPos     LONG
LowerCenter_Column_Width    LONG
LowerCenter_Column_Height   LONG

LowerRight_Column_XPos      LONG
LowerRight_Column_YPos      LONG
LowerRight_Column_Width     LONG
LowerRight_Column_Height    LONG
LowerRight_Column_Max_Items UNSIGNED

Top_Margin                  LONG
Margin                      LONG
Width                       LONG
Height                      LONG

StartX                      LONG
StartY                      LONG

                        END

Search_Match            BYTE
GreenBar                BYTE
Items_Per_Page          UNSIGNED(30)
Shall_Debug             BYTE

!Focused_Neuron          LONG
Neuron_Position         CSTRING(3)

Focused_Neuron_Coords   GROUP,PRE(Focused_Neuron_Coords)
StartX                      LONG
StartY                      LONG
EndX                        LONG
EndY                        LONG
                        END

Touched_Neuron_Coords   GROUP,PRE(Touched_Neuron_Coords)
StartX                      LONG
StartY                      LONG
EndX                        LONG
EndY                        LONG
                        END



!Anchors
DC_Anchor               LONG
Anchor_Circle           UNSIGNED



Child_Neurons_Queue     QUEUE,PRE(CN)
PTR                         LONG
StartX                      LONG
StartY                      LONG
EndX                        LONG
EndY                        LONG
LeftAnchorX                 LONG
LeftAnchorY                 LONG
RightAnchorX                LONG
RightAnchorY                LONG
TopAnchorX                  LONG
TopAnchorY                  LONG
IconStartX                  LONG
IconStartY                  LONG
IconEndX                    LONG
IconEndY                    LONG
IconUsed                    STRING(1)
                        END

Parent_Neurons_Queue    QUEUE,PRE(PN)
PTR                         LONG
StartX                      LONG
StartY                      LONG
EndX                        LONG
EndY                        LONG
LeftAnchorX                 LONG
LeftAnchorY                 LONG
RightAnchorX                LONG
RightAnchorY                LONG
BottomAnchorX               LONG
BottomAnchorY               LONG

                        END

Neurons_Area_Width      ULONG

Fonts                   GROUP,PRE(Fonts)
Neurons_FontFace            STRING(64)
Touched_Neuron_FontFace     STRING(64)
Focused_FontFace            STRING(64)
Labels_FontFace             STRING(64)
                        END


Beziers                 QUEUE,PRE(Beziers)
StartX                      LONG
StartY                      LONG
EndX                        LONG
EndY                        LONG
                        END






CODE
    
    
    DISPLAY()
    
    CASE UPPER(Action)
    
    OF 'INIT'
        
        DO Init_ROUTINE

        
    OF 'REDRAW'
		
        DO Render_Data_Queue_ROUTINE
        
    OF 'REBUILD'
        
        DO Render_Data_Queue_ROUTINE
        
		
    OF 'CLEAN'
        
        
    OF 'PAGE_DOWN'

        
    OF 'PAGE_UP'
        

        
    OF 'DOWN'
        

    OF 'UP'
        
        
    OF 'HOME'
       

        
    OF 'END'
        
        
    END !CASE

    
    RETURN
    
Init_ROUTINE        ROUTINE


    Shall_Debug = FALSE
	
    Neuron_Position = ''
	
    Percentile_Units = INT(0{PROP:Width} / 100)
    Neurons_Area_Width = GLO:Neurons_Area * Percentile_Units
	
    DO Layout_ROUTINE

    DISPLAY(?Universe_Area) !Let's output the mod, try to comment the line and see what happens...
    
    LOC:This_Parent = ?Universe_Area{PROP:Parent} !Identify the parent
	
	!Set variables

    Box_Height = ?Universe_Area{PROP:Height}
    Box_Width = ?Universe_Area{PROP:Width}
    Box_Center_X =  Box_Width / 2
    Box_Center_Y = Box_Height / 2
	
	
    Fonts.Neurons_FontFace        = CLIP(GLO:Neuron_Font)
    Fonts.Touched_Neuron_FontFace = CLIP(GLO:Neuron_Font)
    Fonts.Focused_FontFace        = CLIP(GLO:Neuron_Font)
    Fonts.Labels_FontFace        = CLIP(GLO:Label_Font)
	
    CLEAR(NEU:Record)
    CLEAR(A_NEU:Record)
	
    DO Define_Columns_and_Neuron_ROUTINE !let's define the different columns...
	
    EXIT
	

Define_Columns_and_Neuron_ROUTINE   ROUTINE
	
	!Neuron
    Neuron.Ypos = Box_Center_Y + GLO:Main_Neuron_Y_Margin
    Neuron.Width = GLO:Cell_Width
    Neuron.Height = GLO:Cell_Height
    Neuron.DC_Anchor = 8
    Neuron.Half_DC_Anchor = Neuron.DC_Anchor!INT(Neuron.DC_Anchor)
	
    Columns.Top_Margin = GLO:Vertical_Margin
    Columns.Margin = GLO:Horizontal_Margin
    Columns.Width = Neuron.Width 
    Columns.Height = 40 * Percentile_Units !40%
	
	!Lower Left Column
	 
    Columns.LowerLeft_Column_XPos = Box_Center_X - (Columns.Margin / 2) - Columns.Width 
    Columns.LowerLeft_Column_Ypos = Neuron.Ypos + Neuron.Height + Columns.Top_Margin + Neuron.DC_Anchor
    Columns.LowerLeft_Column_Height = Columns:Height
    Columns.LowerLeft_Column_Width = Columns:Width
	
	!Lower Right Column
	 
    Columns.LowerRight_Column_XPos = Box_Center_X + (Columns.Margin / 2) 
    Columns.LowerRight_Column_Ypos = Neuron.Ypos + Neuron.Height + Columns.Top_Margin + Neuron.DC_Anchor
    Columns.LowerRight_Column_Height = Columns:Height
    Columns.LowerRight_Column_Width = Columns:Width		


	!Far Left Column
    Columns.FarLeft_Column_XPos = 0 + Columns:Margin
    Columns.FarLeft_Column_Ypos = 0 + Columns:Top_Margin
    Columns.FarLeft_Column_Height = Columns:Height * 2
    Columns.FarLeft_Column_Width = Columns:Width
	
	!Far Right Column

    Columns.FarRight_Column_XPos = Box_Width - Columns:Margin - Columns:Width 
    Columns.FarRight_Column_Ypos = 0 + Columns:Top_Margin
    Columns.FarRight_Column_Height = Columns:Height * 2
    Columns.FarRight_Column_Width = Columns:Width
	
	!Upper Left Column
	 
    Columns.UpperLeft_Column_XPos = Columns.FarRight_Column_XPos + Columns.FarRight_Column_Width
    Columns.UpperLeft_Column_Ypos = 0 + Columns:Top_Margin
    Columns.UpperLeft_Column_Height = Columns:Height
    Columns.UpperLeft_Column_Width = Columns:Width
	
	!Upper Right Column
	 
    Columns.UpperRight_Column_XPos = Columns.UpperLeft_Column_XPos + Columns.UpperLeft_Column_Width
    Columns.UpperRight_Column_Ypos = 0 + Columns:Top_Margin
    Columns.UpperRight_Column_Height = Columns:Height
    Columns.UpperRight_Column_Width = Columns:Width
	

    Columns.LowerRight_Column_Max_Items = INT(Columns.LowerRight_Column_Height / (Neuron.Half_DC_Anchor + Columns.Top_Margin))
    Columns.LowerLeft_Column_Max_Items = INT(Columns.LowerLeft_Column_Height / (Neuron.Half_DC_Anchor + Columns.Top_Margin))
		
    Anchor_Circle = 8
	
    EXIT
		
Fill_Neurons_QUEUE_ROUTINE  ROUTINE
	
	
    DO Draw_Child_Neurons_ROUTINE
    DO Draw_Focused_Neuron_ROUTINE
	
    EXIT

Draw_Focused_Neuron_ROUTINE ROUTINE
	
    Neuron_With_Header.StartX                          = Box_Center_X - (Neuron.Width / 2)
    Neuron_With_Header.StartY                          = Neuron.Ypos
    Neuron_With_Header.Cell_Width                      = Neuron.Width
    Neuron_With_Header.Cell_Height                     = Neuron.Height + GLO:Central_Neuron_Extra_Height
    Neuron_With_Header.BoxColor                        = GLO:Box_Color
    Neuron_With_Header.OutlineColor                    = GLO:Outline_Color    
    Neuron_With_Header.Cell_Roundness                  = 5
    Neuron_With_Header.Label_Cell_Width                = Neuron.Width - 20
    Neuron_With_Header.Label_Cell_Height               = 14
    Neuron_With_Header.Label_BoxColor                  = GLO:Label_Box_Color
    Neuron_With_Header.Label_OutlineColor              = GLO:Label_Outline_Color
    Neuron_With_Header.Label_Cell_Roundness            = 5
    Neuron_With_Header.Label_Text                      = CLIP(THO:Thought)
    Neuron_With_Header.Label_Left_Padding              = 0
    Neuron_With_Header.Label_Top_Padding               = 1
    Neuron_With_Header.Label_Justify                   = 'Center'
    Neuron_With_Header.Label_FontFace                  = Fonts.Labels_FontFace
    Neuron_With_Header.Label_FontPoints                = 10
    Neuron_With_Header.Label_FontColor                 = GLO:Label_Text_Color
	
    IF GLO:Debug_DB = TRUE
        Neuron_With_Header.Data_Text                       = 'ID=' & NEU:Neuron_ID & ' PID=' & NEU:Parent_ID & ' ' & NEU:Brief
    ELSE
        Neuron_With_Header.Data_Text                       = CLIP(NEU:Brief)
    END
	
    IF LEN(CLIP(Neuron_With_Header.Data_Text)) > GLO:MaxChars
        Neuron_With_Header.Data_Text = SUB(Neuron_With_Header.Data_Text,1,GLO:MaxChars) & '...'
    END
	
	
    Neuron_With_Header.Data_Left_Padding               = 0
    Neuron_With_Header.Data_Top_Padding                = 18
    Neuron_With_Header.Data_Justify                    = 'Center'
    Neuron_With_Header.Data_FontFace                   = Fonts.Focused_FontFace
    Neuron_With_Header.Data_FontPoints                 = GLO:Text_Points
    Neuron_With_Header.Data_FontColor                 = GLO:Text_Color
	!Neuron_With_Header.BoxColor                        = 0!Fast.MixColors(Neuron_With_Header.BoxColor,COLOR:Black,15)
	
    Neuron.Center_Axon_StartX = Neuron_With_Header.StartX + (Neuron.Width / 2)
    Neuron.Center_Axon_StartY = Neuron_With_Header.StartY + Neuron.Height + GLO:Central_Neuron_Extra_Height

	!Let's set the coords of the Focused Neuron
    Focused_Neuron_Coords.StartX = Neuron_With_Header.StartX
    Focused_Neuron_Coords.StartY = Neuron_With_Header.StartY
    Focused_Neuron_Coords.EndX = Neuron_With_Header.StartX + Neuron_With_Header.Cell_Width
    Focused_Neuron_Coords.EndX = Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height
	
    DO Draw_Neuron_With_Header_ROUTINE
	
    RoundButton.StartX                          = INT(Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 4))
    RoundButton.StartY                          =  INT(Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height)
    RoundButton.Cell_Width                      = Neuron.Width
    RoundButton.Cell_Height                     = Neuron.Height + GLO:Central_Neuron_Extra_Height
    RoundButton.BoxColor                        = GLO:Round_Button_Box_Color
    RoundButton.OutlineColor                    = GLO:Round_Button_Outline_Color
    RoundButton.Data_Text                       = '+'
    RoundButton.Data_Left_Padding               = 0
    RoundButton.Data_Top_Padding                = 18
    RoundButton.Data_Justify                    = 'Center'
    RoundButton.Data_FontFace                   = Fonts.Focused_FontFace
    RoundButton.Data_FontPoints                 = GLO:Round_Button_Text_Points
    RoundButton.Data_FontColor                 = GLO:Round_Button_Text_Color
	
    DO Draw_Round_Buttons_ROUTINE
	
    LC.Add_Area('Add Neuron',POINTER(Neurons),RoundButton.StartX,RoundButton.StartY,RoundButton.StartX + RoundButton.Cell_Width,RoundButton.StartY + RoundButton.Cell_Height)
	
    DISPLAY(?Extended_Data)
	
	
    EXIT
	
Draw_Parents_ROUTINE        ROUTINE

DATA

Cell_StartX LONG
Cell_StartY LONG
What_Column CSTRING(10)
LeftColumn_StartX   LONG
LeftColumn_StartY   LONG
RightColumn_StartX  LONG
RightColumn_StartY  LONG



CODE
	


    LeftColumn_StartX    = Columns.LowerLeft_Column_XPos
    LeftColumn_StartY    = Columns.LowerLeft_Column_YPos
    RightColumn_StartX    = Columns.LowerRight_Column_XPos
    RightColumn_StartY    = Columns.LowerRight_Column_YPos

	
    IF RECORDS(Parent_Neurons_Queue) => 1 !only if we have something
        GET(Parent_Neurons_Queue,-1) !Reset the Queue
        LOOP P#=1 TO RECORDS(Parent_Neurons_Queue)
		
            GET(Parent_Neurons_Queue,P#)
            IF ERRORCODE() THEN BREAK. !Breaks the loop
            GET (A_Neurons,Parent_Neurons_Queue.PTR)
            IF ERRORCODE() THEN BREAK. !Breaks the loop
			
            Neuron_Position = '' !Where can we put the first neuron?	
			
            Neuron_With_Header.StartX                          = Focused_Neuron_Coords.StartX
            Neuron_With_Header.StartY                          = Focused_Neuron_Coords.StartY - Neuron.Height - GLO:Vertical_Margin 
            Neuron_With_Header.Cell_Width                      = Neuron.Width
            Neuron_With_Header.Cell_Height                     = Neuron.Height
            Neuron_With_Header.BoxColor                        = GLO:Box_Color
            Neuron_With_Header.OutlineColor                    = GLO:Outline_Color    
            Neuron_With_Header.Cell_Roundness                  = 5
            Neuron_With_Header.Label_Cell_Width                = Neuron.Width - 20
            Neuron_With_Header.Label_Cell_Height               = 0
            Neuron_With_Header.Label_BoxColor                  = GLO:Label_Box_Color
            Neuron_With_Header.Label_OutlineColor              = GLO:Label_Outline_Color
            Neuron_With_Header.Label_Cell_Roundness            = 5
            Neuron_With_Header.Label_Text                      = ''
            Neuron_With_Header.Label_Left_Padding              = 0
            Neuron_With_Header.Label_Top_Padding               = 1
            Neuron_With_Header.Label_Justify                   = 'Center'
            Neuron_With_Header.Label_FontFace                  = Fonts.Labels_FontFace
            Neuron_With_Header.Label_FontPoints                = 10
            Neuron_With_Header.Label_FontColor                 = GLO:Label_Text_Color
			
            IF GLO:Debug_DB = TRUE
                Neuron_With_Header.Data_Text                       = 'ID=' & A_NEU:Neuron_ID & ' PID=' & A_NEU:Parent_ID & ' ' & A_NEU:Brief
            ELSE
                Neuron_With_Header.Data_Text                       = CLIP(A_NEU:Brief)
            END
			
            IF LEN(CLIP(Neuron_With_Header.Data_Text)) > GLO:MaxChars
                Neuron_With_Header.Data_Text = SUB(Neuron_With_Header.Data_Text,1,GLO:MaxChars) & '...'
            END
	
			
            Neuron_With_Header.Data_Left_Padding               = 0
            Neuron_With_Header.Data_Top_Padding                = 18
            Neuron_With_Header.Data_Justify                    = 'Center'
            Neuron_With_Header.Data_FontFace                   = Fonts.Focused_FontFace
            Neuron_With_Header.Data_FontPoints                 = GLO:Text_Points
            Neuron_With_Header.Data_FontColor                 = GLO:Text_Color
			!Neuron_With_Header.BoxColor                        = 0!Fast.MixColors(Neuron_With_Header.BoxColor,COLOR:Black,15)
			
            DO Draw_Neuron_With_Header_ROUTINE
			
            LC.Add_Area('Neuron',POINTER(A_Neurons),Neuron_With_Header.StartX,Neuron_With_Header.StartY,Neuron_With_Header.StartX + Neuron_With_Header.Cell_Width,Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height)
	
            WinGDI.Bezier(Focused_Neuron_Coords.StartX + (GLO:Cell_Width / 2) , Focused_Neuron_Coords.StartY,|
                Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 4),Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height, GLO:Bezier_Color)!

            PUT(Parent_Neurons_Queue)
			
        END !LOOP

    END
	
    EXIT
	
	
Draw_Child_Neurons_ROUTINE  ROUTINE

DATA

Cell_StartX LONG
Cell_StartY LONG
What_Column CSTRING(10)
LeftColumn_StartX   LONG
LeftColumn_StartY   LONG
RightColumn_StartX  LONG
RightColumn_StartY  LONG



CODE
	

    LeftColumn_StartX    = Columns.LowerLeft_Column_XPos
    LeftColumn_StartY    = Columns.LowerLeft_Column_YPos
    RightColumn_StartX    = Columns.LowerRight_Column_XPos
    RightColumn_StartY    = Columns.LowerRight_Column_YPos

	
    IF RECORDS(Child_Neurons_Queue) => 1 !only if we have something
        GET(Child_Neurons_Queue,-1)
        LOOP P#=1 TO RECORDS(Child_Neurons_Queue)
		
            GET(Child_Neurons_Queue,P#)
            IF ERRORCODE() THEN BREAK. !Breaks the loop
            GET (A_Neurons,Child_Neurons_Queue.PTR)
            IF ERRORCODE() THEN BREAK. !Breaks the loop
			
            IF Columns.LowerRight_Column_Max_Items = Columns.LowerLeft_Column_Max_Items !Same number of free slots
                What_Column = 'Right'			
            END		
            IF Columns.LowerRight_Column_Max_Items > Columns.LowerLeft_Column_Max_Items !Same number of free slots				
                What_Column = 'Right'
            END
            IF Columns.LowerRight_Column_Max_Items < Columns.LowerLeft_Column_Max_Items !Same number of free slots	
                What_Column = 'Left'
            END			
			
			
            CASE What_Column

            OF 'Left'
				
                Cell_StartX = LeftColumn_StartX
                Cell_StartY = LeftColumn_StartY
				

            OF 'Right'

                Cell_StartX = RightColumn_StartX
                Cell_StartY = RightColumn_StartY
				
            END !CASE

			
            Neuron_Position = 'DR' !Where can we put the first neuron?	
			
            Neuron_With_Header.StartX                          = Cell_StartX
            Neuron_With_Header.StartY                          = Cell_StartY
            Neuron_With_Header.Cell_Width                      = Neuron.Width
            Neuron_With_Header.Cell_Height                     = Neuron.Height
            Neuron_With_Header.BoxColor                        = GLO:Box_Color
            Neuron_With_Header.OutlineColor                    = GLO:Outline_Color    
            Neuron_With_Header.Cell_Roundness                  = 5
            Neuron_With_Header.Label_Cell_Width                = Neuron.Width - 20
            Neuron_With_Header.Label_Cell_Height               = 0
            Neuron_With_Header.Label_BoxColor                  = GLO:Label_Box_Color
            Neuron_With_Header.Label_OutlineColor              = GLO:Label_Outline_Color
            Neuron_With_Header.Label_Cell_Roundness            = 5
            Neuron_With_Header.Label_Text                      = ''
            Neuron_With_Header.Label_Left_Padding              = 0
            Neuron_With_Header.Label_Top_Padding               = 1
            Neuron_With_Header.Label_Justify                   = 'Center'
            Neuron_With_Header.Label_FontFace                  = Fonts.Labels_FontFace
            Neuron_With_Header.Label_FontPoints                = 10
            Neuron_With_Header.Label_FontColor                 = GLO:Label_Text_Color
            Neuron_With_Header.Data_FontPoints                 = GLO:Text_Points
			
            IF GLO:Debug_DB = TRUE
                Neuron_With_Header.Data_Text                       = 'ID=' & A_NEU:Neuron_ID & ' PID=' & A_NEU:Parent_ID & ' ' & A_NEU:Brief
            ELSE
                Neuron_With_Header.Data_Text                       = CLIP(A_NEU:Brief)
            END
			
            IF LEN(CLIP(Neuron_With_Header.Data_Text)) > GLO:MaxChars
                Neuron_With_Header.Data_Text = SUB(Neuron_With_Header.Data_Text,1,GLO:MaxChars) & '...'
            END
	
			
            Neuron_With_Header.Data_Left_Padding               = 0
            Neuron_With_Header.Data_Top_Padding                = 18
            Neuron_With_Header.Data_Justify                    = 'Center'
			
            IF A_NEU:Neuron_ID = Touched_Neuron
                Neuron_With_Header.Data_FontFace                   = Fonts.Touched_Neuron_FontFace
                Neuron_With_Header.Data_FontPoints                 = GLO:Text_Points + 1
                ?Extended_Data{PROP:Text} = A_NEU:Extended_Data
            ELSE
                Neuron_With_Header.Data_FontFace                   = Fonts.Neurons_FontFace
            END
			
			
            Neuron_With_Header.Data_FontColor                 = GLO:Text_Color
			!Neuron_With_Header.BoxColor                        = 0!Fast.MixColors(Neuron_With_Header.BoxColor,COLOR:Black,15)
			
			
			
            LC.Add_Area('Neuron',POINTER(A_Neurons),Neuron_With_Header.StartX,Neuron_With_Header.StartY,Neuron_With_Header.StartX + Neuron_With_Header.Cell_Width,Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height)
	
            Child_Neurons_Queue.StartX = Neuron_With_Header.StartX
            Child_Neurons_Queue.StartY = Neuron_With_Header.StartY 
            Child_Neurons_Queue.EndX = Neuron_With_Header.StartX + Neuron_With_Header.Cell_Width
            Child_Neurons_Queue.EndY = Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height

			!Anchors
            Child_Neurons_Queue.LeftAnchorX = Neuron_With_Header.StartX
            Child_Neurons_Queue.LeftAnchorY = Neuron_With_Header.StartY + (Neuron_With_Header.Cell_Height / 2)
            Child_Neurons_Queue.RightAnchorX = Neuron_With_Header.StartX + Neuron_With_Header.Cell_Width
            Child_Neurons_Queue.RightAnchorY = Child_Neurons_Queue.LeftAnchorY
			
            Child_Neurons_Queue.TopAnchorX = Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 2 )
            Child_Neurons_Queue.TopAnchorY = Neuron_With_Header.StartY  
			
			
			
            Beziers.StartX =  Neuron.Center_Axon_StartX
            Beziers.StartY =  Neuron.Center_Axon_StartY
            Beziers.EndX = Child_Neurons_Queue.TopAnchorX
            Beziers.EndY = Child_Neurons_Queue.TopAnchorY

            ADD(Beziers)
			
			
            CASE What_Column

            OF 'Left'
				
                Columns.LowerLeft_Column_Max_Items -= 1
                LeftColumn_StartY += Neuron_With_Header.Cell_Height + GLO:Intercell_Gap
                WinGDI.Ellip(Child_Neurons_Queue.TopAnchorX - Anchor_Circle,Child_Neurons_Queue.TopAnchorY,Child_Neurons_Queue.TopAnchorX,Child_Neurons_Queue.TopAnchorY + Anchor_Circle,GLO:Bezier_Color,COLOR:Black)
                DO Draw_Neuron_With_Header_ROUTINE
				
                IF A_NEU:Locked = TRUE
                    Neuron_With_Header.StartX                          = Cell_StartX - Neuron.Height
                    Neuron_With_Header.StartY                          = Cell_StartY
                    Neuron_With_Header.Cell_Width                      = Neuron.Height
                    Neuron_With_Header.Cell_Height                     = Neuron.Height
					
                    DO Draw_Icon_ROUTINE
                END
				
            OF 'Right'

                Columns.LowerRight_Column_Max_Items -= 1
                RightColumn_StartY += Neuron_With_Header.Cell_Height + GLO:Intercell_Gap
                WinGDI.Ellip(Child_Neurons_Queue.TopAnchorX,Child_Neurons_Queue.TopAnchorY,Child_Neurons_Queue.TopAnchorX + Anchor_Circle,Child_Neurons_Queue.TopAnchorY + Anchor_Circle,GLO:Bezier_Color,COLOR:Black)
                DO Draw_Neuron_With_Header_ROUTINE
				
                IF A_NEU:Locked = TRUE
                    Neuron_With_Header.StartX                          = Cell_StartX + Neuron.Width
                    Neuron_With_Header.StartY                          = Cell_StartY 
                    Neuron_With_Header.Cell_Width                      = Neuron.Height
                    Neuron_With_Header.Cell_Height                     = Neuron.Height
					
                    DO Draw_Icon_ROUTINE
                END
				
            END !CASE
			
            PUT(Child_Neurons_Queue)
			
            Add(Neuron_With_Header)
			
			
        END !LOOP

    END
	
    EXIT
		
	
	
Draw_Icon_ROUTINE   ROUTINE
	

    Neuron_With_Header.BoxColor                        = 0
    Neuron_With_Header.OutlineColor                    = 0    
    Neuron_With_Header.Cell_Roundness                  = 5
    Neuron_With_Header.Label_Cell_Width                = 0
    Neuron_With_Header.Label_Cell_Height               = 0
    Neuron_With_Header.Label_BoxColor                  = 0
    Neuron_With_Header.Label_OutlineColor              = 0
    Neuron_With_Header.Label_Cell_Roundness            = 5
    Neuron_With_Header.Label_Text                      = ''
    Neuron_With_Header.Label_Left_Padding              = 0
    Neuron_With_Header.Label_Top_Padding               = 1
    Neuron_With_Header.Label_Justify                   = 'Center'
    Neuron_With_Header.Label_FontFace                  = 'Photon'
    Neuron_With_Header.Label_FontPoints                = 10
    Neuron_With_Header.Label_FontColor                 = GLO:IconColor
    Neuron_With_Header.Data_Text                       = 'l'
    Neuron_With_Header.Data_Left_Padding               = 0
    Neuron_With_Header.Data_Top_Padding                = 18
    Neuron_With_Header.Data_Justify                    = 'Center'
    Neuron_With_Header.Data_FontFace                   = 'Photon'
    Neuron_With_Header.Data_FontPoints                 = GLO:Icon_Size
    Neuron_With_Header.Data_FontColor                 = GLO:IconColor
	
    DO Draw_Neuron_With_Header_ROUTINE
	
	
    EXIT

Draw_Anchors_ROUTINE        ROUTINE
	

		
    WinGDI.Ellip(Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 2) - Neuron.Half_DC_Anchor,|
        Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height - Neuron.Half_DC_Anchor,|
        Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 2) + Neuron.DC_Anchor,|
        Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height + Neuron.DC_Anchor ,Neuron_With_Header.OutlineColor, Neuron_With_Header.BoxColor)
	
    WinGDI.Ellip(Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 2) - Neuron.Half_DC_Anchor,|
        Neuron_With_Header.StartY  - Neuron.Half_DC_Anchor,|
        Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 2) + Neuron.DC_Anchor,|
        Neuron_With_Header.StartY + Neuron.DC_Anchor, Neuron_With_Header.OutlineColor, Neuron_With_Header.BoxColor)

	
    EXIT


Draw_Neuron_With_Header_ROUTINE     ROUTINE
    
    
    WinGDI.Draw_Cell_With_Header(Neuron_With_Header.StartX, |
        Neuron_With_Header.StartY               ,|
        Neuron_With_Header.Cell_Width           ,|
        Neuron_With_Header.Cell_Height          ,|
        Neuron_With_Header.BoxColor             ,|
        Neuron_With_Header.OutlineColor         ,|
        Neuron_With_Header.Cell_Roundness       ,|
        Neuron_With_Header.Label_Cell_Width     ,|
        Neuron_With_Header.Label_Cell_Height    ,|
        Neuron_With_Header.Label_BoxColor       ,|
        Neuron_With_Header.Label_OutlineColor   ,|
        Neuron_With_Header.Label_Cell_Roundness ,|
        Neuron_With_Header.Label_Text           ,|
        Neuron_With_Header.Label_Left_Padding   ,|
        Neuron_With_Header.Label_Top_Padding    ,|
        Neuron_With_Header.Label_Justify        ,|
        Neuron_With_Header.Label_FontFace       ,|
        Neuron_With_Header.Label_FontPoints     ,|
        Neuron_With_Header.Label_FontColor      ,|
        Neuron_With_Header.Data_Text            ,|
        Neuron_With_Header.Data_Left_Padding    ,|
        Neuron_With_Header.Data_Top_Padding     ,|
        Neuron_With_Header.Data_Justify         ,|
        Neuron_With_Header.Data_FontFace        ,|
        Neuron_With_Header.Data_FontPoints      ,|        
        Neuron_With_Header.Data_FontColor      )
	
    EXIT

Draw_Round_Buttons_ROUTINE  ROUTINE
	
    RoundButton.Cell_Width                      = GLO:RoundButton_Width
    RoundButton.Cell_Height                     = GLO:RoundButton_Height
    RoundButton.StartX                          = INT(Neuron_With_Header.StartX + (Neuron_With_Header.Cell_Width / 2)) - (RoundButton.Cell_Width / 2)
    RoundButton.StartY                          =  INT(Neuron_With_Header.StartY + Neuron_With_Header.Cell_Height) - (RoundButton.Cell_Height  / 2)
    RoundButton.BoxColor                        = GLO:Round_Button_Box_Color
    RoundButton.OutlineColor                    = GLO:Round_Button_Outline_Color
    RoundButton.Data_Text                       = '+'
    RoundButton.Data_Left_Padding               = 0
    RoundButton.Data_Top_Padding                = 18
    RoundButton.Data_Justify                    = 'Center'
    RoundButton.Data_FontFace                   = Fonts.Focused_FontFace
    RoundButton.Data_FontPoints                 = GLO:Round_Button_Text_Points
    RoundButton.Data_FontColor                  = GLO:Round_Button_Text_Color
    RoundButton.Data_Left_Padding               = 0
	
    WinGDI.DrawRoundButton(RoundButton.StartX ,RoundButton.StartY,RoundButton.Cell_Width,RoundButton.Cell_Height,|
        RoundButton.BoxColor,RoundButton.OutlineColor ,RoundButton.Data_Text, |
        RoundButton.Data_Left_Padding,RoundButton.Data_Top_Padding,RoundButton.Data_Justify,|
        RoundButton.Data_FontFace,RoundButton.Data_FontPoints,RoundButton.Data_FontColor)
	
    EXIT

	
Render_Data_Queue_ROUTINE   ROUTINE

    DO Init_ROUTINE
	
    WinGDI.Load()
	
    LC.Redraw_BG()

    IF UPPER(Action) = 'REBUILD' 
        DO Create_Data_Q_ROUTINE
    END
	
    DO Find_Focused_Neuron_ROUTINE
    DO Find_Childs_ROUTINE
    DO Fill_Neurons_QUEUE_ROUTINE
    DO Find_Parents_ROUTINE
    DO Draw_Beziers_ROUTINE
    DO Draw_Parents_ROUTINE
    DO Draw_Neurons_ROUTINE

	
    IF LOC:DisplayMenu = TRUE
        DO Display_Menu_ROUTINE
    ELSE
    END

    WinGDI.Render()
    
    EXIT
    
	
Define_Neuron_ROUTINE       ROUTINE
		
    EXIT
	
Create_Data_Q_ROUTINE       ROUTINE

    IF LOC:Active_Thought <> 0 !Do we have something selected?
        0{PROP:Text} = THO:Thought
        DO Clear_Data_Queues_ROUTINE

    ELSE
		
    END
	
	
    EXIT
	
Clear_Data_Queues_ROUTINE   ROUTINE

    FREE(Q:Areas)
    FREE(Q:Menu_Areas)
    FREE(Q:BreadCrumbs)
    FREE(Q:Data_Queue)
    FREE(Child_Neurons_Queue)
    FREE(Neuron_With_Header)
    FREE(Beziers)
	
    EXIT

Find_Focused_Neuron_ROUTINE ROUTINE


    IF Focused_Neuron => 1

        CLEAR(NEU:Record) !Clear any pointers
        NEU:Neuron_ID = Focused_Neuron
        GET(Neurons,NEU:Neuron_ID_Key)
        IF NOT ERRORCODE()
            DO Draw_Focused_Neuron_ROUTINE
            LOC:Focused_Neuron_Parent_ID = NEU:Parent_ID
			
        ELSE
			
        END

    ELSE
	
        NEU:Thought_ID = LOC:Active_Thought
        GET(Neurons,NEU:Tought_ID_Key)
        IF NOT ERRORCODE()
            Focused_Neuron = NEU:Neuron_ID
            DO Draw_Focused_Neuron_ROUTINE
			!DO Find_Focused_Neuron_ROUTINE !Recursive
        END
	
    END
	
    EXIT

Find_Childs_ROUTINE ROUTINE

    FREE(Child_Neurons_Queue)	
    CLEAR(A_NEU:Record)
    A_NEU:Parent_ID = Focused_Neuron
    SET(A_NEU:Neuron_Parent_ID_Key,A_NEU:Neuron_Parent_ID_Key)
    LOOP
        NEXT(A_Neurons)
        IF ERRORCODE() THEN BREAK.
        IF A_NEU:Parent_ID <> Focused_Neuron THEN BREAK.
        IF A_NEU:Parent_ID = 0 THEN BREAK.
        Child_Neurons_Queue.PTR = POINTER(A_Neurons)
        ADD(Child_Neurons_Queue)
    END !LOOP

    IF Shall_Debug = TRUE
        MESSAGE('Found ' & RECORDS(Child_Neurons_Queue) & ' childs')
    END
	
    EXIT

	
Find_Parents_ROUTINE        ROUTINE
	
    FREE(Parent_Neurons_Queue)
	
    IF LOC:Focused_Neuron_Parent_ID => 1
		
        CLEAR(A_NEU:Record)
        A_NEU:Neuron_ID = LOC:Focused_Neuron_Parent_ID
        GET(A_Neurons,A_NEU:Neuron_ID_Key)
        IF NOT ERRORCODE()
            Parent_Neurons_Queue.PTR = POINTER(A_Neurons)
            ADD(Parent_Neurons_Queue)
        END
	
        IF Shall_Debug = TRUE
            MESSAGE('Found ' & RECORDS(Parent_Neurons_Queue) & ' parents')
        END
    END
	
    EXIT
	
	
	
Display_Menu_ROUTINE        ROUTINE
    
    GLO:Menu_Height = 30
    GLO:Menu_Width = 70
    Horizontal_Padding = 1
    Vertical_Padding = 1

    XX = MouseX() + ?Universe_Area{PROP:Xpos}
    YY = MouseY() + ?Universe_Area{PROP:Ypos}

    
    FREE(Q:Menu_Areas)
    
    CASE LOC:MenuActive

    OF     'Neuron Menu'
        
        This_Menu = 'CHANGE'
        Menu.StartX = XX
            Menu.StartY = YY
                Menu.Cell_Width = GLO:Menu_Width
                    Menu.Cell_Height                     = GLO:Menu_Height
                        Menu.BoxColor                        = 00701919h
                            Menu.OutlineColor                    = 00E22B8Ah
                                Menu.Cell_Roundness                  = 7
                                    Menu.Label_Cell_Width                = 0
                                        Menu.Label_Cell_Height               = 0
                                            Menu.Label_BoxColor                  = 00701919h
                                                Menu.Label_OutlineColor              = COLOR:Orange
                                                    Menu.Label_Cell_Roundness            = 0
                                                        Menu.Label_Text                      = ''
                                                            Menu.Label_Left_Padding              = 0
                                                                Menu.Label_Top_Padding               = 1
                                                                    Menu.Label_Justify                   = 'Center'
                                                                        Menu.Label_FontFace                  = 'De Valencia Regular'
                                                                            Menu.Label_FontPoints                = 10
                                                                                Menu.Label_FontColor                 = COLOR:White
                                                                                    Menu.Data_Text                       = This_Menu
                                                                                        Menu.Data_Left_Padding               = 0
                                                                                            Menu.Data_Top_Padding                = 10
                                                                                                Menu.Data_Justify                    = 'Center'
                                                                                                    Menu.Data_FontFace                   = 'De Valencia Regular'
                                                                                                        Menu.Data_FontPoints                 = 13
                                                                                                            Menu.Data_FontColor                  = 0000D7FFh

                                                                                                                DO Draw_Menu_Cell_ROUTINE

                                                                                                                End_X = XX + GLO:Menu_Width + Horizontal_Padding
                                                                                                                LC.Add_Menu_Area('Neuron', CLIP(This_Menu),LOC:NeuronPTR, XX, YY, End_X, YY + GLO:Menu_Height)


                                                                                                                XX += GLO:Menu_Width + Horizontal_Padding
                                                                                                                Menu.StartX = XX
                                                                                                                    End_X = XX + GLO:Menu_Width + Horizontal_Padding
                                                                                                                    This_Menu = 'DELETE'
                                                                                                                    Menu.Data_Text = This_Menu
                                                                                                                        DO Draw_Menu_Cell_ROUTINE
                                                                                                                        LC.Add_Menu_Area('Neuron', CLIP(This_Menu),LOC:NeuronPTR, XX, YY, End_X, YY + GLO:Menu_Height)
                                                                                                                        LOC:Is_Menu_Visible = TRUE !We just draw a menu...

                                                                                                                    END

                                                                                                                    EXIT

			
Draw_Menu_Cell_ROUTINE      ROUTINE
    
    
    WinGDI.Draw_Cell_With_Header(Menu.StartX, |
    Menu.StartY               ,|
        Menu.Cell_Width           ,|
            Menu.Cell_Height          ,|
                Menu.BoxColor             ,|
                    Menu.OutlineColor         ,|
                        Menu.Cell_Roundness       ,|
                            Menu.Label_Cell_Width     ,|
                                Menu.Label_Cell_Height    ,|
                                    Menu.Label_BoxColor       ,|
                                        Menu.Label_OutlineColor   ,|
                                            Menu.Label_Cell_Roundness ,|
                                                Menu.Label_Text           ,|
                                                    Menu.Label_Left_Padding   ,|
                                                        Menu.Label_Top_Padding    ,|
                                                            Menu.Label_Justify        ,|
                                                                Menu.Label_FontFace       ,|
                                                                    Menu.Label_FontPoints     ,|
                                                                        Menu.Label_FontColor      ,|
                                                                            Menu.Data_Text            ,|
                                                                                Menu.Data_Left_Padding    ,|
                                                                                    Menu.Data_Top_Padding     ,|
                                                                                        Menu.Data_Justify         ,|
                                                                                            Menu.Data_FontFace        ,|
                                                                                                Menu.Data_FontPoints      ,|        
                                                                                                    Menu.Data_FontColor      )
	
                                                                                                        EXIT
			
Draw_Neurons_ROUTINE        ROUTINE 
	
    IF RECORDS(Neuron_With_Header) => 1
        LOOP Q#=1 TO RECORDS(Neuron_With_Header) 
            GET(Neuron_With_Header,Q#)
            WinGDI.Draw_Cell_With_Header(Neuron_With_Header.StartX, |
                Neuron_With_Header.StartY               ,|
                Neuron_With_Header.Cell_Width           ,|
                Neuron_With_Header.Cell_Height          ,|
                Neuron_With_Header.BoxColor             ,|
                Neuron_With_Header.OutlineColor         ,|
                Neuron_With_Header.Cell_Roundness       ,|
                Neuron_With_Header.Label_Cell_Width     ,|
                Neuron_With_Header.Label_Cell_Height    ,|
                Neuron_With_Header.Label_BoxColor       ,|
                Neuron_With_Header.Label_OutlineColor   ,|
                Neuron_With_Header.Label_Cell_Roundness ,|
                Neuron_With_Header.Label_Text           ,|
                Neuron_With_Header.Label_Left_Padding   ,|
                Neuron_With_Header.Label_Top_Padding    ,|
                Neuron_With_Header.Label_Justify        ,|
                Neuron_With_Header.Label_FontFace       ,|
                Neuron_With_Header.Label_FontPoints     ,|
                Neuron_With_Header.Label_FontColor      ,|
                Neuron_With_Header.Data_Text            ,|
                Neuron_With_Header.Data_Left_Padding    ,|
                Neuron_With_Header.Data_Top_Padding     ,|
                Neuron_With_Header.Data_Justify         ,|
                Neuron_With_Header.Data_FontFace        ,|
                Neuron_With_Header.Data_FontPoints      ,|        
                Neuron_With_Header.Data_FontColor      )

        END !LOOP
    END !IF
	

	
    EXIT
	
Draw_Beziers_ROUTINE        ROUTINE
	
DATA

CODE
	
    IF RECORDS(Beziers) => 1
        GET(Beziers,-1)
        LOOP P#=1 TO RECORDS(Beziers)
            GET(Beziers,P#)
			
            WinGDI.Bezier(Beziers.StartX,Beziers.StartY,Beziers.EndX,Beziers.EndY,GLO:Bezier_Color)
			
        END !LOOP
    END !IF
	
    EXIT
	
	
LC.Redraw_BG        PROCEDURE()

Box                     GROUP
StartX                      LONG
StartY                      LONG
EndX                        LONG
EndY                        LONG
Color                       ULONG
OutlineColor                ULONG
RoundedCorner               LONG
						END
Gradient_Orientation    BYTE


CODE

	IF UPPER(CLIP(GLO:Gradient_Orientation)) = 'HORIZONTAL'
		Gradient_Orientation = 0
	ELSE
		Gradient_Orientation = 1
	END

	CASE UPPER(CLIP(GLO:Gradient_Options))
	
	OF		'DOUBLE'
		WinGDI.DrawDoubleGradient(Gradient_Orientation,GLO:Gradient_Start ,GLO:Gradient_End)
	OF		'SINGLE'
		WinGDI.DrawGradient(Gradient_Orientation,GLO:Gradient_Start ,GLO:Gradient_End)
	END

    
	RETURN
    
LC.Add_Menu_Area                PROCEDURE(STRING Kind, STRING Menu_Option, LONG PTR, LONG Start_X, LONG Start_Y, LONG End_X, LONG End_Y)


CODE
    
    Q:Menu_Area:Start_X = Start_X + ?Universe_Area{PROP:Xpos}
    Q:Menu_Area:Start_Y = Start_Y + ?Universe_Area{PROP:Ypos}
    Q:Menu_Area:End_X = End_X + ?Universe_Area{PROP:Xpos}
    Q:Menu_Area:End_Y = End_Y + ?Universe_Area{PROP:Ypos}
    Q:Menu_Area:Kind = CLIP(Kind)
    Q:Menu_Area:Option = Menu_Option
    Q:Menu_Area:PTR = PTR
    
    Add(Q:Menu_Areas)
    
    
    RETURN
    
LC.Display_Menu     PROCEDURE(STRING Action,LONG PTR)

MouseDownX              LONG
MouseDownY              LONG
ThisQRec                LONG
XX                      LONG
YY                      LONG
Horizontal_Padding      LONG
Vertical_Padding        LONG
Former_Menu_Width       LONG

This_Menu               STRING(32)
End_X                   LONG


Menu        GROUP
StartX                      LONG
StartY                      LONG                                                                
Cell_Width                  LONG
Cell_Height                 LONG
BoxColor                    ULONG
OutlineColor                ULONG
Cell_Roundness              LONG
Label_Cell_Width            LONG
Label_Cell_Height           LONG
Label_BoxColor              ULONG
Label_OutlineColor          ULONG
Label_Cell_Roundness        LONG
Label_Text                  STRING(1024)
Label_Left_Padding          LONG
Label_Top_Padding           LONG
Label_Justify               STRING(32)
Label_FontFace              STRING(32)
Label_FontPoints            LONG
Label_FontColor             ULONG
Data_Text                   STRING(1024)
Data_Left_Padding           LONG
Data_Top_Padding            LONG
Data_Justify                CSTRING(64)
Data_FontFace               STRING(128)
Data_FontPoints             LONG
Data_FontColor              ULONG

                        END

CODE
!    
!    MouseDownX = MouseX()
!    MouseDownY = MouseY()
!    
!    Menu_Cell_Height = 30
!    Menu_Cell_Width = 70
!    Horizontal_Padding = 1
!    Vertical_Padding = 1
!
!    XX = MouseDownX
!    YY = MouseDownY
!    
!    !MESSAGE('Gonna display the menu')
!    
!    FREE(Q:Menu_Areas)
!    
!    CASE Action
!    
!    OF     'Contract Menu'
!        
!        WinGDI.Load()
!        
!        This_Menu = 'CHANGE'
!        
!        Menu.StartX                          = XX
!        Menu.StartY                          = YY
!        Menu.Cell_Width                      = Menu_Cell_Width
!        Menu.Cell_Height                     = Menu_Cell_Height
!        Menu.BoxColor                        = COLOR:Navy
!        Menu.OutlineColor                    = 007C5E34h
!        Menu.Cell_Roundness                  = 7
!        Menu.Label_Cell_Width                = 0
!        Menu.Label_Cell_Height               = 0
!        Menu.Label_BoxColor                  = 00228B22h
!        Menu.Label_OutlineColor              = 00359547h
!        Menu.Label_Cell_Roundness            = 0
!        Menu.Label_Text                      = ''
!        Menu.Label_Left_Padding              = 0
!        Menu.Label_Top_Padding               = 1
!        Menu.Label_Justify                   = 'Center'
!        Menu.Label_FontFace                  = 'De Valencia Regular'
!        Menu.Label_FontPoints                = 10
!        Menu.Label_FontColor                 = COLOR:White
!        Menu.Data_Text                       = This_Menu
!        Menu.Data_Left_Padding               = 0
!        Menu.Data_Top_Padding                = 18
!        Menu.Data_Justify                    = 'Center'
!        Menu.Data_FontFace                   = 'De Valencia Regular'
!        Menu.Data_FontPoints                 = 13
!        Menu.Data_FontColor                 = COLOR:White
!                    
!            DO Draw_Menu_Cell_ROUTINE
!            End_X = XX + Menu_Cell_Width + Horizontal_Padding
!            LC.Add_Menu_Area('Contract', CLIP(This_Menu),PTR,XX, YY, End_X, YY + Menu_Cell_Height)
!            XX += Menu_Cell_Width
!            
!            This_Menu = 'DELETE'
!            Menu.Data_Text                       = This_Menu
! 
!                
!        !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!                LC.Add_Menu_Area('Contract', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!                DO Draw_Menu_Cell_ROUTINE
!                
!                Former_Menu_Width = Menu_Cell_Width
!                
!                XX += Menu_Cell_Width
!                Menu.Data_Text                       = 'PRINT'
!
!
!                    This_Menu = 'PRINT'
!                    !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!                    LC.Add_Menu_Area('Contract', CLIP(This_Menu), PTR, End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!                    DO Draw_Menu_Cell_ROUTINE
!        
!
!                
!                
!                    Menu_Cell_Width = 170
!                    Menu.Cell_Width                      = Menu_Cell_Width
!                        XX += Menu_Cell_Width
!                        Menu.Data_Text                       = 'ADD CONTRACT DELIVERY'
!
!                            This_Menu = 'ADD CONTRACT DELIVERY'
!!        End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!                            LC.Add_Menu_Area('Contract', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!                            Menu_Cell_Width = Former_Menu_Width
!                            DO Draw_Menu_Cell_ROUTINE
!        
!        
!                            WinGDI.Render()
!                            
!                            MESSAGE('Just draw the Menu')
!        
!    OF  'Contract Detail Menu'
!        
!        This_Menu = 'CHANGE'
!        !End_X = LC.Draw_Menu_Option(XX  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Detail', CLIP(This_Menu),PTR,XX, YY, End_X, YY + Menu_Cell_Height)
!
!        This_Menu = 'DELETE'
!        !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Detail', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!        
!        This_Menu = 'ADD DELIVERY'
!        !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width + 50, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Detail', CLIP(This_Menu), PTR, End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!        
!    OF     'Contract Detail Delivery Menu'
!        
!        This_Menu = 'CHANGE'
!        !End_X = LC.Draw_Menu_Option(XX  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Detail Delivery', CLIP(This_Menu),PTR,XX, YY, End_X, YY + Menu_Cell_Height)
!
!        This_Menu = 'DELETE'
!        !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Detail Delivery', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!        
!        This_Menu = 'ADD PACK'
!        !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Detail Delivery', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!        
!        Former_Menu_Width = Menu_Cell_Width
!        Menu_Cell_Width = 170
!        
!        This_Menu = 'PRINT PACKING LIST'
!        !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Detail Delivery', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!        
!        Menu_Cell_Width = Former_Menu_Width
!        
!    OF     'Contract Packs Menu'
!        
!        This_Menu = 'CHANGE'
!        !End_X = LC.Draw_Menu_Option(XX  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Pack', CLIP(This_Menu),PTR,XX, YY, End_X, YY + Menu_Cell_Height)
!
!        This_Menu = 'DELETE'
!        !End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!        LC.Add_Menu_Area('Contract Pack', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)
!        
!!        This_Menu = 'ADD PACK'
!!        End_X = LC.Draw_Menu_Option(End_X  + Horizontal_Padding,YY + Vertical_Padding,Menu_Cell_Width, Menu_Cell_Height,3,'',0,CLIP(This_Menu),0)
!!        LC.Add_Menu_Area('Contract Packs', CLIP(This_Menu),PTR,End_X - Menu_Cell_Width, YY, End_X, YY + Menu_Cell_Height)        
!        
!        
!      
!                
!    END !CASE
!
!    Is_Menu_Visible = TRUE
    
	RETURN

    
Draw_Menu_Cell_ROUTINE      ROUTINE
    
    
	WinGDI.Draw_Cell_With_Header(Menu.StartX, |
	Menu.StartY               ,|
		Menu.Cell_Width           ,|
			Menu.Cell_Height          ,|
				Menu.BoxColor             ,|
					Menu.OutlineColor         ,|
						Menu.Cell_Roundness       ,|
							Menu.Label_Cell_Width     ,|
								Menu.Label_Cell_Height    ,|
									Menu.Label_BoxColor       ,|
										Menu.Label_OutlineColor   ,|
											Menu.Label_Cell_Roundness ,|
												Menu.Label_Text           ,|
													Menu.Label_Left_Padding   ,|
														Menu.Label_Top_Padding    ,|
															Menu.Label_Justify        ,|
																Menu.Label_FontFace       ,|
																	Menu.Label_FontPoints     ,|
																		Menu.Label_FontColor      ,|
																			Menu.Data_Text            ,|
																				Menu.Data_Left_Padding    ,|
																					Menu.Data_Top_Padding     ,|
																						Menu.Data_Justify         ,|
																							Menu.Data_FontFace        ,|
																								Menu.Data_FontPoints      , |        
																									Menu.Data_FontColor      )
    
																										EXIT
    
LC.Add_Area                PROCEDURE(STRING Kind, LONG PTR, LONG Start_X, LONG Start_Y, LONG End_X, LONG End_Y)

AbsX                            LONG
AbsY                            LONG


CODE
    
    Q:Area:Start_X = Start_X + ?Universe_Area{PROP:Xpos}
    Q:Area:Start_Y = Start_Y + ?Universe_Area{PROP:Ypos}
    Q:Area:End_X = End_X + ?Universe_Area{PROP:Xpos}
    Q:Area:End_Y = End_Y + ?Universe_Area{PROP:Ypos}
    Q:Area:Kind = CLIP(Kind)
    Q:Area:PTR = PTR
    Add(Q:Areas)
    
    RETURN
    
LC.Manage_GDI_Clicks        PROCEDURE(STRING Action)

MouseDownX                      LONG
MouseDownY                      LONG
ThisQRec                        LONG

CODE
	
	MouseDownX = MouseX() + ?Universe_Area{PROP:Xpos}
	MouseDownY = MouseY() + ?Universe_Area{PROP:Ypos}
	
	IF LOC:Is_Menu_Visible = TRUE !Menu displayed
		DO Menu_Visible_ROUTINE
	ELSE
		DO Clicks_ROUTINE
	END
	
    
	RETURN
    
Clicks_ROUTINE      ROUTINE
	
DATA

Parent_Neuron       LONG

CODE
	
	
		
    
	ThisQRec = 0
		
	LOOP RECORDS(Q:Areas) TIMES
		IF ERRORCODE() THEN .
		ThisQRec += 1		
		GET(Q:Areas,ThisQRec)
		IF MouseDownX => Q:Area:Start_X AND MouseDownX <= Q:Area:End_X
			IF MouseDownY => Q:Area:Start_Y AND MouseDownY <= Q:Area:End_Y	 

				CASE Action 

				OF 'MouseRightUp'        
                    
					CASE Q:Area:Kind
                    
					OF 'Neuron'
                    
						!LOC:Is_Menu_Visible = FALSE
						LOC:DisplayMenu = TRUE
						LOC:NeuronPTR = Q:Area:PTR
						LOC:MenuActive = 'Neuron Menu'
						LC.FillTree('REDRAW')
						BREAK
                
					END
                    
				OF 'MouseLeftUp'   
					
					CASE Q:Area:Kind
						
					OF 'Add Neuron'
							
						IF Focused_Neuron => 1
							CLEAR(NEU:Record)
							GET(Neurons,Q:Area:PTR)
							Parent_Neuron = NEU:Neuron_ID
							Access:Neurons.PrimeAutoInc()
							Access:Neurons.PrimeFields()
								!Access:Neurons.PrimeRecord()
							NEU:Parent_ID = Parent_Neuron
							NEU:Brief = ''
							NEU:Extended_Data = ''
							NEU:Date = TODAY()
							NEU:Time = CLOCK()
							NEU:Locked = 0
							NEU:Password = ''
							GlobalRequest = InsertRecord
							
							Update_Neurons()
							
							CASE GlobalResponse 

							OF RequestCompleted

								LC.FillTree('REBUILD')
									
							OF RequestCancelled
									
								LC.FillTree('REDRAW')

							END
							
							BREAK
						ELSE
							CLEAR(NEU:Record)
							Access:Neurons.PrimeAutoInc()
							NEU:Parent_ID = 0
							NEU:Thought_ID = LOC:Active_Thought
								
							GlobalRequest = InsertRecord
							
							Update_Neurons()
							
							CASE GlobalResponse 

							OF RequestCompleted

								LC.FillTree('REBUILD')
									
							OF RequestCancelled
									
								LC.FillTree('REDRAW')

							END
							
							BREAK
								
						END
					

							
							
					OF 'Neuron'
							
							
						CLEAR(NEU:record)
						GET(Neurons,Q:Area:PTR)
						Touched_Neuron = NEU:Neuron_ID
						
						IF NEU:Locked = TRUE
							X# = Neuron_Password(Q:Area:PTR)
							IF X# = 0
							
								LC.FillTree('REBUILD')
								LOC:ReloadList += 1
							ELSE
								BREAK
							END
							
						ELSE
							LC.FillTree('REBUILD')
							LOC:ReloadList += 1
									
						END

						BREAK
							
					END
					
				OF 'MouseLeft2'
					
					
					CLEAR(NEU:record)
					GET(Neurons,Q:Area:PTR)
						
						
					IF NEU:Locked = TRUE
						X# = Neuron_Password(Q:Area:PTR)
						IF X# = 0
							Focused_Neuron = NEU:Neuron_ID
							LC.FillTree('REBUILD')
							LOC:ReloadList += 1
						ELSE
							BREAK
						END
							
					ELSE
						Focused_Neuron = NEU:Neuron_ID
						LC.FillTree('REBUILD')
						LOC:ReloadList += 1
									
					END


					BREAK

				END
			END	!CASE Action	
		END
	END
    
	EXIT

!
!
Menu_Visible_ROUTINE        ROUTINE
    

	ThisQRec = 0
	LOOP RECORDS(Q:Menu_Areas) TIMES
		IF ERRORCODE() THEN .
		ThisQRec += 1		
		GET(Q:Menu_Areas,ThisQRec)
		IF MouseDownX => Q:Menu_Area:Start_X AND MouseDownX <= Q:Menu_Area:End_X			
			IF MouseDownY => Q:Menu_Area:Start_Y AND MouseDownY <= Q:Menu_Area:End_Y
				!MESSAGE('Found a menu area')
                        
				CASE Q:Menu_Area:Kind
                        
				OF 'Neuron'
                    
					CASE UPPER(Q:Menu_Area:Option)
                    
					OF 'CHANGE'
                        !MESSAGE('Gonna Change')
						GET(Neurons,Q:Menu_Area:PTR)
						
						IF NEU:Locked = TRUE
							X# = Neuron_Password(Q:Menu_Area:PTR)
							IF X# = 0
								GlobalRequest = ChangeRecord
								Update_Neurons()
							ELSE
								BREAK
							END
							
						ELSE
								GlobalRequest = ChangeRecord
								Update_Neurons()						
						END
						
						CASE GlobalResponse 
						OF RequestCancelled
							LC.FillTree('REDRAW')
						OF RequestCompleted
							LC.FillTree('INIT')
						END
						
						BREAK
						
					OF 'DELETE'
                        !MESSAGE('Gonna Delete')        
						GET(Neurons,Q:Menu_Area:PTR)
						GlobalRequest = DeleteRecord
						Update_Neurons()
						LC.FillTree('REBUILD')
						BREAK
						
					END   
					
                        
				END !CASE

                                            
			END
		END 
	END
    
    
	LOC:Is_Menu_Visible = FALSE             
	LOC:DisplayMenu = FALSE
	LC.FillTree('REDRAW')       
    
    
	EXIT
LC.ProcessClicks    PROCEDURE(STRING Clicks)


CODE
 
    RETURN
    
LC.Log              PROCEDURE(STRING WhatToLog)

CODE
	
	?Log{PROP:Text} = CLIP(WhatToLog) & '<13,10>' & ?Log{PROP:Text}
	DISPLAY(?Log)
	
	
	RETURN
LC.Next_Delivery       PROCEDURE(STRING Contract)

Next_Delivery           LONG
This_Count              LONG

CODE

    RETURN(This_Count)

Resizer.Init PROCEDURE(BYTE AppStrategy=AppStrategy:Resize,BYTE SetWindowMinSize=False,BYTE SetWindowMaxSize=False)


  CODE
  PARENT.Init(AppStrategy,SetWindowMinSize,SetWindowMaxSize)
  SELF.SetParentDefaults()                                 ! Calculate default control parent-child relationships based upon their positions on the window
  SELF.SetStrategy(?Universe_Area, Resize:FixXCenter+Resize:FixYCenter, Resize:Resize) ! Override strategy for ?Universe_Area
  SELF.SetStrategy(?Neuron_Work_Area_SHEET, Resize:FixRight+Resize:FixTop, Resize:Resize) ! Override strategy for ?Neuron_Work_Area_SHEET
  SELF.SetStrategy(?Extended_Data, Resize:FixRight+Resize:FixBottom, Resize:Resize) ! Override strategy for ?Extended_Data


Resizer.WindowResizeEnd PROCEDURE


  CODE
  PARENT.WindowResizeEnd
  LC.FillTree('REDRAW')
   DO EntriesPosition_ROUTINE
   DO ResizeButtons_ROUTINE


BRW19.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW19::EIPManager                            ! Set the EIP manager
  SELF.AddEditControl(EditInPlace::LIS:List,1)
  SELF.TabAction = EIPAction:Always
  SELF.EnterAction = EIPAction:Always
  SELF.DeleteAction = EIPAction:Always
  SELF.FocusLossAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Always+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW19.PrimeRecord PROCEDURE(BYTE SuppressClear = 0)

ReturnValue          BYTE,AUTO

  CODE
  ReturnValue = PARENT.PrimeRecord(SuppressClear)
  LIS:Neuron_ID = Focused_Neuron
  RETURN ReturnValue


BRW21.TakeNewSelection PROCEDURE

  CODE
  PARENT.TakeNewSelection
  LC.Manage_Themes('LOAD',THM:ID)
  LC.FillTree('REDRAW')

!!! <summary>
!!! Generated from procedure template - Window
!!! Form Data
!!! </summary>
Update_Neurons PROCEDURE 

CurrentTab           STRING(80)                            ! 
LOC:List_Sequence    LONG                                  ! 
ActionMessage        CSTRING(40)                           ! 
BRW7::View:Browse    VIEW(Lists)
                       PROJECT(LIS:List)
                       PROJECT(LIS:List_ID)
                       PROJECT(LIS:Neuron_ID)
                     END
Queue:Browse         QUEUE                            !Queue declaration for browse/combo box using ?List
LOC:List_Sequence      LIKE(LOC:List_Sequence)        !List box control field - type derived from local data
LIS:List               LIKE(LIS:List)                 !List box control field - type derived from field
LIS:List_ID            LIKE(LIS:List_ID)              !Primary key field - type derived from field
LIS:Neuron_ID          LIKE(LIS:Neuron_ID)            !Browse key field - type derived from field
Mark                   BYTE                           !Entry's marked status
ViewPosition           STRING(1024)                   !Entry's view position
                     END
LocEnableEnterByTab  BYTE(1)                               !Used by the ENTER Instead of Tab template
EnterByTabManager    EnterByTabClass
History::NEU:Record  LIKE(NEU:RECORD),THREAD
QuickWindow          WINDOW('Form Data'),AT(,,521,392),FONT('Microsoft Sans Serif',8,00FFFFF0h,FONT:regular,CHARSET:DEFAULT), |
  RESIZE,CENTER,COLOR(00402B1Fh),GRAY,IMM,MDI,HLP('Update_Data'),SYSTEM
                       PROMPT('Brief:'),AT(4,8),USE(?Dat:Brief:Prompt),TRN
                       ENTRY(@s255),AT(64,8,282,10),USE(NEU:Brief),REQ
                       CHECK('Password Protected'),AT(63,25),USE(NEU:Locked),TRN
                       ENTRY(@s31),AT(151,25,174,10),USE(NEU:Password),PASSWORD
                       BUTTON('&OK'),AT(365,368,71,22),USE(?OK),LEFT,COLOR(00006400h),ICON('ok_32x32.png'),DEFAULT, |
  FLAT,MSG('Accept data and close the window'),TIP('Accept data and close the window')
                       BUTTON('&Cancel'),AT(447,368,71,22),USE(?Cancel),LEFT,COLOR(000000E9h),ICON('cancel_32x32.png'), |
  FLAT,MSG('Cancel operation'),TIP('Cancel operation')
                       SHEET,AT(11,39,509,15),USE(?SHEET1),COLOR(00400000h,00FFFFF0h,00CD0000h)
                         TAB('Extended data'),USE(?TAB1),COLOR(,00FFFFF0h,00CDEBFFh)
                           TEXT,AT(15,57,500,305),USE(NEU:Extended_Data),VSCROLL,FLAT,TRN
                         END
                         TAB('Lists'),USE(?TAB2)
                           LIST,AT(17,61,493,301),USE(?List),RIGHT(1),VSCROLL,COLOR(,,00B3733Bh),FLAT,FORMAT('40C(2)|M@N' & |
  '5@#1#200L(2)|M@s255@'),FROM(Queue:Browse),IMM
                         END
                       END
                       BUTTON('&Insert'),AT(85,372,42,12),USE(?Insert),HIDE
                       BUTTON('&Change'),AT(127,372,42,12),USE(?Change),HIDE
                       BUTTON('&Delete'),AT(169,372,42,12),USE(?Delete),HIDE
                       BUTTON('Today''s Journal'),AT(351,4,68,22),USE(?Make_Journal_BTN),ICON('calendar_32x32.png')
                     END

CoolEntryFields EntryFields
Buttonz CoolButtonz
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
WindowResizeEnd        PROCEDURE(),DERIVED
                     END

BRW7                 CLASS(BrowseClass)                    ! Browse using ?List
Q                      &Queue:Browse                  !Reference to browse queue
Init                   PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)
ResetQueue             PROCEDURE(BYTE ResetMode),DERIVED
SetQueueRecord         PROCEDURE(),DERIVED
                     END

BRW7::Sort0:Locator  StepLocatorClass                      ! Default Locator
BRW7::EIPManager     BrowseEIPManager                      ! Browse EIP Manager for Browse using ?List
EditInPlace::LIS:List EditEntryClass                       ! Edit-in-place class for field LIS:List
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
  GlobalErrors.SetProcedureName('Update_Neurons')
  SELF.Request = GlobalRequest                             ! Store the incoming request
  ReturnValue = PARENT.Init()
  IF ReturnValue THEN RETURN ReturnValue.
  SELF.FirstField = ?Dat:Brief:Prompt
  SELF.VCRRequest &= VCRRequest
  SELF.Errors &= GlobalErrors                              ! Set this windows ErrorManager to the global ErrorManager
  BIND('LOC:List_Sequence',LOC:List_Sequence)              ! Added by: BrowseBox(ABC)
  SELF.AddItem(Toolbar)
  CLEAR(GlobalRequest)                                     ! Clear GlobalRequest after storing locally
  CLEAR(GlobalResponse)
  SELF.HistoryKey = CtrlH
  SELF.AddHistoryFile(NEU:Record,History::NEU:Record)
  SELF.AddHistoryField(?NEU:Brief,4)
  SELF.AddHistoryField(?NEU:Locked,9)
  SELF.AddHistoryField(?NEU:Password,8)
  SELF.AddHistoryField(?NEU:Extended_Data,13)
  SELF.AddUpdateFile(Access:Neurons)
  SELF.AddItem(?Cancel,RequestCancelled)                   ! Add the cancel control to the window manager
  Relate:Lists.SetOpenRelated()
  Relate:Lists.Open()                                      ! File Lists used by this procedure, so make sure it's RelationManager is open
  SELF.FilesOpened = True
  SELF.Primary &= Relate:Neurons
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
  BRW7.Init(?List,Queue:Browse.ViewPosition,BRW7::View:Browse,Queue:Browse,Relate:Lists,SELF) ! Initialize the browse manager
  SELF.Open(QuickWindow)                                   ! Open window
  ?SHEET1{PROP:TabSheetStyle} = TabStyle:Colored
  !Setting the LineHeight for every control of type LIST/DROP or COMBO in the window using the global setting.
  ?List{PROP:LineHeight} = 13
  Do DefineListboxStyle
  IF SELF.Request = ViewRecord                             ! Configure controls for View Only mode
    ?NEU:Brief{PROP:ReadOnly} = True
    ?NEU:Password{PROP:ReadOnly} = True
    DISABLE(?Insert)
    DISABLE(?Change)
    DISABLE(?Delete)
    DISABLE(?Make_Journal_BTN)
  END
  Resizer.Init(AppStrategy:Surface,Resize:SetMinSize)      ! Controls like list boxes will resize, whilst controls like buttons will move
  SELF.AddItem(Resizer)                                    ! Add resizer to window manager
  BRW7.Q &= Queue:Browse
  BRW7.FileLoaded = 1                                      ! This is a 'file loaded' browse
  BRW7.AddSortOrder(,LIS:Neuron_ID_Key)                    ! Add the sort order for LIS:Neuron_ID_Key for sort order 1
  BRW7.AddRange(LIS:Neuron_ID,Relate:Lists,Relate:Neurons) ! Add file relationship range limit for sort order 1
  BRW7.AddLocator(BRW7::Sort0:Locator)                     ! Browse has a locator for sort order 1
  BRW7::Sort0:Locator.Init(,LIS:Neuron_ID,1,BRW7)          ! Initialize the browse locator using  using key: LIS:Neuron_ID_Key , LIS:Neuron_ID
  BRW7.AddField(LOC:List_Sequence,BRW7.Q.LOC:List_Sequence) ! Field LOC:List_Sequence is a hot field or requires assignment from browse
  BRW7.AddField(LIS:List,BRW7.Q.LIS:List)                  ! Field LIS:List is a hot field or requires assignment from browse
  BRW7.AddField(LIS:List_ID,BRW7.Q.LIS:List_ID)            ! Field LIS:List_ID is a hot field or requires assignment from browse
  BRW7.AddField(LIS:Neuron_ID,BRW7.Q.LIS:Neuron_ID)        ! Field LIS:Neuron_ID is a hot field or requires assignment from browse
  BRW7.AddToolbarTarget(Toolbar)                           ! Browse accepts toolbar control
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
    Relate:Lists.Close()
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
    OF ?Make_Journal_BTN
      ThisWindow.Update()
      NEU:Brief = FORMAT(TODAY(),@D7)
      DISPLAY(?NEU:Brief)
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


BRW7.Init PROCEDURE(SIGNED ListBox,*STRING Posit,VIEW V,QUEUE Q,RelationManager RM,WindowManager WM)

  CODE
  PARENT.Init(ListBox,Posit,V,Q,RM,WM)
  SELF.EIP &= BRW7::EIPManager                             ! Set the EIP manager
  SELF.AddEditControl(,1) ! LOC:List_Sequence Disable
  SELF.AddEditControl(EditInPlace::LIS:List,2)
  SELF.TabAction = EIPAction:Default+EIPAction:Remain
  SELF.EnterAction = EIPAction:Default+EIPAction:Remain
  SELF.DeleteAction = EIPAction:Always
  SELF.ArrowAction = EIPAction:Default+EIPAction:Remain+EIPAction:RetainColumn
  IF WM.Request <> ViewRecord                              ! If called for anything other than ViewMode, make the insert, change & delete controls available
    SELF.InsertControl=?Insert
    SELF.ChangeControl=?Change
    SELF.DeleteControl=?Delete
  END


BRW7.ResetQueue PROCEDURE(BYTE ResetMode)

  CODE
  LOC:List_Sequence = 0
  PARENT.ResetQueue(ResetMode)


BRW7.SetQueueRecord PROCEDURE

  CODE
  LOC:List_Sequence += 1
  PARENT.SetQueueRecord

