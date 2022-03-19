@echo off

REM *************************** USER CONFIGURATION ***************************
REM Set simulation start and end years.
set SIMULATION_START_YEAR=1900
set SIMULATION_END_YEAR=2050

REM Set Python path - change this to your Python installation directory.
set GCBM_PYTHON=C:\Python37

REM Is your version of MS Access 32 (x86) or 64 (x64) bit?
set PLATFORM=x64
REM **************************************************************************

REM Set GDAL library paths.
set GDAL_BIN=%GCBM_PYTHON%\lib\site-packages\osgeo
set GDAL_DATA=%GDAL_BIN%\data\gdal

set PYTHONPATH=%GCBM_PYTHON%;%GCBM_PYTHON%\lib\site-packages
set PATH=%GCBM_PYTHON%;%GDAL_BIN%;%GDAL_DATA%;%GCBM_PYTHON%\scripts;%GCBM_PYTHON%\lib\site-packages


REM Merge the raw spatial output and convert to GeoTIFF format.
echo Compiling spatial output...
"%GCBM_PYTHON%\python.exe" tools\compilegcbmspatialoutput\create_tiffs.py --indicator_root gcbm_project\output --start_year %SIMULATION_START_YEAR% --output_path processed_output\spatial --output_type tif

echo Done!
pause
