// MoshEdit.cpp : implementation file
//

#include "stdafx.h"
#include "WinMosh.h"
#include "MoshEdit.h"

#include <sstream>
#include <process.h>
#include ".\moshedit.h"
#include <tlhelp32.h>

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

extern CWinMoshApp theApp; 

/////////////////////////////////////////////////////////////////////////////
// CMoshEdit

CMoshEdit::CMoshEdit()
{
	m_ProcessCreated = false;
	m_History.LoadHistory("mosh_history");
}

CMoshEdit::~CMoshEdit()
{
	try {
		if (client != NULL) {
			char* tmp = client->sendExpression("quit()");
			CORBA::string_free(tmp);
		}
	}
	catch(CORBA::Exception e) {
	}
	m_History.SaveHistory("mosh_history");
}


BEGIN_MESSAGE_MAP(CMoshEdit, CEdit)
	//{{AFX_MSG_MAP(CMoshEdit)
	ON_WM_TIMER()
	ON_WM_SHOWWINDOW()
	ON_WM_KEYUP()
	ON_WM_LBUTTONDOWN()
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CMoshEdit message handlers



void CMoshEdit::OnTimer(UINT_PTR nIDEvent)
{
	if (nIDEvent != 1) return;

	if (client==NULL) {
		CString txt;
		txt += "Starting server.\r\n";
		SetWindowText(txt);
		SetSel(txt.GetLength(),txt.GetLength());

		StartServer();
		if (client==NULL) {
			txt += "Unable to start server.\r\n";
			SetWindowText(txt);
			SetSel(txt.GetLength(),txt.GetLength());
		}
		else
		{ 
			KillTimer(m_Timer);
			txt += ">> ";
			SetWindowText(txt);
			SetSel(txt.GetLength(),txt.GetLength());
		}
	}
}

void CMoshEdit::OnShowWindow( BOOL bShow, UINT )
{
	if (bShow)
		m_Timer = SetTimer(1,100,NULL);
}

void CMoshEdit::OnSetFocus( CWnd* wnd)
{

}

void CMoshEdit::OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags) 
{
	if (nChar == VK_UP) {
		CString line = m_History.GetPrev();

		CString txt;
		GetWindowText(txt);
		int indexOfRowStart = txt.ReverseFind('\n') + 1;
		txt = txt.Left(indexOfRowStart+3) + line;
		SetWindowText(txt);
		SetSel(txt.GetLength(),txt.GetLength());
	}
	else if (nChar == VK_DOWN) {
		CString line = m_History.GetNext();

		CString txt;
		GetWindowText(txt);
		int indexOfRowStart = txt.ReverseFind('\n') + 1;
		txt = txt.Left(indexOfRowStart+3) + line;
		SetWindowText(txt);
		SetSel(txt.GetLength(),txt.GetLength());
	}
	else if (nChar == 13) {
		CString res;
		int start, end;
		GetSel(start,end);
		int line = LineFromChar(start-1);
		int linelength = LineLength(start-1);
		CString command;
		LPTSTR buf = command.GetBuffer(linelength+1);
		GetLine(line,buf,linelength);
		buf[linelength] = 0;
		command.ReleaseBuffer();

		if (command.Left(3) == ">> ")
			res = DoCommand(command.Mid(3));

		CString txt;
		GetWindowText(txt);
		txt += res + "\r\n";
		txt += ">> ";
		SetWindowText(txt);
		SetSel(txt.GetLength(),txt.GetLength());
	}
	else if (nChar == VK_TAB) {
		int start, end;
		GetSel(start,end);
		if (end > start)
			SetSel(end,end);
	}

	int lastline = GetLineCount() - 1;
	int currentline = LineFromChar();
	if (currentline != lastline) {
		SetSel(LineIndex(lastline)+3,LineIndex(lastline)+3);
	}
	CEdit::OnKeyUp(nChar, nRepCnt, nFlags);
}


CString CMoshEdit::DoCommand(LPCTSTR command)
{
	m_History.AddEntry(command);
	if (client == NULL)
		return CString("No Server");

	try {
		if (CString(command) == "quit()") {
			theApp.GetMainWnd()->PostMessage(WM_CLOSE);
		}
		char* tmp = client->sendExpression(command);
		CString res = tmp;
		CORBA::string_free(tmp);

		res.Replace("\n","\r\n");
		return res;
	}
	catch(CORBA::Exception e) {
		std::ostringstream ss;
		e._print(ss);
//		AfxMessageBox(ss.str().c_str());
		client = NULL;
		return CString(ss.str().c_str());
	}
}

