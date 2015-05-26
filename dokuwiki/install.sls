# -*- coding: utf-8 -*-
# vim: ft=sls
{##
Dokuwiki Formula
Description:
  https://github.com/saltstack-formulas/dokuwiki-formula
  All pacakges installed for dockuwiki to work, assumes php and webserver are 
  configured elsewhere
##}

{% from "dokuwiki/map.jinja" import dokuwiki with context %}

dokuwiki:
  pkg.installed:
    - pkgs: {{ dokuwiki.pkgs }}
