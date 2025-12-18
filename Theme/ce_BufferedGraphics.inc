PRAGMA('link(msimg32.lib)')
_ce_BufferedGraphics_       EQUATE(1)

dwRop:BLACKNESS     EQUATE(00000042h) ! Fills the destination rectangle using the color associated with index 0 in the physical palette. (This color is black for the default physical palette.)
dwRop:DSTINVERT     EQUATE(00550009h) ! Inverts the destination rectangle.
dwRop:MERGECOPY     EQUATE(00C000CAh) ! Merges the colors of the source rectangle with the specified pattern by using the Boolean AND operator.
dwRop:MERGEPAINT    EQUATE(00BB0226h) ! Merges the colors of the inverted source rectangle with the colors of the destination rectangle by using the Boolean OR operator.
dwRop:NOTSRCCOPY    EQUATE(00330008h) ! Copies the inverted source rectangle to the destination.
dwRop:NOTSRCERASE   EQUATE(001100A6h) ! Combines the colors of the source and destination rectangles by using the Boolean OR operator and then inverts the resultant color.
dwRop:PATCOPY       EQUATE(00F00021h) ! Copies the specified pattern into the destination bitmap.
dwRop:PATINVERT     EQUATE(005A0049h) ! Combines the colors of the specified pattern with the colors of the destination rectangle by using the Boolean XOR operator.
dwRop:PATPAINT      EQUATE(00FB0A09h) ! Combines the colors of the pattern with the colors of the inverted source rectangle by using the Boolean OR operator. The result of this operation is combined with the colors of the destination rectangle by using the Boolean OR operator.
dwRop:SRCAND        EQUATE(008800C6h) ! Combines the colors of the source and destination rectangles by using the Boolean AND operator.
dwRop:SRCCOPY       EQUATE(00CC0020h) ! Copies the source rectangle directly to the destination rectangle.
dwRop:SRCERASE      EQUATE(00440328h) ! Combines the inverted colors of the destination rectangle with the colors of the source rectangle by using the Boolean AND operator.
dwRop:SRCINVERT     EQUATE(00660046h) ! Combines the colors of the source and destination rectangles by using the Boolean XOR operator.
dwRop:SRCPAINT      EQUATE(00EE0086h) ! Combines the colors of the source and destination rectangles by using the Boolean OR operator.
dwRop:WHITENESS     EQUATE(00FF0062h) ! Fills the destination rectangle using the color associated with index 1 in the physical palette. (This color is white for the default physical palette.)

Colour_Type         GROUP,TYPE
red                     BYTE
green                   BYTE
blue                    BYTE
HighByte                BYTE
					END
GDI_DI_DEFAULTSIZE  EQUATE(0008h)
GDI_DI_IMAGE        EQUATE(0002h)
GDI_DI_MASK         EQUATE(0001h)
GDI_DI_NOMIRROR     EQUATE(0010h)
GDI_DI_NORMAL       EQUATE(0003h)

GDI_WHITE_BRUSH     EQUATE(0)
GDI_LTGRAY_BRUSH    EQUATE(1)
GDI_GRAY_BRUSH      EQUATE(2)
GDI_DKGRAY_BRUSH    EQUATE(3)
GDI_BLACK_BRUSH     EQUATE(4)
!GDI_NULL_BRUSH      EQUATE(080000005h)
GDI_NULL_BRUSH      EQUATE(5)
GDI_WHITE_PEN       EQUATE(6)
GDI_BLACK_PEN       EQUATE(7)
GDI_NULL_PEN        EQUATE(8)
GDI_OEM_FIXED_FONT  EQUATE(10)
GDI_ANSI_FIXED_FONT EQUATE(11)
GDI_ANSI_VAR_FONT   EQUATE(12)
GDI_SYSTEM_FONT     EQUATE(13)
GDI_DEVICE_DEFAULT_FONT     EQUATE(14)
GDI_DEFAULT_PALETTE EQUATE(15)
GDI_SYSTEM_FIXED_FONT       EQUATE(16)
GDI_DEFAULT_GUI_FONT        EQUATE(17)
GDI_DC_BRUSH        EQUATE(18)
GDI_DC_PEN          EQUATE(19)
GDI_FW_DONTCARE     EQUATE(0)
GDI_FW_THIN         EQUATE(100)
GDI_FW_EXTRALIGHT   EQUATE(200)
GDI_FW_ULTRALIGHT   EQUATE(200)
GDI_FW_LIGHT        EQUATE(300)
GDI_FW_NORMAL       EQUATE(400)
GDI_FW_REGULAR      EQUATE(400)
GDI_FW_MEDIUM       EQUATE(500)
GDI_FW_SEMIBOLD     EQUATE(600)
GDI_FW_DEMIBOLD     EQUATE(600)
GDI_FW_BOLD         EQUATE(700)
GDI_FW_EXTRABOLD    EQUATE(800)
GDI_FW_ULTRABOLD    EQUATE(800)
GDI_FW_HEAVY        EQUATE(900)
GDI_FW_BLACK        EQUATE(900)
GDI_CLR_INVALID     EQUATE(0FFFFFFFFH)


