function allData = load_epm_raw_data(studentIds, dataSetPath)
	%# loads cell array with specific ids
	%# dataSetPath - path to folder with sessions
	
	sessionPathTemplate = [dataSetPath '/Data/Processes/Session {x}/'];
	sessions = 1:6;
	
	allData = [];
	
	for studentId = studentIds
		
		for session = sessions
			pathToSessionFolder = strrep(sessionPathTemplate, "{x}",  mat2str(session));
			pathToSessionForStudent = [pathToSessionFolder mat2str(studentId)];
			disp(pathToSessionForStudent);
			try
				thisSessionRawData = read_mixed_csv(pathToSessionForStudent,',');
				disp("ok");
			catch
				thisSessionRawData = [];
				disp("error");
			end
			allData = [allData; thisSessionRawData];
		endfor
	endfor
end