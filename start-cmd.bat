@rem Do not use "echo off" to not affect any child calls.
@setlocal
@set PATH="%cd%\bin";%PATH%
@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%
@cd %HOME%
@start %COMSPEC%