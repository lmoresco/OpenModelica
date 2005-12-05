/*! \file walker.g 
 * \author Ingemar Axelsson
 * 
 * \brief TreeParser that creates the widgetstructure.
 * 
 * Traverses the ast and builds a widgettree using Textcells, 
 * groupcells and inputcells. 
 *
 * \todo Look for memory leaks in this code. There is probably a 
 * lot of them here.
 */

header {
//STD Headers
#include <iostream>
#include <string>
#include <sstream>
#include <cstdlib>
#include <vector>
#include <map>
#include <algorithm>

#include <qstring.h>

//IAEX Headers
#include "cell.h"
#include "rule.h"
#include "factory.h"

using namespace std;
using namespace IAEX;
        
typedef pair<string,string> rule_t;

typedef vector<rule_t> rules_t;

//typedef stringstream content_t;
//typedef pair<content_t, rules_t>  result_t;

///pair<stringstream,vector<pair<string,string> > > result_t

class result_t
{
public:
   result_t(ostringstream &f):first(f){}
   result_t(ostringstream &f, vector<rule_t> &s)
   :first(f), second(s){}
   
   ostringstream& first;
   vector<rule_t> second;
};

}

options
{
    language="Cpp";     //Generate C++ languages.
    genHashLines=false; //Do not generate hashlines.
}

//////////////////////////////////////////////////////////////////////

class AntlrNotebookTreeParser extends TreeParser;

options
{
    k=2;
    importVocab=notebookgrammar;
    buildAST=false;
}


{
    //This is in NotebookTreeParser.hpp
    Factory *factory;
    Cell *workspace;
    ostringstream output;
    //This is not very nice.    
}
document[Cell *ws, Factory *f]
{
    //This is in NotebookTreeParser.cpp
    factory = f;
    workspace = ws;
    result_t result(output);// = new result_t; //??
}
    : expr[result]
        {
            //cout << (*result).first.str() << endl;
        }
    ;

expr [result_t &result]
{
    string val;
    string attr;
}
    : (MODULENAME THICK)* exprheader[result]
        {
        }
    | val = value
        {
            result.first << val;
        }
    | attr= attribute
        {
            result.first << attr;
        }
    ;

