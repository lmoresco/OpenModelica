header "post_include_hpp" {

#define null 0

}

options {
	language = "Cpp";
}

class modelica_expression_parser extends modelica_parser;

start_rule returns [bool has_semicolon]
		: (expression | algorithm_clause ) (s:SEMICOLON)?
		{
			has_semicolon = s;
		}
		;
