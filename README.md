# docker-ssmtp
This docker image can be used to send mails to external smtp servers that require authentication. Just call the mail command like in the following example:
```
$ echo "Message Body Here" | mutt -s "Subject Here" user@example.com -a backup.zip
```
A mail with the subject `Subject Here`, `Message Body Here` as the body and file named `backup.zip` attached will be sent to `user@example.com`.

## Prerequisites/Configuration
| Environment Variable | Example        | Default value | Required |
|----------------------|----------------|---------------|----------|
| HOST                 | smtp.gmail.com |               | Yes      |
| PORT                 | 465            |               | Yes      |
| AUTH_USER            | xyz@gmail.com  |               | Yes      |
| AUTH_PASS            | xyz            |               | Yes      |
| TLS                  | YES (or NO)    | NO            | No       |