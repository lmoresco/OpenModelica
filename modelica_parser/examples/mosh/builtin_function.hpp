#ifndef BUILTIN_FUNCTION_HPP_
#define BUILTIN_FUNCTION_HPP_

#include "value.hpp"

/**
 * Abstract base class. Every builtin function should derive from this class.
*/

class builtin_function
{
public:
  virtual ~builtin_function();

  virtual value evaluate(value val) = 0;
protected:
  builtin_function();

};


/**
 * Functor that evaluates the absolute value
 */
class abs_t : public builtin_function
{
public:
  abs_t();
  ~abs_t();
  value evaluate(value val);
};

/**
 * Functor that evaluates the sign.
 */
class sign_t : public builtin_function
{
public:
  sign_t();
  virtual ~sign_t();
  value evaluate(value val);
};

#endif
