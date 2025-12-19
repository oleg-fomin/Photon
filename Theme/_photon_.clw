

      Member()
         omit('***$***',_VER_C55)
_ABCDllMode_  EQUATE(0)
_ABCLinkMode_ EQUATE(1)
         ***$***
      Include('Equates.CLW'),ONCE
      Include('Keycodes.CLW'),ONCE
      Include('Errors.CLW'),ONCE
      Map
			Module('Win32.lib')


	TextOut_A(ULong,uLong,uLONG,uLong,uLong),bool,pascal,raw,proc,name('TextOutA')
	GradientFill( ULong, long, LONG, long, LONG, LONG),long,pascal,raw,name('GradientFill'),proc

	!SetDCBrushColor(uLONG,uLONG),uLONG,PASCAL,RAW, NAME('SetDCBrushColor')
	SetDCBrushColor(LONG hdc, uLONG),ULONG,PASCAL,proc
    SA_AnimateWindow(HWND,DWORD,DWORD),BOOL,PASCAL,RAW, NAME('AnimateWindow')
	PolyBezier(LONG hdc,uLONG,uLONG), uLONG, PASCAL, RAW, NAME('PolyBezier')
	PolyBezierTo(LONG hdc,uLONG,uLONG), uLONG, PASCAL, RAW, NAME('PolyBezierTo')
	LoadIcon(uLONG AppInstance, uLONG AddressIconCstring), uLONG, PASCAL, RAW, NAME('LoadIconA')
	DestroyIcon(uLONG), LONG, PASCAL, RAW, NAME('DestroyIcon')
	DrawIconEx(ULONG hDC, uLONG Left, uLONG yTop, ULONG hIcon, uLONG cxWidth, uLONG cyWidth, ULONG iStepIfAniCur, ULONG hbrFlickerFreeDraw, ULONG diFlags), LONG, RAW, PASCAL, PROC, NAME('DrawIconEx')
	DrawIcon(ulong,ulong, ulong, ulong),bool,pascal,raw,proc,name('DrawIcon')
	SA_RGB(BYTE ,BYTE ,BYTE),uLONG,PASCAL,RAW, NAME('RGB')
	SelectObject(uLONG, uLONG),ULONG,PASCAL,proc
	GetStockObject(uLONG),ULONG,PASCAL,raw
	GDI_Ellipse(LONG hdc, uLONG, uLONG, uLONG, uLONG),ULONG,PASCAL,proc,name('Ellipse')
  
     !    ReleaseDC                                       ! Releases adevice context, freeing it for use by other applications.
	ReleaseDC(ulong, ulong),ulong,PASCAL,proc


	SetDCPenColor(LONG hdc, uLONG),ULONG,PASCAL,proc

	SA_MessageBox(LONG hWnd, long lpText, long lpCaption, long uType),long,pascal,name('MessageBoxW'),proc,Name('MessageBox')

	SA_IsWindowEnabled(LONG hWnd),bool,pascal,Name('IsWindowEnabled')

	SA_GetFileAttributes(*CString szFileName),long,pascal,raw,name('GetFileAttributesA')
	SA_CreateDirectory(*CString szPathName, *SA_SECURITY_ATTRIBUTES SecurityAttributes),bool,pascal,raw,name('CreateDirectoryA')

	SA_DefWindowProc(LONG hWnd, unsigned nMsg, unsigned wParam, |
		long lParam),long,pascal,name('DefWindowProcA')
	SA_SetWindowLong(LONG hWnd, signed nIndex, long dwNewLong),long,pascal,proc,name('SetWindowLongA')
	SA_GetWindowLong(LONG hWnd, signed nIndex),long,pascal,name('GetWindowLongA')
	SA_CallWindowProc(long lpPrevWndProc, LONG hwnd, unsigned nMsg, unsigned wParam, |
		long lParam),long,pascal,name('CallWindowProcA')

	SA_RegisterClass(*SA_WNDCLASS lpWndClass),LONG,pascal,raw,name('RegisterClassA')
	SA_RegisterClassEx(*SA_WNDCLASSEX lpWndClassEx),LONG,pascal,raw,name('RegisterClassExA')
	SA_UnRegisterClass(*CString lpClassName, LONG hInstance),bool,raw,pascal,name('UnRegisterClassA')
	SA_GetClassInfo(LONG hInst, *CString lpClassName, *SA_WNDCLASS |
		lpWndClass),bool,raw,pascal,name('GetClassInfoA')

	SA_LoadCursor(LONG hInst, long lpCursorName),LONG,pascal, |
		name('LoadCursorA')
	SA_DestroyIcon(SA_HICON hIcon),Bool,Pascal, Name('DestroyIcon')
	SA_ShowCursor(bool bShow),long,pascal,Name('ShowCursor')
	SA_SetCursor(long hCursor),long,name('SetCursor')
	SA_SetCursorPos(signed x, signed y),bool,pascal,proc,Name('SetCursorPos')
	SA_GetCursorPos(*SA_POINT),bool,raw,pascal,proc,Name('GetCursorPos')

	SA_CreateMenu(),LONG,pascal,Name('CreateMenu')
	SA_DestroyMenu(LONG hMenu),bool,pascal,proc,Name('DestroyMenu')

	SA_CreateWindowEx(unsigned dwExStyle, *CString lpClassName, <*CString lpWindowName>, |
		unsigned dwStyle, signed X, signed Y, signed nWidth, signed nHeight, |
		LONG hWndParent, LONG hMenu, LONG hInstance, long lpParam), |
		LONG,raw,pascal,name('CreateWindowExA')
	SA_UpdateWindow(LONG hWnd),bool,pascal,proc,Name('UpdateWindow')
	SA_RedrawWindow(LONG hWnd, long lprcUpdate, LONG hrgnUpdate, unsigned flags),bool,raw,pascal,Name('RedrawWindow')
	SA_BeginPaint(LONG hWnd, *SA_PAINTSTRUCT lpPaint),LONG,raw,pascal,Name('BeginPaint')
	SA_EndPaint(LONG hWnd, *SA_PAINTSTRUCT lpPaint),bool,raw,pascal,proc,Name('EndPaint')
	SA_GetUpdateRect(LONG hWnd, *SA_RECT lpRect, bool bErase),bool,pascal,raw,Name('GetUpdateRect')
	SA_GetUpdateRgn(LONG hWnd, LONG hRgn, BOOL bErase),Long,Pascal,Name('GetUpdateRgn')
	SA_GetStockObject(signed),LONG,pascal,Name('GetStockObject')
	SA_DestroyWindow(LONG hWnd),bool,pascal,proc,Name('DestroyWindow')
	SA_PostMessage(LONG hWnd, unsigned nMsg, unsigned wParam, long lParam), |
		bool,pascal,proc,name('PostMessageA')
	SA_SendMessage(LONG hWnd, long nMsg, long wParam, long lParam), |
		BOOL,pascal,proc,name('SendMessageA')

	SA_SendMessageTimeout(LONG hWnd, Long uMsg, UNSIGNED wParam, Long lParam, UNSIGNED fuFlags, UNSIGNED uTimeout, *Long lpdwResult),Long,Pascal,Raw Name('SendMessageTimeoutA')
	SA_PeekMessage(long lpMsg, LONG hWnd, long wMsgFilterMin, long wMsgFilterMax, long wRemoveMsg),bool,pascal,proc,name('PeekMessageA')
	SA_SetWindowPos(LONG hWnd, LONG hWndInsertAfter, unsigned x, unsigned y, |
		unsigned cx, unsigned cy, unsigned uFlags),bool,pascal,proc,Name('SetWindowPos')
	SA_MoveWindow(LONG hWnd, unsigned x, unsigned y, unsigned cx, unsigned cy, bool bRedraw),bool,pascal,proc,Name('MoveWindow')
	SA_SetWindowText(LONG hWnd, *CString lpString),bool,raw,pascal,name('SetWindowTextA')
	SA_ShowWindow(LONG hWnd, signed nCmdShow),bool,pascal,proc,Name('ShowWindow')
	SA_SetForegroundWindow(LONG hwnd),bool,pascal,proc,Name('SetForegroundWindow')
	SA_GetLastActivePopup(LONG hwnd),LONG,pascal,Name('GetLastActivePopup')
	SA_IsIconic(LONG hwnd),bool,pascal,Name('IsIconic')
	SA_ScreenToClient(LONG hWnd, *SA_POINT lpPOINT),bool,raw,pascal,proc,Name('ScreenToClient')
	SA_ClientToScreen(LONG hWnd, *SA_POINT lpPOINT),bool,raw,pascal,proc,Name('ClientToScreen')
	SA_GetWindowRect(LONG hWnd, *SA_RECT lpRect),bool,raw,pascal,proc,Name('GetWindowRect')
	SA_GetClientRect(LONG hWnd, *SA_RECT lpRect),bool,raw,pascal,proc,Name('GetClientRect')
	SA_DrawEdge(LONG hdc, *SA_RECT qrc, unsigned edge, unsigned grfFlags), |
		bool,raw,pascal,proc,Name('DrawEdge')
	SA_DrawText(LONG hdc, *CString lpszString, unsigned nCount, *SA_RECT lpRect, |
		unsigned uFormat),signed,raw,pascal,proc,name('DrawTextA')
	SA_DrawState(LONG hdc, LONG hbr, long lpOutputFunc, long lData, long wData, long x, |
		long y, long cx, long cy, long fuFlags),bool,pascal,name('DrawStateA'),proc
	SA_Rectangle(LONG hdc, signed nLeftRect, signed nTopRect, signed nRightRect, |
		signed nBottomRect),bool,pascal,proc,Name('Rectangle')
	SA_EqualRect(*SA_RECT, *SA_RECT),bool,raw,pascal,Name('EqualRect')
	SA_RoundRect(LONG hdc, signed nLeftRect, signed nTopRect, signed nRightRect, |
		signed nBottomRect, signed nWidth, signed nHeight),bool,pascal,Name('RoundRect')
	SA_CopyRect(*SA_RECT rcDst, *SA_RECT rcSrc),bool,raw,pascal,proc,Name('CopyRect')
	SA_CopyRectRaw(long rcDst, long rcSrc),bool,pascal,proc,name('CopyRect')
	SA_SetPolyFillMode(LONG hdc, long iPolyFillMode),long,pascal,proc,Name('SetPolyFillMode')
	SA_Polygon(LONG hdc, long lpPt, long nCount),bool,proc,pascal,Name('Polygon')
	SA_SetBkMode(LONG hdc, signed iBkMode),signed,pascal,proc,Name('SetBkMode')
	SA_SetBkColor(LONG hdc, SA_COLORREF crColor),bool,pascal,proc,Name('SetBkColor')
	SA_SetTextColor(LONG hdc, LONG crColor),LONG,pascal,proc,Name('SetTextColor')
	SA_GetTextExtentPoint(LONG hdc, *cstring lpString, long cbString, *SA_SIZE lpSize),bool,raw,pascal,proc,name('GetTextExtentPointA')
	SA_GetTextExtentExPoint(LONG hdc, *cstring szStr, long cchString, long nMaxExtent, |
		*long nFit, <*long Dx>, *SA_SIZE lpSize),bool,raw,pascal,name('GetTextExtentExPointA')