ULARGE_INTEGER      group,type
LowPart                 long
HighPart                long
					end

I64                 EQUATE(long) ! where used, use the push functions for pushing the 64bit longlong

API_MAX_PATH        EQUATE(260)
API_HANDLE          EQUATE(LONG)
API_HWND            EQUATE(API_HANDLE)
API_HINSTANCE       EQUATE(API_HANDLE)
API_HMODULE         EQUATE(API_HANDLE)
API_HMENU           EQUATE(API_HANDLE)
API_HDC             EQUATE(API_HANDLE)
API_HICON           EQUATE(API_HANDLE)
API_HCURSOR         EQUATE(API_HANDLE)
API_HBRUSH          EQUATE(API_HANDLE)
API_HBITMAP         EQUATE(API_HANDLE)
API_HGDIOBJ         EQUATE(API_HANDLE)
API_HFONT           EQUATE(API_HANDLE)
API_HRGN            EQUATE(API_HANDLE)
API_HGLOBAL         EQUATE(API_HANDLE)
API_HPEN            EQUATE(API_HANDLE)
API_HRESULT         EQUATE(API_HANDLE)
API_HPALETTE        EQUATE(API_HANDLE)
API_HMETA           EQUATE(API_HANDLE)

COLORREF            EQUATE(long)
ATOM                EQUATE(long)

GDI_ALTERNATE       EQUATE(1)
GDI_WINDING         EQUATE(2)
GDI_POLYFILL_LAST   EQUATE(2)
GDI_IMAGE_BITMAP    EQUATE(0)
GDI_IMAGE_ICON      EQUATE(1)
GDI_IMAGE_CURSOR    EQUATE(2)
GDI_IMAGE_ENHMETAFILE       EQUATE(3)
GDI_LR_DEFAULTCOLOR EQUATE(0000h)
GDI_LR_MONOCHROME   EQUATE(0001h)
GDI_LR_COLOR        EQUATE(0002h)
GDI_LR_COPYRETURNORG        EQUATE(0004h)
GDI_LR_COPYDELETEORG        EQUATE(0008h)
GDI_LR_LOADFROMFILE EQUATE(0010h)
GDI_LR_LOADTRANSPARENT      EQUATE(0020h)
GDI_LR_DEFAULTSIZE  EQUATE(0040h)
GDI_LR_VGACOLOR     EQUATE(0080h)
GDI_LR_LOADMAP3DCOLORS      EQUATE(1000h)
GDI_LR_CREATEDIBSECTION     EQUATE(2000h)
GDI_LR_COPYFROMRESOURCE     EQUATE(4000h)
GDI_LR_SHARED       EQUATE(8000h)

