// Written in 2010-11-30

#include<stdio.h>
#include<conio.h>
#include<graphics.h>
#include<dos.h>
#include<stdlib.h>

const rad = 20,
  ln = 50,
  lnpx = 5,
  lncx = 635;
void main() {
  int gd = DETECT, gm;
  initgraph( & gd, & gm, "C:\\TC\\BGI\\");
  char in = 'x';
  int ax = 1, ay = 1, add_x, add_y, x = 200, y = 200, lny = 50, cplny;
  add_x = random(2);
  add_y = random(2);

  while ( in != 'q') {
    cleardevice();
    setcolor(RED);
    circle(x, y, rad);
    gotoxy(1, 1);
    cplny = y - 25;
    line(lnpx, lny, lnpx, lny + ln);
    line(lncx, cplny, lncx, cplny + ln);
    x += add_x;
    y += add_y;

    if (x - rad <= lnpx && y >= lny && y <= lny + ln)
      if (ax < 0) {
        ax = -ax;
        sound(15000);
      }
    else
      break;

    if (x + rad >= lncx && y >= cplny && y <= cplny + ln)
      if (ax > 0) {
        ax = -ax;
        sound(15000);
      }
    else
      break;

    if (y - rad <= 0)
      if (ay < 0) {
        ay = -ay;
        sound(15000);
      }

    if (y + rad >= 480)
      if (ay > 0) {
        ay = -ay;
        sound(15000);
      }

    add_x = 0;
    add_y = 0;
    add_x += ax;
    add_y += ay;

    delay(10); in = 'x';
    flushall();
    if (kbhit())
      in = getch();
    if ( in == 'a') {
      lny -= 5;
    }
    if ( in == 'z') {
      lny += 5;
    }
    nosound();
  }
  nosound();
}