exprheader [result_t &result]
{
    rules_t rules;
}
    :   {
        }
        #(NOTEBOOK expr[result] (expr[result])* (rule[rules])*)
        {
        }
    |   {
            ostringstream listoutput;
            result_t list(listoutput);
        }
        #(LIST (listelement[list])*)
        {
			// 2005-09-29 AF, added this switch and cases for t,",[,r
			string str = list.first.str();
        
            //Just replace newline with hard newlines.
            string::size_type pos = 0;
            while((pos = str.find("\\", pos)) != string::npos)
            {
                switch(str[pos+1])
                {
                case 'n':
                    str.replace(pos, 2, "<br>"); //Hard newline
                    break;
                case 't':
					//str.replace( pos, 2, "<tab>" );
					str.replace( pos, 2, "&nbsp;&nbsp;&nbsp;&nbsp;" );
					break;
				case 'r':
					str.erase( pos, 2 );	
					break;
                case '"':
                case '[':
					str.erase( pos, 1 );
					break;
                default:
                    pos += 1;
                    break;
                }
            }
        
			result.first << str << endl;
        
            //result.first << list.first.str() << endl;
        }
    |   #(LISTBODY expr[result])
        {
        }
    |   {  
    	    ostringstream contentoutput;
            result_t content(contentoutput);
        }
        #(CELL expr[content] (style:QSTRING)? (rule[rules])*)
        {               
            string cnt = content.first.str();
            
            // 2005-09-29 AF, added this switch and cases for t,",[,r
            //Just replace newline with hard newlines.
            string::size_type pos = 0;
            while((pos = cnt.find("\\", pos)) != string::npos)
            {
                switch(cnt[pos+1])
                {
                case 'n':
                    cnt.replace(pos, 2, "<br>"); //Hard newline
                    break;
                case 't':
					//cnt.replace( pos, 2, "<tab>" );
					cnt.replace( pos, 2, "&nbsp;&nbsp;&nbsp;&nbsp;" );
					break;
				case 'r':
					cnt.erase( pos, 2 );	
					break;                    
                case '"':
                case '[':
					cnt.erase( pos, 1 );
					break;
                default:
                    pos += 1;
                    break;
                }
            }
            
	    
            if(style)
            {
    		QString qcnt(cnt.c_str());
    		//STYLE
                string s1 = style->getText();
                s1.assign(s1, 1, s1.length()-2);

                QString s(s1.c_str());
                Cell *text = factory->createCell(s, workspace);
                text->setStyle(s);
                text->setText(qcnt);
       
                workspace->addChild(text);
                                
                //RULES
                //Rules from content.
                for(rules_t::iterator i=content.second.begin();i!=content.second.end();++i)
                {
                    text->setStyle(QString((*i).first.c_str()), QString((*i).second.c_str()));
                    text->addRule(new Rule(QString((*i).first.c_str()), QString((*i).second.c_str())));
                }
                
                //Rules from tag.
                for(rules_t::iterator j = rules.begin(); j != rules.end(); j++)
                {
                    text->setStyle(QString((*j).first.c_str()), QString((*j).second.c_str()));
                    text->addRule(new Rule(QString((*j).first.c_str()), QString((*j).second.c_str())));
                }
            }
            else
            {   //This is really ugly, but it works most of the time. 
                //This is only happening when a Cell does not have a style. It seems 
                //to happen only with cells inside textdata-expressions. 
                result.first << cnt;
            }
        }
    |   {
            //CellGroup *group = new CellGroup(workspace->doc());
            //CellGroup *parent = workspace;
            Cell *group = factory->createCell("cellgroup", workspace);
            Cell *parent = workspace;
            workspace = group;
        }   
        #(CELLGROUPDATA expr[result] (opengroup:CELLGROUPOPEN|closegroup:CELLGROUPCLOSED))
        {
			if( opengroup )
				group->setClosed( false );
			else if( closegroup )
				group->setClosed( true );
				
            workspace = parent;
            workspace->addChild(group);
        }
    |   {
    	    ostringstream sboutput;
            result_t sbcontent(sboutput);
            rules_t stylerules;
        }
        #(STYLEBOX expr[sbcontent] (sbstyle:QSTRING|(rule[stylerules])+)?)
        {
            if(sbstyle)
            {
                //What happends if a style is added here?
            }
            else
            {   
                rules_t::iterator i = stylerules.begin();
                for(; i != stylerules.end();++i)
                {
                    //cout << "STYLERULES: " << (*i).first << "->" << (*i).second << endl;
                    result.second.push_back(*i);
                }
            }
            string str = sbcontent.first.str();

            //Just replace newline with hard newlines.
            // 2005-09-20 AF, added cases for t,r,",[
            string::size_type pos = 0;
            while((pos = str.find("\\", pos)) != string::npos)
            {
                switch(str[pos+1])
                {
                case 'n':
                    str.replace(pos, 2, "<br>"); //Hard newline
                    break;
                case 't':
					//str.replace( pos, 2, "<tab>" );
					str.replace( pos, 2, "&nbsp;&nbsp;&nbsp;&nbsp;" );
					break;
				case 'r':
					str.erase( pos, 2 );	
					break;                    
				case '"':
                case '[':
					str.erase( pos, 1 );
					break;                    
                default:
                    pos += 1;
                    break;
                }
            }

            result.first << str; //sbcontent.first.str();
        }
    | 
        {

        }
        #(TEXTDATA expr[result] (expr[result])* (rule[rules])*)
        {
            
        }
    | 
        {
            ostringstream baseoutput;
            ostringstream expoutput;
            result_t base(baseoutput);
            result_t exp(expoutput);
        }
        #(SUPERSCRBOX   expr[base] expr[exp])
        {
            result.first << base.first.str() << "<sup>" << exp.first.str() << "</sup>";
                        
            rules_t::iterator i = base.second.begin();
            for(; i != base.second.end(); ++i)
            {
                result.second.push_back((*i));               
            }
            rules_t::iterator j = exp.second.begin();
            for(; j != exp.second.end(); ++j)
            {
                result.second.push_back((*j));               
            }
        }
    |   {
            //Translates all buttons into hyperlinks.
            ostringstream btoutput;
            result_t buttonTitle(btoutput);
            rules_t buttonRules;
        }
        #(BUTTONBOX   expr[buttonTitle] (expr[result])* (rule[buttonRules])*)
        {         
            string filename;
            //Check rules. Look for ButtonData ->Filename and ButtonStyle=Hyperlink
            rules_t::iterator i = buttonRules.begin();
            for(; i != buttonRules.end();++i)
            {
                if((*i).first == "ButtonData")
                {
                    //cout << "BUTTONBOX RULES: " << (*i).first << "->" 
                    //     << (*i).second << endl;
                    filename = (*i).second;
                }
                //result.second.push_back(*i);
            }

            result.first << "<a href=\"" << filename << "\">" 
                         << buttonTitle.first.str() << "</a>";
        }
    |   {
    	    ostringstream diroutput;
    	    ostringstream filenameoutput;
            result_t dir(diroutput);
            result_t filename(filenameoutput);
            rules_t filenameRules;
        }
        #(FILENAME      expr[dir] (expr[filename])* (rule[filenameRules])*)
        {
            //Delete strange newline in directory string.
            string d = dir.first.str();
            d.assign(d, 0, d.length()-1);
           
            result.first << d << "/" << filename.first.str();
        }
    |	{
			ostringstream boxdataoutput;
            result_t boxdata(boxdataoutput);
		}
		#(BOXDATA       expr[boxdata] (expr[result])* (rule[rules])*)
		{
			string str = boxdata.first.str();
			string newstr = "";
			
			string::size_type pos = 0;
			if( string::npos == str.find( "\"<SimulationData", pos ))
			{
				newstr = str;
			}
		
			result.first << newstr;
		}
    | #(ROWBOX        expr[result] (expr[result])* (rule[rules])*)
    | #(FORMBOX       expr[result] (expr[result])* (rule[rules])*)
    | #(SUBSUPERSCRIPTBOX expr[result] (expr[result])* (rule[rules])*)
    | #(UNDERSCRIPTBOX expr[result] (expr[result])* (rule[rules])*)
    | #(OVERSCRIPTBOX expr[result] (expr[result])* (rule[rules])*)
    | #(UNDEROVERSCRIPTBOX expr[result] (expr[result])* (rule[rules])*)
    | #(FRACTIONBOX expr[result] (expr[result])* (rule[rules])*)
    | #(SQRTBOX       expr[result] (expr[result])* (rule[rules])*)
    | #(RADICALBOX    expr[result] (expr[result])* (rule[rules])*)
    | #(GRAYLEVEL     expr[result] (expr[result])* (rule[rules])*)
    | #(RGBCOLOR      expr[result] (expr[result])* (rule[rules])*)
    ;

