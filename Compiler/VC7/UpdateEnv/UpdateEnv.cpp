// UpdateEnv.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include "UpdateEnv.h"

#include <string>
#include <process.h>
#define MAX_LOADSTRING 100

// Global Variables:
HINSTANCE hInst;								// current instance
TCHAR szTitle[MAX_LOADSTRING];					// The title bar text
TCHAR szWindowClass[MAX_LOADSTRING];			// the main window class name

// Forward declarations of functions included in this code module:
ATOM				MyRegisterClass(HINSTANCE hInstance);
BOOL				InitInstance(HINSTANCE, int);
LRESULT CALLBACK	WndProc(HWND, UINT, WPARAM, LPARAM);
LRESULT CALLBACK	About(HWND, UINT, WPARAM, LPARAM);


/*
#pragma warning(disable : 4311)

bool runTar(std::string& file, std::string& dir) {
	LPSTR strcmd;
	std::string commandline;
	STARTUPINFO startinfo;
	PROCESS_INFORMATION procinfo;
	startinfo.lpDesktop = NULL;
	startinfo.lpTitle = NULL;
	startinfo.cb = sizeof(STARTUPINFO);
	startinfo.lpReserved = NULL;
	startinfo.dwFillAttribute = FOREGROUND_RED| BACKGROUND_RED| BACKGROUND_GREEN| BACKGROUND_BLUE;
	startinfo.dwX = 0;
	startinfo.dwY = 0;
	startinfo.cbReserved2 = NULL;
	startinfo.lpReserved2 = NULL;
	startinfo.wShowWindow = SW_MINIMIZE;
	startinfo.dwFlags = STARTF_USESHOWWINDOW | STARTF_USEFILLATTRIBUTE;
	CopyFile((dir + "\\" + file + ".tar.gz").c_str(), (dir + "\\" + file + ".tgz").c_str(),FALSE);

	commandline = "\"";
	commandline += dir + "\\tools\\gunzip.exe\" ";
	commandline += file + ".tgz";
	strcmd = strdup(commandline.c_str());
	if (CreateProcess(NULL,strcmd,NULL,NULL,FALSE,DETACHED_PROCESS,NULL,dir.c_str(),&startinfo,&procinfo)) {
		int res;
		free(strcmd);
		_cwait(&res, (int)procinfo.hProcess, NULL);
		if (res != 0)
			return false;
	}
	else {
		free(strcmd);
		return false;
	}

	commandline = "\"";
	commandline += dir + "\\tools\\tar.exe\" -xf ";
	commandline += file + ".tar";
	strcmd = strdup(commandline.c_str());
	if (CreateProcess(NULL,strcmd,NULL,NULL,FALSE,DETACHED_PROCESS,NULL,dir.c_str(),&startinfo,&procinfo)) {
		int res;
		free(strcmd);
		_cwait(&res, (int)procinfo.hProcess, NULL);
		DeleteFile((dir+"\\"+file+".tar").c_str());
		if (res != 0)
			return false;
	}
	else {
		DeleteFile((dir+"\\"+file+".tar").c_str());
		free(strcmd);
		return false;
	}

	return true;
}

int DeleteDir(LPCTSTR lpszName)
{
	int ret=0;
	char name1[256];
	WIN32_FIND_DATA info;
    HANDLE hp;
    char *cp;
	
	sprintf(name1, "%s\\*.*",lpszName);
    hp = FindFirstFile(name1,&info);
    if(!hp || hp==INVALID_HANDLE_VALUE)
        return(ret);
    do
    {
		cp = info.cFileName;
        if(cp[1]==0 && *cp=='.')
            continue;
        else if(cp[2]==0 && *cp=='.' && cp[1]=='.')
            continue;
        sprintf(name1,"%s\\%s",lpszName,info.cFileName);
		if(info.dwFileAttributes&FILE_ATTRIBUTE_READONLY)
		{
			SetFileAttributes(name1,info.dwFileAttributes&~FILE_ATTRIBUTE_READONLY);
		}
		if(info.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
		{
			DeleteDir(name1);
		}
		else
		{
			DeleteFile(name1);
		}

    }
    while(FindNextFile(hp,&info));
	FindClose(hp);
	if(info.dwFileAttributes&FILE_ATTRIBUTE_READONLY)
	{
		SetFileAttributes(lpszName,info.dwFileAttributes&~FILE_ATTRIBUTE_READONLY);
	}
	if(RemoveDirectory(lpszName))
	{
		printf("success\n");
		ret=1;
	}	
	else
	{
		printf("error %d\n",GetLastError());
	}
	return(ret);
}

*/