GDI_RDW_INVALIDATE  EQUATE(0001h)
GDI_RDW_INTERNALPAINT       EQUATE(0002h)
GDI_RDW_ERASE       EQUATE(0004h)
GDI_RDW_VALIDATE    EQUATE(0008h)
GDI_RDW_NOINTERNALPAINT     EQUATE(0010h)
GDI_RDW_NOERASE     EQUATE(0020h)
GDI_RDW_NOCHILDREN  EQUATE(0040h)
GDI_RDW_ALLCHILDREN EQUATE(0080h)
GDI_RDW_UPDATENOW   EQUATE(0100h)
GDI_RDW_ERASENOW    EQUATE(0200h)
GDI_RDW_FRAME       EQUATE(0400h)
GDI_RDW_NOFRAME     EQUATE(0800h)

LR_LOADFROMFILE     equate(0010h)
LR_LOADTRANSPARENT  equate(0020h)
IMAGE_BITMAP        equate(0)
IMAGE_ICON          equate(1)
IMAGE_CURSOR        equate(2)
IMAGE_ENHMETAFILE   equate(3)

GRADIENT_FILL_RECT_H        EQUATE(0)
GRADIENT_FILL_RECT_V        EQUATE(1)
EVENT:WM_USER       EQUATE(401h)
! WM_ERASEBKGND       equate(014H)

ColourGroup_Type    GROUP,TYPE
Red                     BYTE
Green                   BYTE
Blue                    BYTE
					END

GDI_NULL            EQUATE(0h)

GDI_RECT            group,type
left                    signed
top                     signed
right                   signed
bottom                  signed
					end
RECTL               Group,type
left                    Long
top                     Long
right                   Long
bottom                  Long
					end

POINT               group,type
x                       signed
y                       signed
					end

GDI_SIZE            group,type
cx                      signed
cy                      signed
					end

GDI_SIZEL           Group,type
cx                      Long
cy                      Long
					end

GDI_HANDLE          EQUATE(LONG)
GDI_HDC             EQUATE(GDI_HANDLE)

GDI_PAINTSTRUCT     group,type
hdc                     GDI_HDC
fErase                  bool
rcPaint                 group(GDI_RECT).
fRestore                bool
fIncUpdate              bool
rgbReserved             string(32)
					end

SA_POINT            group,type
x                       signed
y                       signed
					end


BezierPoints        GROUP,DIM(4),TYPE
x                       SIGNED
y                       SIGNED
					END

! Params use by TEXT functions
DT_TOP              EQUATE(0000h)
DT_LEFT             EQUATE(0000h)
DT_CENTER           EQUATE(0001h)
DT_RIGHT            EQUATE(0002h)
DT_VCENTER          EQUATE(0004h)
DT_BOTTOM           EQUATE(0008h)
DT_WORDBREAK        EQUATE(0010h)
DT_SINGLELINE       EQUATE(0020h)
DT_EXPANDTABS       EQUATE(0040h)
DT_TABSTOP          EQUATE(0080h)
DT_NOCLIP           EQUATE(0100h)
DT_EXTERNALLEADING  EQUATE(0200h)
DT_CALCRECT         EQUATE(0400h)
DT_NOPREFIX         EQUATE(0800h)
DT_INTERNAL         EQUATE(1000h)
DT_EDITCONTROL      EQUATE(2000h)

TRANSPARENT         EQUATE(0001h)
OPAQUE              EQUATE(0002h)