!EnumFontFamExProc PROCEDURE(LONG lpElf,    | pointer to ENUMLOGFONTEX or ENUMLOGFONTEXDV
!                            LONG lpNtm,    | pointer to TEXTMETRIC or NEWTEXTMETRICEX or ENUMTEXTMETRIC
!                            LONG FontType, | font type bitmap
!                            LONG lParam    | optional user defined data
!                            ),SIGNED,PASCAL,TYPE

	SA_EnumFontFamiliesEx(UNSIGNED hdc,             | handle to DC
	*SA_LOGFONT lpLogfont,       | font information
	*EnumFontFamExProc lpEnumFontFamExProc, | callback function
	LONG        lParam,              | additional data to pass to callback
	LONG        dwFlags=0            | not used; must be 0
	),SIGNED,PROC,PASCAL,RAW,NAME('EnumFontFamiliesExA')

	SA_CreateFont(signed nHeight, signed nWidth, signed nEscapement, |
		signed nOrientation, signed fnWeight, unsigned fdwItalic, |
		unsigned fdwUnderline, unsigned fdwStrikeOut, unsigned |
		fdwCharSet, unsigned fdwOutputPrecision, unsigned |
		fdwClipPrecision, unsigned fdwQuality, unsigned |
		fdwPitchAndFamily, *CString lpszFace),LONG,pascal,raw,name('CreateFontA')
	SA_ExtTextOut(LONG hdc, long X, long Y, long fuOptions, *SA_RECT rc, <*cstring lpString>, long cbCount, long lpDx),bool,raw,pascal,name('ExtTextOutA'),proc

	SA_DeleteObject(LONG),bool,pascal,proc,Name('DeleteObject')
	SA_SelectObject(LONG hdc, SA_HGDIOBJ hgdiobj),LONG,pascal,proc,Name('SelectObject')
	SA_CreateCompatibleDC(LONG hdc),LONG,pascal,Name('CreateCompatibleDC')

	SA_LoadBitmap(LONG hInst, long lpBitmapName),LONG,pascal, |
		name('LoadBitmapA')
	SA_LoadImage(LONG hinst, long lpszName, unsigned uType, signed cxDesired, |
		signed cyDesired, unsigned fuLoad),LONG,pascal,raw,name('LoadImageA')
	SA_CreateBitmap(long nWidth, long nHeight, long cPlanes, long cBitsPerPel, long lpvBits),long,pascal,Name('CreateBitmap')

	SA_CreateCompatibleBitmap(LONG hdc, signed nWiidth, signed nHeight),LONG,pascal,Name('CreateCompatibleBitmap')
	SA_CreateDIBitmap(LONG hdc, *SA_BITMAPINFOHEADER bmih, long fdwInit, long lpbInit, *SA_BITMAPINFO bmi, long fuUsage),LONG,raw,pascal,Name('CreateDIBitmap')

	SA_GetBitmapDimensionEx(LONG hBitmap, *SA_SIZE lpDimension),bool,raw,pascal,Name('GetBitmapDimensionsEx')
	SA_BitBlt(LONG hdcDest, signed nXDest, signed nYDest, signed nWidth, signed |
		nHeight, LONG hdcSrc, signed nXSrc, signed nYSrc, long dwRop),bool,pascal,proc,Name('BitBlt')
