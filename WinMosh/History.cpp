// History.cpp: implementation of the CHistory class.
//
//////////////////////////////////////////////////////////////////////

#include "stdafx.h"
#include "WinMosh.h"
#include "History.h"

#include <fstream>

#ifdef _DEBUG
#undef THIS_FILE
static char THIS_FILE[]=__FILE__;
#define new DEBUG_NEW
#endif

using namespace std;
//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

CHistory::CHistory()
{
	m_it = m_History.end();
}

CHistory::~CHistory()
{

}

void CHistory::AddEntry(LPCTSTR entry)
{
	m_History.push_back(entry);
	m_Sorted.push_back(entry);
	m_Sorted.sort();
	m_Sorted.unique();
	m_it = m_History.end();

}

CString CHistory::Lookup(LPCTSTR prefix)
{
	CString key(prefix);
	int len = key.GetLength();

	list<CString>::iterator it = m_Sorted.begin();
	while (it != m_Sorted.end()) {
		if ((*(it)).Left(len) == key)
			return *it;
		it++;
	}
	return CString("");
}

CString CHistory::GetPrev()
{
	CString res("");
	if (m_it != m_History.begin()) {
		m_it--;
	}

	if (m_it != m_History.end())
		res =  *m_it;

	return res;
}

CString CHistory::GetNext()
{
	CString res("");
	if (m_it != m_History.end()) {
		m_it++;
	}

	if (m_it != m_History.end())
		res =  *m_it;

	return res;
}

void CHistory::SaveHistory(LPCTSTR filename)
{
	list<CString>::iterator it;
	try {
		CString line;
		ofstream out(filename);
		for (it=m_History.begin(); it != m_History.end(); it++) {
			out << (LPCTSTR)(*it) << endl;
		}
	}
	catch(...) { }
}

bool CHistory::LoadHistory(LPCTSTR filename)
{
	m_History.clear();
	m_Sorted.clear();
	try {
		CString line;
		ifstream in(filename);
		while (in.good()) {
			in.getline(line.GetBuffer(1025),1024);
			line.ReleaseBuffer();
			if (line.GetLength() > 0)
				AddEntry(line);
		}
	}
	catch(...) {
		return false;
	}

	return true;
}
