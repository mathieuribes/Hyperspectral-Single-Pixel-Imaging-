%% spectro_parameters sets several parameters of the spectrometer :integration time, the number of scans to average and set dark current correction 

%INPUTS: 
%wrapper :wrapper
%integration time 
%average_scan : scans to average 

function  spectro_parameters(wrapper,integration_time,average_scan )

wrapper.setIntegrationTime(0,integration_time);% Set the spectrometer's integration time
wrapper.setScansToAverage(0,average_scan);% Set the spectrometer's scans to average 
wrapper.setCorrectForElectricalDark(0,0,1) % Set dark current correction
end