BOOL CMoshEdit::PreTranslateMessage(MSG* pMsg) 
{
	int start, end;


	if (pMsg->message == WM_KEYDOWN) {
		int key = pMsg->wParam;
		switch (key) {
		case VK_UP:
			return TRUE;
			break;
		case VK_DOWN:
			return TRUE;
			break;
		case VK_RETURN:
			SetSel(GetWindowTextLength(),GetWindowTextLength());
			break;
		case VK_LEFT:
		case VK_BACK:
			GetSel(start, end);
			if ((start - LineIndex()) <= 3)
				return TRUE;
			break;
		case VK_TAB:
			GetSel(start, end);
			if (end > start)
				return TRUE;
		default:
			GetSel(start, end);
			if ((start - LineIndex(GetLineCount()-1)) < 3)
				return TRUE;
			break;
		}

	}
	return CEdit::PreTranslateMessage(pMsg);
}

void CMoshEdit::OnLButtonDown(UINT nFlags, CPoint point) 
{
	// TODO: Add your message handler code here and/or call default
	
	CEdit::OnLButtonDown(nFlags, point);
}

bool CMoshEdit::StartServer(void)
{
	bool running = false;
	PROCESSENTRY32 entry;
	entry.dwSize = sizeof(PROCESSENTRY32);
	char* procName = "modeq.exe";
	HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
	if (snapshot != (HANDLE)-1L) {
		BOOL res = Process32First(snapshot, &entry);
		while (res) {
			if (strnicmp(entry.szExeFile, procName, strlen(procName)) == 0) {
				running = true;
			}
			res = Process32Next(snapshot, &entry);
		}
		CloseHandle(snapshot);
	}
	if (!running) {
		SpawnServer();
	}

	char tmpPath[1025];
	int argc = 0;
	char argv[10][2];
	sprintf(argv[0], "WinMosh");
	orb = CORBA::ORB_init(argc,(char**)argv);
	char uri[300];
	GetTempPath(1024,tmpPath);

	sprintf(uri, "file://%sopenmodelica.objid",tmpPath);
	CString sUri = uri;
	sUri.Replace("\\","/");
	bool notStarted = true;
	int count = 0;
	while (notStarted && count < 1) {
		try {
			CORBA::Object_var obj = orb->string_to_object(sUri);
			if (!CORBA::is_nil(obj)) {
				client = ModeqCommunication::_narrow(obj);
				char *tmp = client->sendExpression("cd()");
				CORBA::string_free(tmp);
				notStarted = false;
			}
		}
		catch(CORBA::Exception e) {
			std::ostringstream s;
			e._print(s);
			CString ex = s.str().c_str();
			client = NULL;
		}
		
		count ++;
	}

	return !notStarted;
}

void CMoshEdit::SpawnServer(void)
{
	CString MoshHome;
	STARTUPINFO startinfo;
	PROCESS_INFORMATION procinfo;
	startinfo.lpDesktop = NULL;
	startinfo.lpTitle = NULL;
	startinfo.cb = sizeof(STARTUPINFO);
	startinfo.lpReserved = NULL;
	startinfo.dwFillAttribute = FOREGROUND_RED| BACKGROUND_RED| BACKGROUND_GREEN| BACKGROUND_BLUE;
	startinfo.dwFlags = STARTF_USESHOWWINDOW | STARTF_USEFILLATTRIBUTE;
	startinfo.dwX = 0;
	startinfo.dwY = 0;
	startinfo.cbReserved2 = NULL;
	startinfo.lpReserved2 = NULL;
	startinfo.wShowWindow = SW_MINIMIZE;
	if (MoshHome.GetEnvironmentVariable("MOSHHOME")) {
		MoshHome = MoshHome.Left(MoshHome.GetLength()-5);
		MoshHome = CString("\"") + MoshHome + "\\modeq\\win\\modeq.exe\" +d=interactiveCorba";
		
		if (CreateProcess(NULL,MoshHome.GetBuffer(),NULL,NULL,FALSE,0,NULL,NULL,&startinfo,&procinfo))
		{
			m_ProcessCreated = true;
			Sleep(1000);
		};
	}
}

void CMoshEdit::RunCommand(LPCSTR command)
{
	CString txt;
	GetWindowText(txt);
	txt += command ;
	txt += "\r\n";
	SetWindowText(txt);
	SetSel(txt.GetLength(),txt.GetLength());
	CString res = DoCommand(command);
	txt += res + "\r\n"; 
	txt += ">> ";
	SetWindowText(txt);
	SetSel(txt.GetLength(),txt.GetLength());
}
