// name: redeclare12.mo
// keywords:
// status: correct
//
// FAILREASON: Redeclare modifiers not properly qualified.
//


model MyInternalModel
  parameter Real par = 1;
end MyInternalModel;

model MyModel 
  replaceable model ReplaceableInternalModel = MyInternalModel;
  ReplaceableInternalModel internalModel;
end MyModel;

model MyTestModel

parameter Real localPar = 1;

MyModel intModel(redeclare model ReplaceableInternalModel = MyInternalModel(final par = localPar)); //This doesn't work.

//MyModel intModel(redeclare model ReplaceableInternalModel = MyInternalModel(final par = 1)); // This works

end MyTestModel;

// Result:
// Failed to type cref intModel.internalModel.localPar
// SCodeInst.instClass failed
// Error processing file: test.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
