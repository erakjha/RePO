file { "/var/tmp/secretfile":
  ensure    => "present",
  owner     => "kunaljha5",
  group     => "kunaljha5",
  mode      => "0400",
}