   PROGRAM


EVENT:RePaint          Equate(807h)
INCLUDE('SystemString.inc'),ONCE
!Equates and Types

FR_PRIVATE          EQUATE(00000010H)
eEncrypt            EQUATE(1)
eDecyrpt            EQUATE(0)

md5_context_type    Group,Type
md5total                ULONG,DIM(2)
md5state                ULONG,DIM(4)
md5buffer               STRING(64)
                    End

sha256_context_type Group,Type
total                   ULONG,Dim(2)
state                   ULONG,Dim(8)
sha256buffer            STRING(64)
                    End

sha1_context_type   Group,Type
total                   ULONG,Dim(2)
state                   ULONG,Dim(5)
sha1buffer              STRING(64)
                    End

! For reading files
FILE_ATTRIBUTE_ARCHIVE      EQUATE(00000020H)
ERROR_INVALID_HANDLE        EQUATE(6)
FILE_SHARE_READ     EQUATE(00000001H)
GENERIC_READ        EQUATE(80000000H)
OPEN_EXISTING       EQUATE(3)
INVALID_HANDLE_VALUE        EQUATE(-1)

ColorData           GROUP,TYPE
lStructSize             LONG
hwndOwner               LONG
hInstance               LONG
rgbResult               LONG
lpCustColors            LONG
Flags                   LONG
lCustData               LONG
lpfnHook                LONG
lpTemplateName          LONG

                    END

INCLUDE('ce_BufferedGraphics.inc'),ONCE

   INCLUDE('ABERROR.INC'),ONCE
   INCLUDE('ABFILE.INC'),ONCE
   INCLUDE('ABUTIL.INC'),ONCE
   INCLUDE('EFOCUS.INC'),ONCE
   INCLUDE('ERRORS.CLW'),ONCE
   INCLUDE('KEYCODES.CLW'),ONCE
  INCLUDE('EntryFields.inc'),ONCE
  INCLUDE('CoolButtonz.inc'),ONCE

   MAP
     MODULE('PHOTON_BC.CLW')
DctInit     PROCEDURE                                      ! Initializes the dictionary definition module
DctKill     PROCEDURE                                      ! Kills the dictionary definition module
     END
!--- Application Global and Exported Procedure Definitions --------------------------------------------
     MODULE('PHOTON001.CLW')
Main                   PROCEDURE   !Photon Data Manager
     END
     MODULE('Win32Api')
     
         SA_DrawText(LONG hdc, *CString lpszString, unsigned nCount, *SA_RECT lpRect, |
             unsigned uFormat),signed,raw,pascal,proc,name('DrawTextA')
         SA_GetTextExtentPoint(LONG hdc, *cstring lpString, long cbString, *SA_SIZE lpSize),bool,raw,pascal,proc,name('GetTextExtentPointA')
         SA_GetTextExtentPoint32(LONG hdc,           | handle to DC
         *CSTRING lpString,  | text string
     LONG        cbString,      | characters in string
         *SA_SIZE lpSize     | string size SIZE structure
         ),BOOL,PASCAL,RAW,PROC,NAME('GetTextExtentPoint32A')
         GetSysColor(signed nIndex),long,pascal,NAME('GetSysColor')
         CallWindowProc(LONG,UNSIGNED,UNSIGNED,UNSIGNED,LONG),LONG,PASCAL,NAME('CallWindowProcA') ! apiSubclass (ABC Free)
         ShellExecute(UNSIGNED,LONG,*CSTRING,LONG,*CSTRING,SIGNED),UNSIGNED,PASCAL,RAW,NAME('SHELLEXECUTEA')
         GetDesktopWindow(), Unsigned, Pascal
         GetWindowRect(UNSIGNED, *RECT), BOOL, RAW, PASCAL, PROC
         MulDiv(SIGNED, SIGNED, SIGNED), SIGNED, PASCAL
         GetKeyState(SIGNED nVirtKey), SHORT, PASCAL
         GetTickCount(), LONG, PASCAL
         SHGetPathFromIdList(LONG pidl, *CSTRING), BOOL, RAW, PASCAL
         AddFontResourceExA(*CSTRING FontName,  UNSIGNED  FontResFlag,  LONG FontResReserved),UNSIGNED,PASCAL,RAW,NAME('AddFontResourceExA')
         
     END
     !  Module('sha1.lib')
     !    sha1_starts(*sha1_context_type),RAW,NAME('_sha1_starts')
     !    sha1_update(*sha1_context_type, *STRING input, ULONG inputlength),RAW,NAME('_sha1_update')
     !    sha1_finish(*sha1_context_type, *STRING),RAW,NAME('_sha1_finish')
     !  End
     !
     !  Module('sha256.lib')
     !    sha256_starts(*sha256_context_type),Raw,NAME('_sha256_starts')
     !    sha256_update(*sha256_context_type, *STRING input, ULONG inputlength),Raw,NAME('_sha256_update')
     !    sha256_finish(*sha256_context_type, *STRING digest),Raw,NAME('_sha256_finish')
     !  End
     !
     !  Module('md5.lib')
     !    md5_starts(*md5_context_type),Raw,Name('_md5_starts')
     !    md5_update(*md5_context_type, *STRING input, ULONG leninput),Raw,Name('_md5_update')
     !    md5_finish(*md5_context_type, *STRING digest),Raw,Name('_md5_finish')
     !  End
     !
     !  Module('FileAPI')
     !    CreateFile(*CSTRING,ULONG,ULONG,<*?>,ULONG,ULONG,SIGNED),SIGNED,PASCAL,RAW,NAME('CreateFileA')
     !    ReadFile(SIGNED,*STRING,ULONG,*ULONG,ULONG),BOOL,PASCAL,RAW
     !    CloseFile(SIGNED),BOOL,PASCAL,RAW,PROC,Name('CloseHandle')
     !    GetLastError(),LONG,PASCAL,RAW
     !  End
     
       INCLUDE('CWUTIL.INC')  !For BYTETOHEX()
     ExecuteHandler(unsigned, STRING) !we need to declare this here, and we will handle the commands passed to Windows... You will see... Please take a look at the Procedures section...
     
   END

