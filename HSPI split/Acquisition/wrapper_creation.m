%INPUT: none
%OUTPUT :wrapper
function wrapper=wrapper_creation()

javaaddpath('C:\Program Files\Ocean Optics\OmniDriverSPAM\OOI_HOME\UniUSB.jar');% added unitUSB.jar in the java path
javaaddpath('C:\Program Files\Ocean Optics\OmniDriverSPAM\OOI_HOME\OmniDriver.jar');% added Omnidriver.jar in the java path
import('java.lang.Object') % java compiler import
import('com.oceanoptics.uniusb.UniUSB.*')% UniUSB library import
import('com.oceanoptics.omnidriver.api.wrapper.Wrapper');% wrapper import
wrapper = Wrapper(); % wrapper creation 
NoOfDevices = wrapper.openAllSpectrometers(); % opens all spectrometers

end

