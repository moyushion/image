dirPath='F:\CaptureFiles';
leftImages = imageSet(fullfile(dirPath, 'left'));
rightImages = imageSet(fullfile(dirPath, 'right'));
imageFileNames1 = leftImages.ImageLocation;
imageFileNames2 = rightImages.ImageLocation;

% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames1, imageFileNames2);

% Generate world coordinates of the checkerboard keypoints
squareSize = 60;  % in units of 'mm'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[stereoParams, pairsUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
	'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
	'NumRadialDistortionCoefficients', 2, 'WorldUnits', 'mm', ...
	'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', []);	
	
disp('CameraParameters1.IntrinsicMatrix');	
disp(stereoParams.CameraParameters1.IntrinsicMatrix.');
disp('CameraParameters1.RadialDistortion');
disp(stereoParams.CameraParameters1.RadialDistortion);
disp('CameraParameters1.TangentialDistortion');
disp(stereoParams.CameraParameters1.TangentialDistortion);
disp('CameraParameters2.IntrinsicMatrix');
disp(stereoParams.CameraParameters2.IntrinsicMatrix.');
disp('CameraParameters2.RadialDistortion');
disp(stereoParams.CameraParameters2.RadialDistortion);
disp('CameraParameters2.TangentialDistortion');
disp(stereoParams.CameraParameters2.TangentialDistortion);
disp('RotationOfCamera2');
disp(stereoParams.RotationOfCamera2.');
disp('TranslationOfCamera2');
disp(stereoParams.TranslationOfCamera2);
disp('CameraParameters1.TranslationVectors');
disp(stereoParams.CameraParameters1.TranslationVectors(1,3));	
disp('CameraParameters2.TranslationVectors');
disp(stereoParams.CameraParameters2.TranslationVectors(1,3));
