Role Name
=========

A brief description of the role goes here.

Requirements
------------


Role Variables
--------------

`deploy_user` : default vagrant


Dependencies
------------

This requires node 8.0

- [ansible-role-nodejs](https://github.com/geerlingguy/ansible-role-nodejs)
- [ansible-role-nginx](https://github.com/geerlingguy/ansible-role-nginx)


Example Playbook
----------------

tree:

    Vagrant
    playbook.yaml
    roles/
      ansible-role-nodejs
      ansible-role-nginx
      ansible-role-nci-ansible-ui


playbook:

    ---
    - hosts: all
      become: yes
      vars:
        nodejs_version: "8.x"
        ci_address: gitserver.dah
        nginx_remove_default_vhost: true
        nginx_vhosts:
          - listen: "80"
            server_name: "{{ ci_address }}"
            state: "present"
            template: "{{ nginx_vhost_template }}"
            filename: "nci-ansible-ui.conf"
            extra_parameters: |
              location /keys/  {
                alias    /var/www/keys/;
                expires 30d;
              }
              location / {
                proxy_pass      http://127.0.0.1:3000;
                # auth_basic "Restricted Content";
                # auth_basic_user_file /etc/nginx/.htpasswd;
                # error_page 404 /404.html;
                # error_page 401 /401.html;
              }
              location = /401.html {
                 root /srv/errorpages/401;
                 internal;
              }
              location = /404.html {
                 root /srv/errorpages/404;
                 internal;
              }
      roles:
        - ansible-role-nodejs
        - ansible-role-nginx
        - ansible-role-nci-ansible-ui
    



License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