!Const DT_TOP As Long = &H0&                      'Justifies the text to the top of the rectangle.
!Const DT_LEFT As Long = &H0&                     'Aligns text to the left.
!Const DT_CENTER As Long = &H1&                   'Centers text horizontally in the rectangle.
!Const DT_RIGHT As Long = &H2&                    'Aligns text to the right.
!Const DT_VCENTER As Long = &H4&                  'Centers text vertically. This value is used only with the DT_SINGLELINE value.
!Const DT_BOTTOM As Long = &H8&                   'Justifies the text to the bottom of the rectangle. This value is used only with the DT_SINGLELINE value.
!Const DT_WORDBREAK As Long = &H10&               'Breaks words. Lines are automatically broken between words if a word would extend past the edge of the rectangle specified by the lpRect parameter. A carriage return-line feed sequence also breaks the line. If this is not specified, output is on one line.
!Const DT_SINGLELINE As Long = &H20&              'Displays text on a single line only. Carriage returns and line feeds do not break the line.
!Const DT_EXPANDTABS As Long = &H40&              'Expands tab characters. The default number of characters per tab is eight. The DT_WORD_ELLIPSIS, DT_PATH_ELLIPSIS, and DT_END_ELLIPSIS values cannot be used with the DT_EXPANDTABS value.
!Const DT_TABSTOP As Long = &H80&                 'Sets tab stops. Bits 158 (high-order byte of the low-order word) of the uFormat parameter specify the number of characters for each tab. The default number of characters per tab is eight. The DT_CALCRECT, DT_EXTERNALLEADING, DT_INTERNAL, DT_NOCLIP, and DT_NOPREFIX values cannot be used with the DT_TABSTOP value.
!Const DT_NOCLIP As Long = &H100&                 'Draws without clipping. DrawText is somewhat faster when DT_NOCLIP is used.
!Const DT_EXTERNALLEADING As Long = &H200&        'Includes the font external leading in line height. Normally, external leading is not included in the height of a line of text.
!Const DT_CALCRECT As Long = &H400&               'Determines the width and height of the rectangle. If there are multiple lines of text, DrawText uses the width of the rectangle pointed to by the lpRect parameter and extends the base of the rectangle to bound the last line of text. If the largest word is wider than the rectangle, the width is expanded. If the text is less than the width of the rectangle, the width is reduced. If there is only one line of text, DrawText modifies the right side of the rectangle so that it bounds the last character in the line. In either case, DrawText returns the height of the formatted text but does not draw the text.
!Const DT_NOPREFIX As Long = &H800&               'Turns off processing of prefix characters. Normally, DrawText interprets the mnemonic-prefix character & as a directive to underscore the character that follows, and the mnemonic-prefix characters && as a directive to print a single &. By specifying DT_NOPREFIX, this processing is turned off. For example, input string:"A&bc&&d", normal:"Abc&d", DT_NOPREFIX:"A&bc&&d". Compare with DT_HIDEPREFIX and DT_PREFIXONLY.
!Const DT_INTERNAL As Long = &H1000&              'Uses the system font to calculate text metrics.
!Const DT_EDITCONTROL As Long = &H2000&           'Duplicates the text-displaying characteristics of a multiline edit control. Specifically, the average character width is calculated in the same manner as for an edit control, and the function does not display a partially visible last line.
!Const DT_PATH_ELLIPSIS As Long = &H4000&         'For displayed text, replaces characters in the middle of the string with ellipses so that the result fits in the specified rectangle. If the string contains backslash (\) characters, DT_PATH_ELLIPSIS preserves as much as possible of the text after the last backslash. The string is not modified unless the DT_MODIFYSTRING flag is specified. Compare with DT_END_ELLIPSIS and DT_WORD_ELLIPSIS.
!Const DT_END_ELLIPSIS As Long = &H8000&          'For displayed text, if the end of a string does not fit in the rectangle, it is truncated and ellipses are added. If a word that is not at the end of the string goes beyond the limits of the rectangle, it is truncated without ellipses. The string is not modified unless the DT_MODIFYSTRING flag is specified. Compare with DT_PATH_ELLIPSIS and DT_WORD_ELLIPSIS.
!Const DT_MODIFYSTRING As Long = &H10000          'Modifies the specified string to match the displayed text. This value has no effect unless DT_END_ELLIPSIS or DT_PATH_ELLIPSIS is specified.
!Const DT_RTLREADING As Long = &H20000            'Layout in right-to-left reading order for bi-directional text when the font selected into the hdc is a Hebrew or Arabic font. The default reading order for all text is left-to-right.
!Const DT_WORD_ELLIPSIS As Long = &H40000         'Truncates any word that does not fit in the rectangle and adds ellipses. Compare with DT_END_ELLIPSIS and DT_PATH_ELLIPSIS.
!Const DT_NOFULLWIDTHCHARBREAK As Long = &H80000  'Windows 98/Me, Windows 2000/XP: Prevents a line break at a DBCS (double-wide character string), so that the line breaking rule is equivalent to SBCS strings. For example, this can be used in Korean windows, for more readability of icon labels. This value has no effect unless DT_WORDBREAK is specified.
!Const DT_HIDEPREFIX As Long = &H100000           'Windows 2000/XP: Ignores the ampersand (&) prefix character in the text. The letter that follows will not be underlined, but other mnemonic-prefix characters are still processed. For example, input string:"A&bc&&d", normal:"Abc&d", DT_HIDEPREFIX:"Abc&d". Compare with DT_NOPREFIX and DT_PREFIXONLY.
!Const DT_PREFIXONLY As Long = &H200000           'Windows 2000/XP: Draws only an underl
!SND_SYNC EQUATE(0000h) ! play synchronously (default)
!SND_ASYNC EQUATE(0001h) ! play asynchronously
!SND_NODEFAULT EQUATE(0002h) ! don't use default sound
!SND_MEMORY EQUATE(0004h) ! lpszSoundName points to a memory file
!SND_LOOP EQUATE(0008h) ! loop the sound until next sndPlaySound
!SND_NOSTOP          EQUATE(0010h) ! don't stop any currently playing sound
!
!SW_HIDE EQUATE(0)
!SW_SHOWNORMAL EQUATE(1)
!SW_NORMAL EQUATE(1)
!SW_SHOWMINIMIZED EQUATE(2)
!SW_SHOWMAXIMIZED EQUATE(3)
!SW_MAXIMIZE EQUATE(3)
!SW_SHOWNOACTIVATE EQUATE(4)
!SW_SHOW EQUATE(5)
!SW_MINIMIZE EQUATE(6)
!SW_SHOWMINNOACTIVE EQUATE(7)
!SW_SHOWNA EQUATE(8)
!SW_RESTORE          EQUATE(9)
!
!RECT EQUATE(LONG)
!UINT EQUATE(UNSIGNED)
!FOURCC EQUATE(LONG)
!WCHAR EQUATE(BYTE)
!UCHAR EQUATE(BYTE)
!CHAR EQUATE(BYTE)
!BOOL EQUATE(SIGNED)
!BYTE EQUATE(BYTE)
!WORD EQUATE(SIGNED)
!DWORD EQUATE(ULONG)
!HANDLE EQUATE(UNSIGNED)
!LPVOID EQUATE(ULONG)
!PVOID EQUATE(ULONG)
!FLOAT EQUATE(SREAL)
!LPSTR EQUATE(CSTRING) !Usage:Pass the Label of the LPSTR
!LPCSTR EQUATE(CSTRING) !Usage:Pass the Label of the LPCSTR
!MAX_PATH EQUATE(260)
!HWND EQUATE(HANDLE)
!HINSTANCE EQUATE(HANDLE)
!HMODULE EQUATE(HINSTANCE)
!HTASK EQUATE(HANDLE)
!HDC EQUATE(HANDLE)
!WPARAM EQUATE(UINT)
!LPARAM EQUATE(LONG)
!LRESULT EQUATE(LONG)
!LPBOOL EQUATE(ULONG)
!LPCVOID EQUATE(ULONG)
!
!HDIOBJ EQUATE(HANDLE)
!HCOLORSPACE EQUATE(HANDLE)
!HRDVR EQUATE(HANDLE)
!HWAVEOUT EQUATE(HANDLE)
!HWAVEIN EQUATE(HANDLE)
!HACCEL EQUATE(HANDLE)
!HBITMAP EQUATE(HANDLE)
!HPEN EQUATE(HANDLE)
!HWINSTA EQUATE(HANDLE)
!HBRUSH EQUATE(HANDLE)
!HRGN EQUATE(HANDLE)
!HKL EQUATE(HANDLE)
!HPALETTE EQUATE(HANDLE)
!HFONT EQUATE(HANDLE)
!HHOOK EQUATE(HANDLE)
!HDRVR EQUATE(HANDLE)
!HDWP EQUATE(HANDLE)
!HRSRC EQUATE(HANDLE)
!HSTR EQUATE(HANDLE)
!HCURSOR EQUATE(HANDLE)
!HICON EQUATE(HCURSOR)
!HGRN EQUATE(HANDLE)
!HMENU EQUATE(HANDLE)
!SC_HANDLE EQUATE(HANDLE)
!HDESK EQUATE(HANDLE)
!HENHMETAFILE EQUATE(HANDLE)
!HSZ EQUATE(WORD)
!HMETAFILE EQUATE(HANDLE)
!HMIDIIN EQUATE(HANDLE)
!HMIDIOUT EQUATE(HANDLE)
!HMMIO EQUATE(HANDLE)
!HFILE EQUATE(SIGNED)
!LUID EQUATE(LONG)
!PLUID EQUATE(LONG)
!
!ANYSIZE_ARRAY EQUATE(1)
!PHANDLE EQUATE(HANDLE)
!SPHANDLE EQUATE(HANDLE)
!LPHANDLE EQUATE(HANDLE)
!HGLOBAL EQUATE(HANDLE)
!HLOCAL EQUATE(HANDLE)
!GLOBALHANDLE EQUATE(HANDLE)
!LOCALHANDLE EQUATE(HANDLE)
!ATOM EQUATE(UINT)
!
!COLORREF EQUATE(DWORD)
!HDDEDATA EQUATE(DWORD)
!HCONV EQUATE(DWORD)
!HCONVLIST EQUATE(DWORD)
!LONGREAL EQUATE(REAL)
!DWORDLONG EQUATE(REAL)
!WORDLONG EQUATE(REAL)
!LARGE_INTEGER EQUATE(LONG)
!ULARGE_INTEGER EQUATE(ULONG)
!BOOLEAN EQUATE(BYTE)
!VERSION EQUATE(UNSIGNed)
!SWP_NOSIZE EQUATE(0001h)
!SWP_NOMOVE EQUATE(0002h)
!SWP_NOZORDER EQUATE(0004h)
!SWP_NOREDRAW EQUATE(0008h)
!SWP_NOACTIVATE EQUATE(0010h)
!SWP_DRAWFRAME EQUATE(0020h)
!SWP_SHOWWINDOW EQUATE(0040h)
!SWP_HIDEWINDOW EQUATE(0080h)
!SWP_NOCOPYBITS EQUATE(0100h)
!SWP_NOREPOSITION EQUATE(0200h)
!
!!SetWindowPos() PARAMETER #2
!HWND_TOP EQUATE(0)
!HWND_BOTTOM EQUATE(1)
!HWND_TOPMOST EQUATE(-1)


