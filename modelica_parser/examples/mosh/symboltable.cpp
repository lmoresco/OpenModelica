#include "symboltable.hpp"

#include "builtin_function.hpp"

symboltable::symboltable()
{
  // Initialize builtin functions
  //  cout << "Building symboltable" << endl;
  m_builtin_functions.insert(std::make_pair(std::string("abs"),value(new abs_t)));
  m_builtin_functions.insert(std::make_pair(std::string("sign"),value(new sign_t)));
  // cout << "Finished building symboltable" << endl;
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
  
  // Search among builtin functions
  pos = m_builtin_functions.find(name);
  if (pos != m_builtin_functions.end())
    {
      return &(pos->second);
    }
  
  // Search among identifiers
  pos = m_symboltable.find(name);
  
  if (pos != m_symboltable.end())
    return &(pos->second);
  else
    return 0;
}
