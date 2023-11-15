# 1. Introduction à la cryptographie

----

## 1.0 Générer et partager une clé de chiffrement AES256 ainsi que les IV avec le destinataire

- Génération éffectué grâce au code en Annexe (2.1)

## 1.1 Comment générer une clé de chiffrement de manière sure ? Quel est le risque si les IV sont toujours les mêmes ?

- Pour générer une clé de chiffrement de manière sure on peut utiliser le chiffrement en Base64.
- Si les IV sont toujours les mêmes ce sera plus facile de décrypter le prochain message.

## 1.2 Chiffrer un message et l’envoyer

### 1.2.1 Hex :

- Voici le résultat lors du chiffrement d'un de mes messages (en Hex) :

Voici le message chiffré :

```
87F154AAFB5CDF299338D4B27DDFA3E45D5DEFF5B2EC6AEAE9C82F40CDC1F165
```

```
Résultat : Salut comment que ça va là
```

Voici ma clé AES : 

```
34 175 251 239 112 150 141 54 27 225 243 51 85 184 229 59 98 53 130 219 20 48 220 149 174 249 10 180 14 28 227 217
```

Et voici ma clé IV : 

```
182 193 182 180 110 96 171 46 126 35 8 6 74 220 13 14
```

### 1.2.2 Base64 :

- Voici le résultat lors du chiffrement d'un de mes messages (en Base64) :

Voici le message chiffré :

```
33WfKa1+X+Fjsth19LuWLQ==
```

```
Résultat : Salut la team
```

Voici ma clé AES : 

```
130 215 162 211 166 68 127 210 72 30 103 4 65 80 190 120 180 222 216 128 31 253 110 8 36 156 230 208 156 187 70 121
```

Et voici ma clé IV : 

```
17 239 42 156 4 59 118 96 21 211 6 126 225 50 121 247
```



## 1.3 Recevoir et déchiffrer le message

- Voici le résultat d'un message reçu :

Voici le message chiffré :

```
C822DAA500808D8603C6F5EF411D73036851B54CF90468BDF989DC3D0E7285E4
```

Voici ma clé AES : 

```
128 178 102 7 194 125 175 157 109 68 152 218 170 110 29 54 16 89 255 53 218 60 70 18 35 3 246 219 196 152 191 252
```

Et voici ma clé IV : 

```
25 54 226 195 216 165 93 227 71 14 8 87 49 58 190 10
```

En décryptant le message j'obtiens donc ceci : 

```
Le saucisson c'est bon
```

## 1.4 Comment pourrait-on s'assurer de l'intégrité du message ? Ajouter cette fonctionnalité à l'aide d'un script ou d'un outil en CLI.

1. Hachage 
2. Signature numérique 
3. Cryptographie asymétrique

Clé AES générée : 
```
d7052795853ec48cbebf036f9102ec798ec5d4576532ad8eb208257e93fb1cf6
```

IV généré : 
```
831b99b21e8471db3e4055dee6025b81
```

Message chiffré (Base64) : 
```
tVsdb36PSWZbzpy847w2XluWQhBQxiL6
```

Message d'origine : 
```
Il fait beau aujourd'hui
```