!--------------------------------------------------------------------------------
!Class ce_BufferedGraphics
!
!--------------------------------------------------------------------------------
ce_BufferedGraphics Class(),Type,Module('ce_BufferedGraphics.Clw'),LINK('ce_BufferedGraphics.Clw',1)
! Properties

FontHandle              LONG
FontFace                CSTRING(255)
TempFontHandle          uLONG


RoundRect               PROCEDURE(SIGNED StartX,SIGNED StartY,SIGNED EndX,SIGNED EndY, SIGNED Radius, ULONG OutlineColor, ULONG FillColor),LONG,VIRTUAL
PenColor                PROCEDURE(LONG PenColor),VIRTUAL
InitFont                PROCEDURE(STRING FontFace, uLONG TextPoints),VIRTUAL
FontColor               PROCEDURE(LONG TextColor),VIRTUAL
BrushColor              PROCEDURE(LONG BrushColor),LONG,VIRTUAL
FreeGDIResources        PROCEDURE(),VIRTUAL
RemoveFontResourceGDI   PROCEDURE(),VIRTUAL
DrawBox                 PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY, ULONG BoxColor, ULONG OutlineColor,LONG Radius),VIRTUAL
Background              PROCEDURE(LONG BackgroundMode), VIRTUAL
Draw_Cell_With_Header   PROCEDURE(SIGNED StartX, SIGNED StartY, |
												SIGNED Cell_Width, SIGNED Cell_Height, ULONG BoxColor, ULONG OutlineColor, SIGNED Cell_Roundness,|
												SIGNED Label_Cell_Width, SIGNED Label_Cell_Height, ULONG Label_BoxColor, ULONG Label_OutlineColor, SIGNED Label_Cell_Roundness,|
												STRING Label_Text, LONG Label_Left_Padding, LONG Label_Top_Padding, STRING Label_Justify, STRING Label_FontFace, LONG Label_FontPoints, ULONG Label_FontColor,|
												STRING Data_Text,LONG Data_Left_Padding, LONG Data_Top_Padding, STRING Data_Justify, STRING Data_FontFace, LONG Data_FontPoints, ULONG Data_FontColor), VIRTUAL
