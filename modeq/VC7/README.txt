To compile open the modeq.sln file in the modeq folder and build the entire solution. 
Remember to choose configuration first.

The solution contains three working configurations:
Release            - builds with mico dynamically linked
NoMico	           - builds without CORBA
RelaseStaticMico   - builds with mico linked statically

The following environment variables must be set:
MICOHOME
ANTLRHOME
MOSHHOME  - not entierly necessery but the final post build step  that 
            copies the exe-file, will fail if it is missing.


Currently the version of RML that is compiled in this solution is 2.1.9
