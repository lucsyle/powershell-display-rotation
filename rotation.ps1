# Application path
$monitor = 1
$display = "path to display64.exe"
$asphyxia = "path to asphyxia-core"
$spice = "path to spice2x"

# Launch the applications
# Rotates to Portrait (Flipped)
Start-Process $display -ArgumentList "/device {$monitor} /rotate 270" 
$aspid = (Start-Process $asphyxia -passthru).Id
# Let asphyxia boot up
Start-Sleep -Seconds 2

$s2pid = (Start-Process $spice -passthru -Wait).Id

Start-Sleep -Seconds 2
# Stop asphyxia server
Stop-Process -Id $aspid

# Set to original rotation
Start-Process $display -ArgumentList "/device {$monitor} /rotate 0"
