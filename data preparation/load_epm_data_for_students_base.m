function studentVectors = load_epm_data_for_students_base(studentIds, dataSetPath, studentVectorInit, formStudentVector)
	%# returns feature array for studentIds
	%# dataSetPath - path to folder with sessions
	%# studentVectorInit - initialize student vector
	%# formStudentVector - add session data to student vector
	
	sessionPathTemplate = [dataSetPath '/Data/Processes/Session {x}/'];
	
	sessions = 1:6;
	studentVectors = [];
	
	%#Parse exercises enum
	%#exerciseEnumIndex = 3; 
	%#[exercise.('Num') exercise.('Str') exercise.('Code')] = textread ([dataSetPath "/exercises.txt"], "%d %s %d");
	
	%#Parse activity enum
	%#activityEnumIndex = 4; 
	%#activity.('Num') activity.('Str')] = textread([dataSetPath "unique_activity.txt"], "%d %s");	
	
	for studentId = studentIds
		
		studentVector = studentVectorInit();
		
		for session = sessions
			pathToSessionFolder = strrep(sessionPathTemplate, "{x}",  mat2str(session));
			pathToSessionForStudent = [pathToSessionFolder mat2str(studentId)];
			disp(pathToSessionForStudent);
			thisSessionDataForStudent = read_epm_csv(pathToSessionForStudent, ',');
			studentVector = formStudentVector(studentVector, thisSessionDataForStudent);
		endfor
		studentVectors = [studentVectors; studentVector];
	endfor
end