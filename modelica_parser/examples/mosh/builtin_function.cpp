#include "builtin_function.hpp"

builtin_function::builtin_function()
{

}

builtin_function::~builtin_function()
{

}

abs_t::abs_t()
{

}

abs_t::~abs_t()
{

}

value abs_t::evaluate(value val)
{
  return value(1);
}

sign_t::sign_t()
{

}

sign_t::~sign_t()
{

}

value sign_t::evaluate(value val)
{
  return value(1);
}
