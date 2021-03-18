﻿<#
This is a Resource designer script which generates a mof schema for DCPP_POSTBehavior resource in DellBIOSProvider module.


#>

$category = New-xDscResourceProperty -name Category -Type String -Attribute Key
$integratedNIC = New-xDscResourceProperty -name IntegratedNIC -Type String -Attribute Write -ValidateSet @("Enabled", "Enabled with PXE", "Enabled with ImageServer", "Enabled with RPL Boot", "Enabled with ISCSI Boot")
$uefiNetworkStack = New-xDscResourceProperty -name UEFINetworkStack -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$parallelPort = New-xDscResourceProperty -name ParallelPort -Type String -Attribute Write -ValidateSet @("Disabled", "AT", "PS2", "ECP")
$serialPort1 = New-xDscResourceProperty -name SerialPort1 -Type String -Attribute Write -ValidateSet @("Disabled", "COM1", "COM2", "COM3", "COM4", "Auto")
$sataOperation = New-xDscResourceProperty -name SATAOperation -Type String -Attribute Write -ValidateSet @("Disabled", "ATA", "AHCI", "RAID On")
$sata0 = New-xDscResourceProperty -name SATA0 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$sata1 = New-xDscResourceProperty -name SATA1 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$sata2 = New-xDscResourceProperty -name SATA2 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$sata3 = New-xDscResourceProperty -name SATA3 -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$smartReporting = New-xDscResourceProperty -name SMARTReporting -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$usbPowerShare = New-xDscResourceProperty -name USBPowerShare -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$audio = New-xDscResourceProperty -name Audio -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$keyboardIllumination = New-xDscResourceProperty -name KeyboardIllumination -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$keyboardBacklightwithAC = New-xDscResourceProperty -name KeyboardBacklightWithAC -Type String -Attribute Write -ValidateSet @("Enabled", "Disabled")
$Password = New-xDscResourceProperty -Name Password -Type string -Attribute Write -Description "Password"
$SecurePassword = New-xDscResourceProperty -Name SecurePassword -Type string -Attribute Write -Description "SecurePassword"
$PathToKey = New-xDscResourceProperty -Name PathToKey -Type string -Attribute Write



$properties = @($category, $integratedNIC, $uefiNetworkStack, $parallelPort, $serialPort1, $sataOperation, $sata0, $sata1, $sata2, $sata3, $smartReporting, $usbPowerShare, $audio, $keyboardIllumination, $keyboardBacklightwithAC,$Password,$SecurePassword,$PathToKey)

New-xDscResource -ModuleName DellBIOSProviderX86 -Name DCPP_SystemConfiguration -Property $properties -Path 'C:\Program Files\WindowsPowerShell\Modules' -FriendlyName "SystemConfiguration" -Force -Verbose

