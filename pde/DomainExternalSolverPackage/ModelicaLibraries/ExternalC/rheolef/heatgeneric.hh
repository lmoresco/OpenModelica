#ifndef _HEATGENERIC_HH_
#define _HEATGENERIC_HH_

#include "rheolef/rheolef.h"
#include "BoundaryCondition.hh"

void heatgenerictime(const string& geofile, 
		     const vector<BoundaryCondition> & bclist,
		     const string& eltype,
		     Float da,
		     Float c,
		     BoundaryCondition::space_function *f,
		     Float dt,
		     field & uprev);

void heatgenerictime(geo & omega, 
		     const vector<BoundaryCondition> & bclist,
		     const string& eltype,
		     Float da,
		     Float c,
		     BoundaryCondition::space_function *f,
		     Float dt,
		     field & uprev);


void heatgeneric(const string& geofile, 
		 const vector<BoundaryCondition> & bclist,
		 const string& eltype,
		 Float c,
		 BoundaryCondition::space_function *f);

void heatgeneric(geo & omega, 
		 const vector<BoundaryCondition> & bclist,
		 const string& eltype,
		 Float c,
		 BoundaryCondition::space_function *f);


void makeXh(geo & omega,
	    const string & eltype,
	    const vector<BoundaryCondition> & bclist,
	    space & Xh);

#endif