GL                  CLASS()
RemovePath              PROCEDURE(STRING FileNameStr),STRING
GetPureExtension        PROCEDURE(STRING FileNameStr),STRING
RemoveTempFiles         PROCEDURE()
DecToHex                PROCEDURE(LONG Value,LONG Digits),STRING
					END
Fast                CLASS
Find                    PROCEDURE(STRING SearchSTR,STRING OnThisSTR,BYTE DebugMSG=0), BYTE
MixColors               PROCEDURE(LONG pColor1,LONG pColor2,BYTE pPercentageMix),LONG
					END
GLO:Cell_Width       DECIMAL(7)
GLO:FontResource     CSTRING(128)
GLO:Neuron_Font      STRING(128)
GLO:Label_Font       STRING(128)
GLO:MaxChars         LONG
GLO:Neurons_Area     ULONG(71)
GLO:IconColor        LONG
GLO:IconBG           LONG
GLO:Icon_Size        DECIMAL(7)
GLO:Debug_DB         BYTE
GLO:Menu_Height      DECIMAL(7,2)
GLO:Menu_Width       DECIMAL(7,2)
GLO:Cell_Height      DECIMAL(7)
GLO:Central_Neuron_Extra_Height DECIMAL(7)
GLO:Text_Points      SIGNED
GLO:Horizontal_Margin DECIMAL(7)
GLO:Vertical_Margin  DECIMAL(7)
GLO:Intercell_Gap    DECIMAL(7)
GLO:Main_Neuron_Y_Margin DECIMAL(7)
GLO:Outline_Color    ULONG
GLO:Label_Outline_Color ULONG
GLO:Box_Color        ULONG
GLO:Label_Box_Color  ULONG
GLO:Text_Color       LONG
GLO:Text_Style       LONG
GLO:Label_Text_Color ULONG
GLO:Bezier_Color     ULONG
GLO:Gradient_Start   ULONG
GLO:Gradient_End     ULONG
GLO:Gradient_Options STRING('''ingle'' {14}')
GLO:Gradient_Orientation STRING('''ingle'' {14}')
GLO:RoundButton_Height ULONG
GLO:RoundButton_Width ULONG
GLO:ForceRefresh     BYTE
GLO:Round_Button_Text_Points DECIMAL(7,2)
GLO:Round_Button_Outline_Color ULONG
GLO:Round_Button_Box_Color ULONG
GLO:Round_Button_Text_Color ULONG
GLO:UniverseRadius   ULONG
GLO:RecLimit         ULONG
GLO:2in1             BYTE
GLO:WasIconized      BYTE
GLO:MaxInitialItems  LONG
GLO:MinDistance      LONG
GLO:ExtraItems       LONG
GLO:InitialRadius    DECIMAL(7,2)
GLO:Multiplier       DECIMAL(7)
GLO:ThisTextPoints   LONG
GLO:Grid             BYTE
GLO:GridSize         ULONG
GLO:Release          CSTRING(120)
GLO:Dealer           CSTRING(120)
GLO:Registered_To    STRING(255)
GLO:SN               CSTRING(64)
GLO:License_Status   CSTRING(120)
GLO:Status           CSTRING(1024)
GLO:MAC              STRING(17)
GLO:Challenge        LONG
GLO:EmailMotherShip  CSTRING(255)
GLO:Email_Name       CSTRING(117)
GLO:Registration_Code CSTRING(255)
GLO:Email            STRING(128)
GLO:Sub_Start        DATE
GLO:Sub_End          STRING(20)
GLO:InitialAngle     LONG
GLO:IncrementalAngle LONG
RetVal               STRING(256)
Input                STRING(256)
GLO:Theme            STRING(32)
GLO:DesignMode       BYTE
GLO:BezierColor      LONG
GLO:Menu:InitialRadius LONG
GLO:Items:InitialRadius LONG
GLO:Items:MinimumDistance LONG
GLO:Items:InitialItems LONG
GLO:Items:ExtraItems LONG
SilentRunning        BYTE(0)                               ! Set true when application is running in 'silent mode'

!region File Declaration
Neurons              FILE,DRIVER('TOPSPEED'),RECLAIM,OEM,NAME('Neurons.tps'),PRE(NEU),BINDABLE,CREATE,THREAD !                     
Tought_ID_Key            KEY(NEU:Thought_ID),DUP,NOCASE    !                     
Neuron_ID_Key            KEY(NEU:Neuron_ID),NOCASE,PRIMARY !                     
Neuron_Parent_ID_Key     KEY(NEU:Parent_ID),DUP,NOCASE     !                     
Extended_Data               MEMO(63000)                    !                     
Record                   RECORD,PRE()
Thought_ID                  LONG                           !                     
Neuron_ID                   LONG                           !                     
Parent_ID                   LONG                           !                     
Brief                       STRING(2048)                   !                     
Date                        DATE                           !                     
Time                        TIME                           !                     
Link                        STRING(1)                      !                     
Password                    CSTRING(32)                    !                     
Locked                      BYTE                           !                     
Is_Journal                  BYTE                           !                     
Is_List                     BYTE                           !                     
Journal_Day                 CSTRING(64)                    !                     
                         END
                     END                       

Files                FILE,DRIVER('TOPSPEED'),RECLAIM,OEM,NAME('Files'),PRE(FIL),BINDABLE,CREATE,THREAD !                     
Files_ID_Key             KEY(FIL:Files_ID),NOCASE,PRIMARY  !                     
Data_ID_Key              KEY(FIL:ID),DUP,NOCASE            !                     
BLOB                        BLOB,BINARY                    !                     
Icon                        BLOB,BINARY                    !                     
Record                   RECORD,PRE()
Files_ID                    LONG                           !                     
ID                          LONG                           !                     
Path                        STRING(512)                    !                     
Original_Filename           STRING(256)                    !                     
FileSize                    LONG                           !                     
Storing_Date                DATE                           !                     
Storing_Time                TIME                           !                     
Kind                        CSTRING(4)                     !                     
                         END
                     END                       

License              FILE,DRIVER('TOPSPEED'),RECLAIM,OWNER('*137*'),ENCRYPT,NAME('Defaults.tps'),PRE(LIC),BINDABLE,CREATE,THREAD !                     
Release_Key              KEY(LIC:RegisteredTo),NOCASE,PRIMARY !                     
Record                   RECORD,PRE()
MAC                         STRING(32)                     !                     
HD_SN                       STRING(32)                     !                     
RegisteredTo                CSTRING(255)                   !                     
ExpirationDate              DATE                           !                     
InstallDate                 DATE                           !                     
Dealer                      CSTRING(120)                   !                     
PersonalCode                CSTRING(32)                    !                     
UnlockCode                  CSTRING(64)                    !                     
Status                      CSTRING(120)                   !                     
CustomerCode                DECIMAL(10)                    !                     
                         END
                     END                       

Geometries           FILE,DRIVER('TOPSPEED'),RECLAIM,OEM,NAME('Geometries'),PRE(GEO),BINDABLE,CREATE,THREAD !                     
ID_Geometries_Key        KEY(GEO:ID),NOCASE,PRIMARY        !                     
Record                   RECORD,PRE()
ID                          LONG                           !                     
MaxInitialItems             LONG                           !                     
ExtraItems                  LONG                           !                     
InitialRadius               LONG                           !                     
Multiplier                  LONG                           !                     
ThisTextPoints              LONG                           !                     
MinDistance                 LONG                           !                     
Grid                        LONG                           !                     
GridSize                    LONG                           !                     
UniverseRadius              LONG                           !                     
InitialAngle                LONG                           !                     
IncrementalAngle            LONG                           !                     
ThemeName                   STRING(32)                     !                     
Menu:InitialRadius          LONG                           !                     
Items:InitialRadius         LONG                           !                     
Items:MinimumDistance       LONG                           !                     
Items:InitialItems          LONG                           !                     
Items:ExtraItems            LONG                           !                     
                         END
                     END                       

Themes               FILE,DRIVER('TOPSPEED'),RECLAIM,OEM,NAME('Themes'),PRE(THM),BINDABLE,CREATE,THREAD !                     
ID_Theme_Color_Key       KEY(THM:ID),NOCASE,PRIMARY        !                     
Theme_Name_Key           KEY(THM:ThemeName),NOCASE         !                     
Record                   RECORD,PRE()
ID                          LONG                           !                     
ThemeName                   STRING(32)                     !                     
Cell_Width                  DECIMAL(7)                     !                     
MaxChars                    LONG                           !                     
Neurons_Area                ULONG                          !                     
IconColor                   LONG                           !                     
IconBG                      LONG                           !                     
Icon_Size                   DECIMAL(7)                     !                     
Debug_DB                    BYTE                           !                     
Menu_Height                 DECIMAL(7,2)                   !                     
Neuron_Font                 STRING(128)                    !                     
Label_Font                  STRING(128)                    !                     
Menu_Width                  DECIMAL(7,2)                   !                     
Cell_Height                 DECIMAL(7)                     !                     
Central_Neuron_Extra_Height DECIMAL(7)                     !                     
Text_Points                 DECIMAL(7)                     !                     
Horizontal_Margin           DECIMAL(7)                     !                     
Vertical_Margin             DECIMAL(7)                     !                     
Intercell_Gap               DECIMAL(7)                     !                     
Main_Neuron_Y_Margin        DECIMAL(7)                     !                     
Outline_Color               ULONG                          !                     
Label_Outline_Color         ULONG                          !                     
Box_Color                   ULONG                          !                     
Label_Box_Color             ULONG                          !                     
Text_Color                  ULONG                          !                     
Label_Text_Color            ULONG                          !                     
Bezier_Color                ULONG                          !                     
Gradient_Start              ULONG                          !                     
Gradient_End                ULONG                          !                     
Gradient_Options            STRING(21)                     !                     
Gradient_Orientation        STRING(21)                     !                     
RoundButton_Height          ULONG                          !                     
RoundButton_Width           ULONG                          !                     
ForceRefresh                BYTE                           !                     
Round_Button_Text_Points    DECIMAL(7,2)                   !                     
Round_Button_Outline_Color  ULONG                          !                     
Round_Button_Box_Color      ULONG                          !                     
Round_Button_Text_Color     ULONG                          !                     
                         END
                     END                       

Thoughts             FILE,DRIVER('TOPSPEED'),RECLAIM,PRE(THO),BINDABLE,CREATE,THREAD !                     
Tought_ID_Key            KEY(THO:Thought_ID),NOCASE,PRIMARY !                     
Tought_Key               KEY(THO:Thought),NOCASE           !                     
Record                   RECORD,PRE()
Thought_ID                  LONG                           !                     
Thought                     STRING(128)                    !                     
                         END
                     END                       

Lists                FILE,DRIVER('TOPSPEED'),RECLAIM,NAME('Lists'),PRE(LIS),BINDABLE,CREATE,THREAD !                     
Neuron_ID_Key            KEY(LIS:Neuron_ID),DUP,NOCASE     !                     
List_ID_Key              KEY(LIS:List_ID),NOCASE,PRIMARY   !                     
Record                   RECORD,PRE()
Neuron_ID                   LONG                           !                     
List_ID                     LONG                           !                     
List                        STRING(256)                    !                     
                         END
                     END                       

A_Neurons            FILE,DRIVER('TOPSPEED'),RECLAIM,OEM,NAME('Neurons.tps'),PRE(A_NEU),BINDABLE,CREATE,THREAD !                     
Tought_ID_Key            KEY(A_NEU:Thought_ID),DUP,NOCASE  !                     
Neuron_ID_Key            KEY(A_NEU:Neuron_ID),NOCASE,PRIMARY !                     
Neuron_Parent_ID_Key     KEY(A_NEU:Parent_ID),DUP,NOCASE   !                     
Extended_Data               MEMO(63000)                    !                     
Record                   RECORD,PRE()
Thought_ID                  LONG                           !                     
Neuron_ID                   LONG                           !                     
Parent_ID                   LONG                           !                     
Brief                       STRING(2048)                   !                     
Date                        DATE                           !                     
Time                        TIME                           !                     
Link                        STRING(1)                      !                     
Password                    CSTRING(32)                    !                     
Locked                      BYTE                           !                     
Is_Journal                  BYTE                           !                     
Is_List                     BYTE                           !                     
Journal_Day                 CSTRING(64)                    !                     
                         END
                     END                       

!endregion

Access:Neurons       &FileManager,THREAD                   ! FileManager for Neurons
Relate:Neurons       &RelationManager,THREAD               ! RelationManager for Neurons
Access:Files         &FileManager,THREAD                   ! FileManager for Files
Relate:Files         &RelationManager,THREAD               ! RelationManager for Files
Access:License       &FileManager,THREAD                   ! FileManager for License
Relate:License       &RelationManager,THREAD               ! RelationManager for License
Access:Geometries    &FileManager,THREAD                   ! FileManager for Geometries
Relate:Geometries    &RelationManager,THREAD               ! RelationManager for Geometries
Access:Themes        &FileManager,THREAD                   ! FileManager for Themes
Relate:Themes        &RelationManager,THREAD               ! RelationManager for Themes
Access:Thoughts      &FileManager,THREAD                   ! FileManager for Thoughts
Relate:Thoughts      &RelationManager,THREAD               ! RelationManager for Thoughts
Access:Lists         &FileManager,THREAD                   ! FileManager for Lists
Relate:Lists         &RelationManager,THREAD               ! RelationManager for Lists
Access:A_Neurons     &FileManager,THREAD                   ! FileManager for A_Neurons
Relate:A_Neurons     &RelationManager,THREAD               ! RelationManager for A_Neurons

GlobalErrorStatus    ErrorStatusClass,THREAD
GlobalErrors         ErrorClass                            ! Global error manager
INIMgr               CLASS(INIClass)                       ! Global non-volatile storage manager
Fetch                  PROCEDURE(),DERIVED
Update                 PROCEDURE(),DERIVED
                     END

GlobalRequest        BYTE(0),THREAD                        ! Set when a browse calls a form, to let it know action to perform
GlobalResponse       BYTE(0),THREAD                        ! Set to the response from the form
VCRRequest           LONG(0),THREAD                        ! Set to the request from the VCR buttons

Dictionary           CLASS,THREAD
Construct              PROCEDURE
Destruct               PROCEDURE
                     END


  CODE
  GlobalErrors.Init(GlobalErrorStatus)
  INIMgr.Init('.\Photon.INI', NVD_INI)                     ! Configure INIManager to use INI file
  DctInit()
  SYSTEM{PROP:Icon} = 'photon.ico'
  GLO:FontResource = '.\Font\photon.ttf'
  AddFontResourceExA(GLO:FontResource,FR_PRIVATE, 0)
  Main
  INIMgr.Update
  INIMgr.Kill                                              ! Destroy INI manager
    
Fast.Find           PROCEDURE(STRING SearchSTR,STRING OnThisSTR,BYTE DebugMSG)

Found_STR               BYTE()
SearchSTR_C             &STRING
OnThisSTR_C             &STRING
SlicedSTR_C             &STRING
XXN                     LONG
LenSTRSearch            LONG


CODE
	
	Found_STR = FALSE
	
	
		
	IF LEN(CLIP(LEFT(OnThisSTR))) => 1 !Only if there is something, otherwise we will cause an error accesing something that does not exist
		
	
		
		SearchSTR_C &= NEW STRING(LEN(CLIP(LEFT(SearchSTR))))
		OnThisSTR_C &= NEW STRING(LEN(CLIP(LEFT(OnThisSTR)))+1) !+1 in case the passed string is a CSTRING, otherwise it will truncate the CSTRING
		

		SearchSTR_C = UPPER(CLIP(LEFT(SearchSTR)))
		OnThisSTR_C = UPPER(CLIP(LEFT(OnThisSTR)))
	
		LenSTRSearch = LEN(CLIP(LEFT(SearchSTR)))
		SlicedSTR_C &= NEW STRING(LenSTRSearch)
		
		!MESSAGE('Search String Size = ' & LenSTRSearch & ' And SlicedStrng = ' & LEN(SlicedSTR_C))
	
		IF LEN(SearchSTR_C) > LEN(OnThisSTR_C) !no point on comparing on something smaller than the search string itself... Counting is faster than comparing anyway...
			DO DISPOSE_ROUTINE
		END
		
			
		IF SearchSTR_C = OnThisSTR_C !If by luck, we are looking at an exact match.... :-)
			DO Return_Found_ROUTINE
		END	
	
		LOOP XXN = 1 TO (LEN(OnThisSTR_C) - LenSTRSearch)
			
			SlicedSTR_C = OnThisSTR_C[XXN : LenSTRSearch + XXN]
			!MESSAGE('Comparing ... ' & '>>' & SearchSTR_C & '<< ' & '>>' & SlicedSTR_C & '<<')
			IF SearchSTR_C = SlicedSTR_C
				!MESSAGE('Match found! ' & 'SearchSTR_C' & '=' & SlicedSTR_C)
				DO Return_Found_ROUTINE
			END
		
	
		END

	!IF Still here
	
		Found_STR = FALSE
	END
	
	
	DO DISPOSE_ROUTINE
	
	


