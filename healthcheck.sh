#!/bin/bash
LOGFILE="healthlog.txt"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

{
echo "==========================================="
echo " System Health Report - $TIMESTAMP"
echo "==========================================="

echo "Current Date & Time: $(date)"

echo "System Uptime:"
powershell.exe -Command "(Get-CimInstance Win32_OperatingSystem).LastBootUpTime" | tr -d '\r'
echo ""

echo "CPU Load:"
powershell.exe -Command "Get-Counter '\Processor(_Total)\% Processor Time' | Select -ExpandProperty CounterSamples | Select -ExpandProperty CookedValue" | tr -d '\r'
echo ""

echo "Memory Usage (MB):"
powershell.exe -Command "Get-CimInstance Win32_OperatingSystem | Select TotalVisibleMemorySize,FreePhysicalMemory" | tr -d '\r'
echo ""

echo "Disk Usage:"
powershell.exe -Command "Get-PSDrive -PSProvider FileSystem | Select Name,Used,Free" | tr -d '\r'
echo ""

echo "Top 5 Memory Consuming Processes:"
powershell.exe -Command "Get-Process | Sort-Object WorkingSet -Descending | Select -First 5 | Select ProcessName,Id,CPU,PM" | tr -d '\r'
echo ""

echo "Service Status:"
for service in sshd nginx; do
  powershell.exe -Command "Get-Service -Name $service -ErrorAction SilentlyContinue | Select Status,Name" | tr -d '\r'
done

echo "-------------------------------------------"
echo ""
} >> "$LOGFILE"