!    SA_PatBlt(LONG hdc,      | handle to DC
!              Long nXLeft,   | x-coord of upper-left rectangle corner
!              Long nYLeft,   | y-coord of upper-left rectangle corner
!              Long nWidth,   | width of rectangle
!              Long nHeight,  | height of rectangle
!              ULong dwRop   | raster operation code
!             ),BOOL,Pascal,Raw,Name('PatBlt')

	SA_GetDIBits(LONG hdc, LONG hbmp, unsigned uStartScan, unsigned cScanLines, |
		long lpvBits, long lpbi, unsigned uUsage),signed,raw,pascal,proc,Name('GetDIBits')
	SA_GetDIBits(LONG hdc, LONG hbmp, unsigned uStartScan, unsigned cScanLines, |
		long lpvBits, *SA_BITMAPINFO lpbi, unsigned uUsage),signed,raw,pascal,proc,Name('GetDIBits')
	SA_GetBitmapBits(LONG hbmp, long cbBuffer, long lpvBits),long,pascal,proc,Name('GetBitmapBits')

	SA_GetDeskTopWindow(),LONG, Pascal, Name('GetDesktopWindow')
	SA_DeleteDC(LONG hdc),bool,pascal,proc,Name('DeleteDC')
	SA_ReleaseDC(LONG hdc, LONG hdc),bool,pascal,proc,Name('ReleaseDC')
	SA_CreateDC(*CString lpszDriver, <*CString lpszDevice>, <*CString lpszOutput>, |
		<long lpInitData>),LONG,raw,pascal,name('CreateDCA')
	SA_GetDC(LONG hwnd),LONG,pascal,Name('GetDC')
	SA_GetObject(SA_HGDIOBJ hgdiobj, signed cbBuffer, *? lpVoid),signed,pascal,raw,name('GetObjectA')
	SA_CreatePolygonRgn(long lppt, unsigned cPoints, signed fnPolyFillMode),LONG,pascal,Name('CreatePolygonRgn')
	SA_CreateRectRgn(signed nLeftRect, signed nTopRect, signed nRightRect, signed nBottomRect),LONG,pascal,Name('CreateRectRgn')
	SA_CombineRgn(LONG hRgnDst, LONG hrgnSrc1, LONG hrgnsrc2, Long fnCombineMode),Long, Pascal, Proc, Name('CombineRgn')
	SA_PtInRegion(LONG hrgn, signed x, signed y),bool,pascal,Name('PtInRegion')
	SA_PtInRect(*SA_RECT, SA_POINT),bool,raw,pascal,Name('PtInRect')
	SA_GetRegionDataRaw(LONG hrgn, long dwCount, <*? lpRgnData>),long,pascal, Raw,Name('GetRegionData')
	SA_GetRegionData(LONG hrgn, long dwCount, UNSIGNED lpRgnData),long,pascal, Raw,Name('GetRegionData')
	SA_ExtCreateRegionRaw(<*SA_XFORM lpXform>, UNSIGNED nCount, *? lpRgnData),LONG,pascal, Raw,Name('ExtCreateRegion')
	SA_ExtCreateRegion(<*SA_XFORM lpXform>, UNSIGNED nCount, UNSIGNED lpRgnData),LONG,pascal, Raw,Name('ExtCreateRegion')

	SA_CreateEllipticRgnIndirect(*SA_RECT lprc),LONG,Pascal, Raw, Name('CreateEllipticRgnIndirect')
	SA_SetWindowRgn(LONG hWnd, LONG hRgn, BOOL bRedraw),Long,Pascal,Name('SetWindowRgn')
	SA_GetWindowRgn(LONG hWnd, LONG hRgn),Long,Pascal,Proc, Name('GetWindowRgn')
	SA_GetRgnBox(LONG hWnd, *SA_RECT lprc),Long,Pascal,Raw, Proc, Name('GetRgnBox')
	SA_FrameRgn(LONG hdc, LONG hrgn, LONG hbr, Long nWidth, Long nHeight ),BOOL,Pascal,Proc,Name('FrameRgn')

	SA_IntersectClipRect(LONG hdc, long nLeftRect, long nTopRect, long nRightRect, long nBottomRect),long,pascal,proc,Name('Inte5rsectClipRect')
	SA_ExcludeClipRect(LONG hdc, long nLeftRect, long nTopRect, long nRightRect, long nBottomRect),long,pascal,proc,Name('ExcludeClipRect')
	SA_SelectClipRgn(LONG DC, LONG hRgn),long,pascal,proc,Name('SelectClipRgn')
	SA_DrawFocusRect(LONG hdc, *SA_RECT lprc),bool,raw,pascal,proc,Name('DrawFocusRect')
	SA_DrawFrameControl(LONG hdc, *SA_RECT lprc, unsigned uType, unsigned uState),bool,raw,pascal,Name('DrawFrameControl')
	SA_InvalidateRect(LONG hwnd, <*SA_RECT lpRect>, bool bErase),bool,raw,pascal,proc,Name('InvalidateRect')
	SA_ValidateRect(LONG hwnd, *SA_RECT lpRect),bool,raw,pascal,proc,Name('ValidateRect')
	SA_GetParent(LONG hwnd),LONG,pascal,Name('GetParent')
	SA_SetParent(LONG hWndChild, LONG hWndNewParent),long,pascal,proc,Name('SetParent')
	SA_FillRect(LONG hdc, *SA_RECT lprc, LONG hbr),bool,raw,pascal,proc,Name('FillRect')
	SA_FillRgn(LONG hdc, LONG hrgn, LONG hbr),BOOL,Pascal,proc,Name('FillRgn')
	SA_CreateSolidBrush(SA_COLORREF crColor),LONG,pascal,Name('CreateSolidBrush')
	SA_CreateHatchBrush(signed fnStyle, SA_COLORREF clrref),LONG,pascal,Name('CreateHatchBrush')
	SA_GetSysColor(signed nIndex),long,pascal,Name('GetSysColor')
	SA_MoveToEx(uLONG,signed x, signed y, *SA_POINT lpPoint),bool,raw,pascal,proc,Name('MoveToEx')
	SA_LineTo(LONG hdc, signed x, signed y),bool,pascal,proc,Name('LineTo')
	SA_PolyLine(LONG hdc, *? pArrayPts, Long nPts),BOOL, pascal, proc, raw, name('PolyLine')
	!SA_SetDCPenColor(LONG hdc, uLONG),ULONG,PASCAL,proc

	SA_SetCapture(LONG hwnd),LONG,pascal,proc,Name('SetCapture')
	SA_ReleaseCapture(),bool,pascal,proc,Name('ReleaseCapture')
	SA_GetCapture(),LONG,pascal,Name('GetCapture')
	SA_IsWindow(LONG hwnd),bool,pascal,Name('IsWindow')
	SA_AdjustWindowRectEx(*SA_RECT lpRect, long dwStyle, bool bMenu, long dwExStyle),bool,raw,pascal,Name('AdjustWindowRectEx')
	SA_AdjustWindowRect(*SA_RECT lpRect, long dwStyle, bool bMenu),bool,raw,pascal,proc,Name('AdjustWindowRect')
	SA_GetSysColorBrush(unsigned nIndex),LONG,pascal,name('GetSysColorBrush')
	SA_CreatePen(signed fnPenStyle, signed nWidth, SA_COLORREF crColor),LONG,pascal,name('CreatePen')

	SA_ExtCreatePen(Long dwPenStyle, Long dwWidth, *SA_LOGBRUSH lpLogbrush, Long dwStyleCount, <*? lpStyle>),LONG,pascal,raw,name('ExtCreatePen')

	SA_GetSystemMetrics(signed nIndex),signed,pascal,Name('GetSystemMetrics')

	SA_EnumResNameProc(HINSTANCE hInst, long lpszType, long lpszName, |
		long lParam),bool,pascal,type

	SA_EnumResTypeProc(HINSTANCE hInst, long lpszType, long lParam),bool,pascal,type

	SA_EnumResourceNames(HINSTANCE hModule, long lpszType, SA_EnumResNameProc |
		lpEnumProc, long lParam),bool,pascal,name('EnumResourceNamesA')
	SA_EnumResourceTypes(HINSTANCE hModule, SA_EnumResTypeProc lpEnumProc, long |
		lParam),bool,pascal,name('EnumResourceTypesA')

	SA_LoadLibrary(*CString lpLibFileName),LONG,pascal,raw,name('LoadLibraryA')
	SA_FreeLibrary(long hModule),bool,pascal,proc,Name('FreeLibrary')
	SA_GetProcAddress(long hModule, *CString lpszProcName), long,pascal,raw,name('GetProcAddress')
	SA_GetModuleHandle(*CString lpModuleName),LONG,pascal,raw,name('GetModuleHandleA')

	SA_LoadLibraryEx32W(*CString lpszLibFile, long hFile, long dwFlags),long,raw,pascal,Name('LoadLibraryEx32W')
	SA_FreeLibrary32W(long hInst),bool,pascal,Name('FreeLibary32W')
	SA_GetProcAddress32W(long hInst, *CString lpszProc),long,raw,pascal,Name('GetProcAddress32W')

	SA_SetScrollInfo(LONG hwnd, signed fnBar, *SA_SCROLLINFO lpsi, bool fRedraw),signed,raw,pascal,proc,Name('SetScrollInfo')
	SA_GetScrollInfo(LONG hwnd, signed fnBar, *SA_SCROLLINFO lpsi),bool,raw,pascal,Name('GetScrollInfo')
	SA_SetScrollRange(LONG hWnd, signed nBar, signed nMinPos, signed nMaxPos, bool bRedraw),bool,pascal,proc,Name('SetScrollRange')
	SA_ShowScrollBar(LONG hwnd, signed wBar, bool bShow),bool,pascal,proc,Name('ShowScrollBar')

	SA_ScrollWindowEx(LONG hWnd, signed dx, signed dy, <*SA_RECT rcScroll>, *SA_RECT rcClip, LONG hrgnUpdate, <*SA_RECT rcUpdate>, unsigned flags),signed,raw,pascal,proc,Name('ScrollWindowEx')

	SA_SetFocus(LONG hwnd),LONG,pascal,proc,Name('SetFocus')
	SA_GetFocus(),LONG,pascal,proc,Name('GetFocus')
	SA_GetLastError(),long,pascal,Name('GetLastError')

	SA_CreateFile( *CSTRING lpFileName,                      | file name
	ULONG       dwDesiredAccess,                     | access mode
	ULONG       dwShareMode,                         | share mode
		<*SA_SECURITY_ATTRIBUTES lpSecurityAttributes>, | SD, null for default
	ULONG       dwCreationDisposition,               | how to create
	ULONG       dwFlagsAndAttributes,                | file attributes
	UNSIGNED    hTemplateFile                     | handle to template file
		),LONG,PASCAL,RAW,NAME('CreateFileA')
		SA_ReadFile  (LONG hFile,                           | handle to file
	UNSIGNED    lpBuffer,                        | data buffer
	ULONG       nNumberOfBytesToRead,                | number of bytes to read
		<*ULONG lpNumberOfBytesRead>,              | number of bytes read
		<*? lpOverlapped>                          | overlapped buffer
		),BOOL,PASCAL,RAW,NAME('ReadFile')
		SA_WriteFile (LONG hFile,                           | handle to file
	UNSIGNED    lpBuffer,                         | pointer to data buffer
	ULONG       nNumberOfBytesToWrite,               | number of bytes to write
		*ULONG lpNumberOfBytesWritten,             | number of bytes written
		<*? lpOverlapped>                          | overlapped buffer
		),BOOL,PASCAL,RAW,NAME('WriteFile')
		SA_FlushFileBuffers(LONG hFile                      | handle to file
		),BOOL,PASCAL,PROC,NAME('FlushFileBuffers')
		SA_LockFile(LONG hFile,                             | handle to file
	ULONG       dwFileOffsetLow,                       | low-order word of offset
	ULONG       dwFileOffsetHigh,                      | high-order word of offset
	ULONG       nNumberOfBytesToLockLow,               | low-order word of length
	ULONG       nNumberOfBytesToLockHigh               | high-order word of length
		),BOOL,PASCAL,NAME('LockFile')
		SA_UnlockFile(LONG hFile,                           | handle to file
	ULONG       dwFileOffsetLow,                     | low-order word of offset
	ULONG       dwFileOffsetHigh,                    | high-order word of offset
	ULONG       nNumberOfBytesToUnLockLow,           | low-order word of length
	ULONG       nNumberOfBytesToUnLockHigh           | high-order word of length
		),BOOL,PASCAL,NAME('UnlockFile')
		SA_GetFileSize(LONG hFile,                          | handle to file
		<*ULONG lpFileSizeHigh>                    | high-order word of file size
		),ULONG,PASCAL,RAW,NAME('GetFileSize')
		SA_SetFilePointer(LONG hFile,                  | handle to file
	LONG        lDistanceToMove,               | bytes to move pointer
		<*LONG lpDistanceToMoveHigh>,       | bytes to move pointer !Omit for null
	ULONG       dwMoveMethod                  | starting point FILE_BEGIN, FILE_CURRENT, FILE_END
	),LONG,PASCAL,RAW,NAME('SetFilePointer')
	SA_DeleteFile(*cstring szFileName),bool,name('DeleteFileA'),raw,pascal
	SA_ReplaceFile(*cstring szFileName, *cstring szReplacementFileName, long lpBackupFileName, Ulong dwReplaceFlags, |
		long lpExclude = 0, long lpReserved = 0),bool,raw,pascal,name('ReplaceFileA')
	SA_CopyFile(*cstring szFileName, *cstring szNewFileName, bool bFailIfExists),bool,raw,pascal,name('CopyFileA')
	SA_SetEndOfFile(LONG hFile),bool,pascal,proc,Name('SetEndoOfFile')

	SA_GetWindowsDirectory(*CString lpBuffer, unsigned uSize),unsigned,pascal,raw,proc,name('GetWindowsDirectoryA')
	SA_GetCurrentDirectory(long nBufferLength, *CString lpBuffer),long,raw,pascal,proc,name('GetCurrentDirectoryA')
	SA_GetModuleFileName(LONG hModule, *CString lpFilename, long nSize),long,pascal,raw,proc,name('GetModuleFileNameA')

	SA_GetCurrentProcessID(),long,pascal,name('GetCurrentProcessId')
	SA_GetCurrentThreadID(),long,pascal,name('GetCurrentThreadId')

    !SA_TimerProc(LONG hwnd, unsigned uMsg, unsigned idEvent, long dwTime),pascal,type

	SA_SetTimer(LONG hWnd, unsigned nIDEvent, unsigned uElapse, long lpTimerFunc),unsigned,pascal,proc,Name('SetTimer')
	SA_KillTimer(LONG hWnd, unsigned uIDEvent),bool,pascal,proc,Name('KillTimer')

	SA_InitializeCriticalSection(*Long lpCriticalSection),raw,pascal,Name('InitializeCriticalSection')
	SA_EnterCriticalSection(*SA_CRITICAL_SECTION lpCriticalSection),raw,pascal,Name('EnterCriticalSection')
	SA_LeaveCriticalSection(*SA_CRITICAL_SECTION lpCriticalSection),raw,pascal,Name('LeaveCriticalSection')
	SA_DeleteCriticalSection(*SA_CRITICAL_SECTION lpCriticalSection),raw,pascal,Name('DeleteCriticalSection')

	SA_GlobalAlloc(long uFlags, long dwBytes),long,pascal,Name('GlobalAlloc')
	SA_GlobalFree(LONG hMem),LONG,pascal,proc,Name('GlobalFree')
	SA_GlobalLock(LONG hMem),long,pascal,proc,Name('GlobalLock')
	SA_GlobalUnlock(LONG hMem),bool,pascal,proc,Name('GlobalUnlock')
	SA_GlobalHandle(long lpmem),LONG,pascal,Name('GlobalHandle')
	SA_GlobalSize(LONG hMem),UNSIGNED,pascal,Name('GlobalSize')

	SA_VirtualAlloc(long lpAddress, long dwSize, long flAllocationType, long flProtect),long,pascal,Name('VirtualAlloc')
	SA_HeapAlloc(long hHeap, long dwFlags, long dwBytes),long,pascal,Name('HeapAlloc')
	SA_VirtualFree(long lpAddress, long dwSize, long dwFreeType),bool,pascal,Name('VirtualFree')
	SA_HeapFree(long hHeap, long dwFlags, long lpMem),bool,pascal,Name('HeapFree')
	SA_GetProcessHeap(),long,pascal,Name('GetProcessHeap')

	SA_CloseHandle(LONG),bool,raw,pascal,proc,Name('CloseHandle')

	SA_IsBadReadPtr(long SourcePtr,long dwLength),bool,raw,pascal,Name('IsBadReadPtr')
	SA_IsBadWritePtr(long DestinationPtr,long dwLength),bool,raw,pascal,Name('IsBadWritePtr')

	SA_MoveMemory(long DestinationPtr,long SourcePtr,long dwLength),bool,raw,proc,pascal,name('RtlMoveMemory')
	SA_FillMemory(long DestinationPtr,long dwLength, long dValue),pascal,Raw,name('RtlFillMemory')
	SA_ZeroMemory(long DestinationPtr,long dwLength),raw,pascal,name('RtlZeroMemory')

	SA_lstrcpy(long DestinationPtr, long SourcePtr),long,pascal,Name('lstrcpy')
	SA_lstrcat(long DestinationPtr, long SourcePtr),long,pascal,Name('lstrcat')
	SA_lstrcmp(long DestinationPtr, long SourcePtr),long,pascal,Name('lstrcmp')
	SA_lstrlenW(*? lpWString),signed,proc,pascal,Raw,Name('lstrlenW')

	SA_wsprintf(long lpBuffer, long lpFormat, long Value),long,C,raw,name('wsprintfA')

	SA_GetTickCount(),long,pascal,Name('GetTickCount')

	SA_GetMenu(LONG hWnd),LONG,pascal,Name('GetMenu')
	SA_GetSubMenu(HMENU hMenu, long nPos),LONG,pascal,Name('GetSubMenu')
	SA_GetMenuItemCount(HMENU hMenu),long,pascal,Name('GetMenuItemCount')
	SA_GetMenuItemID(HMENU hMenu, long nPos),long,pascal,Name('GetMenuItemId')
	SA_GetMenuItemInfo(HMENU hMenu, long uItem, bool fByPosition, *MENUITEMINFO mii),bool,raw,pascal,name('GetMenuItemInfoA')
	SA_SetMenuItemInfo(HMENU hMenu, long uItem, bool fByPosition, *MENUITEMINFO mii),bool,raw,pascal,name('SetMenuItemInfoA')

	SA_BringWindowToTop(LONG hWnd),short,proc,pascal,Name('BrintWindowToTop')
	SA_FindWindow(<*cstring lpszClassName>, <*cstring lpszWindowName>),LONG,raw,pascal,name('FindWindowA')
	SA_EnumWindows(UNSIGNED lpEnumFunc, Long lParam ),Bool, Pascal, Name('EnumWindowsA')
	SA_EnumChildWindows(LONG hWndParent, UNSIGNED lpEnumFunc, Long lParam ),Bool, Pascal, Name('EnumChildWindows')

	SA_GetForegroundWindow(),LONG,pascal,Name('GetForegroundWindow')
	SA_GetGUIThreadInfo(long idThread, *GUITHREADINFO lpgui),bool,raw,pascal,Name('GetGUIThreadInfo')
	SA_WindowFromPoint(real PtByValue),LONG,pascal,Name('WindowFromPoint')

	SA_InterlockedIncrement(*long Var),long,pascal,proc,Name('InterlockedIncrement')
	SA_InterlockedDecrement(*long Var),long,pascal,proc,Name('InterlockedDecrement')

	SA_CoInitialize(long = 0),LONG,pascal,Name('CoInitialize')
	SA_CoUninitialize(),pascal,Name('CoUninitialize')
	SA_CoTaskMemFree(LONG pv),PASCAL,Name('CoTaskMemFree')
	SA_OleInitialize(long pvReserved),long,pascal,Name('OleInitialize')
	SA_OleUninitialize(),pascal,Name('OleUnititialize')
	SA_CoGetClassObject(REFCLSID rclsid, long dwClsContext, long pvReserved, |
		REFIID riid, *long ppvObject),long,raw,pascal,Name('CoGetClassObject')
	SA_CoCreateInstance(REFCLSID rclsid, long pUnkOuter, long dwClsContext, |
		REFIID riid, *long ppvObject),long,raw,pascal,Name('CoCreateInstance')
	SA_CoLockObjectExternal(long pUnk, bool fLock, bool fLastUnlockReleases),LONG,pascal,Name('CoLockObjectExternal')
	SA_RegisterDragDrop(LONG hwnd, long pDropTarget),long,pascal,Name('RegisterDragDrop')
	SA_RevokeDragDrop(LONG hwnd),long,pascal,Name('RevokeDrageDrop')
	SA_DoDragDrop(long pDataObj, long pDropSource, long dwOKEffects, *long dwEffect),long,pascal,Name('DoDragDrop')

	SA_GetRunningObjectTable(long reserved, long ppRot),LONG,pascal,Name('GetRunningObjectTable')
	SA_OleRun(long pIUnk),LONG,pascal,Name('OleRun')
	SA_GetActiveObject(REFCLSID rclsid, long pvReserved, *long pUnk),LONG,pascal,Name('GetActiveObject')

	SA_WaitForSingleObject(LONG hHandle, long dwMilliSeconds),long,pascal,Name('WaitForSingleObject')
	SA_MsgWaitForMultipleObjects(long nCount, long pHandles, bool bWaitAll, long dwMilliseconds, |
		long dwWakeMask),long,pascal,Name('MsgWaitForMultipleObjects')

	SA_WaitForMultipleObjects(Long nCount, |
		*? lpHandles, |
		BOOL bWaitAll, |
		ULong dwMilliseconds |
		),ULong, Pascal, Raw, Proc, Name('WaitForMultipleObjects')

	SA_WaitForSingleObjectEx(LONG hHandle, |
		ULong dwMilliseconds, |
		BOOL bAlertable  |
		),ULong, Pascal, Proc, Name('WaitForSingleObjectEx')
	SA_WaitForMultipleObjectsEx(Long nCount, |
		*? lpHandles, |
		BOOL bWaitAll, |
		ULong dwMilliseconds, |
		BOOL bAlertable       |
		),ULong, Pascal, Raw, Proc, Name('WaitForMultipleObjectsEx')

	SA_ResetEvent(LONG hEvent),bool,pascal,proc,Name('ResetEvent')
	SA_TranslateMessage(long lpMsg),long,pascal,proc,name('TranslateMessage')
	SA_DispatchMessage(long lpMsg),long,pascal,proc,name('DispatchMessageA')
	SA_WaitMessage(),bool,pascal,Name('WaitMessage')
	SA_GetMessage(long lpMsg, LONG hWnd, long wMsgFilterMin, long wMsgFilterMax),bool,pascal,name('GetMessageA')

	SA_MultiByteToWideChar(long CodePage, long dwFlags, long lpMultiByteStr, long cbMultiByte, |
		long lpWideCharStr, long cchWideCharStr),long,pascal,Name('MultiByteToWideChar')

	SA_WideCharToMultiByte(long CodePage, long dwFlags, long lpWideCharStr, long cchWideChar, |
		long lpMultiByteStr, long cbMultiByte, long lpDefaultChar, |
		long lpUsedDefaultChar),long,pascal,Name('WideCharToMultiByte')

