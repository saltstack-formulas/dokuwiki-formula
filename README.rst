Dokuwiki
========

Salt Formula to install Dokuwiki

All default configuration options from dokuwiki.php are available
in pillar.example is just an few options set. see files/local.php for all
options.

.. note::

    See the full `Salt Formulas installation and usage instructions
    <http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html>`_.

Available States
================

.. contents::
    :local:

``dokuwiki``
------------

Installs dokuwiki and local.php configuration

Formula Depencies
=================

* php
* apache

or

* php.fpm
* nginx


Admin Password
==============

The default admin password is set in files/users.auth.php
the password is admin

after you log in you can change the password and copy over the
/var/lib/dokuwiki/acl/users.auth.php in files/users.auth.php 

.. note::

    This needs to be generated/created from pillar data