# SIG # Begin signature block
# MIIcOAYJKoZIhvcNAQcCoIIcKTCCHCUCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCC+4zA+IGCvhaJg
# C27J+BS+ZzpuVbx3OI58SMnPDAHaE6CCCscwggUyMIIEGqADAgECAg0Ah4JSYAAA
# AABR03PZMA0GCSqGSIb3DQEBCwUAMIG+MQswCQYDVQQGEwJVUzEWMBQGA1UEChMN
# RW50cnVzdCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdh
# bC10ZXJtczE5MDcGA1UECxMwKGMpIDIwMDkgRW50cnVzdCwgSW5jLiAtIGZvciBh
# dXRob3JpemVkIHVzZSBvbmx5MTIwMAYDVQQDEylFbnRydXN0IFJvb3QgQ2VydGlm
# aWNhdGlvbiBBdXRob3JpdHkgLSBHMjAeFw0xNTA2MTAxMzQyNDlaFw0zMDExMTAx
# NDEyNDlaMIHIMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVzdCwgSW5jLjEo
# MCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJtczE5MDcGA1UE
# CxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3JpemVkIHVzZSBv
# bmx5MTwwOgYDVQQDEzNFbnRydXN0IEV4dGVuZGVkIFZhbGlkYXRpb24gQ29kZSBT
# aWduaW5nIENBIC0gRVZDUzEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDCvTcBUALFjaAu6GYnHZUIy25XB1LW0LrF3euJF8ImXC9xK37LNqRREEd4nmoZ
# NOgdYyPieuOhKrZqae5SsMpnwyjY83cwTpCAZJm/6m9nZRIi25xuAw2oUGH4WMSd
# fTrwgSX/8yoS4WvlTZVFysFX9yAtx4EUgbqYLygPSULr/C9rwM298YzqPvw/sXx9
# d7y4YmgyA7Bj8irPXErEQl+bgis4/tlGm0xfY7c0rFT7mcQBI/vJCZTjO59K4oow
# 56ScK63Cb212E4I7GHJpewOYBUpLm9St3OjXvWjuY96yz/c841SAD/sjrLUyXE5A
# PfhMspUyThqkyEbw3weHuJrvAgMBAAGjggEhMIIBHTAOBgNVHQ8BAf8EBAMCAQYw
# EwYDVR0lBAwwCgYIKwYBBQUHAwMwEgYDVR0TAQH/BAgwBgEB/wIBADAzBggrBgEF
# BQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVudHJ1c3QubmV0MDAG
# A1UdHwQpMCcwJaAjoCGGH2h0dHA6Ly9jcmwuZW50cnVzdC5uZXQvZzJjYS5jcmww
# OwYDVR0gBDQwMjAwBgRVHSAAMCgwJgYIKwYBBQUHAgEWGmh0dHA6Ly93d3cuZW50
# cnVzdC5uZXQvcnBhMB0GA1UdDgQWBBQqCm8yLCkgIXZqsayMPK+Tjg5rojAfBgNV
# HSMEGDAWgBRqciZ60B7vfec7aVHUbI2fkBJmqzANBgkqhkiG9w0BAQsFAAOCAQEA
# KdkNr2dFXRsJb63MiBD1qi4mF+2Ih6zA+B1TuRAPZTIzazJPXdYdD3h8CVS1WhKH
# X6Q2SwdH0Gdsoipgwl0I3SNgPXkqoBX09XVdIVfA8nFDB6k+YMUZA/l8ub6ARctY
# xthqVO7Or7jUjpA5E3EEXbj8h9UMLM5w7wUcdBAteXZKeFU7SOPId1AdefnWSD/n
# bqvfvZLnJyfAWLO+Q5VvpPzZNgBa+8mM9DieRiaIvILQX30SeuWbL9TEU+XBKdyQ
# +P/h8jqHo+/edtNuajulxlIwHmOrwAlA8cnC8sw41jqy2hVo/IyXdSpYCSziidmE
# CU2X7RYuZTGuuPUtJcF5dDCCBY0wggR1oAMCAQICEHBxdTqSJ2A9AAAAAFVlpdkw
# DQYJKoZIhvcNAQELBQAwgcgxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0
# LCBJbmMuMSgwJgYDVQQLEx9TZWUgd3d3LmVudHJ1c3QubmV0L2xlZ2FsLXRlcm1z
# MTkwNwYDVQQLEzAoYykgMjAxNSBFbnRydXN0LCBJbmMuIC0gZm9yIGF1dGhvcml6
# ZWQgdXNlIG9ubHkxPDA6BgNVBAMTM0VudHJ1c3QgRXh0ZW5kZWQgVmFsaWRhdGlv
# biBDb2RlIFNpZ25pbmcgQ0EgLSBFVkNTMTAeFw0xOTEwMTYxOTE5MzhaFw0yMDEy
# MTIxOTQ5MjhaMIHYMQswCQYDVQQGEwJVUzEOMAwGA1UECBMFVGV4YXMxEzARBgNV
# BAcTClJvdW5kIFJvY2sxEzARBgsrBgEEAYI3PAIBAxMCVVMxGTAXBgsrBgEEAYI3
# PAIBAhMIRGVsYXdhcmUxETAPBgNVBAoTCERlbGwgSW5jMR0wGwYDVQQPExRQcml2
# YXRlIE9yZ2FuaXphdGlvbjEdMBsGA1UECxMUQ2xpZW50IFByb2R1Y3QgR3JvdXAx
# EDAOBgNVBAUTBzIxNDE1NDExETAPBgNVBAMTCERlbGwgSW5jMIIBIjANBgkqhkiG
# 9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxzH4/Uk7SrrIRybkbZYYU8fiPfIL3ekXg2cQ
# mVhptYD7QNfVbte+R+e8owQqoiBlgkauoRIU3V2aK7FJCgXok0Fl09xMFNmB23Mc
# Hlrsjm6NdjtiocVpd+P8yMjuJt9R5SUrRWr3HWlLyDnK0YiURCTpHOaN6/bb55wT
# eiJItYOgwDblltVN38b1iNN+rrae81ZaA06ofx998NF4Ofoq5NGc3pC3Wk0wCksS
# QpA+koBuuoRrvJkxKDQfGoBmJxexQhziRnDll6DxyQ550fsxmsVcY4LTvgt7pMUF
# xQ4JXAL9QTWLihzgUaW/WIesCmS8dezRP2X5uCL5t9d3w6ERKwIDAQABo4IBXzCC
# AVswDgYDVR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMGoGCCsGAQUF
# BwEBBF4wXDAjBggrBgEFBQcwAYYXaHR0cDovL29jc3AuZW50cnVzdC5uZXQwNQYI
# KwYBBQUHMAKGKWh0dHA6Ly9haWEuZW50cnVzdC5uZXQvZXZjczEtY2hhaW4yNTYu
# Y2VyMDEGA1UdHwQqMCgwJqAkoCKGIGh0dHA6Ly9jcmwuZW50cnVzdC5uZXQvZXZj
# czEuY3JsMEoGA1UdIARDMEEwNgYKYIZIAYb6bAoBAjAoMCYGCCsGAQUFBwIBFhpo
# dHRwOi8vd3d3LmVudHJ1c3QubmV0L3JwYTAHBgVngQwBAzAfBgNVHSMEGDAWgBQq
# Cm8yLCkgIXZqsayMPK+Tjg5rojAdBgNVHQ4EFgQU7+AIvIOh/qMSwsaU6b8HBj+6
# NVYwCQYDVR0TBAIwADANBgkqhkiG9w0BAQsFAAOCAQEAPNM/JRouTEuEpxSM/Ihu
# YSFwcj3NmlA2T/9VDre41akRDaAmWEHK19EWN3wb4MPFK1I0f/NjDL+jiX2UZNZj
# A69NCmw7FCaKBPmuVZihPvb4BF1jVuDNQj5GWj5nW3wgIPzduSe6aLzIBO4xsKKb
# Cw0lOtRLzF/UEdqbMx11ns4BMAZeADsT5oKBTjQdJ26njRKZmJA4uc8F649mFqkA
# x0x6PM0alM/+O4xCJ3wXay63Jurr7CiTFXytE+K9jzfPZ6iI2elmx1Eoj4QkcCwX
# ho9KDdn4psSO6kznVjezKdUZU7yEbs4273R0Vr7bWgEqMOfMS7oUpaxJ7OKheVEE
# rjGCEMcwghDDAgEBMIHdMIHIMQswCQYDVQQGEwJVUzEWMBQGA1UEChMNRW50cnVz
# dCwgSW5jLjEoMCYGA1UECxMfU2VlIHd3dy5lbnRydXN0Lm5ldC9sZWdhbC10ZXJt
# czE5MDcGA1UECxMwKGMpIDIwMTUgRW50cnVzdCwgSW5jLiAtIGZvciBhdXRob3Jp
# emVkIHVzZSBvbmx5MTwwOgYDVQQDEzNFbnRydXN0IEV4dGVuZGVkIFZhbGlkYXRp
# b24gQ29kZSBTaWduaW5nIENBIC0gRVZDUzECEHBxdTqSJ2A9AAAAAFVlpdkwDQYJ
# YIZIAWUDBAIBBQCgfDAQBgorBgEEAYI3AgEMMQIwADAZBgkqhkiG9w0BCQMxDAYK
# KwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG
# 9w0BCQQxIgQgjNk1G+6jL7o35UH+7C0Dy5ndiVFeXHPQ1F405sQ7EoQwDQYJKoZI
# hvcNAQEBBQAEggEAJgh99DtFGY7fcOSbwWorP+1AeeIIF1+sl6cTQrVlDuOM/udF
# G++vnJGqVdU+DuYwOSdfJsR2H9TF3YEbqG9+sCKvztq37kDiAXep3/WbnSmgiC53
# J9iHOiohAxtZw53E0F3YNrmHmcxSX5mvzBq4IcMttjJLtO38zuNH8GFnaVs7wiNI
# SFOruNfJANoYwNEIqR34bU1OIuVBYQDvigYfvAhaEDUcpOuTQJb0yzfvFVwbwTxz
# zOOmU4h6CFXidzbRNJr2URX8lBriKeADIfXqZt/JibAc1V0t0cQijEUq3Z8ISSi4
# oBG9jMyX09yAKb1ZakQeXz4Knmm+h1WK3wyTVKGCDjwwgg44BgorBgEEAYI3AwMB
# MYIOKDCCDiQGCSqGSIb3DQEHAqCCDhUwgg4RAgEDMQ0wCwYJYIZIAWUDBAIBMIIB
# DgYLKoZIhvcNAQkQAQSggf4EgfswgfgCAQEGC2CGSAGG+EUBBxcDMDEwDQYJYIZI
# AWUDBAIBBQAEIGEDtVkGbmVL2tz34eWE8rUxWh1FmyzSISjiTXK4btnyAhRdVOrV
# 8iequV2UXaNQOXM+WrStXhgPMjAyMDAzMjAxMDA4MjRaMAMCAR6ggYakgYMwgYAx
# CzAJBgNVBAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0G
# A1UECxMWU3ltYW50ZWMgVHJ1c3QgTmV0d29yazExMC8GA1UEAxMoU3ltYW50ZWMg
# U0hBMjU2IFRpbWVTdGFtcGluZyBTaWduZXIgLSBHM6CCCoswggU4MIIEIKADAgEC
# AhB7BbHUSWhRRPfJidKcGZ0SMA0GCSqGSIb3DQEBCwUAMIG9MQswCQYDVQQGEwJV
# UzEXMBUGA1UEChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRy
# dXN0IE5ldHdvcmsxOjA4BgNVBAsTMShjKSAyMDA4IFZlcmlTaWduLCBJbmMuIC0g
# Rm9yIGF1dGhvcml6ZWQgdXNlIG9ubHkxODA2BgNVBAMTL1ZlcmlTaWduIFVuaXZl
# cnNhbCBSb290IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTE2MDExMjAwMDAw
# MFoXDTMxMDExMTIzNTk1OVowdzELMAkGA1UEBhMCVVMxHTAbBgNVBAoTFFN5bWFu
# dGVjIENvcnBvcmF0aW9uMR8wHQYDVQQLExZTeW1hbnRlYyBUcnVzdCBOZXR3b3Jr
# MSgwJgYDVQQDEx9TeW1hbnRlYyBTSEEyNTYgVGltZVN0YW1waW5nIENBMIIBIjAN
# BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAu1mdWVVPnYxyXRqBoutV87ABrTxx
# rDKPBWuGmicAMpdqTclkFEspu8LZKbku7GOz4c8/C1aQ+GIbfuumB+Lef15tQDjU
# kQbnQXx5HMvLrRu/2JWR8/DubPitljkuf8EnuHg5xYSl7e2vh47Ojcdt6tKYtTof
# Hjmdw/SaqPSE4cTRfHHGBim0P+SDDSbDewg+TfkKtzNJ/8o71PWym0vhiJka9cDp
# MxTW38eA25Hu/rySV3J39M2ozP4J9ZM3vpWIasXc9LFL1M7oCZFftYR5NYp4rBky
# jyPBMkEbWQ6pPrHM+dYr77fY5NUdbRE6kvaTyZzjSO67Uw7UNpeGeMWhNwIDAQAB
# o4IBdzCCAXMwDgYDVR0PAQH/BAQDAgEGMBIGA1UdEwEB/wQIMAYBAf8CAQAwZgYD
# VR0gBF8wXTBbBgtghkgBhvhFAQcXAzBMMCMGCCsGAQUFBwIBFhdodHRwczovL2Qu
# c3ltY2IuY29tL2NwczAlBggrBgEFBQcCAjAZGhdodHRwczovL2Quc3ltY2IuY29t
# L3JwYTAuBggrBgEFBQcBAQQiMCAwHgYIKwYBBQUHMAGGEmh0dHA6Ly9zLnN5bWNk
# LmNvbTA2BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vcy5zeW1jYi5jb20vdW5pdmVy
# c2FsLXJvb3QuY3JsMBMGA1UdJQQMMAoGCCsGAQUFBwMIMCgGA1UdEQQhMB+kHTAb
# MRkwFwYDVQQDExBUaW1lU3RhbXAtMjA0OC0zMB0GA1UdDgQWBBSvY9bKo06FcuCn
# vEHzKaI4f4B1YjAfBgNVHSMEGDAWgBS2d/ppSEefUxLVwuoHMnYH0ZcHGTANBgkq
# hkiG9w0BAQsFAAOCAQEAdeqwLdU0GVwyRf4O4dRPpnjBb9fq3dxP86HIgYj3p48V
# 5kApreZd9KLZVmSEcTAq3R5hF2YgVgaYGY1dcfL4l7wJ/RyRR8ni6I0D+8yQL9YK
# bE4z7Na0k8hMkGNIOUAhxN3WbomYPLWYl+ipBrcJyY9TV0GQL+EeTU7cyhB4bEJu
# 8LbF+GFcUvVO9muN90p6vvPN/QPX2fYDqA/jU/cKdezGdS6qZoUEmbf4Blfhxg72
# 6K/a7JsYH6q54zoAv86KlMsB257HOLsPUqvR45QDYApNoP4nbRQy/D+XQOG/mYnb
# 5DkUvdrk08PqK1qzlVhVBH3HmuwjA42FKtL/rqlhgTCCBUswggQzoAMCAQICEHvU
# 5a+6zAc/oQEjBCJBTRIwDQYJKoZIhvcNAQELBQAwdzELMAkGA1UEBhMCVVMxHTAb
# BgNVBAoTFFN5bWFudGVjIENvcnBvcmF0aW9uMR8wHQYDVQQLExZTeW1hbnRlYyBU
# cnVzdCBOZXR3b3JrMSgwJgYDVQQDEx9TeW1hbnRlYyBTSEEyNTYgVGltZVN0YW1w
# aW5nIENBMB4XDTE3MTIyMzAwMDAwMFoXDTI5MDMyMjIzNTk1OVowgYAxCzAJBgNV
# BAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBDb3Jwb3JhdGlvbjEfMB0GA1UECxMW
# U3ltYW50ZWMgVHJ1c3QgTmV0d29yazExMC8GA1UEAxMoU3ltYW50ZWMgU0hBMjU2
# IFRpbWVTdGFtcGluZyBTaWduZXIgLSBHMzCCASIwDQYJKoZIhvcNAQEBBQADggEP
# ADCCAQoCggEBAK8Oiqr43L9pe1QXcUcJvY08gfh0FXdnkJz93k4Cnkt29uU2PmXV
# JCBtMPndHYPpPydKM05tForkjUCNIqq+pwsb0ge2PLUaJCj4G3JRPcgJiCYIOvn6
# QyN1R3AMs19bjwgdckhXZU2vAjxA9/TdMjiTP+UspvNZI8uA3hNN+RDJqgoYbFVh
# V9HxAizEtavybCPSnw0PGWythWJp/U6FwYpSMatb2Ml0UuNXbCK/VX9vygarP0q3
# InZl7Ow28paVgSYs/buYqgE4068lQJsJU/ApV4VYXuqFSEEhh+XetNMmsntAU1h5
# jlIxBk2UA0XEzjwD7LcA8joixbRv5e+wipsCAwEAAaOCAccwggHDMAwGA1UdEwEB
# /wQCMAAwZgYDVR0gBF8wXTBbBgtghkgBhvhFAQcXAzBMMCMGCCsGAQUFBwIBFhdo
# dHRwczovL2Quc3ltY2IuY29tL2NwczAlBggrBgEFBQcCAjAZGhdodHRwczovL2Qu
# c3ltY2IuY29tL3JwYTBABgNVHR8EOTA3MDWgM6Axhi9odHRwOi8vdHMtY3JsLndz
# LnN5bWFudGVjLmNvbS9zaGEyNTYtdHNzLWNhLmNybDAWBgNVHSUBAf8EDDAKBggr
# BgEFBQcDCDAOBgNVHQ8BAf8EBAMCB4AwdwYIKwYBBQUHAQEEazBpMCoGCCsGAQUF
# BzABhh5odHRwOi8vdHMtb2NzcC53cy5zeW1hbnRlYy5jb20wOwYIKwYBBQUHMAKG
# L2h0dHA6Ly90cy1haWEud3Muc3ltYW50ZWMuY29tL3NoYTI1Ni10c3MtY2EuY2Vy
# MCgGA1UdEQQhMB+kHTAbMRkwFwYDVQQDExBUaW1lU3RhbXAtMjA0OC02MB0GA1Ud
# DgQWBBSlEwGpn4XMG24WHl87Map5NgB7HTAfBgNVHSMEGDAWgBSvY9bKo06FcuCn
# vEHzKaI4f4B1YjANBgkqhkiG9w0BAQsFAAOCAQEARp6v8LiiX6KZSM+oJ0shzbK5
# pnJwYy/jVSl7OUZO535lBliLvFeKkg0I2BC6NiT6Cnv7O9Niv0qUFeaC24pUbf8o
# /mfPcT/mMwnZolkQ9B5K/mXM3tRr41IpdQBKK6XMy5voqU33tBdZkkHDtz+G5vbA
# f0Q8RlwXWuOkO9VpJtUhfeGAZ35irLdOLhWa5Zwjr1sR6nGpQfkNeTipoQ3PtLHa
# Ppp6xyLFdM3fRwmGxPyRJbIblumFCOjd6nRgbmClVnoNyERY3Ob5SBSe5b/eAL13
# sZgUchQk38cRLB8AP8NLFMZnHMweBqOQX1xUiz7jM1uCD8W3hgJOcZ/pZkU/djGC
# AlowggJWAgEBMIGLMHcxCzAJBgNVBAYTAlVTMR0wGwYDVQQKExRTeW1hbnRlYyBD
# b3Jwb3JhdGlvbjEfMB0GA1UECxMWU3ltYW50ZWMgVHJ1c3QgTmV0d29yazEoMCYG
# A1UEAxMfU3ltYW50ZWMgU0hBMjU2IFRpbWVTdGFtcGluZyBDQQIQe9Tlr7rMBz+h
# ASMEIkFNEjALBglghkgBZQMEAgGggaQwGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJ
# EAEEMBwGCSqGSIb3DQEJBTEPFw0yMDAzMjAxMDA4MjRaMC8GCSqGSIb3DQEJBDEi
# BCBpwFXOyi/oQo/BM/CZDAt1VN3YZNaWlyH9+tot7k9UNDA3BgsqhkiG9w0BCRAC
# LzEoMCYwJDAiBCDEdM52AH0COU4NpeTefBTGgPniggE8/vZT7123H99h+DALBgkq
# hkiG9w0BAQEEggEAfbW1uEW7zvt9ffJMRi/ON3G5EgIjRPtgyxmEUA0CTbVvQkwF
# mrFG9grsJBysk8DcUjL0nfTNcnrajpHV3TSDvHBPFfDJzd1tiRSs+Bbj82dIPktH
# HjJ3aLZ3n8IIjVHMvjb21M5EN9Qk104quOnqVsQjBnv5xrZgsQhA12F0yH88tXYA
# fRj+W4rQoc5k1O8uvju3MOXbt9hUkZC1e9hMMd8U8g4otvXu+AnDx7F1yK9Krr41
# nj+eB3OcBeeLWMgXlfRRWUE+/HpKuwvS0NUBKvfolg+BFXmreOkjWfKvts33gUem
# sy9E9nidOV+qcfBMhhod3Q/f+vHFCxkvSJIlPQ==
# SIG # End signature block
