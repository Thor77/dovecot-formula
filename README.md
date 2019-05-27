# dovecot-formula
Formula to install and setup [dovecot](https://www.dovecot.org/).

# Available states

## `dovecot`
Install and configure dovecot

# Pillar
```yaml
dovecot:
  config:
    - protocols: 'imap lmtp sieve'
    - namespace inbox:
      - inbox: 'yes'
      - mailbox Drafts:
        - auto: 'subscribe'
        - special_use: '\Drafts'
```

# Credits
The [config template](dovecot/files/dovecot.conf) is a slightly modified version of [nginx-formula/server.conf](https://github.com/saltstack-formulas/nginx-formula/blob/master/nginx/files/server.conf).
