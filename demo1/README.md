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