@echo off
REM ----------------------------------------------------------------------------
REM Maven Wrapper for Maven 3.8.7
REM ----------------------------------------------------------------------------

REM Required ENV vars:
REM   JAVA_HOME - location of a JDK home dir
REM Optional ENV vars:
REM   MAVEN_OPTS - parameters passed to the Java VM
REM   MAVEN_BATCH_ECHO - 'on' to echo batch commands
REM   MAVEN_BATCH_PAUSE - 'on' to pause at the end
REM   MAVEN_SKIP_RC - skip loading mavenrc files

@if "%MAVEN_BATCH_ECHO%" == "on" echo MAVEN_BATCH_ECHO is on

REM Set HOME if not set
if "%HOME%"=="" set "HOME=%HOMEDRIVE%%HOMEPATH%"

REM Pre scripts
if not "%MAVEN_SKIP_RC%"=="" goto skipRcPre
if exist "%HOME%\mavenrc_pre.bat" call "%HOME%\mavenrc_pre.bat"
if exist "%HOME%\mavenrc_pre.cmd" call "%HOME%\mavenrc_pre.cmd"
:skipRcPre

setlocal
set ERROR_CODE=0
setlocal

REM Validate JAVA_HOME
if "%JAVA_HOME%"=="" (
    echo.
    echo Error: JAVA_HOME not found in your environment. >&2
    echo Please set JAVA_HOME to your Java installation. >&2
    echo.
    goto error
)
if not exist "%JAVA_HOME%\bin\java.exe" (
    echo.
    echo Error: JAVA_HOME points to invalid directory. >&2
    echo JAVA_HOME = "%JAVA_HOME%" >&2
    goto error
)

:init
REM Find project base directory (contains .mvn)
set MAVEN_PROJECTBASEDIR=%MAVEN_BASEDIR%
if not "%MAVEN_PROJECTBASEDIR%"=="" goto endDetectBaseDir

set EXEC_DIR=%CD%
set WDIR=%EXEC_DIR%
:findBaseDir
if exist "%WDIR%\.mvn" goto baseDirFound
cd ..
if "%WDIR%"=="%CD%" goto baseDirNotFound
set WDIR=%CD%
goto findBaseDir

:baseDirFound
set MAVEN_PROJECTBASEDIR=%WDIR%
cd "%EXEC_DIR%"
goto endDetectBaseDir

:baseDirNotFound
set MAVEN_PROJECTBASEDIR=%EXEC_DIR%
cd "%EXEC_DIR%"

:endDetectBaseDir

REM Read additional JVM options
if exist "%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config" (
    setlocal EnableExtensions EnableDelayedExpansion
    for /F "usebackq delims=" %%a in ("%MAVEN_PROJECTBASEDIR%\.mvn\jvm.config") do set JVM_CONFIG_MAVEN_PROPS=!JVM_CONFIG_MAVEN_PROPS! %%a
    endlocal & set JVM_CONFIG_MAVEN_PROPS=%JVM_CONFIG_MAVEN_PROPS%
)

REM Set java executable
set MAVEN_JAVA_EXE="%JAVA_HOME%\bin\java.exe"

REM Wrapper jar and launcher
set WRAPPER_JAR="%MAVEN_PROJECTBASEDIR%\.mvn\wrapper\maven-wrapper.jar"
set WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain

REM Execute Maven
%MAVEN_JAVA_EXE% %JVM_CONFIG_MAVEN_PROPS% %MAVEN_OPTS% %MAVEN_DEBUG_OPTS% -classpath %WRAPPER_JAR% "-Dmaven.multiModuleProjectDirectory=%MAVEN_PROJECTBASEDIR%" %WRAPPER_LAUNCHER% %MAVEN_CONFIG% %*
if ERRORLEVEL 1 goto error
goto end

:error
set ERROR_CODE=1

:end
endlocal & set ERROR_CODE=%ERROR_CODE%

REM Post scripts
if not "%MAVEN_SKIP_RC%"=="" goto skipRcPost
if exist "%HOME%\mavenrc_post.bat" call "%HOME%\mavenrc_post.bat"
if exist "%HOME%\mavenrc_post.cmd" call "%HOME%\mavenrc_post.cmd"
:skipRcPost

REM Pause if requested
if "%MAVEN_BATCH_PAUSE%"=="on" pause

if "%MAVEN_TERMINATE_CMD%"=="on" exit %ERROR_CODE%

exit /B %ERROR_CODE%
