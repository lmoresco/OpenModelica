// ChildView.h : interface of the CChildView class
//
/////////////////////////////////////////////////////////////////////////////

#if !defined(AFX_CHILDVIEW_H__66ECD2BA_9BE6_47EF_8579_F1918EF8A23B__INCLUDED_)
#define AFX_CHILDVIEW_H__66ECD2BA_9BE6_47EF_8579_F1918EF8A23B__INCLUDED_

#include "MoshEdit.h"	// Added by ClassView
#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CChildView window

class CChildView : public CWnd
{
// Construction
public:
	CChildView();

// Attributes
public:

// Operations
public:

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CChildView)
	public:
	virtual BOOL Create(LPCTSTR lpszClassName, LPCTSTR lpszWindowName, DWORD dwStyle, const RECT& rect, CWnd* pParentWnd, UINT nID, CCreateContext* pContext = NULL);
	protected:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);
	//}}AFX_VIRTUAL

// Implementation
public:
	virtual ~CChildView();
	void SetNoServ() {
		m_Text.SetNoServ();
	}
	void SetShowServ() {
		m_Text.SetShowServ();
	}
	void OnLoadLib()
	{
		m_Text.RunCommand("loadModel(Modelica)");
	}
	void Restart() 
	{
		m_Text.Restart();
	}
	void OnLoadModel()
	{
		CFileDialog dlg(TRUE, "mo", "*.mo", OFN_FILEMUSTEXIST, "Modelica files (*.mo)|*.mo||",this);
		if (dlg.DoModal() == IDOK) {
			CString command;
			CString file = dlg.GetPathName();
			file.Replace('\\','/');
			command.Format("loadFile(\"%s\")", file);
			m_Text.RunCommand(command);
		}
	}


	// Generated message map functions
protected:
	//{{AFX_MSG(CChildView)
	afx_msg void OnPaint();
	afx_msg void OnSize(UINT nType, int cx, int cy);
	afx_msg void OnSetFocus(CWnd* pOldWnd);
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	CMoshEdit m_Text;
};

/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CHILDVIEW_H__66ECD2BA_9BE6_47EF_8579_F1918EF8A23B__INCLUDED_)
