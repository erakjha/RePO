## Create
```shell
$ cat demouser.pp
user { "kunaljha5":
  ensure => "present",
}
```
## Check-Pass
```shell
$ cat demouser.pp 
user { "kunaljha5":
  ensure => "present",
}
$ puppet parser validate demouser.pp 
$ 
```

## Check-Fail
```shell
$ cat demouser.pp 
user { "kunaljha5":
  ensure => "present",

$ puppet parser validate demouser.pp 
Error: Could not parse for environment production: Syntax error at end of input (file: /var/tmp/d1/puppet-101/demo1/demouser.pp)
$ 
```
## Test
```shell
$  puppet apply demouser.pp --noop 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: /Stage[main]/Main/User[kunaljha5]/ensure: current_value 'absent', should be 'present' (noop)
Notice: Class[Main]: Would have triggered 'refresh' from 1 event
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Notice: Applied catalog in 0.01 seconds
$ 

```

## Run
```shell
$ puppet apply demouser.pp 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.02 seconds
Notice: /Stage[main]/Main/User[kunaljha5]/ensure: created
Notice: Applied catalog in 0.08 seconds

$ puppet apply demouser.pp 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: Applied catalog in 0.02 seconds

$

```

## Validate-Test-Run-ReRun with uid-shell change
```shell
$ cat demouser_with_uid_shell.pp 
user { "kunaljha5":
  ensure => "present",
  uid    => "7777",
  shell  => "/bin/sh",
}
$ puppet parser validate demouser_with_uid_shell.pp 
$ puppet apply demouser_with_uid_shell.pp --noop 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: /Stage[main]/Main/User[kunaljha5]/uid: current_value 1001, should be 7777 (noop)
Notice: /Stage[main]/Main/User[kunaljha5]/shell: current_value '/bin/bash', should be '/bin/sh' (noop)
Notice: Class[Main]: Would have triggered 'refresh' from 2 events
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Notice: Applied catalog in 0.02 seconds
$
$ puppet apply demouser_with_uid_shell.pp
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: /Stage[main]/Main/User[kunaljha5]/uid: uid changed 1001 to 7777
Notice: /Stage[main]/Main/User[kunaljha5]/shell: shell changed '/bin/bash' to '/bin/sh'
Notice: Applied catalog in 0.09 seconds
$ cat /etc/passwd| grep kunal
kunaljha5:x:7777:1001::/home/kunaljha5:/bin/sh
$ 
$ puppet apply demouser_with_uid_shell.pp
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: Applied catalog in 0.02 seconds
$ 


```


## demofile 
```shell
$ puppet parser validate demofile.pp 
$ puppet apply demofile.pp --noop 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: /Stage[main]/Main/File[/var/tmp/secretfile]/ensure: current_value 'absent', should be 'present' (noop)
Notice: Class[Main]: Would have triggered 'refresh' from 1 event
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Notice: Applied catalog in 0.01 seconds
$ puppet apply demofile.pp 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: /Stage[main]/Main/File[/var/tmp/secretfile]/ensure: created
Notice: Applied catalog in 0.02 seconds
$ ls  -lrth /var/tmp/secretfile 
-r--------. 1 kunaljha5 kunaljha5 0 Sep 19 19:26 /var/tmp/secretfile
$ 


```

## demofile add content to the file

```shell
$ puppet parser validate demofile.pp 
$ puppet apply demofile.pp --noop 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: /Stage[main]/Main/File[/var/tmp/secretfile]/content: current_value '{sha256}e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', should be '{sha256}6d2655f562a3e5877a6437d949f58d14778dde57c4553cc659b3a4798cf224fd' (noop)
Notice: Class[Main]: Would have triggered 'refresh' from 1 event
Notice: Stage[main]: Would have triggered 'refresh' from 1 event
Notice: Applied catalog in 0.02 seconds
$ cat /var/tmp/secretfile 
$ ls -rlth /var/tmp/secretfile
-r--------. 1 kunaljha5 kunaljha5 0 Sep 19 19:26 /var/tmp/secretfile
$ date
Sun Sep 19 19:30:36 UTC 2021
$ puppet apply demofile.pp 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: /Stage[main]/Main/File[/var/tmp/secretfile]/content: content changed '{sha256}e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855' to '{sha256}6d2655f562a3e5877a6437d949f58d14778dde57c4553cc659b3a4798cf224fd'
Notice: Applied catalog in 0.02 seconds
$ ls -rlth /var/tmp/secretfile
-r--------. 1 kunaljha5 kunaljha5 47 Sep 19 19:30 /var/tmp/secretfile
$ cat /var/tmp/secretfile
Hello Martha Stuart, Max's Home-Made Cup Cakes.$ 
$ 
$ puppet apply demofile.pp 
Notice: Compiled catalog for puppetselfcontained.example.com in environment production in 0.01 seconds
Notice: Applied catalog in 0.01 seconds
$ date
Sun Sep 19 19:31:02 UTC 2021
$ 


```