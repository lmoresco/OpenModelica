// WinMosh.h : main header file for the WINMOSH application
//

#if !defined(AFX_WINMOSH_H__6574C059_3EA0_4401_BC73_A771865D77A8__INCLUDED_)
#define AFX_WINMOSH_H__6574C059_3EA0_4401_BC73_A771865D77A8__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// CWinMoshApp:
// See WinMosh.cpp for the implementation of this class
//

class CWinMoshApp : public CWinApp
{
public:
	CWinMoshApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CWinMoshApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

public:
	//{{AFX_MSG(CWinMoshApp)
	afx_msg void OnAppAbout();
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_WINMOSH_H__6574C059_3EA0_4401_BC73_A771865D77A8__INCLUDED_)
