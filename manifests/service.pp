define systemd::service (
                          $execstart,
                          $execstop=undef,
                          $restart=undef,
                          $user='root',
                          $group='root',
                          $servicename=$name,
                          $description,
                          $type='forking',
                        ) {

  if ($type != 'oneshot') {
    validate_re($restart, [ '^always$', '^no$', '^on-\w+$'], "Not a supported restart type: ${restart}")
  }
  file { "/etc/systemd/system/${servicename}.service":
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/service.erb"),
    notify  => Exec['systemctl reload'],
  }

}