listelement[result_t &list]
{ 
    ostringstream resoutput;
    result_t result(resoutput);
}
    :   expr[result]
        {
            list.first << result.first.str();
        }
    ;


rule [rules_t &rules]
{
    ostringstream attoutput;
    ostringstream valoutput;
    result_t attribute(attoutput);
    result_t value(valoutput);
}
    :   {
            
        }
        #(RULE expr[attribute] expr[value])
        {   
            //rules.push_back(Rule(attribute.first.str(), value.first.str()));
            rules.push_back(rule_t(attribute.first.str(), value.first.str()));
        }
    | #(RULEDELAYED expr[attribute] expr[value])
        {
            //rules.push_back(Rule(attribute.first.str(), value.first.str()));
            rules.push_back(rule_t(attribute.first.str(), value.first.str()));
        }
    ;


value returns [string value]
    : str:QSTRING
        {
            //Move this to TextCell.
            
            //Delete quotes
            value = str->getText();
            value.assign(value, 1, value.length()-2);            
        }
    | num:NUMBER
        {
            value = string(num->getText());   
        }
    | tr:TRUE_
        {
            value = string(tr->getText()); 
        }
    | fl:FALSE_
        {
            value =string(fl->getText());
        }
    | rightval:VALUERIGHT //Right / Left
        {
            value = string(rightval->getText()); 
        }
    | leftval:VALUELEFT //Right / Left
        {
            value = string(leftval->getText()); 
        }
    | tradform:TRADITIONALFORM
        {
            //value = string(tradform->getText()); 
        }
    | stdform:STANDARDFORM
        {
            //value = string(stdform->getText()); 
        }
    | inputform:INPUTFORM
        {
            //value = string(inputform->getText()); 
        }
    | outputform:OUTPUTFORM
        {
            //value = string(outputform->getText()); 
        }
    | automatic:AUTOMATIC
        {
            //value = string(automatic->getText()); 
        }
    | none:NONESYM
        {
            //value = string(none->getText()); 
        }
    | nullsym:NULLSYM
        {
            value = string(nullsym->getText());
        }
    ;

