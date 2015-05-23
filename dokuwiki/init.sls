include:
  - apache
  - php

dokuwiki:
  pkg.installed:
    - name: dokuwiki

local.php:
  file.managed:
    - name: /etc/dokuwiki/local.php
    - template: jinja
    - source: salt://dokuwiki/files/local.php
    - require:
      - pkg: dokuwiki

