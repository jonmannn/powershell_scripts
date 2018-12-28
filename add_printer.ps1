$printer_ip = "10.10.10.10"
$portName = "TCPPort:$printer_ip"
$printDriverName = "PCL6 Driver for Universal Print" # Get this value from the INF file
 
$portExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
 
if (-not $portExists) {
  Add-PrinterPort -name $portName -PrinterHostAddress $printer_ip
}
 
$printDriverExists = Get-PrinterDriver -name $printDriverName -ErrorAction SilentlyContinue
 
if (-not $printDriverExists) {
    pnputil.exe /add-driver "C:\path\to\oemsetup.inf" /install # Make sure INF is in same directory as referenced files inside it
    Add-PrinterDriver -Name $printDriverName
}

Add-Printer -Name "Daily News" -PortName $portName -DriverName $printDriverName