!WINOLEAUTAPI VarI4FromDate(DATE dateIn, LONG * plOut);
	SA_VarI4FromDate(REAL dateIn, *LONG plOut),long,pascal,Name('VarI4FromDate')

	SA_VarBstrFromDate(REAL dateIn, LONG lcid, ULONG dwFlags, *LONG pbstrOut),long,pascal,Name('VarBstrFromDate')
	SA_VarBstrFromDate(REAL dateIn, LONG lcid, ULONG dwFlags, *bstring pbstrOut),long,pascal,Name('VarBstrFromDate')
	SA_VarDecFromR8(REAL dblIn, *DECIMAL pdecOut),long,pascal,Name('VarDecFromR8')

	SA_GetSystemTime(*SA_SYSTEMTIME),raw,pascal,Name('GetSystemTime')
	SA_GetSystemTimeAsFileTime(*SA_FILETIME SystemTimeAsFileTime),raw,pascal,Name('GetFileTime')
   
	SA_SystemTimeToFileTime(*SA_SYSTEMTIME lpSystemTime, *SA_FILETIME lpFileTime),BOOL, Pascal, Raw,Proc,Name('SystemTimeToFileTime')
	SA_FileTimeToLocalFileTime(*SA_FILETIME lpFileTime, *SA_FILETIME lpLocalFileTime),BOOL,Pascal, Raw,Proc,Name('FileTimeToLocalFileTime')
	SA_FileTimeToSystemTime(*SA_FILETIME lpFileTime, *SA_SYSTEMTIME lpSystemTime),BOOL, Pascal,Raw,Proc,Name('FileTimeToSystemTime')
	SA_LocalFileTimeToFileTime(*SA_FILETIME lpLocalFileTime, *SA_FILETIME lpFileTime),BOOL, Pascal, Raw,Proc,Name('LocalFileTimeToFileTime')                  

	SA_OutputDebugString(Const *Cstring lpOutputString),Pascal,Raw,Name('OutputDebugStringA')
   
	SA_GetThreadLocale(),long,pascal,Name('GetThreadLocale')

	SA_CreateEvent(<*SA_SECURITY_ATTRIBUTES lpSecurityAttributes>, bool bManualReset, |
		bool bInitialState, long lpName),long,pascal,name('CreateEventA')
	SA_CreateEvent(<*SA_SECURITY_ATTRIBUTES lpSecurityAttributes>, bool bManualReset, |
		bool bInitialState, <*CString lpName>),long,pascal, Raw, Name('CreateEventA')
                   
	SA_SetEvent(LONG hEvent),bool,pascal,proc,Name('SetEvent')

	SA_CreateThread(<*SA_SECURITY_ATTRIBUTES lpSecurityAttributes>, long Stacksize, long lpFunction, long lpParameter, |
		long CreationFlags, *long ThreadID),long,raw,pascal,Name('CreateThread')

	SA_TerminateThread(long hThread, long dwExitCode),bool,pascal,proc,Name('TerminateThread')
	SA_PostQuitMessage(long nExitCode),pascal,Name('PostQuitMessage')

