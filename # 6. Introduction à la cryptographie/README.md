# Introduction à la cryptographie

----

## 0. Générer et partager une clé de chiffrement AES256 ainsi que les IV avec le destinataire

- Génération éffectué grâce au code suivant : 

```powershell 
<# utilisation:

$aes = Generer-cle
$iv = generer-iv                                      
$msgchiffre = Chiffrer-message -Message "test" -Key $aes -IVs $iv
$msgchiffre
Dechiffrer-message -EncryptedString $msgchiffre -Key $aes -IVs $iv

/!\ attention: contrairement à la clé, les IV ne doivent pas être réutilisés.
Ce script est utilisé à titre éducatif et n'est pas là pour garantir la confidentialité d'échanges en production.

#>



function Generer-cle {

    $AESKey = New-Object Byte[] 32
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($AESKey)
    return $AESKey

}


function Generer-IV {

    $IV = New-Object Byte[] 16
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($IV)
    return $IV

}


function Chiffrer-message
{
    param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string] $Message,

    [Parameter(Mandatory=$true, Position=1)]
    [System.Byte[]] $Key,
  
    [Parameter(Mandatory=$true, Position=2)]
    [Byte[]] $IVs

    )

$AES = New-Object System.Security.Cryptography.AesCryptoServiceProvider
$AES.Key = $Key
$AES.IV = $IVs
$AES.Mode = "CBC"
$Encryptor = $AES.CreateEncryptor()
$EncryptedBytes = $Encryptor.TransformFinalBlock([Text.Encoding]::UTF8.GetBytes($Message), 0, $Message.Length)
return [BitConverter]::ToString($EncryptedBytes) -replace '-', ''

}


## déchiffrement

function Dechiffrer-message
{
    param(
    [Parameter(Mandatory=$true, Position=0)]
    [ValidateNotNullOrEmpty()]
    [string] $EncryptedString,

    [Parameter(Mandatory=$true, Position=1)]
    [System.Byte[]] $Key,

    [Parameter(Mandatory=$true, Position=2)]
    [Byte[]] $IVs

    )

$EncryptedBytes = [byte[]]::new($EncryptedString.Length / 2)
for ($i = 0; $i -lt $EncryptedBytes.Length; $i++) {
    $EncryptedBytes[$i] = [Convert]::ToByte($EncryptedString.Substring($i * 2, 2), 16)
}
$AES = New-Object System.Security.Cryptography.AesCryptoServiceProvider
$AES.Key = $Key
$AES.Mode = "CBC"
$AES.IV = $IVs
$Decryptor = $AES.CreateDecryptor()
$DecryptedBytes = $Decryptor.TransformFinalBlock($EncryptedBytes, 0, $EncryptedBytes.Length)
return [Text.Encoding]::UTF8.GetString($DecryptedBytes)

}

$aes = Generer-cle
$a = ""; $aes |% { $a += $_.tostring() + " " }  
$iv = generer-iv 
$v = ""; $iv |% { $v += $_.tostring() + " " }                                      
$msgchiffre = Chiffrer-message -Message "Salut, comment que ça va " -Key $aes -IVs $iv
$msgchiffre
Dechiffrer-message -EncryptedString $msgchiffre -Key $aes -IVs $iv

Write-Output "------AES-----"
$a 
Write-Output "------IV-----"
$v
Write-Output "-----------"
```

## 1. Comment générer une clé de chiffrement de manière sure ? Quel est le risque si les IV sont toujours les mêmes ?

- Pour générer une clé de chiffrement de manière sure on peut utiliser le chiffrement en Base64.
- Si les IV sont toujours les mêmes ce sera plus facile de décrypter le prochain message.

## 2. Chiffrer un message et l’envoyer

- Voici le résultat lors du chiffrement d'un de mes messages (en Hex) :

Voici le message chiffré :

```
87F154AAFB5CDF299338D4B27DDFA3E45D5DEFF5B2EC6AEAE9C82F40CDC1F165
```

Voici ma clé AES : 

```
34 175 251 239 112 150 141 54 27 225 243 51 85 184 229 59 98 53 130 219 20 48 220 149 174 249 10 180 14 28 227 217
```

Et voici ma clé IV : 

```
182 193 182 180 110 96 171 46 126 35 8 6 74 220 13 14
```

## 3. Recevoir et déchiffrer le message