Clé privée RSA : 
```
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDCZw8lfgXuii2R
D5OZa/iopNuou7iOzmMNlShA9irNLFWIDtXC3tsqciRD88S8cltZbbWBJeUEk7Ko
mBn9EOj0CvHLC3kQjjgALvSfjKQOLZaMRaKZcSbtWG8Bl3Z27Wgp2AlMtOMyktPY
DFMO+49d7n9+Gn5skUkZJLfncJ+PMgxWLbJ2XaZpy1sTimxrA4VNLoDVIi4N0Mey
XH/Ewqr34WhTBqyDrr2YvbGfffFjz68bsKvggzZkA3kW2uwNNjANav5SXvy7l7vO
NISXNIIusLZYbK0VWHV/SF0ReSh5tfL+wXF/VXBhJNLk3N0V+3cwCZvweUdUeTRe
cwzmOUftAgMBAAECggEAGYI7bxB/x8Ky4vd3xyhvSvXC6vui5n43aidZzlhe2mhI
Wt+TdgwXFxU+I/p/JLkeunfWWrl1uSmGRnAa7OWEo80x2BJL0vvOZlvC9pKWTlP2
DrbudJLv6DHz8vIEdeuGAQObiMitjUvN52oKlgs1Tz6F1S61yxovTNDQHtrc3QWa
DKv8o8HWfyhKQnZHVY0OLTW7KwA1sKEoAVXCyDVYFn8SvvJSka5nHKZ2WRzSVBsU
RSytE8V0ucON9z6CWLEunuFK2MQXuZelNZV8VBIANwpTl9E/p1knXLsXK6zopxtV
WbfsLvAiRqVbkV0uwo6dOtEmO5vK4cRenUsB2cRWUQKBgQDr7BD/YS+pNhkt7qaG
LULajHSnN4Z1FoRpyyD+9JAD/q6E7tce6mD1LpfHRyXKS9tUJOKV2hgo3BAhrxX0
eJLsPcS0a09PI3zmDV6AkUTYbgodPgWAPXcpFFTRKN76x/vlXpLpsbTpt1FYYVf4
2sdcIZmEF1kuiXSxZjNhg7IpeQKBgQDS8myPmwHz8aEyDGs4oeoN5COfoh8438Fm
eh7YzAbDfz6cLtKNwzCdgDRxXGcdDHOT3DzVsglV7FLolKl8yqr+3ScImieGArJ8
K8akfgPly7Vy633UkyYWu4XlC2KaxJ2f+/tUluqwhoBAosi/JYkLIcbLXQv1UkBh
hOtYEVOpFQKBgCYCt85dmy85Hx9uZvgRTMcngBf88zXkNdtRtfQ99QIfw4B5dsFt
Y8e9BQk/ZlBMnn7VHoikReY3ZoX2zqO/1XQok4u6CmImxpXOK56tSRlRyWFiv8Ik
pRFCTFQSsLJZDDWtYiAy2IIbXgjOTj0zCpHGfBRzKpQ740g9viOE82yJAoGBAKNJ
eHNo/4f/YFHHfy/lVbHPCSxGaHiz65cRrNMQi6PE2Yg4Tk/h6b3hQbcGWeMIgmbQ
Ml8QY12Zg0v514B7uQVz1wU3nqSDbfnkQO2PhiDZIOmGFG76QJ+UJL75oyg+Te1L
Nm9yKtTeKGTgHRipS33MdX9x1RHey2sxYqNXNjVJAoGBAOD5GB0Ru26347KwBzHr
L0QeQmyo0+lXQ0+98kZieGjwi5iXRMLtuoiIFuz0WFkFOvXkqEHciWPx70zA4bAt
rWZlKGFQkZbXbDRc8hQMrJOYBy9O2Sx2ewgZPr97uyXrch2O6Sjj/ZOieHhNd6q2
EH93hE3MvX8rZ6lBIUi9vR3X
-----END PRIVATE KEY-----
```

Clé publique RSA : 
```
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwmcPJX4F7ootkQ+TmWv4
qKTbqLu4js5jDZUoQPYqzSxViA7Vwt7bKnIkQ/PEvHJbWW21gSXlBJOyqJgZ/RDo
9Arxywt5EI44AC70n4ykDi2WjEWimXEm7VhvAZd2du1oKdgJTLTjMpLT2AxTDvuP
Xe5/fhp+bJFJGSS353CfjzIMVi2ydl2mactbE4psawOFTS6A1SIuDdDHslx/xMKq
9+FoUwasg669mL2xn33xY8+vG7Cr4IM2ZAN5FtrsDTYwDWr+Ul78u5e7zjSElzSC
LrC2WGytFVh1f0hdEXkoebXy/sFxf1VwYSTS5NzdFft3MAmb8HlHVHk0XnMM5jlH
7QIDAQAB
-----END PUBLIC KEY-----
```

Signature numérique : 
```
WC0zW7mrmSbMRuJHaVUBkQBQr84WnBricGffBT8OLWWXfI8aiGAuVkaBLlP/H5CuL8hHCpTMLLQ9uz5hr6kh87npiXDLcSCim6GP95SLDC/u/5nX5twBJPdKOUWza4iFsCSkHXAWtyJ87lsOElL3isITCya90azcGnJJi6e6fXk6g0pZOPpol1og4Ij2x40ai8zI6iaSKL42OJl5RMYraM1lr2tEXMjfzOGRnyZomK9D827YBL+trnysRx7WDQTWGCjNrwV1K7Up9j36OuUryfcgQP8Cf0nlYU20SS1BR/a3EIJCh9bKbqgh2xzDBvfvXIenr+Wv114GeKAR0/T74g==
```