! Clipboard Manager Functions

	SA_OpenClipboard(long hWndNewOwner),bool,pascal,Name('OpenClipboard')
	SA_CloseClipboard(),BOOL,pascal,Name('CloseClipboard')
	SA_GetClipboardSequenceNumber(),long,pascal,Name('GetClipboardSequenceNumber')
	SA_GetClipboardOwner(),long,pascal,Name('GetClipboardOwner')
	SA_SetClipboardViewer(long hWndNewViewer),long,pascal,Name('SetClipboardViewer')
	SA_GetClipboardViewer(),long,pascal,Name('GetClipboardViewer')
	SA_ChangeClipboardChain(long hWndRemove, long hWndNewNext),bool,pascal,Name('GetClipboardChain')
	SA_SetClipboardData(long uFormat, long hMem),long,pascal,Name('SetClipboardData')
	SA_GetClipboardData(long uFormat),long,pascal,Name('GetClipboardData')
	SA_CountClipboardFormats(),long,pascal,Name('CountClipboardFormats')
	SA_EnumClipboardFormats(long lformat),long,pascal,Name('EnumClipboardFormats')
	SA_RegisterClipboardFormat(long lpszFormat),long,pascal,name('RegisterClipboardFormatA')
	SA_GetClipboardFormatName(long lformat, long lpszFormatName, long cchMaxCount),long,pascal,name('GetClipboardFormatNameA')

	SA_EmptyClipboard(),bool,pascal,Name('EmptyClipboard')
	SA_IsClipboardFormatAvailable(long lformat),bool,pascal,Name('IsClipboardFormatAvailable')
	SA_GetPriorityClipboardFormat(*long aFormatPriorityList, long cFormats),long,pascal,Name('GetPriorityClipboardFormat')
	SA_GetOpenClipboardWindow(),long,pascal,Name('GetOpenClipboardWindow')

! Registry Functions
	SA_RegOpenKey(long hKey, *Cstring pszSubKey, *long phkResult),long,pascal,name('RegOpenKeyA')
	SA_RegOpenKeyEx(Long hKey,*Cstring lpSubKey, <ULong ulOptions>, UNSIGNED samDesired, *UNSIGNED phkResult)Long,Pascal,Raw,Name('RegOpenKeyExA')

	SA_RegQueryValue(long hKey, *Cstring pszSubKey, *Cstring pszValue, *long cbValue),long,pascal,name('RegQueryValueA')
	SA_RegQueryValueEx(long hKey, *Cstring pszValueName, <long lpReserved>, <*long dwType>, *? lpData, *long cbData),long,pascal,name('RegQueryValueExA')
	SA_RegCloseKey(long hKey),long,proc,pascal, Name('RegCloseKey')

