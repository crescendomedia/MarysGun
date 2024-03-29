echo off
rem ********************************************************************
rem * Simple Windows batch file to run Photomatix Pro 2 to combine up  *
rem * to 9 images and then display the result in BreezeBrowser Pro     *
rem *                                                                  *
rem * Please set "Append sequence letter to end of filenames when      *
rem * auto-bracketing" before using this script.                       *
rem ********************************************************************

rem set paths to Photomatix command line app and BBPro dir display utility
set PhotomatixCL="C:\Program Files\Photomatix\PhotomatixCL.exe"
set DisplayCmd=BBProDisplay.exe

rem Photomatix Pro blending mode:
rem -0=average, -1=H&S auto, -2=H&S adjust, -3=HDR image
rem -t=global tone mapping (also requires -3)
rem -a align images prior to combining them
set blend=-3 -t

rem *** Do not edit anything below this line! ***

if not exist %PhotomatixCL% goto not_found

rem set %output% to the name of the output file (without file extension)
set output=%1
set output=%output:"=%
set output=%output:~0,-5%
set output=%output%_blended

rem set %display% to the name of the output file (with file extension)
set display=%output%.jpg

rem run the commands
%PhotomatixCL% %blend% -o "%output%" %1 %2 %3 %4 %5 %6 %7 %8 %9
%DisplayCmd% "%display%"
goto done

:not_found
echo Unable to find Photomatix Pro command line app:
echo %PhotomatixCL%
pause

:done
