# Application path
$display = $Env:display64path
$asphyxia = $Env:asphyxia-core
$spice = $Env:spice2x

# Launch the applications
# Rotates to Portrait (Flipped)
Start-Process $display -ArgumentList "/device 1 /rotate 270" 
$aspid = (Start-Process $asphyxia -passthru).Id
# Let asphyxia boot up
Start-Sleep -Seconds 2

$s2pid = (Start-Process $spice -passthru -Wait).Id

Start-Sleep -Seconds 2
# Stop asphyxia server
Stop-Process -Id $aspid

# Set to original rotation
Start-Process $display -ArgumentList "/device 1 /rotate 0"
