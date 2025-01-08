::Sets time to eastern

tzutil /s "Eastern Standard Time"

:: Diasble UAC

:: reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f

:: Turn off monitor never

powercfg /change monitor-timeout-ac 0
powercfg /change monitor-timeout-dc 0

:: Set sleep to never

powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 0

:: Disables hibernate and fast start up

powercfg /hibernate off

::Set Proccesor minimum plugged in

powercfg -setacvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMIN 100

::Set Processor minimum battery

powercfg -setdcvalueindex SCHEME_BALANCED SUB_PROCESSOR PROCTHROTTLEMIN 50

::Turn off hard disk never

powercfg -change -disk-timeout-dc 0
powercfg -change -disk-timeout-ac 0

::Close lid do nothing on battery and plugged in

powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

:: When pressing power button shut down, plugged in and battery

powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3

powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3

::Applies power settings to current scheme

powercfg -SetActive SCHEME_CURRENT

pause