int APIENTRY _tWinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPTSTR    lpCmdLine,
                     int       nCmdShow)
{
	bool deldir = false;
	DWORD dwReturnValue;

	/* 
	 * Adrian Pop - 2007-03-23
	 * just send an update message to all windows! 
	 * and then just exit
	 *
	 */
	SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, 0,
     (LPARAM)"Environment", SMTO_ABORTIFHUNG,5000, &dwReturnValue);

	return 0;

	/*
	std::string commands = lpCmdLine;
	std::string::size_type first = commands.find_first_not_of(" \t");
	commands = commands.substr(first);


	if (commands.substr(0,7) == "/DelDir") {
		deldir = true;
		first = commands.find_first_not_of(" \t",7);
		commands = commands.substr(first);
	}

	std::string dir;
	if (commands[0] == '\"') {
		dir = commands.substr(0,commands.find_first_of('\"',1));
		commands = commands.substr(dir.length()+1);
		dir = dir.substr(1);
	}
	else {
		dir = commands.substr(0,commands.find_first_of(" \n"));
		commands = commands.substr(dir.length()+1);
	}

	first = commands.find_first_not_of(" \t");
	while (first != std::string::npos) {
		std::string file;
		std::string::size_type next;
		next = commands.find_first_of(" \t",first);
		if (next!=std::string::npos) {
			file = commands.substr(first,next - 1);
		}
		else {
			file = commands.substr(first);
		}
		if (deldir) {
			DeleteDir((dir + "\\" + file).c_str());
			first = commands.find_first_not_of(" \t",next);
		}
		else {
			if (!runTar(file,dir)) {
				//return -1;
			}
			DeleteFile((dir + "\\" + file).c_str());
			first = commands.find_first_not_of(" \t",next);
		}
	}

	*/

	return 0;
}



//
//  FUNCTION: MyRegisterClass()
//
//  PURPOSE: Registers the window class.
//
//  COMMENTS:
//
//    This function and its usage are only necessary if you want this code
//    to be compatible with Win32 systems prior to the 'RegisterClassEx'
//    function that was added to Windows 95. It is important to call this function
//    so that the application will get 'well formed' small icons associated
//    with it.
//
ATOM MyRegisterClass(HINSTANCE hInstance)
{
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX); 

	wcex.style			= CS_HREDRAW | CS_VREDRAW;
	wcex.lpfnWndProc	= (WNDPROC)WndProc;
	wcex.cbClsExtra		= 0;
	wcex.cbWndExtra		= 0;
	wcex.hInstance		= hInstance;
	wcex.hIcon			= LoadIcon(hInstance, (LPCTSTR)IDI_UPDATEENV);
	wcex.hCursor		= LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground	= (HBRUSH)(COLOR_WINDOW+1);
	wcex.lpszMenuName	= (LPCTSTR)IDC_UPDATEENV;
	wcex.lpszClassName	= szWindowClass;
	wcex.hIconSm		= LoadIcon(wcex.hInstance, (LPCTSTR)IDI_SMALL);

	return RegisterClassEx(&wcex);
}

//
//   FUNCTION: InitInstance(HANDLE, int)
//
//   PURPOSE: Saves instance handle and creates main window
//
//   COMMENTS:
//
//        In this function, we save the instance handle in a global variable and
//        create and display the main program window.
//
BOOL InitInstance(HINSTANCE hInstance, int nCmdShow)
{
   HWND hWnd;

   hInst = hInstance; // Store instance handle in our global variable

   hWnd = CreateWindow(szWindowClass, szTitle, WS_OVERLAPPEDWINDOW,
      CW_USEDEFAULT, 0, CW_USEDEFAULT, 0, NULL, NULL, hInstance, NULL);

   if (!hWnd)
   {
      return FALSE;
   }

   ShowWindow(hWnd, nCmdShow);
   UpdateWindow(hWnd);

   return TRUE;
}

//
//  FUNCTION: WndProc(HWND, unsigned, WORD, LONG)
//
//  PURPOSE:  Processes messages for the main window.
//
//  WM_COMMAND	- process the application menu
//  WM_PAINT	- Paint the main window
//  WM_DESTROY	- post a quit message and return
//
//
LRESULT CALLBACK WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
	int wmId, wmEvent;
	PAINTSTRUCT ps;
	HDC hdc;

	switch (message) 
	{
	case WM_COMMAND:
		wmId    = LOWORD(wParam); 
		wmEvent = HIWORD(wParam); 
		// Parse the menu selections:
		switch (wmId)
		{
		case IDM_ABOUT:
			DialogBox(hInst, (LPCTSTR)IDD_ABOUTBOX, hWnd, (DLGPROC)About);
			break;
		case IDM_EXIT:
			DestroyWindow(hWnd);
			break;
		default:
			return DefWindowProc(hWnd, message, wParam, lParam);
		}
		break;
	case WM_PAINT:
		hdc = BeginPaint(hWnd, &ps);
		// TODO: Add any drawing code here...
		EndPaint(hWnd, &ps);
		break;
	case WM_DESTROY:
		PostQuitMessage(0);
		break;
	default:
		return DefWindowProc(hWnd, message, wParam, lParam);
	}
	return 0;
}

// Message handler for about box.
LRESULT CALLBACK About(HWND hDlg, UINT message, WPARAM wParam, LPARAM lParam)
{
	switch (message)
	{
	case WM_INITDIALOG:
		return TRUE;

	case WM_COMMAND:
		if (LOWORD(wParam) == IDOK || LOWORD(wParam) == IDCANCEL) 
		{
			EndDialog(hDlg, LOWORD(wParam));
			return TRUE;
		}
		break;
	}
	return FALSE;
}
