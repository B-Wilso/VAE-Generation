% This audioDatastore will point to all audio files in folder and its
% subfolders
ads = audioDatastore("C:\Users\Brock\Desktop\DSP Project\slices",IncludeSubfolders=true);
% Write my images here
outputLocation = fullfile("C:\Users\Brock\Desktop\DSP Project\spectrograms","mySpectrograms");



% Create PNGs for all audio files.
writeall(ads,outputLocation,WriteFcn=@myCustomWriter);
function myCustomWriter(audioIn,writeInfo,~)
% Get the sample rate of the audio file
fs = writeInfo.ReadInfo.SampleRate;
% Extract Mel spectrogram
S = melSpectrogram(audioIn,fs);
% Form image name
imagename = strrep(writeInfo.SuggestedOutputName,".wav",".png");
% Save image
imwrite(S(:,:,1),imagename);
end