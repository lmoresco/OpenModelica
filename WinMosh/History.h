// History.h: interface for the CHistory class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_HISTORY_H__EF7425E9_49E0_4E5A_A506_F76C7B01BEF3__INCLUDED_)
#define AFX_HISTORY_H__EF7425E9_49E0_4E5A_A506_F76C7B01BEF3__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#include<list>

class CHistory  
{
private:
	std::list<CString> m_History;
	std::list<CString> m_Sorted;
	std::list<CString>::iterator m_it;

public:
	bool LoadHistory(LPCTSTR filename);
	void SaveHistory(LPCTSTR filename);
	CString GetNext();
	CString GetPrev();
	CString Lookup(LPCTSTR prefix);
	void AddEntry(LPCTSTR entry);
	CHistory();
	virtual ~CHistory();

};

#endif // !defined(AFX_HISTORY_H__EF7425E9_49E0_4E5A_A506_F76C7B01BEF3__INCLUDED_)