!-----

	SA_GlobalAddAtom(*CSTRING lpString),USHORT,PASCAL,RAW,NAME('GlobalAddAtomA')
	SA_GlobalGetAtomName(USHORT nAtom, |
		*CSTRING lpBuffer, |
		SIGNED nSize),ULONG,PASCAL,RAW,NAME('GlobalGetAtomNameA')
	SA_GlobalFindAtom(*CSTRING lpString),USHORT,PASCAL,RAW,NAME('GlobalFindAtomA')

	SA_GlobalDeleteAtom(UNSIGNED nAtom),USHORT,PASCAL,RAW,PROC,NAME('GlobalDeleteAtom')

	SA_RegisterWindowMessage(*CSTRING lpString),UNSIGNED,RAW,PASCAL,NAME('RegisterWindowMessageA')

	SA_SystemParametersInfo(UNSIGNED uiAction,     |
		UNSIGNED uiParam=0,    |Depends upon the uiAction parameter
	<*? pvParam>,          |
		UNSIGNED fWinIni=0),BOOL,PASCAL,RAW,PROC,NAME('SystemParametersInfoA')

	SA_CreatePalette(*? pPal),LONG,PASCAL,RAW,NAME('CreatePalette')
	SA_SelectPalette(LONG Thishdc, LONG hpal, BOOL bForceBackground),LONG,PASCAL,PROC,Name('SelectPalette')
	SA_RealizePalette(LONG Thishdc),UNSIGNED,PASCAL,PROC,Name('RealizePalette')
	SA_UpdateColors(LONG hdc),Bool,PASCAL,PROC,Name('UpdateColors')

	SA_StretchBlt(LONG hdcDest,      | handle to destination DC
	LONG        nXOriginDest, | x-coord of destination upper-left corner
	LONG        nYOriginDest, | y-coord of destination upper-left corner
	LONG        nWidthDest,   | width of destination rectangle
	LONG        nHeightDest,  | height of destination rectangle
	LONG        hdcSrc,       | handle to source DC
	LONG        nXOriginSrc,  | x-coord of source upper-left corner
	LONG        nYOriginSrc,  | y-coord of source upper-left corner
	LONG        nWidthSrc,    | width of source rectangle
	LONG        nHeightSrc,   | height of source rectangle
	LONG        dwRop         | raster operation code
	),BOOL,PASCAL,PROC,Name('StretchBlt')

	SA_ScrollWindowEx(LONG hWnd, |
		signed dx, signed dy, |
		<*SA_RECT rcScroll>,   |
		<*SA_RECT rcClip>,     |
		<LONG hrgnUpdate>,    |
		<*SA_RECT rcUpdate>,   |
		unsigned flags),signed,raw,pascal,proc, Name('ScrollWindowEx')

	SA_SetMapMode(LONG Thishdc, LONG fnMapMode),LONG,PASCAL,PROC,Name('SetMapMode')
	SA_SaveDC(LONG Thishdc),LONG,PASCAL,PROC,Name('SaveDC')
	SA_RestoreDC(LONG Thishdc, LONG nSavedDC),BOOL,PASCAL,PROC,Name('RestoreDC')

		SA_SetViewportOrgEx(LONG Thishdc,     | handle to device context
	LONG        X,          | new x-coordinate of viewport origin
	LONG        Y,          | new y-coordinate of viewport origin
		<*SA_POINT lpPoint> | original viewport origin
		),BOOL,PASCAL,RAW,PROC,Name('SetViewportOrgEx')

		SA_CreateRectRgnIndirect(*SA_RECT lprc),LONG,PASCAL,RAW,Name('CreateRectRgnIndirect')
		SA_PaintRgn(LONG hdcThis,LONG hrgn),BOOL,PASCAL,PROC,Name('PaintRgn')
		SA_InvalidateRgn(LONG ThishWnd, LONG ThisHrgn, BOOL bErase),BOOL,PASCAL,PROC,Name('InvalidateRgn')
		SA_ValidateRgn(LONG ThishWnd, LONG hRgn),BOOL,PASCAL,PROC,Name('ValidateRgn')

		SA_CreateBrushIndirect(*SA_LOGBRUSH lplb),LONG,PASCAL,RAW,Name('CreateBrushIndirect')

		SA_RedrawWindow(LONG hWnd,         | handle to window
		<*SA_RECT lprcUpdate>,| update rectangle
	LONG        hrgnUpdate=0, | handle to update region
	LONG        flags         | array of redraw flags
		),BOOL,PASCAL,RAW,PROC,Name('RedrawWindow')


		SA_SetRect(*SA_RECT lprc,     | rectangle
	LONG        xLeft,     | left side
	LONG        yTop,      | top side
	LONG        xRight,    | right side
	LONG        yBottom    | bottom side
		),BOOL,PASCAL,RAW,PROC,Name('SetRect')


		SA_OffsetRect(*SA_RECT lprc,  | rectangle
	LONG        dx,     | horizontal offset
	LONG        dy      | vertical offset
		),BOOL,PASCAL,RAW,PROC,Name('OffsetRect')
	 
		SA_InflateRect(*SA_RECT lprc,  | rectangle
	LONG        dx,       | amount to adjust width
	LONG        dy        | amount to adjust height
		),BOOL,PASCAL,RAW,PROC,Name('InflateRect')

		SA_IntersectRect(*SA_RECT lprcDst,     | intersection buffer
		*SA_RECT lprcSrc1,    | first rectangle
		*SA_RECT lprcSrc2     | second rectangle
		),Bool,Pascal,Raw,Name('IntersectRect')

		SA_IsRectEmpty(*SA_RECT lprc),Bool,Pascal,Raw,Name('IsRectEmpty')

		SA_MapWindowPoints(LONG hWndFrom,     | handle to source window
	LONG     hWndTo,       | handle to destination window
		*? lpPoints,       | array of points to map
	UNSIGNED    cPoints   | number of points in array
		),SIGNED,PASCAL,RAW,PROC,Name('MapWindowPoints')

	 
		SA_GetBkColor(LONG hdc),LONG,PASCAL,Name('GetBkColor')

		SA_MulDiv(LONG nNumber,       | 32-bit signed multiplicand
	LONG        nNumerator,    | 32-bit signed multiplier
	LONG        nDenominator   | 32-bit signed divisor
		)LONG,PASCAL,Name('MulDiv')

		SA_CreateDIBitmap(LONG hdc,              | handle to DC
	LONG        lpbmih,           | bitmap data
	LONG        fdwInit,          | initialization option
	LONG        lpbInit,          | pointer to initialization data
	LONG        lpbmi,            | color-format data
	LONG        fuUsage           | color-data usage
		),LONG,PASCAL,RAW,Name('CreateDIBitmap')  !hBitmap

		SA_SetDIBits(LONG hdc,                  | handle to DC
	LONG        hbmp,                 | handle to bitmap
	LONG        uStartScan,           | starting scan line
	LONG        cScanLines,           | number of scan lines
	LONG        lpvBits,              | array of bitmap bits
		*BITMAPINFO lpbmi,        | bitmap data
	LONG        fuColorUse            | type of color indexes to use
		),LONG,PASCAL,RAW,Name('SetDIBits')

		SA_SetStretchBltMode(LONG hdc,           | handle to DC
	Long        iStretchMode  | bitmap stretching mode
		),Long, PASCAL,RAW,Name('SetStretchBltMode')

		SA_StretchDIBits(LONG hdc,                      | handle to DC
	LONG        XDest,                    | x-coord of destination upper-left corner
	LONG        YDest,                    | y-coord of destination upper-left corner
	LONG        nDestWidth,               | width of destination rectangle
	LONG        nDestHeight,              | height of destination rectangle
	LONG        XSrc,                     | x-coord of source upper-left corner
	LONG        YSrc,                     | y-coord of source upper-left corner
	LONG        nSrcWidth,                | width of source rectangle
	LONG        nSrcHeight,               | height of source rectangle
	LONG        lpBits,                   | bitmap bits
	LONG        lpBitsInfo,               | bitmap data
	ULONG       iUsage,                  | usage options
	UNSIGNED    dwRop                 |  raster operation code
		),LONG,PASCAL,RAW,Name('StretchDIBits')

		SA_LoadImage(LONG hisnst,  |
			*CSTRING lpszName, |
			LONG uType,    |
			LONG cxDesired,  |
			LONG cyDesired,  |
			LONG fuLoad    |
			),LONG,PASCAL,RAW,NAME('LoadImageA')


		SA_CreateFontIndirect(*SA_LOGFONT lplf   | characteristics
		),LONG,PASCAL,RAW,NAME('CreateFontIndirectA')

		SA_GetDeviceCaps(LONG hdc,    | handle to DC
	LONG        nIndex  | index of capability
		),LONG,PASCAL,Name('GetDeviceCaps')

		SA_GetTextExtentPoint32(LONG hdc,           | handle to DC
		*CSTRING lpString,  | text string
	LONG        cbString,      | characters in string
		*SA_SIZE lpSize     | string size SIZE structure
		),BOOL,PASCAL,RAW,PROC,NAME('GetTextExtentPoint32A')

		SA_GetCharABCWidths(LONG hdc,         | handle to DC
	UNSIGNED    uFirstChar, | first character in range
	UNSIGNED    uLastChar,  | last character in range
	UNSIGNED    lpabc       | pointer to array of character widths
		),BOOL,PASCAL,RAW,NAME('GetCharABCWidthsA')

		SA_GetCharacterPlacement(LONG hDC,                  | handle to DC
		*CSTRING lpString,         | character string
	SIGNED      nCount,             | number of characters
	SIGNED      nMaxExtent,         | maximum extent for string
		*SA_GCP_RESULTS lpResults,    | placement result
	ULONG       dwFlags              | placement options
		),ULONG,PASCAL,RAW,NAME('GetCharacterPlacementA')

		SA_SetTextJustification(LONG hdc,          | handle to DC
	SIGNED      nBreakExtra,  | length of extra space
	SIGNED      nBreakCount   | count of space characters
		),BOOL,PASCAL,PROC,Name('SetTextJustification')

		SA_SetTextAlign(LONG hDC, UNSIGNED fMode),UNSIGNED,PASCAL,PROC,Name('SetTextAlign')
		SA_GetTextAlign(LONG hDC),UNSIGNED,PASCAL,PROC,Name('GetTextAlign')

		SA_GetFontLanguageInfo(LONG hdc),ULONG,PASCAL,Name('GetFontLanguageInfo')

		SA_GetOutlineTextMetrics(LONG hdc,                    | handle to DC
	UNSIGNED    cbData,             | size of metric data array
		<*? lpOTM>                   | array of OTM, metric data array
		),UNSIGNED,PASCAL,RAW,NAME('GetOutlineTextMEtricsA')

		SA_GetTextMetrics(LONG hdc, *TEXTMETRIC tm),Bool,Pascal,Raw,Proc,Name('GetTextMetricsA')

		SA_GetKerningPairs(LONG hdc,                 | handle to DC
	UNSIGNED    nNumPairs,      | number of kerning pairs
		<*? lpkrnpair> | array of kerning pairs
		),UNSIGNED,PASCAL,RAW,NAME('GetKerningPairsA')

		SA_TextOut(LONG hdc,             | handle to DC
	LONG        nXStart,       | x-coordinate of starting position
	LONG        nYStart,       | y-coordinate of starting position
		*CSTRING lpString,  | character string
	LONG        cbString       | number of characters
		),BOOL,PASCAL,PROC,RAW,NAME('TextOutA')

		SA_TabbedTextOut(LONG hDC,   |handle to DC
	Long        X,       |x-coord of start
	Long        Y,       | y-coord of start
		*Cstring lpString, |character string
	Long        nCount,  | number of characters
	Long        nTabPositions, | number of tabs in array
		*Long lpnTabStopPositions, |array of tab positions
	Long        nTabOrigin | start of tab expansion
		),Bool, Pascal, Raw, Proc, Name('TabbedTextOutA')

		SA_ExtTextOut(LONG hDC,          | handle to DC
	LONG        X,           | x-coordinate of reference point
	LONG        Y,           | y-coordinate of reference point
	ULONG       fuOptions,   | text-output options
		<*SA_RECT lprc>,     | optional dimensions
		*? lpString,| pointer to string or Glyph index array
	LONG        cbCount,     | number of characters in string
		<*? lpDx>       | array of spacing values
		),BOOL,RAW,PASCAL,NAME('ExtTextOutA'),PROC


		SA_DrawTextEx(LONG hDC,          | handle to DC
		*CSTRING lpString, | text to draw
	LONG        nCount,       | text length
		*SA_RECT lpRect,      | formatting dimensions
	LONG        uFormat,      | text-drawing options
		<*SA_DRAWTEXTPARAMS dtp>| Extended parameters
		),LONG,PROC,PASCAL,RAW,NAME('DrawTextExA')

		SA_GetTextColor(LONG hdc),LONG,PASCAL,Name('GetTextColor')

		SA_SetGraphicsMode(LONG hdc,   | handle to device context
	LONG        iMode  | graphics mode
		),LONG,PASCAL,PROC,Name('SetGraphicsMode')

		SA_ClipCursor(<*SA_RECT lpRect>),BOOL,PASCAL,RAW,PROC,Name('ClipCursor')


		SA_OpenPrinter    ( *CSTRING pPrinterName,       | printer or server name
		*LONG phPrinter,             | printer or server handle
	LONG        pDefault                | printer defaults
		),BOOL,PASCAL,RAW,NAME('OpenPrinterA')

		SA_WritePrinter   ( LONG hPrinter,             | handle to printer object
		*? pBuf,                     | Pointer to array of printer data
	LONG        cbBuf,                 | size of array
		*LONG pcBytesWritten         | Pointer to bytes received
		),BOOL,RAW,PASCAL,PROC,Name('WritePrinter')

		SA_GetPrinter     (LONG hPrinter,    | handle to printer
	LONG        Level,       | information level
		*? pPrinter,      | printer information buffer
	LONG        cbBuf,       | size of buffer
		*LONG pcbNeeded   | bytes received or required
		),BOOL,PASCAL,RAW,NAME('GetPrinterA')

		SA_ClosePrinter ( LONG hPrinter ),BOOL,RAW,PASCAL,PROC,Name('ClosePrinter')
		SA_StartDoc    (LONG hdc, *SA_DOCINFO lpDocInfo),LONG,PASCAL,RAW,PROC,NAME('StartDocA')
		SA_EndDoc         ( LONG hdc ),LONG,PASCAL,RAW,PROC,Name('EndDoc')
		SA_StartPage      ( LONG hDC ),LONG,PASCAL,RAW,PROC,Name('StartPage')
		SA_EndPage     ( LONG hdc ),LONG,PASCAL,RAW,PROC,NAME('EndPage')

		SA_StartDocPrinter( LONG hPrinter,             | handle to printer object
	LONG        Level,                 | information level
		*? pDocInfo                  | information buffer
		),LONG,PASCAL,PROC,RAW,NAME('StartDocPrinterA')
		SA_EndDocPrinter  ( LONG hPrinter ),BOOL,PASCAL,RAW,PROC,Name('EndDocPrinter')
		SA_StartPagePrinter( LONG hPrinter ),BOOL,PASCAL,RAW,PROC,Name('StartPagePrinter')
		SA_EndPagePrinter( LONG hPrinter ),BOOL,PASCAL,RAW,PROC,Name('EndPagePrinter')

		SA_EnumPrinters  ( LONG Flags,         | printer object types
		<*CSTRING>,          | Ponter to string containing name of printer object
	LONG        Level,         | information level
		*? pPrinterEnum,     | Pointer to printer information buffer
	LONG        cbBuf,         | size of printer information buffer
		*? pcbNeeded,        | pointer to DWORD of bytes received or required
		*? pcReturned        | pointer to DWORD of number of printers enumerated
		),BOOL,PASCAL,RAW,NAME('EnumPrintersA')


		SA_DeviceCapabilities(LONG pDevice,        | printer name
	LONG        pPort,          | port name
	USHORT      fwCapability, | device capability
	LONG        pOutput,        | output buffer, datatype depends on fwCapability
		<*DEVMODE pDevMode>  | device data buffer
		),LONG,PASCAL,RAW,NAME('DeviceCapabilitiesA'),PROC


		SA_SetLastError(ULONG dwErrCode),PASCAL,Name('SetLastError')


		SA_SetProp(LONG hWnd, *? lpString, LONG hData),BOOL,PASCAL,RAW,NAME('SetPropA')
		SA_GetProp(LONG hWnd, *? lpString),LONG,PASCAL,RAW,NAME('GetPropA')
		SA_RemoveProp(LONG hWnd, *? lpString),LONG,PASCAL,RAW,NAME('RemovePropA'),PROC

		SA_FindResource(LONG hModule, LONG lpName, LONG lpType),LONG,PASCAL,NAME('FindResourceA')
		SA_FindResource(Long hModule, *Cstring pszName, *Cstring pszType), Long, Pascal,Raw,Name('FindResourceA'),DLL(1)
		SA_LoadResource(LONG hModule, LONG hResInfo),LONG,PASCAL,RAW,Name('LoadResource')
		SA_LockResource(LONG hResData),LONG,PASCAL,Name('LockResource')
		SA_SizeOfResource(LONG hmodule, LONG hres),ULONG, Pascal, Name('Sizeofresource')

		SA_EnableScrollBar(UNSIGNED ThishWnd, UNSIGNED wSBflags, UNSIGNED wArrows),BOOL,PASCAL,Proc,Name('EnableScrollBar')

		SA_GetKeyState(Long Vkey),Short,Pascal,Name('GetKeyState')

		SA_lstrlen(Long lpString),LONG,PASCAL,Name('lstrlen')
		SA_lstrlenRaw(*CSTRING lpString),LONG,PASCAL,RAW,Name('lstrlen')
		SA_lstrcpynRaw(*CSTRING lpDestStr, *CSTRING lpSrcStr, LONG cbCopy),PASCAL,RAW,Name('lstrcpyn')

		SA_memset(Long pDestination, Long nValue, Long SizeToFill),Long,proc,raw,Name('_MEMSET') !only low byte of value is used
		SA_memsetRawDst(*? pDestination, Long nValue, Long SizeToFill),Long,proc,raw,Name('_MEMSET')

		SA_memcpy(LONG Dest, LONG Src, LONG SizeToCpy),LONG,PROC,NAME('_MEMCPY')
		SA_memcpyRawDst(*? Dest, LONG Src, LONG SizeToCpy),LONG,PROC,RAW,NAME('_MEMCPY')
		SA_memcpyRawSrc(Long Dest, *? Src, LONG SizeToCpy),LONG,PROC,RAW,NAME('_MEMCPY')
		SA_memcpyRaw(*? Dest, *? Src, LONG SizeToCpy),LONG,PROC,RAW,NAME('_MEMCPY')

		SA_ZeroMemory(*? pDestination,   | memory block
	LONG        cbLength      | size of memory block
		),PASCAL,RAW,NAME('RtlZeroMemory')


		SA_GetSaveFileName(*SA_OPENFILENAME ofn),BOOL,Proc,Raw,Pascal,Name('GetSaveFileNameA')
		SA_GetOpenFileName(*SA_OPENFILENAME ofn),BOOL,Proc,Raw,Pascal,Name('GetOpenFileNameA')
		SA_InitCommonControls(),Pascal,Name('InitCommonControls')
		SA_CommDlgExtendedError(),ULONG,Pascal,Name('CommDlgExtendedError')

		SA_GetVersionEx(*SA_OSVERSIONINFO lpVersionInfo),BOOL,Pascal,Raw,Name('GetVersionExA')
		SA_GetSystemInfo(*SA_SYSTEM_INFO lpSystemInfo),Pascal,Raw,Name('GetSystemInfo')


		SA_SHBrowseForFolder(*SA_BROWSEINFO lpbi),Long,PASCAL,RAW,PROC,Name('SHBrowseForFolder')
		SA_SHGetPathFromIDList(Long pidl, |
			*CSTRING pszPath    |
			),BOOL,PASCAL,RAW,PROC,Name('ShGetPathFromIDListA')

		SA_SHGetSpecialFolderLocation(LONG hwndOwner, |
			LONG nFolder,       |
			*Long ppidl |
			),LONG,PASCAL,RAW,PROC,Name('SHGetSpecialFolderLocation')

		SA_TrackMouseEvent(*SA__TRACKMOUSEEVENT lpEventTrack),BOOL,PASCAL,RAW,NAME('_TrackMouseEvent')
		SA_GetDlgItem(LONG hDlg, Long nIDDlgItem),LONG, Pascal, Name('GetDlgItem')

		!--- MetaFile functions
		SA_GetEnhMetaFile(*CSTRING szEnhMetaFilename),LONG,PASCAL,RAW,NAME('GetEnhMetaFileA')
		SA_GetMetaFile(*CSTRING szMetaFilename),LONG,PASCAL,RAW,NAME('GetMetaFileA')
		SA_GetMetaFileBitsEx(SA_HMETA hmf, ULONG nSize, <*? lpvData>),UNSIGNED,PASCAL,RAW,NAME('GetMetaFileBitsEx')
		SA_GetMetaFileBitsExAddr(SA_HMETA hmf, ULONG nSize, UNSIGNED lpvData=0),UNSIGNED,PASCAL,RAW,NAME('GetMetaFileBitsEx')

		SA_SetMetaFileBitsEx(UNSIGNED nSize, *? lpData),UNSIGNED,PASCAL,RAW,NAME('SetMetaFileBitsEx')
		SA_SetMetaFileBitsExAddr(UNSIGNED nSize, UNSIGNED lpData),UNSIGNED,PASCAL,RAW,NAME('SetMetaFileBitsEx')

		SA_PlayEnhMetaFile(LONG hdc, SA_HMETA hemf, *SA_RECT lpRect),BOOL,PASCAL,RAW,NAME('PlayEnhMetaFile')
		SA_PlayMetaFile(LONG hdc, SA_HMETA hmf),BOOL,PASCAL,PROC,NAME('PlayMetaFile')
		SA_SetWinMetaFileBits(ULONG cbBuffer, *? lpbBuffer, LONG hdc, *SA_METAFILEPICT lpmfp),UNSIGNED,PASCAL,RAW,NAME('SetWinMetaFileBits')
		SA_DeleteEnhMetaFile(SA_HMETA hemf),BOOL,PASCAL,PROC,NAME('DeleteEnhMetaFile')
		SA_DeleteMetaFile(SA_HMETA hmf),BOOL,PASCAL,PROC,NAME('DeleteMetaFile')

		SA_EnumDisplayMonitors(LONG hdc,                    | handle to display DC
		<*SA_RECT lprcClip>,           | clipping rectangle
	UNSIGNED    lpfnEnum,             | callback function
	Long        dwData                    | data for callback function
		),BOOL,Pascal,Raw,Name('EnumDisplayMonitors')

		SA_GetMonitorInfo( LONG hMonitor,      | handle to display monitor
		*SA_MONITORINFO lpmi      | display monitor information
		),BOOL,Pascal,Raw,Name('GetMonitorInfoA')

		SA_GetMonitorInfo( LONG hMonitor,      | handle to display monitor
		*SA_MONITORINFOEX lpmix   | display monitor information
		),BOOL,Pascal,Raw,Name('GetMonitorInfoA')

		SA_Sleep(Long dwMilliseconds),Pascal, Name('Sleep')

				SA_ShellExecuteEx(*SA_SHELLEXECUTEINFO lpExecInfo),BOOL,Pascal,Name('ShellExecuteExA')
				SA_SetPixel(LONG, LONG, LONG, LONG),LONG,PASCAL,Name('SetPixel')