DrawRoundButton   PROCEDURE(SIGNED StartX, SIGNED StartY, |
												SIGNED Cell_Width, SIGNED Cell_Height, ULONG BoxColor, ULONG OutlineColor, |
										STRING Data_Text,LONG Data_Left_Padding, LONG Data_Top_Padding, | 
										STRING Data_Justify, STRING Data_FontFace, LONG Data_FontPoints, ULONG Data_FontColor)
MixColors               PROCEDURE(LONG pColor1,LONG pColor2,BYTE pPercentageMix),LONG
Ln                      PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY)

DrawImage               PROCEDURE(STRING pImageFile, UNSIGNED pW, UNSIGNED pH), LONG, VIRTUAL

Bezier                  PROCEDURE(LONG StartX,LONG StartY,LONG EndX, LONG EndY, LONG BezierColor),VIRTUAL
Trn                     PROCEDURE(LONG CenterX,LONG CenterY,LONG InnerCircle,LONG OuterCircle,<STRING Direction>),VIRTUAL
Ellip                   PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY, ULONG OutlineColor, ULONG FillColor),VIRTUAL
Poly                    PROCEDURE(LONG CenterX,LONG CenterY,LONG Sides,LONG Radius,LONG StartAngle),STRING,VIRTUAL
DrawGradient            PROCEDURE(BYTE pFillOrder, LONG pStartColour, LONG pEndColour,<LONG StartX>,<LONG StartY>,<LONG EndX>,<LONG EndY>) 
DrawDoubleGradient      PROCEDURE(BYTE pFillOrder, LONG pStartColour, LONG pEndColour)                  

