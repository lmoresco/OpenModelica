#include "value.hpp"

#include "modelica_runtime_error.hpp"
#include <cmath>

value::value()
{

}

value::value(double val)
{
  m_real = val;
  m_type = real;
}

value::value(bool val)
{
  m_boolean = val;
  m_type = boolean;
}

value::value(int val)
{
  m_integer = val;
  m_type = integer;
}

value::~value()
{

}

void value::set_value(std::string val)
{
  m_string = val;
  m_type = str;
}

void value::set_value(int val)
{
  m_integer = val;
  m_type = integer;
}

void value::set_value(double val)
{
  m_real = val;
  m_type = real;
}

void value::set_value(bool val)
{
  m_boolean = val;
  m_type = boolean;
}

std::string value::get_string() const
{
  return m_string;
}


double value::get_real() const
{
  return m_real;
}


int value::get_integer() const
{
  return m_integer;
}


bool value::get_boolean() const
{
  return m_boolean;
}


value::type_en value::type() const
{
  return m_type;
}

void value::set_type(value::type_en type)
{
  m_type = type;
}

bool value::is_numeric() const
{
  return (m_type == integer) || (m_type == real);
}

bool value::is_real() const
{
  return m_type == real;
}

bool value::is_integer() const
{
  return m_type == integer;
}

bool value::is_boolean() const
{
  return m_type == boolean;
}

bool value::is_array() const
{
  return m_type == array;
}

void value::append_to_array(const value& val)
{
  m_array.push_back(val);
}

ostream& operator<< (ostream& o, const value& v)
{
  if (v.is_integer()) 
    {
      o << v.m_integer;
    }

  if (v.is_boolean())
    {
      o << v.m_boolean;
    }
  
  if (v.is_real())
    {
      o << v.m_real;
    }

  if (v.is_array())
    {
      vector<const value>::iterator pos = v.m_array.begin();
      
      o << "{" << *pos;
      pos++;
      for (; pos < v.m_array.end(); ++pos)
	{
	  o << "," << *pos;
	}
      o << "}";
    }
  
  return o;
}

const value& value::operator+= (const value& val)
{
  //  cout << "type: m_type " << m_type << endl;
  // cout << "val type: " << val.type() << endl;
  if (!is_numeric() || !val.is_numeric())
    {
      throw modelica_runtime_error("Adding non-numerical value\n");
    }

  if (val.is_real() || is_real())
  {
    m_real = to_double()+val.to_double();//to_double(val.m_real);
    m_type = real;
  }
  else 
    {
      m_integer += val.m_integer;
      m_type = integer;
    }

  return *this;
}

value value::operator+(const value& v) const
{
  
  value tmp(*this);

  //  cout << "operator+" << v.type() << endl;
  tmp += v;
  return tmp;
}

const value& value::operator-= (const value& val)
{
  if (!is_numeric() || !val.is_numeric())
    {
      throw modelica_runtime_error("Subtracting non-numerical value\n");
    }

  if (val.is_real() || is_real())
  {
    m_real = to_double()-val.to_double();
    m_type = real;
  }
  else 
    {
      m_integer -= val.m_integer;
      m_type = integer;
    }

  return *this;
}

value value::operator-(const value& v) const
{
  value tmp(*this);
  tmp -= v;
  return tmp;
}

const value& value::operator*= (const value& val)
{
    if (!is_numeric() || !val.is_numeric())
    {
      throw modelica_runtime_error("Multiplying non-numerical value\n");
    }

  if (val.is_real() || is_real())
  {
    m_real = to_double()*val.to_double();
    m_type = real;
  }
  else 
    {
      m_integer *= val.m_integer;
      m_type = integer;
    }

  return *this;
}

value value::operator*(const value& v) const
{
  value tmp(*this);
  tmp *= v;
  return tmp;
}

const value& value::operator/= (const value& val)
{
    if (!is_numeric() || !val.is_numeric())
    {
      throw modelica_runtime_error("Multiplying non-numerical value\n");
    }

  if (val.is_real() || is_real())
  {
    m_real = to_double()/val.to_double();
    m_type = real;
  }
  else 
    {
      m_real = m_integer / static_cast<double>(val.m_integer);
      m_type = real;
    }

  return *this;
}

value value::operator/(const value& v) const
{
  value tmp(*this);
  tmp /= v;
  return tmp;
}

