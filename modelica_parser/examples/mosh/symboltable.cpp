#include "symboltable.hpp"

symboltable::symboltable()
{

}

symboltable::~symboltable()
{

}

void symboltable::insert(std::string name, value val)
{
  m_symboltable.insert(std::make_pair(name,val));
}

value* symboltable::lookup(std::string name)
{
  std::map<std::string,value>::iterator pos;
  
  pos = m_symboltable.find(name);
  
  value lookup_value;
  if (pos != m_symboltable.end())
    return &(pos->second);
  else
    return 0;
}
