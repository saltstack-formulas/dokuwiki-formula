
dokuwiki:
  pkg.installed:
    - name: dokuwiki

local.php:
  file.managed:
    - name: /etc/dokuwiki/local.php
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://dokuwiki/files/local.php
    - require:
      - pkg: dokuwiki

users.auth.php:
  file.managed:
    - name: /var/lib/dokuwiki/acl/users.auth.php
    - user: www-data
    - group: root
    - mode: 600
    - template: jinja
    - source: salt://dokuwiki/files/users.auth.php
    - require:
      - pkg: dokuwiki

acl.auth.php:
  file.managed:
    - name: /var/lib/dokuwiki/acl/acl.auth.php
    - user: www-data
    - group: root
    - mode: 600
    - template: jinja
    - source: salt://dokuwiki/files/acl.auth.php
    - require:
      - pkg: dokuwiki