double value::to_double() const
{
  if (!is_numeric())
    {
      throw modelica_runtime_error("to_double on non-numerical value\n");
    }

  if (is_integer()) 
    {
      return static_cast<double>(m_integer);
    }
  else
    {
      return m_real;
    }
}

value value::operator-() const
{
    if (!is_numeric())
	{
	    throw modelica_runtime_error("unary minus on non-numerical value\n");
	}

    value tmp(*this);

    if (is_integer()) 
	{
	    tmp.m_integer = - m_integer;
	}
    else
	{
	    tmp.m_real = - m_real;
	}

    return tmp;
}

const value power(const value& x,const value& y)
{
  if (!x.is_numeric() || !y.is_numeric())
    {
      throw modelica_runtime_error("Power non-numerical value\n");
    }
  
  return value(pow(x.to_double(),y.to_double()));
}

const value not_bool(const value& x)
{
  if (!x.is_boolean())
    {
      throw modelica_runtime_error("Not of a non-boolean value\n");
    }
  
  return value(!(x.m_boolean));
}

const value and_bool(const value& x,const value& y)
{
  if (!x.is_boolean())
    {
      throw modelica_runtime_error("And of a non-boolean value\n");
    }
  
  return value(x.m_boolean && y.m_boolean);
}

const value or_bool(const value& x,const value& y)
{
  if (!x.is_boolean())
    {
      throw modelica_runtime_error("Or of a non-boolean value\n");
    }
  
  return value(x.m_boolean || y.m_boolean);
}

const value modelica_if(const value& x, const value& y, const value& z)
{
  if (!x.is_boolean())
    {
      throw modelica_runtime_error("If of a non-boolean value\n");
    }
  
  if (x.get_boolean())
    return y;
  else
    return z;
}

/*const value less(const value& x, const value& y)
{
    if (!x.is_numeric() || !y.is_numeric())
	{
	    throw modelica_runtime_error("less of a non-numerical value\n");
	}
    
    return value(x.to_double() < y.to_double());
}*/

const value lesseq(const value& x, const value& y)
{
    if (!x.is_numeric() || !y.is_numeric())
	{
	    throw modelica_runtime_error("less of a non-numerical value\n");
	}
    
    return value(x.to_double() <= y.to_double());
}

/*const value greater(const value& x, const value& y)
{
    if (!x.is_numeric() || !y.is_numeric())
	{
	    throw modelica_runtime_error("less of a non-numerical value\n");
	}
    
    return value(x.to_double() > y.to_double());
}*/

const value greatereq(const value& x, const value& y)
{
    if (!x.is_numeric() || !y.is_numeric())
	{
	    throw modelica_runtime_error("less of a non-numerical value\n");
	}
    
    return value(x.to_double() >= y.to_double());
}

const value eqeq(const value& x, const value& y)
{
    if (!x.is_numeric() || !y.is_numeric())
	{
	    throw modelica_runtime_error("less of a non-numerical value\n");
	}
    
    return value(x.to_double() == y.to_double());
}

const value lessgt(const value& x, const value& y)
{
    if (!x.is_numeric() || !y.is_numeric())
	{
	    throw modelica_runtime_error("less of a non-numerical value\n");
	}
    
    return value(x.to_double() != y.to_double());
}

const value create_array(const value& x)
{
  value tmp;
  tmp.set_type(value::array);
  
  tmp.append_to_array(x);
  
  return tmp;
}

const value create_array(const value& x, const value& y, const value& z)
{
  if (!x.is_numeric() || !y.is_numeric() || !z.is_numeric())
	{
	    throw modelica_runtime_error("Non-numeric value in range expression\n");
	}
  
  value tmp;
  tmp.set_type(value::array);
  

  if (x.is_integer() && y.is_integer() && z.is_integer())
    {
      //  cout << x;
      //cout << y;
      //cout << z;
      double upper = floor( (z.get_integer()-x.get_integer()) / y.get_integer());
      for (int i = 0; i <= upper; i++)
	{
	  tmp.append_to_array(value(x.get_integer()+int(i)*y.get_integer()));
	}
    }
  else
    {
      double lower = x.is_real() ? x.get_real() : x.get_integer();
      double increment = y.is_real() ? y.get_real() : y.get_integer();
      double upper = z.is_real() ? z.get_real() : z.get_integer();
 
      for (int i = 0; i <= floor((upper-lower)/increment); ++i)
	{
	  tmp.append_to_array(value(lower+i*increment));
	}
    }
  return tmp;
    
}

const value create_array(const value& x, const value& y)
{
  return create_array(x, value(1), y);
}
