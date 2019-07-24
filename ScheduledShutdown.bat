@echo off
Rem Short little script used for scheduled PC shutdown
Rem Not fault tolerant to bad user input
:while
	SET /p min="Enter number of minutes after which you want the PC to shutdown [1 minute at least]: "
	echo %min%| findstr /r "^[1-9][0-9]*$">nul
	IF %errorlevel% NEQ 0 (
		GOTO :while
	)
SET /p answer="Are you sure you want to schedule a shutdown (y/n)? "
SetLocal EnableDelayedExpansion
IF "%answer%"=="y" (
	SET /A secs=min*60
	ECHO Your PC will shutdown after %min% minute[s] / !secs! second[s].
	SHUTDOWN -s -t !secs!
	ECHO Run "shutdown -a" or "AbortScheduledShutdown.bat" if you want to abort the scheduled shutdown.	
) ELSE ( 
	ECHO Scheduled PC shutdown was aborted.
)
cmd /k