$host.ui.rawui.foregroundcolor = "green"
# Variable que me demande si je veux éxécuter ou non le script
$scriptouvert = Read-host "Souhaitez vous ouvrir le script ? [O/N]"

####### EXTRA #######

# Variable qui me sert de séparation pour rajouter de l'esthétique à mon code
$barre = "
======================================
"

# Ici on déclare un choix qui répond en fonction du résultat de la variable "$scriptouvert"
switch($scriptouvert){
    O{
        # Je déclare une variable pour récupérer le nom de mon poste (ici mon serveur)
        $computername = "WIN-SERVER.AD.LAB"

        ##### NOMBRES D'UTILISATEURS #####

        # On déclare une variable qui vient récupérer le nombre d'utilisateur dans l'ad
        $nusers = (Get-AdUser -Filter *).Count
        # Variable de séparation
        $barre
        # On écrit le résultat 
        Write-host = " Voici le nombres d'utilisateurs présent sur l'ad : $nusers"
        # Variable de séparation
        

        ##### SERVICES DNS, WinRM #####
        $barre
        Get-Service DNS ;
        Get-Service WinRM ;
        

        ##### LISTE ACCES SMBSHARE #####
        $barre
        Get-SmbShare -Name "ro" | Get-SMBShareAccess |select -Property name,AccessRight,AccountName ; 
        Get-SMBShare -Name "rw" | Get-SmbShareAccess |select -Property name,AccessRight,AccountName;

        $barre
        ssh -i C:\Users\administrateur\.ssh administrateur@$computername curl -k https://localhost:3000  
        $barre 

        $host.ui.rawui.foregroundcolor = "white"     
    }
    N{
        $host.ui.rawui.foregroundcolor = "white"
        Write-Host "Merci ! Au revoir" -foregroundcolor red
        Pause
        Exit
    }
}