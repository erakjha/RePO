file { "/var/tmp/secretfile":
  ensure    => "present",
  owner     => "kunaljha5",
  group     => "kunaljha5",
  mode      => "0400",
  content   => "Hello Martha Stuart, Max's Home-Made Cup Cakes."
}