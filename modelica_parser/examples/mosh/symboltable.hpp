#ifndef SYMBOLTABLE_HPP_
#define SYMBOLTABLE_HPP_

#include "value.hpp"

#include <map>
#include <string>

class symboltable
{
public:
  symboltable();
  virtual ~symboltable();

  void insert(std::string name, value val);
  value* lookup(std::string name);

private:
  std::map<std::string,value> m_symboltable;
  std::map<std::string,value> m_builtin_functions;
};
#endif