Return_Found_ROUTINE        ROUTINE
	
	Found_STR = TRUE
	
	DO DISPOSE_ROUTINE
	
	RETURN(Found_STR)
	
	EXIT

DISPOSE_ROUTINE     ROUTINE
	
	
	DISPOSE(SearchSTR_C)
	DISPOSE(OnThisSTR_C)
	DISPOSE(SlicedSTR_C)
	RETURN(Found_STR)
	
	EXIT
Fast.MixColors       PROCEDURE (LONG pColor1, LONG pColor2, BYTE pPercentageMix)

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

        RETURN BOR (RetCWColor, DitherColors)        
        
GL.DecToHex         PROCEDURE(LONG Value,LONG Digits)
Pos                     ULONG,AUTO
PwrValue                ULONG,AUTO
RVal                    STRING(8)
RValChar                STRING(1),DIM(Size(RVal)),OVER(RVal)
HexChars                STRING('0123456789ABCDEF')

CODE
	IF OMITTED(2) THEN Digits=4.             !Set default value for digits
	LOOP Pos=Digits TO 1 BY -1
		PwrValue=16^(Pos-1)
		IF PwrValue>Value THEN
			RValChar[Digits-Pos+1]='0'
		ELSE
			RValChar[Digits-Pos+1]=HexChars[Int(Value/PwrValue)+1]
			Value-=(PwrValue*Int(Value/PwrValue))
		END
	END
	RETURN(RVal)
