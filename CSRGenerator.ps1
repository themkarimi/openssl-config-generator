Write-Host "Welcome to OpenSSL San Config Generator"
Write-Host "This Script generates an OpenSSl SAN CSR Config file or a SAN CSR if needed, Please Install OpenSSL First"
sleep 1
Write-Host "Please Enter the Number of Subject Alternative Names"
sleep 1
$num= Read-Host "Number"
$c=1
Write-Host "Please Enter the Config File Path Name(Example:D:\Test.cnf)"
$Path= Read-Host "Path" 
New-Item -Path $Path 
$def=Get-Content -Path ./default.txt
Add-Content $Path -Value $def 
While ( $c -le $num )
{
    Write-Host "Please Enter SAN"
    $san=Read-Host "SAN"
    $DNS= "DNS.$c  = $san"
    Add-Content $Path -Value $DNS
    $c=$c+1

}
sleep 1
$req= Read-Host "Do You Want to Generate CSR File?(Yes/No)"

if($req -eq "Yes")
  {
    $filename=Read-Host "Please Enter CSR File Name(Example: Test.csr)"
    $keyname=Read-Host "Please Enter Key File Name (Example: Test.Key)"
	sleep 1
	Write-Host "Press Enter for defaults"
    C:\"Program Files"\OpenSSL-Win64\bin\openssl.exe req -out $filename -newkey rsa:2048 -nodes -keyout $keyname -config $Path
	sleep 1
	Write-Host "Done"
    }
    elseif ( $req -eq "No" )
        {
            Write-Host "Ok, So Long!"
            }
                else {

                    Write-Host "Wait, What??"
                    }
                    
