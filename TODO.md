#### Use magic vars:

http://www.ansibleworks.com/docs/playbooks_variables.html
{% for host in groups['app_servers'] %}
   {{ hostvars[host]['ansible_eth0']['ipv4']['address'] }}
{% endfor %}