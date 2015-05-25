# -*- coding: utf-8 -*-
# vim: ft=sls
{##
Dokuwiki Formula
Description:
  https://github.com/saltstack-formulas/dokuwiki-formula
  All files configured for the package
##}

{% from "dokuwiki/map.jinja" import dokuwiki with context %}

{# config files #}
local-php:
  file.managed:
    - name: {{ dokuwiki.config_path }}/local.php
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://dokuwiki/files/local.php

users-auth-php:
  file.managed:
    - name: {{ dokuwiki.acl_path }}/users.auth.php
    - user: {{ dokuwiki.web_user }}
    - group: root
    - mode: 600
    - template: jinja
    - source: salt://dokuwiki/files/users.auth.php

acl-auth-php:
  file.managed:
    - name: {{ dokuwiki.acl_path }}/acl.auth.php
    - user: {{ dokuwiki.web_user }}
    - group: root
    - mode: 600
    - template: jinja
    - source: salt://dokuwiki/files/acl.auth.php

{# symlinks #}

{{ dokuwiki.config_path }}users.auth.php:
  file.symlink:
    - target: {{ dokuwiki.acl_path }}/users.auth.php
    - user: root
    - group: {{ dokuwiki.web_user }}
    - require:
      - file: users-auth-php

{{ dokuwiki.config_path }}/acl.auth.php:
  file.symlink:
    - target: {{ dokuwiki.acl_path }}/acl.auth.php
    - user: root
    - group: {{ dokuwiki.web_user }}
    - require:
      - file: acl-auth-php
