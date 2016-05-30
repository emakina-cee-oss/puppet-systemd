define systemd::timer (
                          $monotonic=undef,
                          $oncalendar=undef,
                          $persistent=true,
                          $servicename=$name,
                          $description,
                        ) {

  validate_bool($persistent)
  if ($oncalendar != undef) and ($monotonic != undef) {
    fail('monotonic and oncalendar can not be set both')
  }

  file { "/etc/systemd/system/${servicename}.timer":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/timer.erb"),
  }

}