GL.RemoveTempFiles  PROCEDURE()

DirQ            QUEUE(File:Queue),PRE(DirQ)
                END


CODE
    REMOVE('Temp\*.*', REMOVE:RECURSIVE)
    
    RETURN
    
    
GL.GetPureExtension     PROCEDURE(STRING FileNameStr)

ReturnString            STRING(1024)
ExtViewer               STRING(10)

CODE
    
    StartPos# = INSTRING('.',FileNameStr,-1,LEN(FileNameStr)) 
    ReturnString = SUB(FileNameStr,StartPos# + 1,LEN(FileNameStr) - StartPos#)    

    RETURN(CLIP(ReturnString))    
    
ExecuteHandler      PROCEDURE(wHandle, Command) 

CMDBuffer            CSTRING(256)
EmptyString             CSTRING(254)

CODE
    
    CMDBuffer = CLIP(Command)
    EmptyString=''
    x#=ShellExecute(wHandle, 0, CMDBuffer, 0, EmptyString, 1) !You can add PROC to the Windows Def to avoid using X#... But we shall check for errors all the time... Right?
    
    RETURN
    
GL.RemovePath       PROCEDURE(STRING FileNameStr)

ReturnString STRING(1024)

CODE
    
    StartPos# = INSTRING('\',FileNameStr,-1,LEN(FileNameStr)) 
    ReturnString = SUB(FileNameStr,StartPos# + 1,LEN(FileNameStr) - StartPos#)    
    
    RETURN(CLIP(ReturnString))
    
    


Dictionary.Construct PROCEDURE

  CODE
  IF THREAD()<>1
     DctInit()
  END


Dictionary.Destruct PROCEDURE

  CODE
  DctKill()


INIMgr.Fetch PROCEDURE

  CODE
  GLO:MaxInitialItems = SELF.TryFetch('Preserved','GLO:MaxInitialItems') ! Resore ' preserved variable' from non-volatile store
  GLO:ExtraItems = SELF.TryFetch('Preserved','GLO:ExtraItems') ! Resore ' preserved variable' from non-volatile store
  GLO:InitialRadius = SELF.TryFetch('Preserved','GLO:InitialRadius') ! Resore ' preserved variable' from non-volatile store
  GLO:Multiplier = SELF.TryFetch('Preserved','GLO:Multiplier') ! Resore ' preserved variable' from non-volatile store
  GLO:ThisTextPoints = SELF.TryFetch('Preserved','GLO:ThisTextPoints') ! Resore ' preserved variable' from non-volatile store
  GLO:MinDistance = SELF.TryFetch('Preserved','GLO:MinDistance') ! Resore ' preserved variable' from non-volatile store
  GLO:Grid = SELF.TryFetch('Preserved','GLO:Grid')         ! Resore ' preserved variable' from non-volatile store
  GLO:GridSize = SELF.TryFetch('Preserved','GLO:GridSize') ! Resore ' preserved variable' from non-volatile store
  GLO:Challenge = SELF.TryFetch('Preserved','GLO:Challenge') ! Resore ' preserved variable' from non-volatile store
  GLO:Email = SELF.TryFetch('Preserved','GLO:Email')       ! Resore ' preserved variable' from non-volatile store
  GLO:Registered_To = SELF.TryFetch('Preserved','GLO:Registered_To') ! Resore ' preserved variable' from non-volatile store
  GLO:SN = SELF.TryFetch('Preserved','GLO:SN')             ! Resore ' preserved variable' from non-volatile store
  GLO:UniverseRadius = SELF.TryFetch('Preserved','GLO:UniverseRadius') ! Resore ' preserved variable' from non-volatile store
  GLO:InitialAngle = SELF.TryFetch('Preserved','GLO:InitialAngle') ! Resore ' preserved variable' from non-volatile store
  GLO:IncrementalAngle = SELF.TryFetch('Preserved','GLO:IncrementalAngle') ! Resore ' preserved variable' from non-volatile store
  GLO:Theme = SELF.TryFetch('Preserved','GLO:Theme')       ! Resore ' preserved variable' from non-volatile store
  GLO:Menu:InitialRadius = SELF.TryFetch('Preserved','GLO:Menu:InitialRadius') ! Resore ' preserved variable' from non-volatile store
  GLO:Items:InitialRadius = SELF.TryFetch('Preserved','GLO:Items:InitialRadius') ! Resore ' preserved variable' from non-volatile store
  GLO:Items:MinimumDistance = SELF.TryFetch('Preserved','GLO:Items:MinimumDistance') ! Resore ' preserved variable' from non-volatile store
  GLO:Items:InitialItems = SELF.TryFetch('Preserved','GLO:Items:InitialItems') ! Resore ' preserved variable' from non-volatile store
  GLO:Items:ExtraItems = SELF.TryFetch('Preserved','GLO:Items:ExtraItems') ! Resore ' preserved variable' from non-volatile store
  GLO:Cell_Width = SELF.TryFetch('Preserved','GLO:Cell_Width') ! Resore ' preserved variable' from non-volatile store
  GLO:Cell_Height = SELF.TryFetch('Preserved','GLO:Cell_Height') ! Resore ' preserved variable' from non-volatile store
  GLO:Text_Points = SELF.TryFetch('Preserved','GLO:Text_Points') ! Resore ' preserved variable' from non-volatile store
  GLO:Horizontal_Margin = SELF.TryFetch('Preserved','GLO:Horizontal_Margin') ! Resore ' preserved variable' from non-volatile store
  GLO:Vertical_Margin = SELF.TryFetch('Preserved','GLO:Vertical_Margin') ! Resore ' preserved variable' from non-volatile store
  GLO:Intercell_Gap = SELF.TryFetch('Preserved','GLO:Intercell_Gap') ! Resore ' preserved variable' from non-volatile store
  GLO:Main_Neuron_Y_Margin = SELF.TryFetch('Preserved','GLO:Main_Neuron_Y_Margin') ! Resore ' preserved variable' from non-volatile store
  GLO:Outline_Color = SELF.TryFetch('Preserved','GLO:Outline_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Box_Color = SELF.TryFetch('Preserved','GLO:Box_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Text_Color = SELF.TryFetch('Preserved','GLO:Text_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Label_Outline_Color = SELF.TryFetch('Preserved','GLO:Label_Outline_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Label_Box_Color = SELF.TryFetch('Preserved','GLO:Label_Box_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Label_Text_Color = SELF.TryFetch('Preserved','GLO:Label_Text_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Bezier_Color = SELF.TryFetch('Preserved','GLO:Bezier_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Gradient_Start = SELF.TryFetch('Preserved','GLO:Gradient_Start') ! Resore ' preserved variable' from non-volatile store
  GLO:Gradient_End = SELF.TryFetch('Preserved','GLO:Gradient_End') ! Resore ' preserved variable' from non-volatile store
  GLO:Gradient_Options = SELF.TryFetch('Preserved','GLO:Gradient_Options') ! Resore ' preserved variable' from non-volatile store
  GLO:Gradient_Orientation = SELF.TryFetch('Preserved','GLO:Gradient_Orientation') ! Resore ' preserved variable' from non-volatile store
  GLO:RoundButton_Height = SELF.TryFetch('Preserved','GLO:RoundButton_Height') ! Resore ' preserved variable' from non-volatile store
  GLO:RoundButton_Width = SELF.TryFetch('Preserved','GLO:RoundButton_Width') ! Resore ' preserved variable' from non-volatile store
  GLO:Round_Button_Text_Points = SELF.TryFetch('Preserved','GLO:Round_Button_Text_Points') ! Resore ' preserved variable' from non-volatile store
  GLO:Round_Button_Outline_Color = SELF.TryFetch('Preserved','GLO:Round_Button_Outline_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Round_Button_Box_Color = SELF.TryFetch('Preserved','GLO:Round_Button_Box_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Round_Button_Text_Color = SELF.TryFetch('Preserved','GLO:Round_Button_Text_Color') ! Resore ' preserved variable' from non-volatile store
  GLO:Central_Neuron_Extra_Height = SELF.TryFetch('Preserved','GLO:Central_Neuron_Extra_Height') ! Resore ' preserved variable' from non-volatile store
  GLO:IconColor = SELF.TryFetch('Preserved','GLO:IconColor') ! Resore ' preserved variable' from non-volatile store
  GLO:IconBG = SELF.TryFetch('Preserved','GLO:IconBG')     ! Resore ' preserved variable' from non-volatile store
  GLO:Icon_Size = SELF.TryFetch('Preserved','GLO:Icon_Size') ! Resore ' preserved variable' from non-volatile store
  GLO:Neurons_Area = SELF.TryFetch('Preserved','GLO:Neurons_Area') ! Resore ' preserved variable' from non-volatile store
  GLO:MaxChars = SELF.TryFetch('Preserved','GLO:MaxChars') ! Resore ' preserved variable' from non-volatile store
  GLO:Neuron_Font = SELF.TryFetch('Preserved','GLO:Neuron_Font') ! Resore ' preserved variable' from non-volatile store
  GLO:Label_Font = SELF.TryFetch('Preserved','GLO:Label_Font') ! Resore ' preserved variable' from non-volatile store
  PARENT.Fetch


INIMgr.Update PROCEDURE

  CODE
  PARENT.Update
  SELF.Update('Preserved','GLO:MaxInitialItems',GLO:MaxInitialItems) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:ExtraItems',GLO:ExtraItems) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:InitialRadius',GLO:InitialRadius) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Multiplier',GLO:Multiplier) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:ThisTextPoints',GLO:ThisTextPoints) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:MinDistance',GLO:MinDistance) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Grid',GLO:Grid)             ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:GridSize',GLO:GridSize)     ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Challenge',GLO:Challenge)   ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Email',GLO:Email)           ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Registered_To',GLO:Registered_To) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:SN',GLO:SN)                 ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:UniverseRadius',GLO:UniverseRadius) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:InitialAngle',GLO:InitialAngle) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:IncrementalAngle',GLO:IncrementalAngle) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Theme',GLO:Theme)           ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Menu:InitialRadius',GLO:Menu:InitialRadius) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Items:InitialRadius',GLO:Items:InitialRadius) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Items:MinimumDistance',GLO:Items:MinimumDistance) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Items:InitialItems',GLO:Items:InitialItems) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Items:ExtraItems',GLO:Items:ExtraItems) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Cell_Width',GLO:Cell_Width) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Cell_Height',GLO:Cell_Height) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Text_Points',GLO:Text_Points) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Horizontal_Margin',GLO:Horizontal_Margin) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Vertical_Margin',GLO:Vertical_Margin) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Intercell_Gap',GLO:Intercell_Gap) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Main_Neuron_Y_Margin',GLO:Main_Neuron_Y_Margin) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Outline_Color',GLO:Outline_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Box_Color',GLO:Box_Color)   ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Text_Color',GLO:Text_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Label_Outline_Color',GLO:Label_Outline_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Label_Box_Color',GLO:Label_Box_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Label_Text_Color',GLO:Label_Text_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Bezier_Color',GLO:Bezier_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Gradient_Start',GLO:Gradient_Start) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Gradient_End',GLO:Gradient_End) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Gradient_Options',GLO:Gradient_Options) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Gradient_Orientation',GLO:Gradient_Orientation) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:RoundButton_Height',GLO:RoundButton_Height) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:RoundButton_Width',GLO:RoundButton_Width) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Round_Button_Text_Points',GLO:Round_Button_Text_Points) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Round_Button_Outline_Color',GLO:Round_Button_Outline_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Round_Button_Box_Color',GLO:Round_Button_Box_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Round_Button_Text_Color',GLO:Round_Button_Text_Color) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Central_Neuron_Extra_Height',GLO:Central_Neuron_Extra_Height) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:IconColor',GLO:IconColor)   ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:IconBG',GLO:IconBG)         ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Icon_Size',GLO:Icon_Size)   ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Neurons_Area',GLO:Neurons_Area) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:MaxChars',GLO:MaxChars)     ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Neuron_Font',GLO:Neuron_Font) ! Save 'preserved variable' in non-volatile store
  SELF.Update('Preserved','GLO:Label_Font',GLO:Label_Font) ! Save 'preserved variable' in non-volatile store

