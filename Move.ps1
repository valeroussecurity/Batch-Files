# Replace "<SERVER_NAME_HERE!>" with the name of your server. Source server is where you want the data to copy from, Destination is where it will go to.
# If files are already in the destination directory, it will overwrite them.

$sourcePath = "\\<SERVER_NAME_HERE!>\D$\Shares"
$destinationPath = "\\<SERVER_NAME_HERE!>\D$\Shares"

Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