!    GetDeviceCaps(UNSIGNED, SIGNED),SIGNED,PASCAL
!    ReleaseDC(LONG, LONG),SIGNED,PASCAL
!    GetDC(LONG),LONG,PASCAL
!    ResetDC(LONG, LONG),LONG,PASCAL,NAME('ResetDCA')
    
!    CreateCompatibleDC(LONG),LONG,PASCAL
!    CreateCompatibleBitmap(LONG, LONG, LONG),LONG,PASCAL
!    BitBlt(long hdcDest, long nXDest, long nYDest, long nWidth, long nHeight, ulong hdcSrc, long nXSrc, long nYSrc, ulong dwRop), long, raw, pascal, name('BitBlt'),proc
!    SelectObject(LONG, LONG),LONG,PASCAL,PROC
!    SetStretchBltMode(long,long),long,pascal,proc
!    StretchBlt(long,long,long,long,long,Long,long,long,long,long,long),long,pascal,raw,PROC
  End
      End ! map
      Include('_photon_.inc'),ONCE



class_photon.Allocate       PROCEDURE  (SIGNED pControlFEQ) ! Declare Procedure
	CODE
		IF pControlFEQ = 0
			SELF.controlHWnd  = pControlFEQ{PROP:ClientHandle}
		ELSE
			
			SELF.controlHWnd  = pControlFEQ{PROP:Handle}
		END
		
		SELF.controlDC    = SA_GetDC(SELF.controlHWnd)
		SELF.sourceWidth  = pControlFEQ{PROP:Width}
		SELF.sourceHeight = pControlFEQ{PROP:Height}
		
		!We will write directly to the screen...
		
