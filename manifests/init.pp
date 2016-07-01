#
class systemd (
  $systemd_services = {},
  $systemd_timers   = {}
) {
  exec { 'systemctl reload':
    command     => 'systemctl daemon-reload',
    refreshonly => true,
    path        => '/bin:/sbin:/usr/bin:/usr/sbin'
  }

  create_resources('systemd::service', $systemd_services)
  create_resources('systemd::timer', $systemd_timers)
}