## 1.5 Comment pourrait-on s'assurer de l'authenticité de ce message ? Ajouter cette fonctionnalité à l'aide d'un script ou d'un outil en CLI.

1. Signature numérique
2. Cryptographie asymétrique
3. Protocole d'authentification
4. Vérification du contenu

# 2. Annexe :

## 2.1 Code powershell génération de clé AES et IV : 

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

## 2.2 Code powershell génération de clé AES et IV (base64) : 

```powershell 
# Fonction pour générer une clé AES
function Generate-AESKey {
    $aesKey = New-Object Byte[] 32
    [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($aesKey)
    $aesKey
}

# Fonction pour générer un vecteur d'initialisation (IV)
function Generate-InitializationVector {
    $iv = New-Object Byte[] 16
    [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($iv)
    $iv
}

# Fonction pour chiffrer un texte en utilisant AES-CBC et le formatage en base64
function Encrypt-Text {
    param(
        [Parameter(Mandatory=$true)]
        [string]$plaintext,

        [Parameter(Mandatory=$true)]
        [byte[]]$key,

        [Parameter(Mandatory=$true)]
        [byte[]]$InitializationVector
    )

    $aes = New-Object System.Security.Cryptography.AesCryptoServiceProvider
    $aes.Key = $key
    $aes.IV = $InitializationVector
    $encryptor = $aes.CreateEncryptor()

    $plaintextBytes = [System.Text.Encoding]::UTF8.GetBytes($plaintext)
    $encryptedBytes = $encryptor.TransformFinalBlock($plaintextBytes, 0, $plaintextBytes.Length)

    $base64Text = [Convert]::ToBase64String($encryptedBytes)
    return $base64Text
}

# Fonction pour déchiffrer un texte en utilisant AES-CBC et le formatage en base64
function Decrypt-Text {
    param(
        [Parameter(Mandatory=$true)]
        [string]$base64Text,

        [Parameter(Mandatory=$true)]
        [byte[]]$key,

        [Parameter(Mandatory=$true)]
        [byte[]]$InitializationVector
    )

    $aes = New-Object System.Security.Cryptography.AesCryptoServiceProvider
    $aes.Key = $key
    $aes.IV = $InitializationVector
    $decryptor = $aes.CreateDecryptor()

    $encryptedBytes = [Convert]::FromBase64String($base64Text)
    $decryptedBytes = $decryptor.TransformFinalBlock($encryptedBytes, 0, $encryptedBytes.Length)

    $plaintext = [System.Text.Encoding]::UTF8.GetString($decryptedBytes)
    return $plaintext
}

# Exemple d'utilisation
$aesKey = Generate-AESKey
Write-Host "Clé AES générée : $($aesKey -join '')"

$InitializationVector = Generate-InitializationVector
Write-Host "IV généré : $($InitializationVector -join '')"

$message = "Salut la team"
Write-Host "Message d'origine : $message"

$encryptedText = Encrypt-Text -plaintext $message -key $aesKey -InitializationVector $InitializationVector
Write-Host "Message chiffré (Base64) : $encryptedText"

$decryptedMessage = Decrypt-Text -base64Text $encryptedText -key $aesKey -InitializationVector $InitializationVector
Write-Host "Message déchiffré : $decryptedMessage"
```

## 2.3 Code python génération de clé AES et IV (base64) : 

```python
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
import os

def generate_aes_key():
    # Générer une clé AES aléatoire de 256 bits
    key = os.urandom(32)  # 32 octets pour une clé AES-256
    return key

def generate_iv():
    # Générer un vecteur d'initialisation (IV) aléatoire de 16 octets
    iv = os.urandom(16)
    return iv

def encrypt(plaintext, key, iv):
    # Créer un objet Cipher avec l'algorithme AES, la clé et le mode d'opération CBC
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    
    # Créer un objet Encryptor à partir du Cipher
    encryptor = cipher.encryptor()
    
    # Ajouter un remplissage au texte brut
    padder = padding.PKCS7(128).padder()
    padded_plaintext = padder.update(plaintext) + padder.finalize()
    
    # Chiffrer le texte brut avec le remplissage
    ciphertext = encryptor.update(padded_plaintext) + encryptor.finalize()

    return ciphertext

def decrypt(ciphertext, key, iv):
    # Créer un objet Cipher avec l'algorithme AES, la clé et le mode d'opération CBC
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=default_backend())
    
    # Créer un objet Decryptor à partir du Cipher
    decryptor = cipher.decryptor()
    
    # Déchiffrer le texte chiffré
    plaintext = decryptor.update(ciphertext) + decryptor.finalize()
    
    return plaintext

if __name__ == "__main__":
    # Générer une clé AES
    aes_key = generate_aes_key()
    print(f"Clé AES générée : {aes_key.hex()}")

    # Générer un vecteur d'initialisation (IV)
    iv = generate_iv()
    print(f"IV généré : {iv.hex()}")
    
    # Exemple d'utilisation du chiffrement et du déchiffrement
    message = b"Hello, world!"
    print(f"Message d'origine : {message.decode('utf-8')}")

    # Chiffrer le message
    ciphertext = encrypt(message, aes_key, iv)
    print(f"Message chiffré : {ciphertext.hex()}")

    # Déchiffrer le message
    decrypted_message = decrypt(ciphertext, aes_key, iv)
    print(f"Message déchiffré : {decrypted_message.decode('utf-8')}")
```