!		SELF.memoryDC     = SA_CreateCompatibleDC(SELF.controlDC)
!		SELF.memoryBitMap = SA_CreateCompatibleBitmap(SELF.controlDC, SELF.sourceWidth , SELF.sourceHeight)

class_photon.Render PROCEDURE                       ! Declare Procedure
	CODE
		!not needed, we are writing directly to the screen
		ReturnedVal# = SA_SetStretchBltMode(SELF.controlDC, 3)
		OtherReturnedVal# = SA_StretchBlt(SELF.controlDC, 0, 0, SELF.sourceWidth, SELF.sourceHeight, SELF.memoryDC, 0, 0, SELF.sourceWidth, SELF.sourceHeight, GDI:SRCCOPY)

class_photon.SetPixel       PROCEDURE  (LONG pX, LONG pY, LONG pColour) ! Declare Procedure
	CODE
 !Stop('pX: ' & pX & ', pY: ' & pY & ', pColour: ' & pColour)
		ReturnedVal# = SA_SetPixel(SELF.controlDC, pX, pY, pColour)
class_photon.Load   PROCEDURE                         ! Declare Procedure
	CODE
		SELF.memoryOriginalBitMap = SelectObject(SELF.memoryDC, SELF.memoryBitMap)
		SA_BitBlt(SELF.memoryDC, 0, 0, SELF.sourceWidth, SELF.sourceHeight, SELF.controlDC , 0, 0, GDI:BLACKNESS)
		
class_photon.Bezier PROCEDURE(LONG StartX,LONG StartY,LONG EndX, LONG EndY)


BezierPTs               LIKE(BezierPoints)
LOC:BezierPTR           LONG

Magnet                  GROUP,DIM(2)
x                           LONG
y                           LONG
						END

MagnetDev               LONG


	CODE

		MagnetDev = 50
	
		Magnet.x[1] = StartX - RANDOM(-50,50)
		Magnet.y[1] = StartY - RANDOM(-50,50)
		Magnet.x[2] = EndX - RANDOM(-50,50)
		Magnet.y[2] = EndY - RANDOM(-50,50)
	
		IF EndX =< StartX AND EndY =< StartY
			Magnet.x[1] = StartX - MagnetDev
			Magnet.y[1] = StartY - MagnetDev
			Magnet.x[2] = EndX + MagnetDev
			Magnet.y[2] = EndY + MagnetDev
		END
		
		IF EndX =< StartX AND EndY => StartY
			Magnet.x[1] = StartX + MagnetDev
			Magnet.y[1] = StartY + MagnetDev
			Magnet.x[2] = EndX - MagnetDev
			Magnet.y[2] = EndY - MagnetDev
		END
		IF EndX => StartX AND EndY =< StartY
			Magnet.x[1] = StartX + MagnetDev
			Magnet.y[1] = StartY + MagnetDev
			Magnet.x[2] = EndX - MagnetDev
			Magnet.y[2] = EndY - MagnetDev
		END
		
		IF EndX => StartX AND EndY => StartY
			Magnet.x[1] = StartX - MagnetDev
			Magnet.y[1] = StartY - MagnetDev
			Magnet.x[2] = EndX + MagnetDev
			Magnet.y[2] = EndY + MagnetDev
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
		ThisBezier# = PolyBezier(SELF.controlDC,LOC:BezierPTR,4)
	!ThisBezier# = PolyBezier(MyWindowDC,LOC:BezierPTR,4)

	
		RETURN

class_photon.Poly   PROCEDURE(LONG CenterX,LONG CenterY,LONG Sides,LONG Radius,LONG StartAngle)


cx                      DECIMAL(10,2)
cy                      DECIMAL(10,2)
n                       DECIMAL(10,2)
r                       DECIMAL(10,2)
ang                     DECIMAL(10,2)
startAng                DECIMAL(10,2)
PI                      DECIMAL(10,6)
ARRAYSTR                STRING(8192)
centerAng               DECIMAL(10,4)
vx                      LONG
VY                      LONG



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

	
class_photon.PenColor       PROCEDURE(LONG PenColor)

	CODE
	
	
		SetDCPenColor(SELF.controlDC,PenColor)
		SelectObject(SELF.controlDC,GetStockObject(DC_PEN))
	
!	SetDCPenColor(SELF.controlHWnd,PenColor)
!	SelectObject(SELF.controlHWnd,GetStockObject(DC_PEN))
	
		RETURN		
class_photon.Trn    PROCEDURE(LONG CenterX,LONG CenterY,LONG InnerCircle,LONG OuterCircle,<STRING Direction>)

PAX                     LONG
PAY                     LONG
PBX                     LONG
PBY                     LONG
PCX                     LONG
PCY                     LONG

TriangleHeight          DECIMAL(10,2)
SideA                   DECIMAL(10,2)
SideB                   DECIMAL(10,2)
SideC                   DECIMAL(10,2)
TriangleArea            DECIMAL(10,2)


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
	
class_photon.Ln     PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY)

ptOldPoint              GROUP,PRE(PNT)
x                           SIGNED
y                           SIGNED
						END


	CODE
	
		SelectObject(SELF.controlDC,NULL_PEN)		
		SA_MoveToEx(SELF.controlDC,StartX,StartY,ptOldPoint)
		SelectObject(SELF.controlDC,DC_PEN)
		SA_LineTo(SELF.controlDC,EndX,EndY)
!	
!	SelectObject(SELF.controlHWnd,NULL_PEN)
!	SA_MoveToEx(SELF.controlHWnd,StartX,StartY,ptOldPoint)
!	SelectObject(SELF.controlHWnd,DC_PEN)
!	SA_LineTo(SELF.controlHWnd,EndX,EndY)

		RETURN


class_photon.Ellip  PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY)

	CODE
	
	
		SelectObject(SELF.controlDC,GetStockObject(NULL_BRUSH))
		GDI_Ellipse(SELF.controlDC,StartX,StartY,EndX,EndY)
	
	
		RETURN	
		
class_photon.InitFont  PROCEDURE(STRING FontFace, uLONG TextPoints)

	CODE
		SELF.FontFace = CLIP(FontFace)
		

	SELF.FontHandle = SA_CreateFont(TextPoints,0,0,0,0,0,0,0,0,0,0,2,0,SELF.FontFace)
	SELF.TempFontHandle = SelectObject(SELF.controlDC,SELF.FontHandle)
!	
	
		RETURN			
		
class_photon.FontColor      PROCEDURE(LONG TextColor)

	CODE
		
		SA_SetTextColor(SELF.controlDC,TextColor)
		
		RETURN
class_photon.BrushColor     PROCEDURE(LONG BrushColor)


	CODE
		
		ReturnedVal# = SetDCBrushColor(SELF.controlDC,BrushColor) 
		SelectObject(SELF.controlDC,GetStockObject(DC_BRUSH))

		RETURN(ReturnedVal#)
		
class_photon.RoundRect      PROCEDURE(LONG StartX,LONG StartY,LONG EndX,LONG EndY, LONG Radius)
ReturnedVal LONG
CODE								
	ReturnedVal = SA_RoundRect(SELF.controlDC,StartX,StartY,EndX,EndY,Radius,Radius)		
	RETURN(ReturnedVal)
	
	
class_photon.Background     PROCEDURE(LONG BackgroundMode)

	CODE
		SA_SetBkMode(SELF.controlDC,BackgroundMode)
	RETURN

class_photon.FreeGDIResources  PROCEDURE()

	CODE
		
		SA_ReleaseDC(SELF.controlDC, SELF.controlDC)
		SA_ReleaseDC(SELF.controlDC,SELF.TempFontHandle)
		SA_ReleaseDC(SELF.controlDC,SELF.FontHandle)
		SA_DeleteObject(SELF.TempFontHandle)
		SA_DeleteObject(SELF.FontHandle)
		
		
		
		RETURN