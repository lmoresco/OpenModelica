// name:     ArrayFieldSlice
// keywords: array
// status:   correct

record Person
  String 			name;
  Integer 			age;
  String[2]			children;
end Person;

function mkperson
  input String 		name;
  input Integer 	age;
  input String[2]	children;
  output Person p;
algorithm
  p.name 			:= name;
  p.age 			:= age;
  p.children 		:= children;
end mkperson;

class PersonList
  Person[3] persons = {mkperson("John", 35, {"Carl", "Eva"} ),
    				  mkperson("Karin", 40, {"Anders", "Dan"} ),
   					  mkperson("Lisa", 37, {"John", "Daniel"} )
    		};
end PersonList;


class getPerson
  PersonList pList;
  String name[3];
  Integer age[3];
  String[3, 2] children;
equation  
  name 		= pList.persons.name; 	// Returns: {"John", "Karin", "Lisa"}
  age 		= pList.persons.age;	// Returns: {35, 40, 37}
  children 	= pList.persons.children;	// Returns: {{"Carl", "Eva"}, 
  							//		 {"Anders", "Dan"}, 
  							//		 {"John", "Daniel"}}
end getPerson; 


// model getPerson
// String pList.persons[1].name;
// Integer pList.persons[1].age;
// String pList.persons[1].children[2];
// String pList.persons[2].name;
// Integer pList.persons[2].age;
// String pList.persons[2].children[2];
// String pList.persons[3].name;
// Integer pList.persons[3].age;
// String pList.persons[3].children[2];
// String name[3];
// Integer age[3];
// String children[3, 2];
// equation
// name = pList.persons.name;
// age = pList.persons.age;
// children = pList.persons.children;
// end getPerson; 

