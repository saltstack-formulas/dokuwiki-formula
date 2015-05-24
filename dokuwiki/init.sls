{% from "dokuwiki/map.jinja" import dokuwiki with context %}

dokuwiki:
  pkg.installed:
    - name: {{ dokuwiki.pkg }}

local.php:
  file.managed:
    - name: {{ dokuwiki.config_path }}/local.php
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://dokuwiki/files/local.php
    - require:
      - pkg: dokuwiki

users.auth.php:
  file.managed:
    - name: {{ dokuwiki.acl_path }}/users.auth.php
    - user: www-data
    - group: root
    - mode: 600
    - template: jinja
    - source: salt://dokuwiki/files/users.auth.php
    - require:
      - pkg: dokuwiki

{{ dokuwiki.config_path }}users.auth.php:
  file.symlink:
    - target: {{ dokuwiki.acl_path }}/users.auth.php
    - user: root
    - group: www-data
    - require:
      - file: users.auth.php

acl.auth.php:
  file.managed:
    - name: {{ dokuwiki.acl_path }}/acl.auth.php
    - user: www-data
    - group: root
    - mode: 600
    - template: jinja
    - source: salt://dokuwiki/files/acl.auth.php
    - require:
      - pkg: dokuwiki

{{ dokuwiki.config_path }}/acl.auth.php:
  file.symlink:
    - target: {{ dokuwiki.acl_path }}/acl.auth.php
    - user: root
    - group: www-data
    - require:
      - file: acl.auth.php
