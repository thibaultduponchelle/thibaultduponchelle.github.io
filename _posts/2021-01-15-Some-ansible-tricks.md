---
layout: post
title: Some ansible tricks
date: 2021-01-15 17:35:15
---

![Ansible](/assets/images/d1m8edn571qzdthwchxj.png)

In this blog post, I will share some (basic) tricks about Ansible :smiley:

It could possibly prevent you to get bitten :mask:

## Quote when using vars
When not using variables, you can quote (or not) indifferently:
```yaml
- name: Copy
  copy:
    src: foobar
    dest: /tmp/foobar
```

Or (with quotes):
```yaml
- name: Copy
  copy:
    src: "foobar"
    dest: "/tmp/foobar"
```

But as soon as you use variables, you should use quotes!
```yaml
- name: Copy
  copy:
    src: "{{ filename }}"
    dest: "/tmp/{{ filename }}"
```

Not all ansible versions have the same behaviour for this! Latest versions of Ansible are more flexible, but are not able to completely handle it (depends where the variable is positioned).

For more info, see [YAML gotcha](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#when-to-quote-variables-a-yaml-gotcha)

## Extra quote when passing extra variable in command line
When using the `--extra-vars` (or `-e`) to pass variables in the command line, take care of adding an extra quote to protect spaces:
```bash
                            # here v          and here v
$ ansible-playbook playbook.yml -e 'protectme="foo bar"'
                            #     to protect this ^
```

## sh gotcha
This is broken:
```yaml
---
- hosts: servers
  tasks:
  - name: Broken
    shell: '[[ -z "" ]] && true'
```
Why? Because it is executed by `/bin/sh`... not `bash` !

You can transform it to a `sh` compatible version like this:
```yaml
---
- hosts: servers
  tasks:
  - name: Working
    shell: 'test -z "" && true'
```

Or specify the executable in the `args`:
```yaml
---
- hosts: servers
  tasks:
  - name: Broken
    shell: '[[ -z "" ]] && true'
    args:
      executable: /bin/bash
```

## Precedence of vars
Some are obvious, but not all :grin:

Here is my reminder:
1. CLI extra var `-e variable="foo"` will override...
2. role vars (`roles/common/vars/main.yml`) that overrides...
3. playbook vars (`playbook.yml`) that are taken in priority over...
4. role default vars (`roles/common/default/main.yml`)

For more infos, check the official doc about [complete list of precedence](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#ansible-variable-precedence)

## Edit variable after initialization

You can do this with the module [set fact](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/set_fact_module.html#ansible-collections-ansible-builtin-set-fact-module)!
```yaml
- name:
  set_fact:
    var1: "new value"
```

## Conclusion
That's all for the tricks.

Happy provisioning! :smiley:

![Happy provisioning](/assets/images/zat57oucm3twctukfnlr.jpeg)
