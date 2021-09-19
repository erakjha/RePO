file { "/var/tmp/dir1":
  ensure    => "directory",
  owner     => "kunaljha5",
  group     => "kunaljha5",
  mode      => "0700"
}

file { "/var/tmp/dir1/secret":
  ensure    => "present",
  owner     => "kunaljha5",
  group     => "kunaljha5",
  mode      => "0400",
  content   => "something"
}