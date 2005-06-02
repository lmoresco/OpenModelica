#if !defined(AFX_MOSHEDIT_H__79F9ACC3_4E98_4143_8831_A0FB12B9FA21__INCLUDED_)
#define AFX_MOSHEDIT_H__79F9ACC3_4E98_4143_8831_A0FB12B9FA21__INCLUDED_

#include "History.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// MoshEdit.h : header file
//

#include <CORBA.h>
#include "omc_communication.h"

/////////////////////////////////////////////////////////////////////////////
// CMoshEdit window


class CMoshEdit : public CEdit
{
// Construction
public:
	CMoshEdit();

// Attributes
public:
	void SetNoServ()
	{
		m_NoServ = true;
	}
	void SetShowServ()
	{
		m_ShowServ = true;
	}
	void Restart();
	void ClearEdit();
	void Stop();
// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CMoshEdit)
	public:
	virtual BOOL PreTranslateMessage(MSG* pMsg);
	//}}AFX_VIRTUAL

// Implementation
public:
	CString DoCommand(LPCTSTR command);
	virtual ~CMoshEdit();

	// Generated message map functions
protected:
	//{{AFX_MSG(CMoshEdit)
	afx_msg void OnTimer(UINT_PTR nIDEvent);
	afx_msg void OnShowWindow( BOOL, UINT );
	afx_msg void OnSetFocus( CWnd* );
	afx_msg void OnKeyUp(UINT nChar, UINT nRepCnt, UINT nFlags);
	afx_msg void OnLButtonDown(UINT nFlags, CPoint point);
	//}}AFX_MSG

	DECLARE_MESSAGE_MAP()
private:
	bool m_NoServ;
	bool m_ShowServ;
	bool m_ProcessCreated;
	UINT_PTR m_Timer;
	CHistory m_History;
	CORBA::ORB_var orb;
	OmcCommunication_var client; 
	CEdit* m_pErrorText;
public:
	bool StartServer(void);
	void SpawnServer(void);
	void RunCommand(LPCSTR command);
	void SetErrorWindow(CEdit* pWnd);
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_MOSHEDIT_H__79F9ACC3_4E98_4143_8831_A0FB12B9FA21__INCLUDED_)
