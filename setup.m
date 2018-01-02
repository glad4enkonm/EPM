function typedData = setup()
	more off;
	
	disp('loading the data set ...');
	urlwrite ("http://archive.ics.uci.edu/ml/machine-learning-databases/00346/EPMDataset%20.zip", "EPMDataset 20.zip");
	
	disp('unpacking the data set ...');
	unzip("EPMDataset 20.zip");
	
	extract();
	
	
	disp("done")
	more on;
end

function extract()
	disp('extracting unique_activities.txt ...');
	
	uniqueStudentIds = [];
	for i = 1:6 
		uniqueStudentIds = unique( 
			[
				uniqueStudentIds; 
				readdir(["EPM Dataset 2/Data/Processes/Session " mat2str(i)])
			]
		);
	end
	
	disp(size(uniqueStudentIds));
	cd 'EPM Dataset 2';
	
	
	
end