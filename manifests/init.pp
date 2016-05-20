#
class systemd (
  $systemd_services = {},
  $systemd_timers   = {}
) {
  create_resources('systemd::service', $systemd_services)
  create_resources('systemd::timer', $systemd_timers)
}
