{% from 'dovecot/map.jinja' import dovecot with context %}

dovecot_pkg:
  pkg.installed:
    - name: {{ dovecot.lookup.pkg }}

dovecot_cfg:
  file.managed:
    - name: {{ dovecot.lookup.cfg }}
    - source: salt://dovecot/files/dovecot.conf
    - template: jinja
    - context:
        cfg: {{ dovecot.config|tojson }}

dovecot_service:
  service.running:
    - name: {{ dovecot.lookup.service }}
    - require:
      - pkg: dovecot_pkg
      - file: dovecot_cfg
    - watch:
      - file: dovecot_cfg
    - enable: true