## 2.4 Code python génération de clé AES et IV (base64 + signature) :

```python 
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import padding, hashes
import os
import base64
from cryptography.hazmat.primitives.asymmetric import rsa, padding
from cryptography.hazmat.primitives import serialization

def generate_aes_key():
    return os.urandom(32)

def generate_initialization_vector():
    return os.urandom(16)

def encrypt_text(plaintext, key, iv):
    cipher = Cipher(algorithms.AES(key), modes.CFB(iv), backend=default_backend())
    encryptor = cipher.encryptor()

    plaintext_bytes = plaintext.encode('utf-8')

    # Chiffrer les données
    ciphertext = encryptor.update(plaintext_bytes) + encryptor.finalize()
    return base64.b64encode(ciphertext).decode('utf-8')

def decrypt_text(ciphertext, key, iv):
    cipher = Cipher(algorithms.AES(key), modes.CFB(iv), backend=default_backend())
    decryptor = cipher.decryptor()

    ciphertext_bytes = base64.b64decode(ciphertext)

    # Déchiffrer les données
    plaintext_bytes = decryptor.update(ciphertext_bytes) + decryptor.finalize()
    return plaintext_bytes.decode('utf-8')

def generate_rsa_key_pair():
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048,
        backend=default_backend()
    )

    private_pem = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.NoEncryption()
    )

    public_key = private_key.public_key()

    public_pem = public_key.public_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PublicFormat.SubjectPublicKeyInfo
    )

    return private_pem, public_pem

def sign_message(message, private_key):
    private_key = serialization.load_pem_private_key(private_key, password=None, backend=default_backend())

    message_bytes = message.encode('utf-8')
    signature = private_key.sign(
        message_bytes,
        padding.PSS(
            mgf=padding.MGF1(hashes.SHA256()),
            salt_length=padding.PSS.MAX_LENGTH
        ),
        hashes.SHA256()
    )

    return base64.b64encode(signature).decode('utf-8')

def verify_signature(message, signature, public_key):
    public_key = serialization.load_pem_public_key(public_key, backend=default_backend())

    message_bytes = message.encode('utf-8')
    signature_bytes = base64.b64decode(signature)

    try:
        public_key.verify(
            signature_bytes,
            message_bytes,
            padding.PSS(
                mgf=padding.MGF1(hashes.SHA256()),
                salt_length=padding.PSS.MAX_LENGTH
            ),
            hashes.SHA256()
        )
        return True
    except cryptography.exceptions.InvalidSignature:
        return False

# Exemple d'utilisation
aes_key = generate_aes_key()
print(f"Clé AES générée : {aes_key.hex()}")

iv = generate_initialization_vector()
print(f"IV généré : {iv.hex()}")

message = "Il fait beau aujourd'hui"
print(f"Message d'origine : {message}")

# Chiffrement avec AES
encrypted_text = encrypt_text(message, aes_key, iv)
print(f"Message chiffré (Base64) : {encrypted_text}")

# Signature numérique avec RSA
private_key, public_key = generate_rsa_key_pair()
print(f"Clé privée RSA : {private_key.decode('utf-8')}")
print(f"Clé publique RSA : {public_key.decode('utf-8')}")

signature = sign_message(encrypted_text, private_key)
print(f"Signature numérique : {signature}")

# Vérification de la signature avec la clé publique RSA
is_signature_valid = verify_signature(encrypted_text, signature, public_key)
print(f"La signature est-elle valide ? {is_signature_valid}")
```