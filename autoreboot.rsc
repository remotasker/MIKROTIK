/system script add name="DailyReboot" source="/system reboot"
/system scheduler add name="RebootAt3AM" on-event="DailyReboot" start-time=03:00:00 interval=1d

