#ifndef VALUE_HPP_
#define VALUE_HPP_

#include <vector>
#include <string>
#include <iostream>

// Forward declaration
class builtin_function;

/**
 * This class represents a value
 */

class value
{
public:
  value();
  value(double val);
  value(bool val);
  value(int val);
  value(std::string val);
  value(builtin_function* function);

  virtual ~value();

   value(const value& val);
  
  
  void set_value(std::string val);
  void set_value(int val);
  void set_value(double val);
  void set_value(bool val);

  std::string get_string() const;
  double get_real() const;
  int get_integer() const;
  bool get_boolean() const;
  
  enum type_en {str,integer,real,boolean,array,function,undefined};
  type_en type() const;
  void set_type(type_en type);

  bool is_numeric() const;
  bool is_real() const;
  bool is_integer() const;
  bool is_boolean() const;
  bool is_array() const;

  void append_to_array(const value& val);

  const value& operator+= (const value& val);
  value operator+(const value& v) const;

  const value& operator-= (const value& val);
  value operator-(const value& val) const;

  const value& operator*= (const value& val);
    value operator*(const value& val) const;
    
  const value& operator/= (const value& val);
  value operator/(const value& val) const;
  
  value operator- () const;
  
  friend ostream& operator<< (ostream& o, const value& v);
  
  friend const value power(const value& x, const value& y);
  friend const value not_bool(const value& x);
  friend const value and_bool(const value& x, const value& y);
  friend const value or_bool(const value& x, const value& y);
  friend const value modelica_if(const value& x, const value& y, const value& z);
  //    friend const value less(const value& x, const value& y);
  friend const value lesseq(const value& x, const value& y);
  //  friend const value greater(const value& x, const value& y);
  friend const value greatereq(const value& x, const value& y);
  friend const value eqeq(const value& x, const value& y);
  friend const value lessgt(const value& x, const value& y);

  friend const value create_array(const value& x);
  friend const value create_array(const value& x, const value& y);
  friend const value create_array(const value& x, const value& y, const value& z);
    
private:
  std::string m_string;
  int m_integer;
  double m_real;
  bool m_boolean;
  type_en m_type;
  
  double to_double() const;
  std::vector<value> m_array;
  builtin_function* m_function;
    
};
#endif
