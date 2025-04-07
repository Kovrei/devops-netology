Role Name
=========

Install lighthouse on Debian

Role Variables
--------------

| vars | description |
| -------- | ---------- |
| lighthouse_dir | create file configuration (lighthouse.conf) in a nginx |
| repo | repository on github for create lighthouse |
| nginx_user | create option in file configaration (nginx.conf) for nginx |
| worker_processes | create option in file configaration (nginx.conf) for nginx |
| worker_connections | create option in file configaration (nginx.conf) for nginx |
| client_max_body_size | create option in file configaration (nginx.conf) for nginx |


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: lighthouse }

License
-------

MIT

Author Information
------------------

Andrei Osipenkov