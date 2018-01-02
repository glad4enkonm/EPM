function typedData = read_epm_csv(fileName, delimiter)
  try
	rawData = read_mixed_csv(fileName,delimiter);
	disp(fileName);
  
	%#Parse double values
	numericalIndexes = [1:2 7:13];  
	typedData = cellfun(@(s) str2double(s),rawData(:,numericalIndexes));
	%#typedData = cell2mat(typedData);
	
	%#Parse exercises enum
	%#exercisesNumericValues = cellfun(@(s) {get_num_from_enum(s, exerciseStruct.('Num'), exerciseStruct.('Str'))},rawData(:,exerciseEnumIndex));
	%#exercisesNumericValues = cell2mat(exercisesNumericValues);
	%#typedData = [typedData exercisesNumericValues];	
	
	%#Parse activity enum
	%#activityNumericValues = cellfun(@(s) {get_num_from_enum(s, activityStruct.('Num'), activityStruct.('Str')},rawData(:,activityEnumIndex));
	%#activityNumericValues = cell2mat(activityNumericValues);
	%#typedData = [typedData activityNumericValues];	
	
	%#Parse time
	timeIndex = [5:6];
	typedTime = reshape(cellstr(char(rawData (:,timeIndex))),size(rawData,1),size(timeIndex,2));
	%#disp(size(typedTime));
	%#typedData = mktime(strptime(typedTime,"%d.%m.%Y %H:%M:%S"));
	typedTime = cellfun(@(x) mktime(strptime(x,"%d.%m.%Y %H:%M:%S")), typedTime);
	typedData = [typedData typedTime];
	
  catch
	typedData = [];
  end
end