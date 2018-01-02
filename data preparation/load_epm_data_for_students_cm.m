function studentVectors = load_epm_data_for_students_cm(studentIds, dataSetPath)
	%# returns Cyclomatic Complexity of McCabe (https://en.wikipedia.org/wiki/Cyclomatic_complexity)	
	%# for every session as a feature vector
	studentVectors = load_epm_data_for_students_base(studentIds, dataSetPath, @studentVectorInit,@formStudentVector );
end

function newStudentVector = studentVectorInit()
	%# initialization of feature vector for a student 
	newStudentVector = [];
end
	
function studentVector = formStudentVector(existingStudentVector, newData)
	%# extends existing student feature vector with next session data - newData
	if (size(newData,1) == 0)
		studentVector = [existingStudentVector -1]; %# set default value if there is no session for a student
		disp("not found");
	else
	
		activityIndex = 11;
		
		activityAmount = size(unique(newData(:,activityIndex)),1);
		
		transition = zeros(99,99); %# activity adjacency matrix for a session
		
		newDataLength = size(newData, 1); %# loop through rows and fill adjacency matrix
		for newDataIndex = 1: (newDataLength - 1)
			currentActivity = newData(newDataIndex, activityIndex);
			nextActivity = newData(newDataIndex + 1, activityIndex );
			transition(currentActivity, nextActivity) =  1;  %# mark as connected
		endfor		
		
		cm = sum(sum(transition)) - activityAmount + 1; %# CM = |E| − |V| + P
		studentVector = [existingStudentVector cm];
		disp("ok");
	endif
end