attribute returns [string value]
    : fontslant:FONTSLANT       
        {
            value = string(fontslant->getText());
        }
    | fontsize:FONTSIZE        
        {
            value = string(fontsize->getText());
        }
    | fontcolor:FONTCOLOR       
        {
            value = string(fontcolor->getText());
        }
    | fontweight:FONTWEIGHT      
        {
            value = string(fontweight->getText());
        }
    | fontfamily:FONTFAMILY      
        {
            value = string(fontfamily->getText());
        }
    | fontvariations:FONTVARIATIONS  
        {
            value = string(fontvariations->getText());
        }
    | textalignment:TEXTALIGNMENT   
        {
            value = string(textalignment->getText());
        }
    | textjustification:TEXTJUSTIFICATION
        {
            value = string(textjustification->getText());
        }
    | initializationcell:INITIALIZATIONCELL
        {
            value = string(initializationcell->getText());
        }
    | buttondata:BUTTONDATA      
        {
            value = string(buttondata->getText());
        }
    | buttonstyle:BUTTONSTYLE     
        {
            value = string(buttonstyle->getText());
        }
    | characterencoding:CHARACHTERENCODING
        {
            value = string(characterencoding->getText());
        }
    | screenrectangle:SCREENRECTANGLE
        {
            value = string(screenrectangle->getText());
        }
    | autogeneratedpackage:AUTOGENERATEDPACKAGE
        {
            value = string(autogeneratedpackage->getText());
        }
    | celltags:CELLTAGS
        {
            value = string(celltags->getText());
        }
    | cellframe:CELLFRAME
        {
            value = string(cellframe->getText());
        }
    | editable:EDITABLE     
        {
            value = string(editable->getText());
        }
    | background:BACKGROUND   
        {
            value = string(background->getText());
        }
    | windowsize:WINDOWSIZE     
        {
            value = string(windowsize->getText());
        }
    | windowmargins:WINDOWMARGINS  
        {
            value = string(windowmargins->getText());
        }
    | windowframe:WINDOWFRAME    
        {
            value = string(windowframe->getText());
        }
    | windowelements:WINDOWELEMENTS 
        {
            //value = string(attr->getText());
        }
    | windowtitle:WINDOWTITLE    
        {
            //value = string(attr->getText());
        }
    | windowtoolbars:WINDOWTOOLBARS 
        {
            //value = string(attr->getText());
        }
    | windowmoveable:WINDOWMOVEABLE 
        {
            //value = string(attr->getText());
        }
    | windowfloating:WINDOWFLOATING 
        {
            //value = string(attr->getText());
        }
    | windowclickselect:WINDOWCLICKSELECT
        {
            //value = string(attr->getText());
        }
    | styledefinitions:STYLEDEFINITIONS
        {
            value = string(styledefinitions->getText());
        }
    | frontendversion:FRONTENDVERSION 
        {
            value = string(frontendversion->getText());
        }
    | magnification:MAGNIFICATION 
        {
            value = string(magnification->getText());
        }
    | generatedCell:GENERATEDCELL
        {
            value = string(generatedCell->getText());
        }
    | cellautoovrt:CELLAUTOOVRT 
        {
            value = string(cellautoovrt->getText());
        }
    | imagesize:IMAGESIZE
        {
            value = string(imagesize->getText());
        }
    | imagemargins:IMAGEMARGINS     
        {
            value = string(imagemargins->getText());
        }
    | imageregion:IMAGEREGION      
        {   
            value = string(imageregion->getText());
        }
    | imagerangecache:IMAGERANGECACHE
        {
            value = string(imagerangecache->getText());
        }
    | imagecache:IMAGECACHE      
        {
            value = string(imagecache->getText());
        }
    ;
