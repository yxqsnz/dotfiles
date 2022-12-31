#include <errno.h>
#include <fcntl.h>
#include <libevdev-1.0/libevdev/libevdev.h>
#include <linux/input-event-codes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
  struct libevdev *dev = NULL;
  int fd, led_enabled = LIBEVDEV_LED_ON, rc = 1;

  if (argc < 2) {
    puts("i need a device name.");
    return 1;
  }

  fd = open(argv[1], O_RDWR);
  rc = libevdev_new_from_fd(fd, &dev);
  if (rc < 0) {
    fprintf(stderr, "Failed to init libevdev (%s)\n", strerror(-rc));
    exit(1);
  }

  if (!libevdev_has_event_code(dev, EV_LED, LED_SCROLLL)) {
    puts("Device donest have LED_SCROLLL!");
    return 0;
  }

  do {
    struct input_event ev;
    rc = libevdev_next_event(dev, LIBEVDEV_READ_FLAG_NORMAL, &ev);
    libevdev_kernel_set_led_value(dev, LED_SCROLLL, led_enabled);

    if (ev.code == KEY_SCROLLLOCK && ev.value) {
      if (led_enabled == LIBEVDEV_LED_ON) {
        led_enabled = LIBEVDEV_LED_OFF;
      } else {
        led_enabled = LIBEVDEV_LED_ON;
      }
    }
  } while (rc == 1 || rc == 0 || rc == -EAGAIN);

  perror("fail");
  close(fd);
  return 0;
}
