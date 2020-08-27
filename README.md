# docker-ssmtp
This docker image can be used to send mails to external smtp servers that require authentication. Just call the mail command like in the following example:
```
$ echo "Message Body Here" | mail -s "Subject Here" user@example.com -A backup.zip
```
A mail with the subject `Subject Here`, `Message Body Here` as the body and file named `backup.zip` attached will be sent to `user@example.com`.