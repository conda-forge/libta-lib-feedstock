setlocal EnableDelayedExpansion

pushd win

:: Make a build folder and change to it.
mkdir build
pushd build

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      ..
if errorlevel 1 exit 1

:: Build!
nmake
if errorlevel 1 exit 1

:: Install!
nmake install
if errorlevel 1 exit 1

popd

:: Copy files to correct locations because CMakeLists.txt overrides the it even if we set the install prefix
:: Try both C:/Program Files (x86)/ and C:/Program Files/ to ensure we find the files
for %%l in ("Program Files" "Program Files (x86)") do (
    pushd "C:\%%l\TA-Lib"
    copy /Y /B "lib\ta-lib.lib" "%LIBRARY_LIB%\ta-lib.lib"
    copy /Y /B "bin\ta-lib.dll" "%LIBRARY_BIN%\ta-lib.dll"
    copy /Y /B "lib\ta-lib-static.lib" "%LIBRARY_LIB%\ta-lib-static.lib"
    copy /Y /B "include\ta_abstract.h" "%LIBRARY_INC%\ta_abstract.h"
    copy /Y /B "include\ta_common.h" "%LIBRARY_INC%\ta_common.h"
    copy /Y /B "include\ta_defs.h" "%LIBRARY_INC%\ta_defs.h"
    copy /Y /B "include\ta_func.h" "%LIBRARY_INC%\ta_func.h"
    copy /Y /B "include\ta_libc.h" "%LIBRARY_INC%\ta_libc.h"
    popd
)