FillOrder               BYTE
memoryDC                LONG
ClonedMemoryDC          LONG

tempDC                  LONG
memoryBitMap            LONG
memoryOriginalBitMap    LONG
controlHWnd             LONG
controlDC               LONG
sourceWidth             LONG
sourceHeight            LONG
ControlFEQ              LONG


IconsTempDC             LONG
IconsMemoryBitMap       LONG
IconsMemoryOriginalBitMap       LONG
IconsControlHWnd        LONG
IconsControlDC          LONG
IconsSourceWidth        LONG
IconsSourceHeight       LONG
IconsControlFEQ         LONG
IconsMemoryDC           LONG



StartColour_Clarion     LONG
StartColour             GROUP(ColourGroup_Type),OVER(StartColour_Clarion)
						END
EndColour_Clarion       LONG
EndColour               GROUP(ColourGroup_Type),OVER(EndColour_Clarion)
						END

RectVertex              GROUP,PRE(),DIM(2)
RVX                         LONG
RVY                         LONG
RVRed                       USHORT
RVGreen                     USHORT
RVBlue                      USHORT
RVAlpha                     USHORT
						END

GradientRect            GROUP,PRE()
GRUpperLeft                 ULONG
GRLowerRight                ULONG
						END


! Methods
Allocate                PROCEDURE (SIGNED pControlFEQ),LONG ,VIRTUAL 
DeAllocate              PROCEDURE () ,VIRTUAL 

IconsAllocate           PROCEDURE (SIGNED IconspControlFEQ),LONG ,VIRTUAL 
IconsDeAllocate         PROCEDURE () ,VIRTUAL 

Render                  PROCEDURE () ,VIRTUAL 
SetPixel                PROCEDURE (LONG pX, LONG pY, LONG pColour) ,VIRTUAL 
Load                    PROCEDURE () ,VIRTUAL 
					END ! Class Definition
!_EndOfInclude_
