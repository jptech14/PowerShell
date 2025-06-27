# Fine Grained Password Policy where password does not expire
New-ADFineGrainedPasswordPolicy -Name "NoExpiryPolicy" `
    -Precedence 1 `
    -MaxPasswordAge ([TimeSpan]::Zero) `
    -MinPasswordAge 1.00:00:00 `
    -MinPasswordLength 12 `
    -PasswordHistoryCount 24 `
    -ComplexityEnabled $true `
    -ReversibleEncryptionEnabled $false `
    -LockoutDuration 00:30:00 `
    -LockoutObservationWindow 00:30:00 `
    -LockoutThreshold 5
